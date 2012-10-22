Feature: Create or edit categories
  As a blog administrator
  In order to organize my articles
  I want to be able to add and edit my categories 

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully create new and edit existing categories
    Given I am on the admin content page
    When I follow "Categories"
    Then I should be on the new category page
    When I fill in "category_name" with "Category Title"
    And I fill in "category_keywords" with "Test"
    And I fill in "category_permalink" with "Testing Link"
    And I fill in "category_description" with "Hello World"
    And I press "Save"
    Then I should be on the new category page
    And I should see "Category was successfully saved"

    #Using the created category to test the edit functionality
    Given I am on the new category page
    When I follow "Category Title"
    Then I should be on the edit category page
    And I should see "Category Title"
    And I should see "Test"
    And I should see "Testing Link"
    And I should see "Hello World"
