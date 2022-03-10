import psycopg2

conn = psycopg2.connect("postgresql://planner:testing@localhost/wedding_planner")
cur = conn.cursor()

while True:
    print("Please select a from the options below")
    print("1. Add guest")
    print("2. Remove guest")
    print("3. Assign seating")
    choice = int(input())
    
    if choice == 1:
       print("Guest First and last name")
       name = str(input()).split()
       first = name[0]
       last = name[1]
       print("Please input b for bride's side, g for grooms side")
       bride_groom = str(input())
       print("Guest email")
       email = str(input())
       print("Guest phone number")
       phone = str(input())
       print("Is the guest in the bridal party? True for yes, False for no")
       w_party = str(input())
       cur.execute("""
           INSERT INTO guests (first_name, last_name, bride_groom, email, phone_number, w_party)
           VALUES (%s, %s, %s, %s, %s, %s);""", (first, last, bride_groom, email, phone, w_party));
       print("Guest added")
       conn.commit()
    elif choice == 2:
        print("Choice 2")
    elif choice == 3:
        print("Choice 3")

cur.close()
conn.close()
