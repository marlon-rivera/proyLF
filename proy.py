import mysql.connector
from mysql.connector import Error
from flask import Flask

app = Flask(__name__)

def create_connection():

    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="root",
        database="PROYLF"
    )

    return conn

def execute_queries():

    conn = create_connection()

    with open('results.txt', 'r') as file:
        queries = []
        for line in file:
            queries.append(line.strip())
    result_queries = ""
    if conn.is_connected:
        cursor = conn.cursor()
        for query in queries:
            try:
                cursor.execute(query)
                if(query.split()[0] == "SELECT"):
                    resultQuery = cursor.fetchall()
                    column_names = [description[0] for description in cursor.description]
                    result_queries += "<h1 style='font-family: Arial, sans-serif; font-size: 24px; margin-bottom: 20px;'>" + query + "</h1>"
                    
                    result_queries += "<table style='border-collapse: collapse; width: 100%;'>"
                    result_queries += "<thead>"
                    result_queries += "<tr style='background-color: #f2f2f2;'>"
                    for name in column_names:
                        result_queries += "<th style='border: 1px solid #ddd; padding: 8px;'>" + str(name) + "</th>"
                    result_queries += "</tr>"
                    result_queries += "</thead>"
                    result_queries += "<tbody>"
                    for result in resultQuery:
                        result_queries += "<tr>"
                        for r in result:
                            result_queries += "<td style='border: 1px solid #ddd; padding: 8px;'>" + str(r) + "</td>"
                        result_queries += "</tr>"
                    result_queries += "</tbody>"
                    result_queries += "</table>"
                    
                
            except Exception as e:
                print("Error al ejecutar la consulta:", e)
                conn.rollback()
        cursor.close()
        conn.close()
    print(result_queries)
    return result_queries

@app.route('/consultas', methods=['GET'])
def exexcute():
    return execute_queries()

if __name__ == '__main__':
    app.run(debug=True)


