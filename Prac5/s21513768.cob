        IDENTIFICATION DIVISION.
        PROGRAM-ID. MainProgram.

        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 WS-Table.
            05 WS-A PIC 9(4) VALUE 0 OCCURS 5 TIMES.
        01 arr PIC 9(4).
        01 i PIC 99.
        01 j PIC 99.
        01 smallest PIC 99.
        01 largest PIC 99.
        01 modeValue PIC 99.
        01 maxCount PIC 99.
        01 currCount PIC 99.

        PROCEDURE DIVISION.
            CALL 'readData' USING WS-Table.
            PERFORM findSmallest
            PERFORM findLargest
            PERFORM returnMode
            DISPLAY "Smallest: " smallest
            DISPLAY "Largest: " largest
            DISPLAY "Mode Value: " modeValue

            STOP RUN.

        findSmallest.
            MOVE WS-A(1) TO smallest.

            PERFORM VARYING j FROM 1 BY 1 UNTIL j > 5
                IF WS-A(j) < smallest
                    MOVE WS-A(j) TO smallest
                END-IF
            END-PERFORM.

        findLargest.
            MOVE WS-A(1) TO largest.

            PERFORM VARYING j FROM 1 BY 1 UNTIL j > 5
                IF WS-A(j) > largest
                MOVE WS-A(j) TO largest
                END-IF
            END-PERFORM.

        returnMode.
            MOVE 0 TO maxCount.

            PERFORM VARYING j FROM 1 BY 1 UNTIL j > 5
                MOVE 0 TO currCount
                PERFORM VARYING i FROM 1 BY 1 UNTIL i > 5
                    IF WS-A(i) = WS-A(j)
                        ADD 1 TO currCount
                    END-IF
                END-PERFORM
                
                IF currCount > maxCount
                    MOVE WS-A(j) TO modeValue
                    MOVE currCount TO maxCount
                END-IF
            END-PERFORM.

        IDENTIFICATION DIVISION.
        PROGRAM-ID. readData.

        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 k PIC 99.

        LINKAGE SECTION.
        01 WS-T.
            05 WS-B PIC 9(4) VALUE 0 OCCURS 5 TIMES. 

        PROCEDURE DIVISION USING WS-T.
            DISPLAY "Enter five integers: ".
            PERFORM VARYING k FROM 1 BY 1 UNTIL k > 5
                DISPLAY "Enter integer " k ": "
                ACCEPT WS-B(k)
            END-PERFORM.
        END PROGRAM readData.
