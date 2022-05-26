# frozen_string_literal: true

# Eliminamos cualquier registro previo
User.destroy_all
# Creamos los primeros 3 ingeniero de prueba
User.create!([
               { name: 'Ernesto', username: 'Erni', email: 'ernesto@recorrido.cl', password: 'erni2022' },
               { name: 'Barbara', username: 'Barbi', email: 'barbara@recorrido.cl', password: 'barbi2022' },
               { name: 'Benjamin', username: 'Benja', email: 'benjamin@recorrido.cl', password: 'benja2022' }
             ])
# Eliminamos cualquier registro previo
Client.destroy_all
# Obtenemos la fecha actual, solo para fines practicos
today = Date.today
# Marcamos fecha de inicio y fecha final del servicio
start_date = today.prev_occurring(:monday)
end_date = today.next_occurring(:friday)
# Funcion de genera un array a partir de un rango de horas
def create_hours(start_time, end_time)
  (Time.parse(start_time).to_i..Time.parse(end_time).to_i).step(1.hour).map do |i|
    Time.at(i).strftime('%k:%M')
  end
end

# Funcion que prepara el objeto anidado para insertar un rango de fechas y horas
def create_days_and_hours(start_date, end_date, start_hour, end_hour)
  (start_date..end_date).map do |d|
    DaysTaken.create!({
                        day: d,
                        timesheets: create_hours(start_hour, end_hour).map do |h|
                                      Timesheet.create({ hour: h })
                                    end
                      })
  end
end
# Creamos los clientes y servicios a partir de sus fechas yt horas solicitadas
Client.create([
                {
                  name: 'Coca Cola',
                  services: [
                    Service.create({
                                     start_date: start_date,
                                     end_date: end_date,
                                     start_time: '19:00',
                                     end_time: '23:00',
                                     days_takens: create_days_and_hours(start_date, end_date, '19:00', '23:00')
                                   })

                  ]
                },
                {
                  name: 'Bimbo',
                  services: [
                    Service.create({
                                     start_date: start_date,
                                     end_date: end_date,
                                     start_time: '1:00',
                                     end_time: '12:00',
                                     days_takens: create_days_and_hours(start_date, end_date, '1:00', '12:00')
                                   })

                  ]
                },
                {
                  name: 'Disney',
                  services: [
                    Service.create({
                                     start_date: start_date,
                                     end_date: end_date,
                                     start_time: '13:00',
                                     end_time: '18:00',
                                     days_takens: create_days_and_hours(start_date, end_date, '13:00', '18:00')
                                   })

                  ]
                }
              ])
