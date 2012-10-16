Feature: Merge Articles
  As a blog administrator
  In order to combine articles
  I want to be able to merge articles on my blog

  Background:
    Given the blog is set up
    And the following articles exist:
    | title               | author  | body                        |
    | Orig Article        | Person1 | Article 1 to be merged body |


  Scenario: non-admin cannot merge articles
    Given I am logged in not as admin
    Given I am on the new article page

    Then I should not see "Merge Article"
    And I should not see "Article ID:"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    # First creating a new article to merge with
    Given I am logged into the admin panel
    Given I am on the new article page
    When I fill in "article_title" with "Merge Article Title"
    And I fill in "article__body_and_extended_editor" with "New Body"
    And I press "Publish"
    Then I should be on the admin content page
    Then I should see "Merge Article Title"
    When I follow "Merge Article Title"

    # Merging with another article
    Then I should see "Merge Article"
    And I should see "Article ID:"
    When I merge in "merge_id" with the newest added article
    And I press "Merge"
    Then I should be on the admin content page
    Then I should see "Merge Article Title"
    When I follow "Merge Article Title"
    Then I should see "New Body"
    And I should see "Article 1 to be merged body"
 
