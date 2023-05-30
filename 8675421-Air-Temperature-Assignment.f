!this code is for converting temperatures in degrees celcius to kelvin
PROGRAM temperatureconverter
  
  IMPLICIT NONE 
    
  CHARACTER(len=20) :: input_filename, output_filename
  INTEGER :: i, num_values
  REAL :: celsius, kelvin
  LOGICAL :: file_exists
  
  write(*, *) "Enter the  input filename: "
  read(*, *) input_filename
  write(*, *) "Enter ouput filename "
  read(*, *) output_filename
  
  inquire(file=trim(input_filename), exist=file_exists)
  if (.not. file_exists) then
    write(*, *) "Input File ", trim(input_filename), "does not exist."
    stop
  end if
  
  open(unit=10, file=trim(input_filename), status='old')
  
  read(10, *) num_values
  
  open(unit=20, file=trim(output_filename), status='replace')
  do i = 1, num_values
    read(10, *) celsius
    kelvin = celsius + 273.15
    write(20, '(F10.2)') kelvin
  end do
  close(10)
  close(20)
  END PROGRAM temperatureconverter
