//
//  Vehicle.swift
//
//  Created by Layla Michel
//  Created on 2022-05-26
//  Version 1.0
//  Copyright (c) 2022 IMH. All rights reserved.
//
//  This program creates vehicle objects by reading information from
//  a text file.

import Foundation

class Vehicle {
    // Properties
    internal var vehicleNum: String
    private var licensePlate: String?
    internal var colour: String
    private var doorsNum: String?
    internal var speed: String
    internal var maxSpeed: String

    // Constructor
    init(carNum: String,
         carLicensePlate: String,
         carColour: String,
         carDoorsNum: String,
         carSpeed: String,
         carMaxSpeed: String) {
        vehicleNum = carNum
        licensePlate = carLicensePlate
        colour = carColour
        doorsNum = carDoorsNum
        speed = carSpeed
        maxSpeed = carMaxSpeed
    }

    // Constructor
    init(carNum2: String,
         carColour2: String,
         carSpeed2: String,
         carMaxSpeed2: String) {
        vehicleNum = carNum2
        colour = carColour2
        speed = carSpeed2
        maxSpeed = carMaxSpeed2
    }

    // Accelerates the vehicle by a specified km/h
    func accelerate(acceleration: String) {}

    // Slows the vehicle by a specified km/h
    func brake(deceleration: String) {}

    // Displays the vehicle's current speed to the output text file
    func getSpeed() {}

    // Displays the vehicle's max speed to the output text file
    func getMaxSpeed() {}

    // Displays the vehicle's information to the output text file
    func getInfo() {}
}

class Truck: Vehicle {
    // Properties
    private var licensePlate: String
    private var doorsNum: String
    private var wheelsNum: String
    private var length: String
    private var strArray: [String] = ["0", "0", "0", "0", "0", "0", "0", "0"]
    private var outputPath: String = "/home/runner/Unit3-07-Swift/output.txt"

    // Constructor
    init(truckNum: String,
         truckLicensePlate: String,
         truckColour: String,
         truckDoorsNum: String,
         truckWheelsNum: String,
         truckLength: String,
         truckSpeed: String,
         truckMaxSpeed: String) {
        self.licensePlate = truckLicensePlate
        self.doorsNum = truckDoorsNum
        self.wheelsNum = truckWheelsNum
        self.length = truckLength
        super.init(carNum: truckNum, carLicensePlate: truckLicensePlate,
                   carColour: truckColour, carDoorsNum: truckDoorsNum,
                   carSpeed: truckSpeed, carMaxSpeed: truckMaxSpeed)
        vehicleNum = truckNum
        licensePlate = truckLicensePlate
        colour = truckColour
        doorsNum = truckDoorsNum
        wheelsNum = truckWheelsNum
        length = truckLength
        speed = truckSpeed
        maxSpeed = truckMaxSpeed
    }

    // Accelerates the vehicle by a specified km/h
    override func accelerate(acceleration: String) {
        let accelerationInt: Int = Int(acceleration) ?? 0
        var speedInt: Int = Int(speed) ?? 0

        // Sets new speed value
        speedInt += accelerationInt
        speed = String(speedInt)
    }

    // Slows the vehicle by a specified km/h
    override func brake(deceleration: String) {
        let decelerationInt: Int = Int(deceleration) ?? 0
        var speedInt: Int = Int(speed) ?? 0

        // Sets new speed value
        speedInt -= decelerationInt
        speed = String(speedInt)
    }

    // Displays the truck's current speed to the output text file
    override func getSpeed() {
        // Adding string to array
        var stringArray: [String] = ["0"]
        stringArray[0] = "The current speed of truck "
            + "\(vehicleNum) is: \(speed) km/h."

        // Create string containing elements of the array
        // separated by a new line
        let joined = stringArray.joined(separator: "\n")
        let newLine = "\n"

        // Path to the output file
        let saveToPath = URL(string: outputPath)

        do {
            // Code from: 
            // https://stackoverflow.com/questions/27327067/
            // append-text-or-data-to-text-file-in-swift
            if let fileUpdater = try? FileHandle(forUpdating: saveToPath!) {

                // Function which when called will cause all updates
                // to start from end of the file
                fileUpdater.seekToEndOfFile()

                // Which lets the caller move editing to any position within
                // the file by supplying an offset
                fileUpdater.write(joined.data(using: .utf8)!)
                fileUpdater.write(newLine.data(using: .utf8)!)
                fileUpdater.write(newLine.data(using: .utf8)!)

                // Once we convert our new content to data and write it,
                // we close the file and that’s it!
                fileUpdater.closeFile()
            }
        }
        print("Truck \(vehicleNum)'s current speed is displayed"
            + " to 'output.txt'")
    }

