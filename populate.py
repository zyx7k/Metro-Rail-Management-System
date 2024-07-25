from faker import Faker
import random
from datetime import datetime, timedelta
import string
import getindianname
import itertools
import pandas as pd

fake = Faker()


def is_ascii(s):
    return all(c in string.printable for c in s)


def random_phone_number():
    return fake.random_int(min=6000000000, max=9999999999)


def random_boolean():
    return random.choice([True, False])


def generate_random_date(start_date, end_date):
    start_date = datetime.strptime(start_date, "%Y-%m-%d")
    end_date = datetime.strptime(end_date, "%Y-%m-%d")

    delta = end_date - start_date
    random_days = random.randint(0, delta.days)
    random_date = start_date + timedelta(days=random_days)
    return random_date.strftime("%Y-%m-%d")


def generate_random_time():
    hour = random.randint(0, 23)
    minute = random.randint(0, 59)
    second = random.randint(0, 59)
    return f"{hour:02d}:{minute:02d}:{second:02d}"


def generate_random_datetime(start_date, end_date):
    start = datetime.strptime(start_date, "%Y-%m-%d")
    end = datetime.strptime(end_date, "%Y-%m-%d")
    random_seconds = random.randint(0, int((end - start).total_seconds()))
    random_datetime = start + timedelta(seconds=random_seconds)
    return random_datetime


def get_random_color():
    colors = [
        "red",
        "blue",
        "green",
        "yellow",
        "orange",
        "purple",
        "pink",
        "brown",
        "black",
        "white",
    ]
    return random.choice(colors)


def generate_random_float(start, end):
    return round(random.uniform(start, end), 2)


red_line = ["LBNagar", "MGBusStation", "Ameerpet", "Kukatpally", "Miyapur"]
green_line = ["Falakuma", "MGBusStation", "ParadeGround"]
blue_line = ["Nagole", "ParadeGround", "Begumpet", "Ameerpet", "HITechCity", "RaiDurg"]

station_prices = []


def calculate_price(num_stops):
    return num_stops * 10


def generate_station_prices(line):
    for station1 in line:
        for station2 in line:
            if station1 != station2:
                num_stops = abs(line.index(station1) - line.index(station2))
                price = calculate_price(num_stops)
                station_prices.append(
                    {
                        "s1": station1,
                        "s2": station2,
                        "common_station": None,
                        "price": price,
                    }
                )


def find_common_stations(line1, line2):
    return list(set(line1).intersection(line2))


def generate_station_prices_between_lines(line1, line2):
    common_stations = find_common_stations(line1, line2)
    for common_station in common_stations:
        for station1 in line1:
            if station1 != common_station:
                for station2 in line2:
                    if station2 != common_station:
                        num_stops = abs(
                            line1.index(station1) - line1.index(common_station)
                        ) + abs(line2.index(station2) - line2.index(common_station))
                        price = calculate_price(num_stops)
                        station_prices.append(
                            {
                                "s1": station1,
                                "s2": station2,
                                "common_station": common_station,
                                "price": price,
                            }
                        )


generate_station_prices(red_line)
generate_station_prices(green_line)
generate_station_prices(blue_line)

generate_station_prices_between_lines(red_line, green_line)
generate_station_prices_between_lines(red_line, blue_line)
generate_station_prices_between_lines(green_line, blue_line)

station_prices_df = pd.DataFrame(station_prices)
# print(station_prices_df)


def priceBetweenStations(station1, station2):
    for index, row in station_prices_df.iterrows():
        if row["s1"] == station1 and row["s2"] == station2:
            return row["price"]
        if row["s2"] == station1 and row["s1"] == station2:
            return row["price"]
    return -1


PASSENGER = pd.DataFrame(
    columns=[
        "PassengerId",
        "FirstName",
        "MiddleName",
        "LastName",
        "DateOfBirth",
        "PhoneNo",
        "Privilege",
    ]
)


