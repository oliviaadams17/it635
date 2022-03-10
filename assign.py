import psycopg2

conn = psycopg2.connect("postgresql://planner:testing@localhost/wedding_planner")
cur = conn.cursor()

while True:
    print("Please select a from the options below")
    print("1. Add guest")
    print("2. Remove guest")
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
        print("Guest first and last name")
        name = str(input()).split()
        first = name[0]
        last = name[1]
        curr.execute("""
            SELECT guest_id FROM guests WHERE first_name = %s AND last_name = %s;""",(first,last));
        id = curr.fetchone()[0]
        print(f"Do you want to delete guest id {id}? Y or N")
        answer = str(input())
        if answer == "Y":
            cur.execute("""
                DELETE FROM guests WHERE guest_id = %s;""", (id));
            print("Guest Deleted")

cur.close()
conn.close()
