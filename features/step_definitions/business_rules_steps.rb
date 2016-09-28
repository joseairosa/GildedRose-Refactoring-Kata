Given(/^an item with name "([^"]*)"$/) do |name|
  @items = [Item.new(name, 0, 0)]
  @name = name
end

When(/^the quality is updated$/) do
  GoldshireInn.new(@items).update_quality
end

Then(/^the name is the same$/) do
  expect(@items[0].name).to eq 'fixme'
end