def generate_passenger_data():
    count = 20
    for _ in range(count):
        indianName = getindianname.randname()
        while (
            not is_ascii(indianName)
            or len(indianName.split()[0]) + len(indianName.split()[1]) < 5
        ):
            indianName = getindianname.randname()
        first_name = indianName.split()[0]
        middle_name = random.choice(string.ascii_letters).upper()
        last_name = indianName.split()[1]

        dob = fake.date_of_birth()
        phone = random_phone_number()
        privilege = random.choice(["Regular", "Premium", "Student", "SeniorCitizen"])
        PASSENGER.loc[_] = (
            _ + 1,
            first_name,
            middle_name,
            last_name,
            dob,
            phone,
            PermissionError,
        )
        print(
            f"('{first_name}' '{middle_name}' '{last_name}', '{dob}', {phone}, '{privilege}')",
            end="",
        )
        if _ == count - 1:
            print(";")
        else:
            print(",")


STATION = pd.DataFrame(
    columns=[
        "StationID",
        "Area",
        "City",
        "State",
        "PlatformCount",
        "DateOfEstablishment",
        "Administrator",
    ]
)


def generate_station_data():
    stations = [
        ("LBNagar", "Hyderabad", "Telangana"),
        ("MGBusStation", "Hyderabad", "Telangana"),
        ("Ameerpet", "Hyderabad", "Telangana"),
        ("Miyapur", "Hyderabad", "Telangana"),
        ("Falakuma", "Hyderabad", "Telangana"),
        ("ParadeGround", "Hyderabad", "Telangana"),
        ("Charminar", "Hyderabad", "Telangana"),
        ("Kukatpally", "Hyderabad", "Telangana"),
        ("Nagole", "Hyderabad", "Telangana"),
        ("Begumpet", "Hyderabad", "Telangana"),
        ("HITechCity", "Hyderabad", "Telangana"),
        ("RaiDurg", "Hyderabad", "Telangana"),
    ]
    count = len(stations)
    for _ in range(count):
        (area, city, state) = stations[_]
        platform_count = random.randint(2, 8)
        date_of_establishment = generate_random_date("2000-01-01", "2023-01-01")
        administrator = random.choice(STATION["StationID"]) if _ != 0 else "NULL"
        if random.randint(1, 10) < 6:
            administrator = "NULL"
        STATION.loc[_] = (
            _ + 1,
            area,
            city,
            state,
            platform_count,
            date_of_establishment,
            administrator,
        )
        print(
            f"('{area}', '{city}', '{state}', {platform_count}, '{date_of_establishment}', {administrator})",
            end="",
        )
        if _ == count - 1:
            print(";")
        else:
            print(",")


TRAIN = pd.DataFrame(
    columns=["TrainID", "SeatingCapacity", "EngineModel", "CoachCount", "ServiceYears"]
)


def generate_train_data():
    count = 10
    for _ in range(count):
        seating_capacity = random.randint(100, 500)
        engine_model = "".join(
            random.choice(string.ascii_uppercase + string.digits)
            for _i in range(random.randint(5, 8))
        )
        coach_count = random.randint(5, 15)
        service_years = random.randint(1, 10)
        TRAIN.loc[_] = (
            _ + 1,
            seating_capacity,
            engine_model,
            coach_count,
            service_years,
        )
        print(
            f"({seating_capacity}, '{engine_model}', {coach_count}, {service_years})",
            end="",
        )
        if _ == count - 1:
            print(";")
        else:
            print(",")


LINE = pd.DataFrame(columns=["LineID", "Color", "City", "TotalTravelTime"])


def generate_line_data():
    count = 3
    for _ in range(count):
        lineid = _ + 1
        # color = get_random_color()
        color = ["red", "green", "blue"][_]
        city = "Hyderabad"
        totaltt = random.randint(30, 90)
        LINE.loc[_] = (lineid, color, city, totaltt)
        print(
            f"({lineid}, '{color}', '{city}', {totaltt})",
            end="",
        )
        if _ == count - 1:
            print(";")
        else:
            print(",")


TICKET = pd.DataFrame(
    columns=[
        "TicketID",
        "Source",
        "Destination",
        "TimeOfPurchase",
        "PassengerID",
        "Price",
    ]
)


