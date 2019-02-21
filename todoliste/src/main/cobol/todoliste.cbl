       IDENTIFICATION DIVISION.
       PROGRAM-ID. TODOLISTE.
       WORKING-STORAGE SECTION.
       01 TEMP-FIELDS.
        05  NEW-TODO-ITEM           PIC X(35).
        05  ITEM-TO-DELETE          PIC 999.
        05  NUMBER-OF-TODOS         PIC 999.
           88 LIST-IS-EMPTY VALUE ZERO.
        05  COUNTER                 PIC 999.
        05  TODOLISTE.
            07  TODO-ITEM PIC X(35) OCCURS 999.

       PROCEDURE DIVISION.
           GOBACK
          .

       ADD-NEW-TODO-ITEM SECTION.
           ADD 1 TO NUMBER-OF-TODOS

           MOVE NEW-TODO-ITEM
             TO TODO-ITEM (NUMBER-OF-TODOS)
          EXIT.

       CLEAR-LIST SECTION.
          INITIALIZE TEMP-FIELDS
          EXIT.

       DELETE-ITEM SECTION.
           MOVE SPACES TO TODO-ITEM (ITEM-TO-DELETE)
           PERFORM WITH TEST AFTER
             VARYING COUNTER FROM ITEM-TO-DELETE BY 1 UNTIL
                  COUNTER = NUMBER-OF-TODOS
                MOVE TODO-ITEM(COUNTER + 1)
                  TO TODO-ITEM(COUNTER)
           END-PERFORM
          EXIT.

       END PROGRAM TODOLISTE.
