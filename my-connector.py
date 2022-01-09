import pyodbc
import json
import requests

 # Connection to DB

conn = pyodbc.connect("Driver={SQL Server};Server=.\SQL2019TRAINING;Database=master;Trusted_Connection=yes; charset='utf8'")
conn.timeout = 60
conn.autocommit = True

# getting data

response = requests.get('https://randomuser.me/api/?results=40&inc=gender,name,dob,registered&noinfo&nat=us')
response.encoding = 'utf-8'
data = response.json()
data = data['results']
print(data)

def write_to_db (dbname):
    try:
        cursor = conn.cursor()
        sql = "EXEC ? @json = ?"
        cursor.execute(sql, (dbname,json.dumps(item, ensure_ascii=False).encode('utf8')))
        # print('inserted data')

    except pyodbc.Error as err:
        print('Error !!!!! %s' % err)
    except:
        print('something else failed miserably')

#            Insert Data By Gender
for item in data:
    if 'female' in (item["gender"]) :
        write_to_db('insertFemale')

    elif (item["gender"]) == 'male':
        write_to_db('insertMale')

#       Insert Data by Age
for item in data:
    if (int((item["dob"]["age"]))//10)*10 == 10:
        write_to_db('insertNoaTest10')

    elif (int((item["dob"]["age"]))//10)*10 == 20:
        write_to_db('insertNoaTest20')

    elif (int((item["dob"]["age"]))//10)*10 == 30:
        write_to_db('insertNoaTest30')

    elif (int((item["dob"]["age"]))//10)*10 == 40:
        write_to_db('insertNoaTest40')

    elif (int((item["dob"]["age"]))//10)*10 == 50:
        write_to_db('insertNoaTest50')

    elif (int((item["dob"]["age"]))//10)*10 == 60:
        write_to_db('insertNoaTest60')

    elif (int((item["dob"]["age"]))//10)*10 == 70:
        write_to_db('insertNoaTest70')

    elif (int((item["dob"]["age"]))//10)*10 == 80:
        write_to_db('insertNoaTest80')

    elif (int((item["dob"]["age"]))//10)*10 == 90:
        write_to_db('insertNoaTest90')
#  Triggering store procedures

try:
                cursor = conn.cursor()
                cursor.execute('EXEC insertNoaTestTop20')
                cursor.execute('EXEC insertNoaTestTop5')
                cursor.execute('EXEC insertNoaTestTop2')
                cursor.execute('EXEC insertNoaTestQuestion6')
                cursor.execute('EXEC insertNoaTestQuestion7')

                cursor.execute("SELECT * FROM noa_test_question_6")
                rows = cursor.fetchall()
                question_6_list = []
                for row in rows:
                    t = (row[0], row[1], row[2], row[3], row[4])
                    question_6_list.append(t)
                j = json.dumps(question_6_list)
                with open("first.js", "w", encoding="utf8") as f:
                    f.write(j)

                cursor.execute("SELECT * FROM noa_test_question_7")
                rows = cursor.fetchall()
                question_7_list = []
                for row in rows:
                    t = (row[0], row[1], row[2], row[3], row[4])
                    question_7_list.append(t)
                j = json.dumps(question_7_list)
                with open("second.js", "w", encoding="utf8") as f:
                    f.write(j)

except pyodbc.Error as err:
                print('Error !!!!! %s' % err)
except:
                print('something else failed miserably')

conn.close()
print('closed db connection')





