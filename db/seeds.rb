# frozen_string_literal: true

# Create airports
Airport.create(code: 'POA')
Airport.create(code: 'CWB')
Airport.create(code: 'FLN')
Airport.create(code: 'CGH')
Airport.create(code: 'BSB')

# Create flights
flight1 = Flight.create(departure_airport: Airport.find_by(code: 'POA'), arrival_airport: Airport.find_by(code: 'CWB'),
                        passenger_count: 75, start_datetime: DateTime.now, flight_duration: '2h')
flight2 = Flight.create(departure_airport: Airport.find_by(code: 'CWB'), arrival_airport: Airport.find_by(code: 'BSB'),
                        passenger_count: 50, start_datetime: DateTime.tomorrow, flight_duration: '6h')
flight3 = Flight.create(departure_airport: Airport.find_by(code: 'POA'), arrival_airport: Airport.find_by(code: 'CGH'),
                        passenger_count: 100, start_datetime: DateTime.yesterday, flight_duration: '4h')

# Create passengers
Passenger.create(name: 'John Doe', email: 'john@example.com')
Passenger.create(name: 'Jane Doe', email: 'jane@example.com')
Passenger.create(name: 'Jim Doe', email: 'jim@example.com')

# Create bookings and associate passengers with flights

Booking.create(flight: flight1, passengers_attributes: [{ name: 'John Doe', email: 'john@example.com' }])
Booking.create(flight: flight2, passengers_attributes: [{ name: 'Jane Doe', email: 'jane@example.com' }])
Booking.create(flight: flight3, passengers_attributes: [{ name: 'Jim Doe', email: 'jim@example.com' }])
