import psycopg2

conn = psycopg2.connect("postgresql://planner:testing@localhost/wedding_planner")
cur = conn.cursor()

while True:
    print("Please select a from the options below")
    print("1. Add guest")
    print("2. Remove guest")
    print("3. Assign seating")
    choice = int(input())
    
    if choice = 1:
        curr.execute("""
            SELECT max(guest_id) FROM guests RETURNING max(guest_id);"""
            guest_id = int(cur.fetchone()[0])+1
            print(guest_id)
    elif choice = 2:
        print("Choice 2")
    elif choice = 3:
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