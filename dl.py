#!/usr/bin/python3
import sys, time
def sprint(str):
  for c in str + '\n':
    sys.stdout.write(c)
    sys.stdout.flush()
    time.sleep(0.100)
sprint ('USB Belum Terdeteksi. Menunggu...')