    // Displays the truck's max speed to the output text file
    override func getMaxSpeed() {
        // Adding string to array
        var stringArray2: [String] = ["0"]
        stringArray2[0] = "The max speed of truck "
            + "\(vehicleNum) is: \(maxSpeed) km/h."

        // Create string containing elements of the array
        // separated by a new line
        let joined = stringArray2.joined(separator: "\n")
        let newLine = "\n"

        // Path to the output file
        let saveToPath = URL(string: outputPath)

        do {
            // Code from: 
            // https://stackoverflow.com/questions/27327067/
            // append-text-or-data-to-text-file-in-swift
            if let fileUpdater = try? FileHandle(forUpdating: saveToPath!) {

                // Function which when called will cause all updates
                // to start from end of the file
                fileUpdater.seekToEndOfFile()

                // Which lets the caller move editing to any position within
                // the file by supplying an offset
                fileUpdater.write(joined.data(using: .utf8)!)
                fileUpdater.write(newLine.data(using: .utf8)!)
                fileUpdater.write(newLine.data(using: .utf8)!)

                // Once we convert our new content to data and write it,
                // we close the file and that’s it!
                fileUpdater.closeFile()
            }
        }
        print("Truck \(vehicleNum)'s max speed is displayed "
            + "to 'output.txt'")
    }

    // Displays the truck's information to the output text file
    override func getInfo() {
        // Adding truck's information to an array
        strArray[0] = "Truck \(vehicleNum)'s info"
        strArray[1] = "License plate: \(licensePlate)"
        strArray[2] = "Colour: \(colour)"
        strArray[3] = "Number of doors: \(doorsNum)"
        strArray[4] = "Number of wheels: \(wheelsNum)"
        strArray[5] = "Length: \(length)"
        strArray[6] = "Speed: \(speed)"
        strArray[7] = "Max speed: \(maxSpeed)"

        // Create string containing elements of the array
        // separated by a new line
        let joined = strArray.joined(separator: "\n")
        let newLine = "\n"

        // Path to the output file
        let saveToPath = URL(string: outputPath)

        do {
            // Code from: 
            // https://stackoverflow.com/questions/27327067/
            // append-text-or-data-to-text-file-in-swift
            if let fileUpdater = try? FileHandle(forUpdating: saveToPath!) {

                // Function which when called will cause all updates
                // to start from end of the file
                fileUpdater.seekToEndOfFile()

                // Which lets the caller move editing to any position within
                // the file by supplying an offset
                fileUpdater.write(joined.data(using: .utf8)!)
                fileUpdater.write(newLine.data(using: .utf8)!)
                fileUpdater.write(newLine.data(using: .utf8)!)

                // Once we convert our new content to data and write it,
                // we close the file and that’s it!
                fileUpdater.closeFile()
            }
        }
        print("Truck \(vehicleNum)'s information is displayed"
            + " to 'output.txt'")
    }
}

class Bike: Vehicle {
    // Properties
    private var wheelsNum: String
    private var seatsNum: String
    private var strArray: [String] = ["0", "0", "0", "0", "0", "0"]
    private var outputPath: String = "/home/runner/Unit3-07-Swift/output.txt"

    // Constructor
    init(bikeNum: String,
         bikeColour: String,
         bikeWheelsNum: String,
         bikeSeatsNum: String,
         bikeSpeed: String,
         bikeMaxSpeed: String) {
        self.wheelsNum = bikeWheelsNum
        self.seatsNum = bikeSeatsNum
        super.init(carNum2: bikeNum, carColour2: bikeColour, carSpeed2: bikeSpeed, carMaxSpeed2: bikeMaxSpeed)
        vehicleNum = bikeNum
        colour = bikeColour
        wheelsNum = bikeWheelsNum
        seatsNum = bikeSeatsNum
        speed = bikeSpeed
        maxSpeed = bikeMaxSpeed
    }

    // Accelerates the vehicle by a specified km/h
    override func accelerate(acceleration: String) {
        let accelerationInt: Int = Int(acceleration) ?? 0
        var speedInt: Int = Int(speed) ?? 0

        // Sets new speed value
        speedInt += accelerationInt
        speed = String(speedInt)
    }

    // Slows the vehicle by a specified km/h
    override func brake(deceleration: String) {
        let decelerationInt: Int = Int(deceleration) ?? 0
        var speedInt: Int = Int(speed) ?? 0

        // Sets new speed value
        speedInt -= decelerationInt
        speed = String(speedInt)
    }

