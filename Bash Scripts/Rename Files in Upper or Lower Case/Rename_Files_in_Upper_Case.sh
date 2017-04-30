#!/bin/bash

for i in `echo *` ; do mv $i "${i^^}" ; done
