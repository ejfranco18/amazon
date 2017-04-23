Given(/^I am on the Amazon site$/) do
  @browser.goto "http://www.amazon.com"
  sleep 2
end

When(/^I enter to the login page$/) do
  @sign_msg="Sign in"
  @browser.span(id: "nav-link-accountList").click
  expect(@browser.h1(class: "a-spacing-small").text).to include @sign_msg
end

And(/^Enter the my credentials$/) do
  @email="automation.testing0918@gmail.com"
  @pass="testing1234"
  @browser.text_field(id:"ap_email").send_keys @email
  @browser.span(id: "ap_password").send_keys "testing1234"
  @browser.span(id: "signInSubmit").click
  sleep 6
end

Then(/^I should be logged in with the name "([^"]*)"$/) do |name|
  expect(@browser.span(id: "hud-customer-name").text).to include name
end



When(/^I search for "([^"]*)"$/) do |search|
  @browser.text_field(id: "twotabsearchtextbox").send_keys(search)
  @browser.button(value: "Go").click
end

And(/^Select an item from the results$/) do
  @size_li=@browser.lis(class: "s-result-item celwidget").size
  @index = rand(1..@size_li - 1)
  @index_1 = @index - 1
  @item = @browser.h2(class: "a-size-medium a-color-null s-inline scx-truncate s-access-title  a-text-normal", index: @index - 1).text
  puts @browser.h2(class: "a-size-medium a-color-null s-inline scx-truncate s-access-title  a-text-normal", index: @index - 1).text
  @browser.h2(class: "a-size-medium a-color-null s-inline scx-truncate s-access-title  a-text-normal", index: @index - 1).click
  sleep 2
end

Then(/^I should be on the information page of the selected item$/) do
  expect(@browser.span(id: "productTitle").text).to include @item[0,40]
  puts @browser.span(id: "productTitle").text
end

And(/^I add it to the car$/) do
  @browser.button(id: "add-to-cart-button").click
  if @browser.h4(class: "a-popover-header-content").exists? and (@browser.h4(class: "a-popover-header-content").text).include? "Add to your order"
    puts @browser.h4(class: "a-popover-header-content").text
    @browser.button(id: "siNoCoverage-announce").click
  else  if @browser.h4(class: "a-popover-header-content").exists? and (@browser.h4(class: "a-popover-header-content").text).include? "Add to your Fire tablet order"
          @browser.a(id: "intl_pop_continue").click
        end
  end
end

Then(/^The item should be on the shopping cart$/) do
  @browser.a(id: "nav-cart").click
  expect(@browser.span(class: "a-size-medium sc-product-title a-text-bold").text).to include @item[0,40]
end

When(/^I log out$/) do
  sleep 2
  @browser.span(xpath: "/html/body/div[1]/header/div/div[2]/div[2]/div/a[2]/span[2]").hover
  sleep 5
  @browser.a(href: "/gp/flex/sign-out.html/ref=nav_youraccount_signout?ie=UTF8&action=sign-out&path=%2Fgp%2Fyourstore%2Fhome&signIn=1&useRedirectOnSuccess=1").click
end

Then(/^I should return to the login page$/) do
  @sign_msg="Sign in"
  expect(@browser.h1(class: "a-spacing-small").text).to include @sign_msg
end