    // Displays the bike's current speed to the output text file
    override func getSpeed() {
        // Adding string to array
        var stringArray: [String] = ["0"]
        stringArray[0] = "The current speed of bike "
            + "\(vehicleNum) is: \(speed) km/h."

        // Create string containing elements of the array
        // separated by a new line
        let joined = stringArray.joined(separator: "\n")
        let newLine = "\n"

        // Path to the output file
        let saveToPath = URL(string: outputPath)

        do {
            // Code from: 
            // https://stackoverflow.com/questions/27327067/
            // append-text-or-data-to-text-file-in-swift
            if let fileUpdater = try? FileHandle(forUpdating: saveToPath!) {

                // Function which when called will cause all updates
                // to start from end of the file
                fileUpdater.seekToEndOfFile()

                // Which lets the caller move editing to any position within
                // the file by supplying an offset
                fileUpdater.write(joined.data(using: .utf8)!)
                fileUpdater.write(newLine.data(using: .utf8)!)
                fileUpdater.write(newLine.data(using: .utf8)!)

                // Once we convert our new content to data and write it,
                // we close the file and that’s it!
                fileUpdater.closeFile()
            }
        }
        print("Bike \(vehicleNum)'s current speed is displayed"
            + " to 'output.txt'")
    }

    // Displays the bike's max speed to the output text file
    override func getMaxSpeed() {
        // Adding string to array
        var stringArray2: [String] = ["0"]
        stringArray2[0] = "The max speed of bike "
            + "\(vehicleNum) is: \(maxSpeed) km/h."

        // Create string containing elements of the array
        // separated by a new line
        let joined = stringArray2.joined(separator: "\n")
        let newLine = "\n"

        // Path to the output file
        let saveToPath = URL(string: outputPath)

        do {
            // Code from: 
            // https://stackoverflow.com/questions/27327067/
            // append-text-or-data-to-text-file-in-swift
            if let fileUpdater = try? FileHandle(forUpdating: saveToPath!) {

                // Function which when called will cause all updates
                // to start from end of the file
                fileUpdater.seekToEndOfFile()

                // Which lets the caller move editing to any position within
                // the file by supplying an offset
                fileUpdater.write(joined.data(using: .utf8)!)
                fileUpdater.write(newLine.data(using: .utf8)!)
                fileUpdater.write(newLine.data(using: .utf8)!)

                // Once we convert our new content to data and write it,
                // we close the file and that’s it!
                fileUpdater.closeFile()
            }
        }
        print("Bike \(vehicleNum)'s max speed is displayed "
            + "to 'output.txt'")
    }

    // Displays the bike's information to the output text file
    override func getInfo() {
        // Adding bike's information to an array
        strArray[0] = "Bike \(vehicleNum)'s info"
        strArray[1] = "Colour: \(colour)"
        strArray[2] = "Number of wheels: \(wheelsNum)"
        strArray[3] = "Number of seats: \(seatsNum)"
        strArray[4] = "Speed: \(speed)"
        strArray[5] = "Max speed: \(maxSpeed)"

        // Create string containing elements of the array
        // separated by a new line
        let joined = strArray.joined(separator: "\n")
        let newLine = "\n"

        // Path to the output file
        let saveToPath = URL(string: outputPath)

        do {
            // Code from: 
            // https://stackoverflow.com/questions/27327067/
            // append-text-or-data-to-text-file-in-swift
            if let fileUpdater = try? FileHandle(forUpdating: saveToPath!) {

                // Function which when called will cause all updates
                // to start from end of the file
                fileUpdater.seekToEndOfFile()

                // Which lets the caller move editing to any position within
                // the file by supplying an offset
                fileUpdater.write(joined.data(using: .utf8)!)
                fileUpdater.write(newLine.data(using: .utf8)!)
                fileUpdater.write(newLine.data(using: .utf8)!)

                // Once we convert our new content to data and write it,
                // we close the file and that’s it!
                fileUpdater.closeFile()
            }
        }
        print("Bike \(vehicleNum)'s information is displayed"
            + " to 'output.txt'")
    }
}

