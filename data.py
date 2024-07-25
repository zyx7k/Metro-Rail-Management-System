import subprocess as sp
import pymysql
import pymysql.cursors
from tabulate import tabulate


RED = '\033[31m'
GREEN = '\033[32m'
YELLOW = '\033[33m'
MAGENTA = '\033[35m'
CYAN = '\033[36m'
END = '\033[0m'


def tryExecute(query, errmsg):
    print(CYAN+query+END)
    try:
        cur.execute(query)
    except Exception as e:
        con.rollback()
        # tmp = sp.call('clear', shell=True)
        print("Failed to", errmsg)
        print(">>>>>>>>>>>>>", e)
        tmp = input("Enter any key to CONTINUE>")
        sp.call('clear', shell=True)
        return False
    return True


def printPrettyTable(header, rows):
    table = [header]
    for row in rows:
        table.append(row.values())
    print(tabulate(table, headers="firstrow", tablefmt='rst'))


# M.1.1
def addPassenger():
    line = input(
        "Enter passenger details: FirstName MiddleName LastName DOB PhoneNumber Privilege\n")
    line = line.split()
    if len(line) != 6:
        print(RED + "Invalid Input"+END)
        return
    if not line[0].isalpha() or not line[1].isalpha() or not line[2].isalpha():
        print(RED + "Invalid Name"+END)
        return
    if len(line[3]) != 10 and line[3][4] != '-' and line[3][6] != '-':
        print(RED + "Invalid DOB"+END)
        return
    if len(line[4]) != 10:
        print(RED + "Invalid Phone Number"+END)
        return
    if line[5] != "Student" and line[5] != "SeniorCitizen" and line[5] != "Regular" and line[5] != "Premium":
        print(RED + "Invalid Privilege"+END)
        return

    query = "INSERT INTO PASSENGER(FirstName, MiddleName, LastName, DateOfBirth, PhoneNo, Privilege) VALUES ('{}', '{}', '{}', '{}', '{}', '{}')".format(
        line[0], line[1], line[2], line[3], line[4], line[5])
    if tryExecute(query, "add passenger"):
        con.commit()
        print(GREEN+"Passenger added successfully"+END)


# M.1.2
def addStation():
    line = input(
        "Enter station details: Area, City, State, PlatformCount, DateOfEstablishment, Administrator\n")
    line = line.split()
    if len(line) != 6:
        print(RED + "Invalid Input"+END)
        return
    if not line[0].isalpha() or not line[1].isalpha() or not line[2].isalpha():
        print(RED + "Invalid Name"+END)
        return
    if not line[3].isdigit():
        print(RED + "Invalid Platform Count"+END)
        return
    if len(line[4]) != 10 and line[4][4] != '-' and line[4][6] != '-':
        print(RED + "Invalid Date of Establishment"+END)
        return
    if not line[5].isdigit():
        print(RED + "Invalid Administrator"+END)
        return

    query = "INSERT INTO STATION(Area, City, State, PlatformCount, DateOfEstablishment, Administrator) VALUES ( '{}', '{}', '{}', {}, '{}', {})".format(
        line[0], line[1], line[2], line[3], line[4], line[5])
    if tryExecute(query, "add station"):
        con.commit()
        print(GREEN+"Station added successfully"+END)


# M.1.3 -- Not in functional requirements
def addTicket():
    line = input(
        "Enter ticket details: SrcStation DestStation Time PassengerID\n")
    line = line.split()
    if len(line) != 5:
        print(RED + "Invalid Input"+END)
        return
    if not line[0].isdigit() or not line[1].isdigit():
        print(RED+"Invalid Station ID" + END)
        return
    if line[2][4] != '-' and line[2][6] != '-':
        print(RED + "Invalid Time"+END)
        return
    if not line[4].isdigit():
        print(RED + "Invalid PassengerID" + END)
        return

    query = "INSERT INTO TICKET(Source, Destination, TImeOfPurchase, PassengerID) VALUES ('{}', '{}', '{} {}', '{}')".format(
        line[0], line[1], line[2], line[3], line[4])
    if tryExecute(query, "add ticket"):
        con.commit()
        print(GREEN+"Ticket booked successfully"+END)


