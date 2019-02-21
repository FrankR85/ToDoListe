       IDENTIFICATION DIVISION.
       PROGRAM-ID. TODOHANDLER.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT WEBINPUT ASSIGN TO KEYBOARD
           FILE STATUS IS IN-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD WEBINPUT.
          01 CHUNK-OF-POST     PIC X(1024).

       WORKING-STORAGE SECTION.
       01 IN-STATUS            PIC 9999.
       01 NEWLINE              PIC X     VALUE X'0A'.
       01 UPNAME               PIC X(10).
       01 REQUEST-PARAMETERS.
           05 REQUEST-STRING PIC X(300).
           05 PARAMETER-NAME PIC X(10).
           05 PARAMETER-VALUE PIC X(10).

       PROCEDURE DIVISION.
           PERFORM U01-PRINT-HEADER
           DISPLAY "Eingabe: " CHUNK-OF-POST
           DISPLAY "Parameter holen..."
           MOVE CHUNK-OF-POST TO REQUEST-STRING
           MOVE "action" TO PARAMETER-NAME

           CALL "CGIUTIL" USING REQUEST-PARAMETERS

           DISPLAY "Parameter war: " PARAMETER-VALUE

           GOBACK
          .


       U01-PRINT-HEADER SECTION.
           DISPLAY "CONTENT-TYPE: TEXT/HTML"
                    NEWLINE
          .
       END PROGRAM TODOHANDLER.
