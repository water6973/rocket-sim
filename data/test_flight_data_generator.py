import csv

# Constants
initial_velocity = 150  # m/s
acceleration = -10  # m/s^2
pitch = 1  # degree
yaw = 1  # degree
time_increment = 5  # milliseconds

# Initialize variables
time = 0  # milliseconds
velocity = initial_velocity
altitude = 0
extension_level = 2
motor_burning = True

# Function to calculate the next altitude
def next_altitude(altitude, velocity, time_increment):
    # Convert time increment to seconds
    time_in_seconds = time_increment / 1000
    # Calculate new altitude
    new_altitude = altitude + velocity * time_in_seconds
    return new_altitude

# Open a CSV file to write the flight data
with open('flight_data.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    # Write the header
    writer.writerow(['Time (ms)', 'Velocity (m/s)', 'Altitude (m)', 'Pitch (degree)', 'Yaw (degree)', 'Extension Level', 'Motor Burning', 'Acceleration (m/s^2)'])

    # Generate data for each entry
    for i in range(6001):  # Adjust the range as needed for longer data
        # Calculate the new altitude
        altitude = next_altitude(altitude, velocity, time_increment)
        # Update velocity
        velocity += acceleration * (time_increment / 1000)
        # Update motor burning status
        if time > 2000:  # After 2 seconds
            motor_burning = False
        # Update extension level
        if (i % 333) == 0 and i != 0:
            extension_level = 1 if extension_level == 2 else 2
        # Write data to CSV
        writer.writerow([time, velocity, altitude, pitch, yaw, extension_level, motor_burning, acceleration])
        # Increment time
        time += time_increment

print("Flight data generated in 'flight_data.csv'")