def generate_ticket_data():
    count = 20
    for _ in range(count):
        ticketID = _ + 1
        src = random.choice(STATION["StationID"])
        dest = random.choice(STATION["StationID"])
        while dest == src:
            dest = random.choice(STATION["StationID"])
        top = generate_random_datetime("2015-01-01", "2024-01-01")
        pid = random.choice(PASSENGER["PassengerId"])
        price = priceBetweenStations(
            STATION.loc[STATION[STATION["StationID"] == src].index.item(), "Area"],
            STATION.loc[STATION[STATION["StationID"] == dest].index.item(), "Area"],
        )
        if price < 0:
            _ -= 1
            continue
        TICKET.loc[_] = (ticketID, src, dest, top, pid, price)
        print(
            f"({ticketID}, {src}, {dest}, '{top}', {pid}, {price})",
            end="",
        )
        if _ == count - 1:
            print(";")
        else:
            print(",")


TIMETABLE = pd.DataFrame(
    columns=["EntryID", "Station", "TimeOfArrival", "TimeOfDeparture"]
)


def generate_timetable_data():
    count = 80
    for _ in range(count):
        station = random.choice(STATION["StationID"])
        toa = generate_random_time()
        toa_datetime = datetime.strptime(toa, "%H:%M:%S")
        tod_datetime = toa_datetime + timedelta(minutes=random.randint(1, 3))
        tod = tod_datetime.strftime("%H:%M:%S")
        TIMETABLE.loc[len(TIMETABLE)] = (_ + 1, station, toa, tod)
        print(
            f"({station}, '{toa}', '{tod}')",
            end="",
        )
        if _ == count - 1:
            print(";")
        else:
            print(",")


METROCARD = pd.DataFrame(
    columns=["CardNumber", "AvailableBalance", "Validity", "Status"]
)


def generate_metro_card_data():
    count = random.randint(10, len(PASSENGER))
    for _ in range(count):
        cardnum = _ + 1
        avl = generate_random_float(0, 3000)
        val = generate_random_date("2021-01-01", "2026-01-01")
        status = 'Active'
        if val < "2022-01-01":
            status = "Expired"
        elif random.randint(1,10)<2:
            status = "Blocked"

        METROCARD.loc[_] = (cardnum, avl, val, status)
        print(
            f"({cardnum}, {avl}, '{val}', '{status}')",
            end="",
        )
        if _ == count - 1:
            print(";")
        else:
            print(",")


TRANSACTION = pd.DataFrame(columns=["TxnID", "TimeOfEntry", "SwipeType"])


def generate_transaction_data():
    count = random.randint(1, 50)
    for _ in range(2 * count):
        TxnId = _ + 1
        te = generate_random_datetime("2020-01-01", "2024-01-01")
        st = 0

        TRANSACTION.loc[_] = (TxnId, te, st)
        print(f"({TxnId}, '{te}', {st})", end="")
        if _ == count - 1:
            print(";")
        else:
            print(",")

        if random.randint(1, 10) < 8:
            _ += 1
            TxnId = _ + 2
            te = te + timedelta(
                minutes=random.randint(10, 50), seconds=random.randint(0, 60)
            )
            st = 1

            TRANSACTION.loc[_] = (TxnId, te, st)
            print(
                f"({TxnId}, '{te}', {st})",
                end="",
            )
            if _ == count - 1:
                print(";")
            else:
                print(",")


EATERY = pd.DataFrame(
    columns=["Name", "Location", "StationID", "AveragePrice", "Rating", "NonVegOptions"]
)


def generate_eatery_data():
    count = random.randint(1, 5) * len(STATION)
    names = [
        "KFC",
        "McDonalds",
        "BurgerKing",
        "Wendys",
        "Dominos",
        "PizzaHut",
        "OvenStory",
        "MojoPizza",
        "KarachiBakery",
        "KSBakers",
        "Haldirams",
    ]
    locations = [
        "MainEntrance",
        "MainExit",
        "WaitingLounge",
        "Underpass",
        "Rooftop",
        "TicketCounter",
    ]
    stations = range(1, len(STATION) + 1)
    for _ in range(count):
        (n, l, s) = random.choice(list(itertools.product(names, locations, stations)))
        avgprice = generate_random_float(100, 400)
        rating = generate_random_float(2, 5)
        nonveg = random.choice([0, 1])

        EATERY.loc[_] = (n, l, s, avgprice, rating, nonveg)
        print(
            f"('{n}', '{l}', {s}, {avgprice}, {rating}, {nonveg})",
            end="",
        )
        if _ == count - 1:
            print(";")
        else:
            print(",")


