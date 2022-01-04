import mysql.connector

try:
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="5ome_3071",
        database='mydb')
    if conn.is_connected():
        print('Connected to MySQL database')

    cursor = conn.cursor()
    insert_query = """
    INSERT INTO user(iduser, name, url)
    VALUES(3, 'user3', 'url123'),
    (4, 'user4', 'url124');
    """
    conn.autocommit = True

    try:
        cursor.execute(insert_query)
        print("Query executed successfully")
    except mysql.connector.OperationalError as e:
        print(e)
    print_query = "SELECT * FROM user WHERE iduser = 4"
    try:
        cursor.execute(print_query)
        print("Query executed successfully")
    except mysql.connector.OperationalError as e:
        print(e)
    result = cursor.fetchall()
    print(result)
except mysql.connector.Error as e:
    print(e)
finally:
    conn.close()