# M.2.1
def updateAvgPrice():
    line = input("Enter Eatery StationID AvgPrice: ")
    line = line.split()
    if len(line) != 3:
        print(RED + "Invalid Input"+END)
        return
    if not line[0].isalpha():
        print(RED + "Invalid Eatery"+END)
        return
    if not line[1].isdigit():
        print(RED + "Invalid StationID"+END)
        return
    if not line[2].isdigit():
        print(RED + "Invalid AvgPrice"+END)
        return

    query = "UPDATE EATERY SET AveragePrice = {} WHERE StationID = {} AND NAME = '{}'".format(
        line[2], line[1], line[0])
    if tryExecute(query, "update eatery avg price"):
        con.commit()
        print(GREEN+"Eatery avg price updated successfully"+END)


# M.2.2
def transferStationMaster():
    line = input("Enter EmployeeID NewStationID: ")
    line = line.split()
    if len(line) != 2:
        print(RED + "Invalid Input"+END)
        return
    if not line[0].isdigit():
        print(RED + "Invalid EmployeeID"+END)
        return
    if not line[1].isdigit():
        print(RED + "Invalid NewStationID"+END)
        return

    query = "UPDATE STATION_MASTER SET WorksIn = {} WHERE EmployeeID = {}".format(
        line[1], line[0])
    if tryExecute(query, "transfer station master"):
        con.commit()
        print(GREEN+"Station master transferred successfully"+END)


# M.3.1
def removePassenger():
    line = input("Enter PassengerID:")
    line = line.split()
    if len(line) != 1:
        print(RED + "Invalid Input"+END)
        return
    if not line[0].isdigit():
        print(RED + "Invalid PassengerID"+END)
        return

    query = "DELETE FROM PASSENGER WHERE PassengerID = {}".format(
        line[0])
    if tryExecute(query, "remove passenger"):
        con.commit()
        print(GREEN+"Passenger removed successfully"+END)


# M.3.2
def removeTrain():
    line = input("Enter TrainID:")
    line = line.split()
    if len(line) != 1:
        print(RED + "Invalid Input"+END)
        return
    if not line[0].isdigit():
        print(RED + "Invalid TrainID"+END)
        return

    query = "DELETE FROM TRAIN WHERE TrainID = {}".format(
        line[0])
    if tryExecute(query, "remove train"):
        con.commit()
        print(GREEN+"Train removed successfully"+END)


# R.1.1
def stationList():
    line = input("Enter City, State: ")
    line = line.split()
    if len(line) != 2:
        print(RED + "Invalid Input"+END)
        return
    if not line[0].isalpha() or not line[1].isalpha():
        print(RED + "Invalid Input"+END)
        return

    query = "SELECT StationID, Area FROM STATION WHERE City = '{}' AND State = '{}'".format(
        line[0], line[1])
    if tryExecute(query, "get train list"):
        rows = cur.fetchall()
        header = ['ID', 'Name']
        printPrettyTable(header, rows)


# R.1.2
def stationTrainList():
    line = input("Enter StationID: ")
    line = line.split()
    if len(line) != 1:
        print(RED + "Invalid Input"+END)
        return
    if not line[0].isdigit():
        print(RED + "Invalid StationID"+END)
        return

    query = "SELECT T.TrainID, TT.TimeOfArrival, TT.TimeOfDeparture FROM TRAIN T JOIN FOLLOWS F ON T.TrainID = F.Train JOIN TIMETABLE TT ON F.Timetable = TT.EntryID JOIN STATION S ON S.StationID = TT.Station WHERE S.StationID = '{}'".format(
        line[0])
    if tryExecute(query, "get train list"):
        rows = cur.fetchall()
        header = ['TrainID', 'Arrival', 'Departure']
        printPrettyTable(header,  rows)


# R.2.1
def cardBalance():
    query = "SELECT CardNumber, AvailableBalance FROM METRO_CARD"
    if tryExecute(query, "get card balance"):
        rows = cur.fetchall()
        header = ['CardNum', 'Balance']
        printPrettyTable(header,  rows)


# R.2.2
def trainInfo():
    query = "SELECT TrainID, EngineModel FROM TRAIN"
    if tryExecute(query, "get train info"):
        rows = cur.fetchall()
        header = ['TrainID', 'Engine Model']
        printPrettyTable(header,  rows)


# R.3.1
def countTicketsInMonth():
    line = input("Enter Month: ")
    line = line.split()
    if len(line) != 1 or int(line[0]) > 12 or int(line[0]) < 1:
        print(RED + "Invalid Input"+END)
        return

    query = "SELECT COUNT(*) FROM TICKET WHERE MONTH(TimeOfPurchase) = {}".format(
        line[0])
    if tryExecute(query, "remove train"):
        rows = cur.fetchall()
        header = ['Count']
        printPrettyTable(header,  rows)


