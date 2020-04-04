#!/bin/python
import numpy as np
import sys,os,argparse

def main():
    with open("thread_numbers.input", "r") as f:
        lines = f.readlines()
    for i,l in enumerate(lines):
        print(lines[len(lines)-1-i])

if __name__=="__main__":
    main()
