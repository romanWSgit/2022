module Day4
  implicit none
  public :: read_file, count_lines,  range_arr
  private
  
contains
  !read a data file
  subroutine read_file(filename, line_arr ,length)
      character(len = *) :: filename
      integer, intent(in) :: length
      character(len = 256), intent(out) :: line_arr(length)
      integer i, iu
  
      open(newunit=iu, file = filename, status = 'old', action = 'read')
      do i = 1,length
          read(iu, '(A)') line_arr(i)
      enddo
      close(iu)
  end subroutine read_file

  !count the lines to read
  function count_lines(filename) result(nlines)
    implicit none
    character(len=*)    :: filename
    integer             :: nlines 
    integer             :: io, iu
  
    open(newunit = iu, file=filename, iostat=io, status='old')
    if (io/=0) stop 'Cannot open file! '
    nlines = 0
    do
      read(iu,*,iostat=io)
      if (io/=0) exit
      nlines = nlines + 1
    end do
    close(iu)
  end function count_lines

  ! create a python like 'range'
  function range_arr(start, stop) result(a)
    integer, intent(in) :: start, stop
    integer :: i
    integer :: length
    integer, allocatable :: a(:)
    length = (stop - start + 1)
    allocate(a(length))
    a = (/(i, i=start,stop, 1)/)
  end function range_arr
  end module Day4