# R.3.2
def revenueInMonth():
    line = input("Enter Month: ")
    line = line.split()
    if len(line) != 1 or int(line[0]) > 12 or int(line[0]) < 1:
        print(RED + "Invalid Input"+END)
        return

    query = "SELECT SUM(Price) FROM TICKET WHERE MONTH(TimeOfPurchase) = {}".format(
        line[0])
    if tryExecute(query, "remove train"):
        rows = cur.fetchall()
        header = ['Revenue']
        printPrettyTable(header,  rows)


# R.3.3
def longestTrain():
    query = "SELECT LineID, Color, TotalTravelTime FROM LINE WHERE TotalTravelTime = (SELECT MAX(TotalTravelTime) FROM LINE)"
    if tryExecute(query, "longest train"):
        rows = cur.fetchall()
        header = ['LineID', 'Color', 'Total Travel Time']
        printPrettyTable(header,  rows)


# R.3.4
def latestStationMaster():
    query = "SELECT SM.EmployeeID, CONCAT(SM.FirstName, ' ', SM.MiddleName, ' ', SM.LastName), SM.DateOfBirth, SM.PhoneNo, CONCAT(S.Area, ', ', S.City), SM.DateOfJoining FROM STATION_MASTER SM JOIN STATION S ON SM.WorksIn = S.StationID WHERE DateOfJoining = (SELECT MAX(SM.DateOfJoining) FROM STATION_MASTER SM)"
    if tryExecute(query, "latest station master"):
        rows = cur.fetchall()
        header = ['EmpID', 'Name', 'DOB', 'Phone',
                  'Works at', 'Date of Joining']

        printPrettyTable(header,  rows)


# R.3.5
def avgEateryRating():
    line = input("Enter Area City: ")
    line = line.split()
    if len(line) != 2:
        print(RED + "Invalid Input"+END)
        return
    if not line[0].isalpha() or not line[1].isalpha():
        print(RED + "Invalid Input"+END)
        return

    query = "SELECT AVG(Rating) FROM EATERY, STATION WHERE STATION.StationID = EATERY.StationID AND Area = '{}' AND City = '{}'".format(
        line[0], line[1])
    if tryExecute(query, "average eatery rating"):
        rows = cur.fetchall()
        header = ['Avg Rating']
        printPrettyTable(header, rows)


# R.4.1
def listStationByName():
    keyword = "pet"
    query = "SELECT * FROM STATION WHERE Area LIKE '%{}%'".format(
        keyword)
    if tryExecute(query, "list station by name"):
        rows = cur.fetchall()
        header = ['ID', 'Name', 'City', 'State',
                  'Platform Count', 'EstDate', 'RegionalHead']
        printPrettyTable(header, rows)


# R.4.2
def passengerByPrivilege():
    privilege = "Student"
    query = "SELECT PassengerID, CONCAT(FirstName, ' ', MiddleName, ' ', LastName), DateOfBirth, PhoneNo FROM PASSENGER WHERE Privilege = '{}'".format(
        privilege)
    if tryExecute(query, "passenger by student privilege"):
        rows = cur.fetchall()
        header = ['ID', 'Name', 'DOB', 'Phone']
        printPrettyTable(header, rows)


# A.1
def pastHistory():
    line = input("Enter PassengerID: ")
    line = line.split()
    if len(line) != 1 and not line[0].isdigit():
        print(RED + "Invalid Input"+END)
        return
    if not line[0].isdigit():
        print(RED + "Invalid PassengerID"+END)
        return

    query = "SELECT T.TimeOfPurchase, S1.Area AS SourceArea, S2.Area AS DestinationArea, T.Price FROM TICKET T JOIN STATION S1 ON T.Source = S1.StationID JOIN STATION S2 ON T.Destination = S2.StationID JOIN TIMETABLE TT ON T.Destination = TT.Station WHERE T.PassengerID = '1' AND TT.TimeOfArrival < NOW()".format(
        line[0])
    if tryExecute(query, "past history tickets"):
        rows = cur.fetchall()
        header = ['Time of Purchase' 'TrainID', 'Arrival', 'Departure']
        print("Past Tickets")
        printPrettyTable(header, rows)

    query = "SELECT CT.MetroCard, S.Area, T.TimeOfEntry, CASE WHEN T.SwipeType = 0 THEN 'Entry' ELSE 'Exit' END FROM CREATE_TXN CT JOIN STATION S ON CT.Station = S.StationID JOIN TRANSACTION T ON CT.Transaction = T.TxnID WHERE CT.Passenger = '{}' ".format(
        line[0])
    if tryExecute(query, "past history transactions"):
        rows = cur.fetchall()
        header = ['CardNum', 'Station', 'Time', 'Swipe Type']
        print("Past Transactions")
        printPrettyTable(header, rows)


