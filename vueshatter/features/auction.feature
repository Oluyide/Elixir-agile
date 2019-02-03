Feature: Book Extension
  As a student 
  Such that I  ne
  
  Scenario: creating an item to be auction
    Given the following items are to be added
          | Description | Price	 | Date    |
          | adeniyi     | 1234   | 2018-12-28|
    When I summit the booking request
    Then I should receive a confirmation message