EATERY_ITEMS = pd.DataFrame(columns=["ItemName", "EateryName", "EateryLocation"])


def generate_eatery_items_data():
    count = random.randint(1, 100)
    items = [
        "Spring rolls",
        "Pizza",
        "Popcorn",
        "Chocolate cake",
        "Pancakes",
        "Croissants",
        "Sushi",
        "Potato chips",
        "Ice cream",
        "Omelette",
        "Bruschetta",
        "Tacos",
        "Pretzels",
        "Cheesecake",
        "French toast",
        "Hummus",
        "Steak",
        "Trail mix",
        "Fruit salad",
        "Avocado toast",
        "Samosas",
        "Biryani",
        "Nachos",
        "Panna cotta",
        "Cereal",
        "Caprese salad",
        "Fruit juice",
        "Muffins",
        "Donuts",
        "Bread rolls",
        "Coffee",
        "Soda",
        "Beer",
        "Tea",
        "Iced tea",
        "Wine",
        "Fruit juice",
        "Vodka",
        "Hot chocolate",
        "Smoothies",
        "Espresso",
        "Milkshakes",
        "Whiskey",
        "Chai",
        "Martini",
    ]
    for _ in range(count):
        e = EATERY.sample(n=1)
        if e is None:
            _ -= 1
            continue
        n = e.iloc[0]["Name"]
        l = e.iloc[0]["StationID"]
        i = random.choice(items)
        while _ != 0 and any(
            EATERY_ITEMS[col].eq(val).all()
            for col, val in zip(EATERY_ITEMS.columns, (i, n, l))
        ):
            e = EATERY.sample(n=1)
            n = e.iloc[0]["Name"]
            l = e.iloc[0]["StationID"]
            i = random.choice(items)
        EATERY_ITEMS.loc[_] = (i, n, l)
        print(
            f"('{i}', '{n}', '{l}')",
            end="",
        )
        if _ == count - 1:
            print(";")
        else:
            print(",")


STOPS_AT = pd.DataFrame(columns=["Train", "Station"])


def generate_stops_at_data():
    t = random.randint(1, len(TRAIN))
    count = len(red_line)
    for _ in range(count):
        st = STATION[STATION["Area"] == red_line[_]].to_records(index=False)[0][0]
        STOPS_AT.loc[len(STOPS_AT)] = (t, st)
        print(
            f"({t}, {st})",
            end=",\n",
        )
    t1 = random.randint(1, len(TRAIN))
    while t1 == t:
        t1 = random.randint(1, len(TRAIN))
    count = len(green_line)
    for _ in range(count):
        st = STATION[STATION["Area"] == green_line[_]].to_records(index=False)[0][0]
        STOPS_AT.loc[len(STOPS_AT)] = (t1, st)
        print(
            f"({t1}, {st})",
            end=",\n",
        )
    t2 = random.randint(1, len(TRAIN))
    while t2 == t or t1 == t2:
        t2 = random.randint(1, len(TRAIN))
    count = len(green_line)
    for _ in range(count):
        st = STATION[STATION["Area"] == blue_line[_]].to_records(index=False)[0][0]
        STOPS_AT.loc[len(STOPS_AT)] = (t2, st)
        print(
            f"({t2}, {st})",
            end="",
        )
        if _ == count - 1:
            print(";")
        else:
            print(",")


FOLLOWS = pd.DataFrame(columns=["Train", "LineID", "Timetable"])


def generate_follows_data():
    count = 100
    for _ in range(count):
        t = random.randint(1, len(TRAIN) + 1)
        l = random.randint(1, len(LINE) + 1)
        tt = random.randint(1, len(TIMETABLE) + 1)
        FOLLOWS.loc[_] = (t, l, tt)
        print(
            f"({t}, {l}, {tt})",
            end="",
        )
        if _ == count - 1:
            print(";")
        else:
            print(",")


TRAIN_STOPS = pd.DataFrame(columns=["LineID", "StopName", "StopNum"])


