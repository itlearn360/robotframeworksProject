from selenium.webdriver.common.by import By
from robot.libraries.BuiltIn import BuiltIn

class ITLearn360Library:
    def __init__(self):
        self.selenium_lib = None
        self.default_timeout = 10  # default timeout in seconds

    def get_selenium_instance(self):
        if self.selenium_lib is None:
            self.selenium_lib = BuiltIn().get_library_instance('SeleniumLibrary')
        return self.selenium_lib

    def open_home_page(self):
        url = 'https://demo.itlearn360.com/'
        selenium = self.get_selenium_instance()
        selenium.open_browser(url, 'chrome')
        selenium.maximize_browser_window()
        self.set_implicit_wait(self.default_timeout)  # Set implicit wait after opening the browser

    def set_implicit_wait(self, timeout):
        """
        Set the implicit wait for the browser instance.
        :param timeout: Timeout in seconds
        """
        selenium = self.get_selenium_instance()
        selenium.set_selenium_implicit_wait(timeout)

    def login(self, username, password):
        selenium = self.get_selenium_instance()
        selenium.click_element('id=loginlabel')
        selenium.input_text('id=user_login', username)  # Update 'username_field_id' with actual ID from the webpage
        selenium.input_text('id=user_pass', password)  # Update 'password_field_id' with actual ID from the webpage
        selenium.click_button('id=wp-submit')            # Update 'login_button_id' with actual ID from the webpage

    def verify_logged_in(self):
        selenium = self.get_selenium_instance()
        # Assuming redirection to a dashboard page signifies a successful login
        current_url = selenium.get_location()
        if "dashboard" in current_url:
            print("Login successful")
        else:
            print("Login failed")

    def close_browser(self):
        self.get_selenium_instance().close_all_browsers()