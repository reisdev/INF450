import numpy as np
import matplotlib.pyplot as plt
import os
import sys

dir = sys.argv[1] + "/results-valgrind/"

labels = ["2k", "4k", "8k", "16k", "32k",
          "64k", "128k", "256k", "512k", "1M", "2M"]

startIndexL1 = {
    "bubblesort": 12,
    "quicksort": 12,
    "treesort": 12,
    "list": 12,
    "body": 14
}

startIndexL3 = {
    "bubblesort": 19,
    "quicksort": 19,
    "treesort": 19,
    "list": 19,
    "body": 25
}

def getSize(name):
    return name.split("-")[1].split(".")[0]


def getAssociativity(name):
    return name.split("-")[2].split(".")[0]


files = sorted(os.listdir(dir), key=getSize)

data_L1 = {
    "1": [],
    "2": [],
    "4": [],
    "8": [],
    "16": []
}

data_L3 = {
    "1": [],
    "2": [],
    "4": [],
    "8": [],
    "16": []
}

for name in files:
    with open("%s%s" % (dir, name), "r") as file:
        try:
            lines = file.readlines()
            l1 = float(lines[startIndexL1[sys.argv[1]]
                             ].split("rate:")[1].strip().replace("%", ""))
            l3 = list(filter(lambda s: "%" in s,
                             lines[startIndexL3[sys.argv[1]]].split(" ")))
            l3 = float(l3[0].replace("%", ""))
            data_L1[getAssociativity(name)].append(l1)
            data_L3[getAssociativity(name)].append(l3)
        except IndexError:
            print("Error in %s" % name)
    print()

fig, chart_L1 = plt.subplots()

plt.xlabel("Input Size", fontsize=12)
plt.ylabel("Miss Ratio - Cache L1 (%)", fontsize=12)

gap = .8 / len(labels)
X = np.arange(len(labels))
bars = []

for i, value in enumerate(data_L1.keys()):
    b = chart_L1.bar(X+i*gap, data_L1[value], gap, bottom=0)
    bars.append(b)

chart_L1.set_title(sys.argv[1].capitalize()+"- valgrind")
chart_L1.set_xticks(X + gap / len(labels))
chart_L1.set_xticklabels(labels)

chart_L1.legend((bars[0][0], bars[1][0], bars[2][0], bars[3][0],
                 bars[4][0]), ('1', '2', '4', '8', '16'), loc="upper right")

fig.savefig("./charts/%s-valgrind-L1.png" % sys.argv[1])

fig, chart_L3 = plt.subplots()

plt.xlabel("Input Size", fontsize=12)
plt.ylabel("Miss Ratio - Cache L3 (%)", fontsize=12)

gap = .8 / len(labels)
X = np.arange(len(labels))
bars = []
for i, value in enumerate(data_L3.keys()):
    b = chart_L3.bar(X+i*gap, data_L3[value], gap, bottom=0)
    bars.append(b)

chart_L3.set_title(sys.argv[1].capitalize()+"- valgrind")
chart_L3.set_xticks(X + gap / len(labels))
chart_L3.set_xticklabels(labels)
chart_L3.legend((bars[0][0], bars[1][0], bars[2][0], bars[3][0],
                 bars[4][0]), ('1', '2', '4', '8', '16'), loc="upper right")

fig.savefig("./charts/%s-valgrind-L3.png" % sys.argv[1])
plt.show()
