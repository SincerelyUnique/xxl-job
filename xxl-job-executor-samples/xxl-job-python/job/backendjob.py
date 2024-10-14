import os.path
import sys
import traceback

basedir = os.path.abspath(os.path.dirname(__file__))
lib_path = os.path.dirname(basedir)
sys.path.append(lib_path)

from config import AppConfig

from job.job1 import test1
from job.job2 import test2
from job.job3 import test3


if __name__ == '__main__':
    args = sys.argv

    script = args[0]
    job_name = args[1]

    actions = {
        AppConfig.JOB_NAME1: test1.test,
        AppConfig.JOB_NAME2: test2.test,
        AppConfig.JOB_NAME3: test3.test
    }

    try:
        if job_name == "job1":
            actions[job_name]("Jalen", 12)
        elif job_name == "job2":
            actions[job_name]("Cat")
        else:
            actions[job_name]()
    except Exception as e:
        print(f"Job run error, error message is {e}")
        print(traceback.format_exc())
        print("some other alert here, email or short message")
