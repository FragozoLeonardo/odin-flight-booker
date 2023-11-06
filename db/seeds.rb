# frozen_string_literal: true

Airport.create(code: 'POA')
Airport.create(code: 'CWB')
Airport.create(code: 'FLN')
Airport.create(code: 'CGH')
Airport.create(code: 'BSB')

Flight.create(departure_airport: Airport.find_by(code: 'POA'), arrival_airport: Airport.find_by(code: 'CWB'),
              passenger_count: '75', start_datetime: DateTime.now, flight_duration: '2h')
Flight.create(departure_airport: Airport.find_by(code: 'CWB'), arrival_airport: Airport.find_by(code: 'BSB'),
              passenger_count: '50', start_datetime: DateTime.tomorrow, flight_duration: '6h')
Flight.create(departure_airport: Airport.find_by(code: 'POA'), arrival_airport: Airport.find_by(code: 'CGH'),
              passenger_count: '100', start_datetime: DateTime.yesterday, flight_duration: '4h')
