import sys 
import subprocess
import json

#psycopg2 is a driver needed to talk to PostgreSQL using Python
#logic for auto installing it, given its likely not already installed (needs pip)
#tries to import to start, given it will likely be installed if ran a second time
#if not available, tries to install and exits if install error happens
try:
    import psycopg2
except ImportError:
    try:
        #platform independent, uses python interpreter to execute install command
        subprocess.check_call([sys.executable, "-m", "pip", "install", "psycopg2-binary"])
        import psycopg2
    except Exception as e:
        sys.stderr.write(f"Error installing psycopg2: {e}\n")
        raise

#add table and csv_path here
def write(table="", csv_path="", login_info_path = "login_info.json"):
    #login_info.json contains all login info, joining with spaces because this is needed for postgres
    with open(login_info_path) as f:
        login_info_json = json.load(f)
    login_info = " ".join(
        [
            f"host={login_info_json['host']}",
            f"dbname={login_info_json['dbname']}",
            f"user={login_info_json['user']}",
            f"password={login_info_json['password']}",
        ]
    )
    #open postgres connection and csv file
    with psycopg2.connect(login_info) as connection, open(csv_path) as csv_file:
        #cursor lets you send SQL commands
        #error handling logic helps diagnose errors with CSV assumptions
        with connection.cursor() as cursor:
            try:
                #uses standard in to put csv into table
                cursor.copy_expert(f"COPY {table} FROM STDIN WITH CSV HEADER", csv_file)
            except psycopg2.errors.UndefinedColumn as e:
                sys.stderr.write(
                    f"Column names in CSV header don't match table column names: {e}\n"
                )
                return
            except psycopg2.errors.BadCopyFileFormat as e:
                sys.stderr.write(
                    f"Postgres cannot parse CSV because of formatting issues (like missing a closing quote or delimiter): {e}\n"
                )
                return
            except psycopg2.errors.StringDataRightTruncation as e:
                sys.stderr.write(
                    f"Data is too long for a column (e.g. cell with more than 50 characters but column has VARCHAR(50)): {e}\n"
                )
                return
            except psycopg2.Error as e:
                sys.stderr.write(f"Error copying the table: {e}\n")
                raise