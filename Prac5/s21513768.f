        program myprog
c Quintin d'Hotman de Villiers u21513768
        integer maxm
        parameter( maxm = 5)
        integer m, n, i, arr(5), findSmallest, smallest
        integer findLargest, largest, j, mode, returnMode

        m = 5

        call readData( arr, maxm )

        smallest = findSmallest( arr )
        write(*,*) 'Smallest Value:', smallest

        largest = findLargest( arr )
        write(*,*) 'Largest Value:', largest

        returnMode = mode( arr )
        write(*,*) 'Mean Value:', returnMode

        stop
        end

        subroutine readData( arr, maxm )
        integer maxm, n, arr(maxm)

        write(*,*) 'Please enter 5 numbers:'
        do i = 1, 5
            read(*,*) n
            arr(i) = n
        end do

        return
        end

        integer function findSmallest( arr )
        integer arr(5)

        findSmallest = arr(1)
        do i = 1, 5
            if (arr(i) .LT. findSmallest) then
                findSmallest = arr(i)
            endif
        end do

        return
        end

        integer function findLargest( arr )
        integer arr(5)

        findLargest = arr(1)
        do i = 1, 5
            if (arr(i) .GT. findLargest) then
                findLargest = arr(i)
            endif
        end do
        
        return
        end

        integer function mode( arr )
        integer arr(5), maxCount, curr

        maxCount = 1
        mode = arr(1)
        do i = 1, 5
            curr = 0
            do j = 1, 5
                if (arr(j) .EQ. arr(i)) then
                    curr = curr+1
                endif
            end do

            if (curr .GT. maxCount) then
                mode = arr(i)
                maxCount = curr
            endif
        end do

        return
        end