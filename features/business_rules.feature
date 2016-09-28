Feature: These are the business rules, change me if you see fit

Scenario: When updating the quality, the name does not change
  Given an item with name "foo"
  When the quality is updated
  Then the name is the same
