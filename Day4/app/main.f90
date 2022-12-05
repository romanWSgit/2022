program main
  use M_strings, only : string_to_values
  use Day4, only:count_lines, range_arr, read_file 
  implicit none
  integer :: line_Length, i,j,k 
  character(len = 256), allocatable :: line_arr(:)
  character(*), parameter :: filename = "input.txt"
  integer,allocatable :: array(:,:) 
  integer,allocatable :: a(:), b(:)
  integer :: checkArray(4)
  integer :: res
  integer :: lg
  logical, allocatable :: inter(:)
  integer,parameter  :: isz=4
  real              ::  REAL_array(isz)
  integer            :: inums, ierr, ii
  integer :: cnt, cnt2

  ! setup
  print*,""
  print*,"=============================================================="
  print*,""
  print*,"Advent of Code 2022"
  print*,""
  print*,"Day 4:"
  print*,""
  print*,"--------------------------------------------------------------"
  print*,""
  


 
	line_Length = count_lines(filename)
	print *, "Number of lines in the input file:", line_Length
  print*,""
  allocate(line_arr(line_Length))
  call read_file(filename,line_arr, line_Length)
  print*,".........."

  print*,"Solutions:"
  print*,".........."

  ! split strings and convert to int
  allocate(array(line_Length,4))
  do i = 1,line_Length
    call string_to_values(line_arr(i), 10, REAL_array ,inums,' - ,', ierr)
    do j = 1,4
      array(i,j) = int(REAL_array(j))
    enddo
  enddo 


  cnt = 0
  cnt2 = 0
  ! loop over lines
  do i = 1,line_Length 
    checkArray = array(i,:)
    
    ! Part 1:
    if ((checkArray(1) >= checkArray(3)) .and. (checkArray(2) <= checkArray(4))) then
      cnt = cnt + 1
    elseif ((checkArray(3) >= checkArray(1)) .and. (checkArray(4) <= checkArray(2))) then
      cnt = cnt + 1
    endif
    
    ! Part 2:
    a = range_arr(checkArray(1),checkArray(2))
    b = range_arr(checkArray(3),checkArray(4))
    allocate(inter(size(a)))
    do k = 1, size(a)
      inter(k) = any(a(k) == b)
    enddo
    if (any(inter) .eqv. .true.) then 
      cnt2 = cnt2 + 1
    endif
    deallocate(inter)

  enddo 

  print*, 'solution 1 =', cnt
  print*, 'solution 2 =', cnt2
  print*,""
  print*,"=============================================================="
 
end program main
