import numpy as np
import matplotlib.pyplot as plt
import os
import sys

dir = sys.argv[1] + "/results/"

labels = ["2k", "4k", "8k", "16k", "32k",
          "64k", "128k", "256k", "512k", "1M", "2M"]

startIndexL1 = {
    "bubblesort": 11,
    "quicksort": 11,
    "treesort": 11,
    "list": 11,
    "body": 11
}

startIndexL3 = {
    "bubblesort": 13,
    "quicksort": 13,
    "treesort": 13,
    "list": 13,
    "body": 13
}


def getSize(name):
    return int(name.split("-")[1].split(".")[0])


files = sorted(os.listdir(dir), key=getSize)

data_L1 = []

data_L3 = []

for name in files:
    with open("%s%s" % (dir, name), "r") as file:
        try:
            lines = file.readlines()
            l1 = 100 - float(lines[startIndexL1[sys.argv[1]]
                        ].split("#")[1].split()[0].replace("%", "").replace(",","."))
            l3 = list(filter(lambda s: "%" in s,
                             lines[startIndexL3[sys.argv[1]]].split(" ")))
            l3 = 100 - float(l3[0].replace("%", "").replace(",","."))
            data_L1.append(l1)
            data_L3.append(l3)
        except IndexError:
            print("Error in %s" % name)
    print()

fig, chart_L1 = plt.subplots()
chart_L1.plot(labels,data_L1)

chart_L1.set(xlabel="Input Size", ylabel="Hit Ratio - Cache L1 (%)", title = sys.argv[1].capitalize() + " - perf")

plt.savefig("./charts/%s-perf-L1.png" % sys.argv[1],bbox_inches = "tight")

fig, chart_L3 = plt.subplots()
chart_L3.plot(labels,data_L3)

chart_L3.set(xlabel="Input Size", ylabel="Hit Ratio - Cache L3 (%)", title = sys.argv[1].capitalize() + " - perf")

plt.savefig("./charts/%s-perf-L3.png" % sys.argv[1],bbox_inches = "tight")
plt.show()
