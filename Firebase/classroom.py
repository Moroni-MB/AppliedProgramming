import firebase_admin
from firebase_admin import credentials, firestore

cred = credentials.Certificate("/Users/moronimontoya/dev/PersonalProgrammingProjects/Firebase/classrom.json")
firebase_admin.initialize_app(cred)

db = firestore.client()

# result = db.collection("classes").get()
# total = 0
# for record in result:
#     data = record.to_dict()
#     print(f'{record.id} : {data["name"]}')

# choice = input('Select a class code: ')
# new_size = int(input("What is the new class size: "))

# db.collection("classes").document(choice).set({"name" : choice, "size" : new_size})
# data = result.to_dict()
# if data is None:
#     print("Invalid class")
# else:
#     print(data["size"])

# db.collection("classes").document("cse110").set({"name" : "Introduction to Programming", "size" : 50})

# db.collection("classes").document("cse 280").delete()

# new_grade = int(input("What is the new grade? "))
# db.collection("grades").add({"grade":new_grade})

results = db.collection("grades").get()
for result in results:
    data = result.to_dict()
    
    if "name" in data:
        print(f"{data["name"]} : {data["grade"]}")
        
name = input("Which name? ")
grade = int(input("Which grade? "))
new_grade = int(input("New grade? "))

# Find the grade
results = db.collection("grades").where("name", "==", name).where("grade", "==", grade).get()
if len(results) == 1:
    id = results[0].id
    db.collection("grades").document(id).set({"name":name, "grade":new_grade})
else:
    print("Can't find the record")

    
results = db.collection("grades").get()
for result in results:
    data = result.to_dict()
    
    if "name" in data:
        print(f"{data["name"]} : {data["grade"]}")