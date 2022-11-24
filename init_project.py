# Author: https://github.com/shendeguize
from typing import *

import os.path as osp
import argparse


class ProjectName(object):
    def __init__(self, project_name: Text):
        self.project_name = None
        self.cmake_prefix = None
        self.header_protector_prefix = None
        if not self.init(project_name):
            raise ValueError(f"{project_name} is not supported, snake case project name is required!")

    def init(self, project_name: Text) -> bool:
        if project_name.lower() != project_name or not all(project_name.split("_")):
            return False
        self.project_name = project_name
        self.cmake_prefix = "".join(part.title() for part in self.project_name.split("_"))
        self.header_protector_prefix = self.project_name.upper()
        return True

    def __str__(self):
        return f"project_name: {self.project_name}\n"\
               f"cmake_prefix: {self.cmake_prefix}\n"\
               f"header_protector_prefix: {self.header_protector_prefix}\n"


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