def generate_train_stops_data():
    count = len(red_line)
    l = 1
    _i = 0
    for _ in range(count):
        sname = STATION.loc[STATION[STATION["Area"] == red_line[_]].index.item(), "StationID"]
        snum = _
        TRAIN_STOPS.loc[_i] = (l, sname, snum)
        _i += 1
        print(
            f"({l}, {sname}, {snum})",
            end=",\n",
        )
    count = len(green_line)
    l = 2
    for _ in range(count):
        sname = STATION.loc[STATION[STATION["Area"] == green_line[_]].index.item(), "StationID"]
        snum = _
        TRAIN_STOPS.loc[_i] = (l, sname, snum)
        _i += 1
        print(
            f"({l}, {sname}, {snum})",
            end=",\n",
        )
    count = len(blue_line)
    l = 3
    for _ in range(count):
        sname = sname = STATION.loc[STATION[STATION["Area"] == blue_line[_]].index.item(), "StationID"]
        snum = _
        TRAIN_STOPS.loc[_i] = (l, sname, snum)
        _i += 1
        print(
            f"({l}, {sname}, {snum})",
            end="",
        )
        if _ == count - 1:
            print(";")
        else:
            print(",")


ASSIGNED_TO = pd.DataFrame(
    columns=["MetroCard", "Passenger", "StationOfIssue", "DateOfIssue"]
)


def generate_assigned_to_data():
    validmc = [i for i, row in METROCARD.iterrows() if row["Status"] == "Active"]
    count = len(validmc)
    for _ in range(count):
        p = random.randint(1, len(PASSENGER))
        s = random.randint(1, len(STATION)) - 1
        d = generate_random_date("2021-01-01", "2026-01-01")
        ASSIGNED_TO.loc[_] = (validmc[_], p, s - 1, d)
        print(
            f"({validmc[_]}, {p}, {s}, '{d}')",
            end="",
        )
        if _ == count - 1:
            print(";")
        else:
            print(",")


CREATE_TXN = pd.DataFrame(columns=["Passenger", "MetroCard", "Station", "Transaction"])


def generate_create_txn_data():
    _ = 0
    count = len(ASSIGNED_TO)
    for _i, r in ASSIGNED_TO.iterrows():
        p = r["Passenger"]
        m = r["MetroCard"]
        s = random.randint(1, len(STATION)) - 1
        s2 = random.randint(1, len(STATION)) - 1
        while s2 == s:
            s2 = random.randint(1, len(STATION)) - 1
        t = random.randint(1, len(TRANSACTION))

        while TRANSACTION.iloc[t]["SwipeType"] == 1:
            t = random.randint(1, len(TRANSACTION))
        t2 = t + 1
        CREATE_TXN.loc[_] = (p, m, s, t)
        print(
            f"({p}, {m}, {s}, {t})",
            end="",
        )
        if _ == count - 1:
            print(";")
        else:
            print(",")
        if TRANSACTION.iloc[t2]["SwipeType"] == 1:
            _ += 1
            CREATE_TXN.loc[_] = (p, m, s2, t2)
            print(
                f"({p}, {m}, {s2}, {t2})",
                end="",
            )
            if _ == count - 1:
                print(";")
            else:
                print(",")
        _ += 1


STATION_MASTER = pd.DataFrame(
    columns=[
        "EmployeeID",
        "FirstName",
        "MiddleName",
        "LastName",
        "DateOfBirth",
        "PhoneNo",
        "WorksIn",
        "DateOfJoining",
    ]
)


def generate_station_master_data():
    count = 20
    for _ in range(count):
        indianName = getindianname.randname()
        while (
            not is_ascii(indianName)
            or len(indianName.split()[0]) + len(indianName.split()[1]) < 5
        ):
            indianName = getindianname.randname()
        first_name = indianName.split()[0]
        middle_name = random.choice(string.ascii_letters).upper()
        last_name = indianName.split()[1]

        dob = fake.date_of_birth()
        phone = random_phone_number()
        wi = random.randint(0, len(STATION) - 1)
        doj = generate_random_date("2010-01-01", "2024-01-01")
        STATION_MASTER.loc[_] = (
            _ + 1,
            first_name,
            middle_name,
            last_name,
            dob,
            phone,
            wi,
            doj,
        )
        print(
            f"('{first_name}' '{middle_name}' '{last_name}', '{dob}', {phone}, {wi}, '{doj}')",
            end="",
        )
        if _ == count - 1:
            print(";")
        else:
            print(",")