# A.2
def stationView():
    line = input("Enter StationID: ")
    line = line.split()
    if len(line) != 1:
        print(RED + "Invalid Input"+END)
        return
    if not line[0].isdigit():
        print(RED + "Invalid StationID"+END)
        return

    query = "SELECT S.Area FROM STATION AS S JOIN TRAIN_STOPS TS ON TS.StopName = S.StationID WHERE TS.LineID IN (SELECT LineID FROM TRAIN_STOPS AS TS JOIN STATION AS S ON TS.StopName = S.StationID WHERE S.StationID = {} )".format(
        line[0])
    if tryExecute(query, "station view"):
        rows = cur.fetchall()
        header = ['Station Name']
        printPrettyTable(header,  rows)


# Global
tmp = sp.call('clear', shell=True)

username = input("Username: ")
password = input("Password: ")

try:
    con = pymysql.connect(host='localhost',
                          port=3306,
                          user=username,
                          password=password,
                          db='metro',
                          unix_socket="/run/mysqld/mysqld.sock",
                          cursorclass=pymysql.cursors.DictCursor)

    if (con.open):
        print("Connected")
    else:
        print("Failed to connect")

    tmp = input("Enter any key to CONTINUE>")

except Exception as e:
    print(e)
    print(
        RED+"Connection Refused: Either username or password is incorrect or user doesn't have access to database" + END)
    exit()

sp.call('clear', shell=True)

while (1):
    try:
        with con.cursor() as cur:
            print(YELLOW, end="")
            print("M11 Add Passenger")
            print("M12 Add Station")
            print("M13 Add Ticket")
            print("M21 Update Avg Price of an Eatery")
            print("M22 Transfer Station Master to another Station")
            print("M31 Remove Passenger")
            print("M32 Remove Train")
            print("R11 Get Station List for a City")
            print("R12 Get Train List for a Station")
            print("R21 Balance of all Cards")
            print("R22 Info about all Trains")
            print("R31 Count of number of tickets sold in a month")
            print("R32 Calculate the revenue earned from tickets in a month")
            print("R33 Find the longest running line")
            print("R34 Find the newly joined station master")
            print("R35 Find the average rating of all eateries in a station")
            print("R41 List all stations with a keyword in their name")
            print("R42 List all passengers with a particular privilege")
            print("A11 Travel history of a passenger")
            print("A12 All stations on the same line as a station")

            print(MAGENTA, end="")
            print("Q00 Quit")

            print(END, end="")
            print("Enter your choice: ")
            choice = input()
            choice = choice.upper()

            if choice == 'M11':
                addPassenger()
            elif choice == 'M12':
                addStation()
            elif choice == 'M13':
                addTicket()
            elif choice == 'M21':
                updateAvgPrice()
            elif choice == 'M22':
                transferStationMaster()
            elif choice == 'M31':
                removePassenger()
            elif choice == 'M32':
                removeTrain()
            elif choice == 'R11':
                stationList()
            elif choice == 'R12':
                stationTrainList()
            elif choice == 'R21':
                cardBalance()
            elif choice == 'R22':
                trainInfo()
            elif choice == 'R31':
                countTicketsInMonth()
            elif choice == 'R32':
                revenueInMonth()
            elif choice == 'R33':
                longestTrain()
            elif choice == 'R34':
                latestStationMaster()
            elif choice == 'R35':
                avgEateryRating()
            elif choice == 'R41':
                listStationByName()
            elif choice == 'R42':
                passengerByPrivilege()
            elif choice == 'A11':
                pastHistory()
            elif choice == 'A12':
                stationView()
            elif choice == 'Q00':
                break
            else:
                sp.call('clear', shell=True)
                print(RED + "Invalid Input\n" + END)
                continue

            tmp = input("\nEnter any key to CONTINUE>")
            sp.call('clear', shell=True)

    except Exception as e:
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
        sp.call('clear', shell=True)
