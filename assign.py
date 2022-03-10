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
           INSERT INTO guests (guest_id, first_name, last_name, bride_groom, email, phone_number, w_party)
           VALUES (DEFAULT, %s, %s, %s, %s, %s, %s);""", (first, last, bride_groom, email, phone, w_party));
       print("Guest added")
    elif choice == 2:
        print("Choice 2")
    elif choice == 3:
        print("Choice 3")
    
    
    
#    print("Please input up to 10 guest number separated only by a comma")
#    guests = input()
#    guest_num = guest.split(",")
#    for i in range(len(guest_num)):
#        guest_num[i] = int(guest_num[i])
#cur.execute("""
#    INSERT INTO seating
#    VALUES (%s, 
#""", (table,));

#    print(f"Seating created")
#    conn.commit()
    
    
    
#SELECT guest_id
#FROM guests
#WHERE guest_id NOT IN seating;