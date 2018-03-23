Given /^I visit the home page$/ do
  visit ENV['ROOT_URL']
end

When /^I click on "(.+)"$/ do |button|
  click_on button
end

Then /^I should see a list of team members$/ do
  page.has_css? 'div.profiles'
end

And /^I should see "(.+)"$/ do |team_member|
  within 'div.profiles' do
    find 'div.profile-name', text: team_member
  end
end
