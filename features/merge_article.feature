Feature: Merge Articles
  As a blog administrator
  In order to combine articles
  I want to be able to merge articles on my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist:
    | title             | author  | body                        |
    | Orig Article      | Person1 | Article 1 to be merged body |


  Scenario: non-admin cannot merge articles
    Given I am on the new article page
    When I fill in "article_title" with "Merge Article"
    And I fill in "article__body_and_extended_editor" with "New Body"
    And I fill in "merge_with" with "1"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "User not admin"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am on the new article page
    When I fill in "article_title" with "Merge Article"
    And I fill in "article__body_and_extended_editor" with "New Body"
    And I fill in "merge_id" with "1"
    And I press "Merge"
    Then I should be on the admin content page
    When I follow "Merge Article"
    Then I should see "New Body"
    And I should see "Article 1 to be merged body"
    And I should see "Merge Article"
 
  Scenario: When articles are merged, the merged article should have one author
    Given I am on the new article page
    When I fill in "article_title" with "Merge Article"
    And I fill in "article__body_and_extended_editor" with "New Body"
    And I fill in "merge_id" with "1"
    And I press "Merge"
    Then I should be on the admin content page
    When I follow "Merge Article"
    Then I should see "New Body"
    And I should see "Article 1 to be merged body"
    And I should see "Merge Article"

  Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article

  Scenario: The title of the new article should be the title from either one of the merged articles.

  Scenario: Successfully merge articles
    Given I am on the new article page
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "Foobar"
    When I follow "Foobar"
    Then I should see "Lorem Ipsum"
