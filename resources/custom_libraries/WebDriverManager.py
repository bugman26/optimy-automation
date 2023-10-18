from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager
ROBOT_AUTO_KEYWORDS = True

class WebDriverManager(object):

    def get_driver_path(self, browser):
        if browser.lower() == "chrome":
            return ChromeDriverManager().install()
        elif browser.lower() == "firefox":
            return GeckoDriverManager().install()
        else:
            raise ValueError("Please enter a valid browser!")