do {
    if CommandLine.argc < 2 {
        // Error message if no file is inputted
        print("Error: Text file needed.")
    } else {
        // Read command line arguments for file name
        let arguments = CommandLine.arguments
        let file: String = arguments[1]

        let set = try String(contentsOfFile: file, encoding: String.Encoding.utf8)
        // Create array of the elements in the text file
        let stringArray: [String] = set.components(separatedBy: "\n")

        for vehicle in stringArray {
            // Create list of each element of the array
            var list = vehicle.components(separatedBy: " ")

            var counter = 0

            if list[0].uppercased == "TRUCK" {
                for string in list {
                    if counter == 1 {
                        // Check if the truck number is an integer
                        let truckNumInt = Int(string) ?? -23847125624345235

                        if truckNumInt == -23847125624345235 {
                            // Set the truck number value to null if
                            // the input is invalid
                            list[counter] = "null"
                        }
                    } else if counter == 2 {
                        // Check if a license plate was written
                        if string == "" {
                            // Set the license plate to XXX XXX
                            // if the field is empty
                            list[counter] = "XXX XXX"
                        }
                    } else if counter == 4 {
                        // Check if the number of doors is an integer
                        let doorsNumInt = Int(string) ?? -23847125624345235

                        if doorsNumInt == -23847125624345235 {
                            // Set the door number value to "0"
                            // if the input is invalid
                            list[counter] = "0"
                        } else {
                            list[counter] = String(doorsNumInt)
                        }
                    } else if counter == 5 {
                        // Check if the speed is an integer
                        let wheelsNumInt = Int(string) ?? -23847125624345235

                        if wheelsNumInt == -23847125624345235 {
                            // Set the speed value to "0"
                            // if the input is invalid
                            list[counter] = "0"
                        }
                    } else if counter == 6 {
                        // Check if the max speed is an integer
                        let lengthInt = Int(string) ?? -23847125624345235

                        if lengthInt == -23847125624345235 {
                            // Set the max speed value to "0"
                            // if the input is invalid
                            list[counter] = "0"
                        }
                    } else if counter == 7 {
                        // Check if the max speed is an integer
                        let speedInt = Int(string) ?? -23847125624345235

                        if speedInt == -23847125624345235 {
                            // Set the max speed value to "0"
                            // if the input is invalid
                            list[counter] = "0"
                        }
                    } else if counter == 8 {
                        // Check if the max speed is an integer
                        let maxSpeedInt = Int(string) ?? -23847125624345235

                        if maxSpeedInt == -23847125624345235 {
                            // Set the max speed value to "0"
                            // if the input is invalid
                            list[counter] = "0"
                        }
                    }
                    counter += 1
                }
                // Create aTruck object containing the information of each string
                let aTruck = Truck(truckNum: list[1],
                    truckLicensePlate: list[2],
                    truckColour: list[3],
                    truckDoorsNum: list[4],
                    truckWheelsNum: list[5],
                    truckLength: list[6],
                    truckSpeed: list[7],
                    truckMaxSpeed: list[8]
                    )

                // Get the current speed of the truck
                aTruck.getSpeed()

                // Get the max speed of the truck
                aTruck.getMaxSpeed()

                // Accelerate the truck by 10 km/h
                aTruck.accelerate(acceleration: "10")

                // Deceleration the truck by 10 km/h
                aTruck.brake(deceleration: "5")

                // Get the truck's information
                aTruck.getInfo()
            } else if list[0].uppercased == "BIKE" {
                for string in list {
                    if counter == 1 {
                        // Check if the bike number is an integer
                        let bikeNumInt = Int(string) ?? -23847125624345235

                        if bikeNumInt == -23847125624345235 {
                            // Set the bike number value to null if
                            // the input is invalid
                            list[counter] = "null"
                        }
                    } else if counter == 3 {
                        // Check if the number of doors is an integer
                        let wheelsNumInt = Int(string) ?? -23847125624345235

                        if wheelsNumInt == -23847125624345235 {
                            // Set the door number value to "0"
                            // if the input is invalid
                            list[counter] = "0"
                        }
                    } else if counter == 4 {
                        // Check if the speed is an integer
                        let seatsNum = Int(string) ?? -23847125624345235

                        if seatsNum == -23847125624345235 {
                            // Set the speed value to "0"
                            // if the input is invalid
                            list[counter] = "0"
                        }
                    } else if counter == 5 {
                        // Check if the max speed is an integer
                        let speedInt = Int(string) ?? -23847125624345235

                        if speedInt == -23847125624345235 {
                            // Set the max speed value to "0"
                            // if the input is invalid
                            list[counter] = "0"
                        }
                    } else if counter == 6 {
                        // Check if the max speed is an integer
                        let maxSpeedInt = Int(string) ?? -23847125624345235

                        if maxSpeedInt == -23847125624345235 {
                            // Set the max speed value to "0"
                            // if the input is invalid
                            list[counter] = "0"
                        }
                    }
                    counter += 1
                }
                // Create aBike object containing the information of each string
                let aBike = Bike(bikeNum: list[1],
                    bikeColour: list[2],
                    bikeWheelsNum: list[3],
                    bikeSeatsNum: list[4],
                    bikeSpeed: list[5],
                    bikeMaxSpeed: list[6]
                    )

                // Get the current speed of the bike
                aBike.getSpeed()

                // Get the max speed of the bike
                aBike.getMaxSpeed()

                // Accelerate the bike by 10 km/h
                aBike.accelerate(acceleration: "10")

                // Deceleration the bike by 10 km/h
                aBike.brake(deceleration: "5")

                // Get the bike's information
                aBike.getInfo()
            } else {
                // Message if the vehicle is not a truck or bike
                print("Please enter a valid vehicle.")
            }
        }
    }
} catch {
    // Error message if nonexistent file is inputted
    print("File does not exist.")
}