TRAIN_DRIVER = pd.DataFrame(
    columns=[
        "DriverID",
        "FirstName",
        "MiddleName",
        "LastName",
        "DateOfBirth",
        "PhoneNo",
        "TrainID",
        "DateOfJoining",
    ]
)


def generate_train_driver_data():
    count = 20
    for _ in range(count):
        indianName = getindianname.randname()
        while (
            not is_ascii(indianName)
            or len(indianName.split()[0]) + len(indianName.split()[1]) < 5
        ):
            indianName = getindianname.randname()
        first_name = indianName.split()[0]
        middle_name = random.choice(string.ascii_letters).upper()
        last_name = indianName.split()[1]

        dob = fake.date_of_birth()
        phone = random_phone_number()
        tid = random.randint(0, len(TRAIN))
        doj = generate_random_date("2010-01-01", "2024-01-01")
        STATION_MASTER.loc[_] = (
            _ + 1,
            first_name,
            middle_name,
            last_name,
            dob,
            phone,
            tid,
            doj,
        )
        print(
            f"('{first_name}' '{middle_name}' '{last_name}', '{dob}', {phone}, {tid}, '{doj}')",
            end="",
        )
        if _ == count - 1:
            print(";")
        else:
            print(",")


print(
    "INSERT INTO PASSENGER (FirstName, MiddleName, Lastname, DateOfBirth, PhoneNo, Privilege) VALUES"
)
generate_passenger_data()
print()

print(
    "INSERT INTO STATION (Area, City, State, PlatformCount, DateOfEstablishment, Administrator) VALUES"
)
generate_station_data()
print()

print(
    "INSERT INTO TRAIN (SeatingCapacity, EngineModel, CoachCount, ServiceYears) VALUES"
)
generate_train_data()
print()

print("INSERT INTO LINE (LineID, Color, City, TotalTravelTime) VALUES")
generate_line_data()
print()

print(
    "INSERT INTO TICKET (Source, Destination, TimeOfPurchase, PassengerID, Price) VALUES"
)
generate_ticket_data()
print()

print("INSERT INTO TIMETABLE (EntryID, Station, TimeOfArrival, TimeOfDeparture) VALUES")
generate_timetable_data()
print()

print("INSERT INTO METRO_CARD (CardNumber, AvailableBalance, Validity, Status) VALUES")
generate_metro_card_data()
print()

print("INSERT INTO TRANSACTION (TxnId, TimeOfEntry, SwipeType) VALUES")
generate_transaction_data()
print()

print(
    "INSERT INTO EATERY (Name, Location, StationID, AveragePrice, Rating, NonVegOptions) VALUES"
)
generate_eatery_data()
print()

print("INSERT INTO EATERY_ITEMS (ItemName, EateryName, EateryLocation) VALUES")
generate_eatery_items_data()
print()

print("INSERT INTO STOPS_AT (Train, Station) VALUES")
generate_stops_at_data()
print()

print("INSERT INTO FOLLOWS (Train, LineID, Timetable) VALUES")
generate_follows_data()
print()

print("INSERT INTO TRAIN_STOPS (LineID, StopName, StopNum) VALUES")
generate_train_stops_data()
print()

print(
    "INSERT INTO ASSIGNED_TO (MetroCard, Passenger, StationOfIssue, DateOfIssue) VALUES"
)
generate_assigned_to_data()
print()

print("INSERT INTO CREATE_TXN (Passenger, MetroCard, Station, Transaction) VALUES")
generate_create_txn_data()
print()

print(
    "INSERT INTO STATION_MASTER (EmployeeID, FirstName, MiddleName, Lastname, DateOfBirth, PhoneNo, WorksIn, DateOfJoining) VALUES"
)
generate_station_master_data()
print()

print(
    "INSERT INTO TRAIN_DRIVER (EmployeeID, FirstName, MiddleName, Lastname, DateOfBirth, PhoneNo, WorksIn, DateOfJoining) VALUES"
)
generate_train_driver_data()
print()
