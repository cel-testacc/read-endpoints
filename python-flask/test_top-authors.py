import unittest
import json
from urllib.request import urlopen

class TestRequestData(unittest.TestCase):
    def test_render_json(self):
        authors_json = json.load(urlopen('http://127.0.0.1:5000/authors'))
        checkrow = [7, 'Jane Austen']
        self.assertIn(checkrow, authors_json)

if __name__ == '__main__':
    unittest.main()
