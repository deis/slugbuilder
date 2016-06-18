import unittest

import procfile

class TestProcfileMethods(unittest.TestCase):

    def test_parse_procfile_keys(self):
        data = [
            'web: run_server',
            'worker: echo hi',
            '',
            'badly formed procfile entry'
        ]
        self.assertEqual(procfile.parse_procfile_keys(data), ['web', 'worker'])

if __name__ == '__main__':
    unittest.main()
