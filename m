Return-Path: <>
From: Gaku Inami <gaku.inami.xh@renesas.com>
Subject: [PATCH 0/5] Optimization with aware of cpu capacity for R-Car Gen3
Date: Tue, 27 Feb 2018 11:19:50 +0900
Message-Id: <1519697995-6061-1-git-send-email-gaku.inami.xh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Gaku Inami <gaku.inami.xh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

These add the scheduler information to be aware cpu capacity. Some
R-Car SoCs have big LITTLE architecture(e.g. CA57/CA53). It has a
difference performance/power consumption for each CPUs.

As the scheduler will be aware the capacity of CPU, the scheduler is
balancing so that the free capacity of each CPU is even. This means
that it aggressively migrates tasks to big CPUs(e.g. CA57) with large
capacity in case of the system load is low and middle, the performance
of user application is improved than before.

Since most users for IVI are using CPU with performance oriented than
power consumption, this change will benefit for their use-cases. Some
benchmark is improved as an example below.

UnixBench (1 parallel) on R-Car M3-W (CA57x2 + CA53x4) :
                                            before      after
 - Dhrystone 2 using register variables    9197952   15534005   +68%
 - Double-Precision Whetstone                 1390       1697   +22%
 - Execl Throughput                            621       1189   +91%
 - File Copy 1024 bufsize 2000 maxblocks     81755     138840   +69%
 - File Copy 256 bufsize 500 maxblocks       25819      40125   +55%
 - File Copy 4096 bufsize 8000 maxblocks    212116     384956   +81%
 - Pipe Throughput                          133006     232866   +75%
 - Pipe-based Context Switching              23973      46271   +93%
 - Process Creation                           1085       2253  +107%
 - Shell Scripts (1 concurrent)                682       1003   +47%
 - Shell Scripts (8 concurrent)                261        319   +22%
 - System Call Overhead                     107912     193681   +79%
 - System Benchmarks Index Score               177        293   +65%

UnixBench (8 parallel) on R-Car H3 (CA57x4 + CA53x4) :
                                            before      after
 - Dhrystone 2 using register variables   86830146   86498236     0%
 - Double-Precision Whetstone                11640      11783    +1%
 - Execl Throughput                           4196       4207     0%
 - File Copy 1024 bufsize 2000 maxblocks    122995     127868    +3%
 - File Copy 256 bufsize 500 maxblocks       32339      30683    -6%
 - File Copy 4096 bufsize 8000 maxblocks    312526     421738   +34%
 - Pipe Throughput                          904408     896829    -1%
 - Pipe-based Context Switching             136409     122969   -10%
 - Process Creation                           5877       5712    -3%
 - Shell Scripts (1 concurrent)               3533       3279    -7%
 - Shell Scripts (8 concurrent)                467        465     0%
 - System Call Overhead                     738344     735697     0%
 - System Benchmarks Index Score               718        721     0%

based on renesas-devel-20180212-v4.16-rc1

Gaku Inami (5):
  arm64: dts: renesas: r8a7795: Add multi-cluster definition
  arm64: dts: renesas: r8a7796: Add multi-cluster definition
  arm64: dts: renesas: r8a7795: Add cpu capacity-dmips-mhz
  arm64: dts: renesas: r8a7796: Add cpu capacity-dmips-mhz
  soc: renesas: rcar-topology: Add support to be aware cpu capacity

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 40 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 32 +++++++++++++++++++++++++
 drivers/soc/renesas/Kconfig              |  4 ++++
 drivers/soc/renesas/Makefile             |  1 +
 drivers/soc/renesas/rcar-topology.c      | 36 ++++++++++++++++++++++++++++
 5 files changed, 113 insertions(+)
 create mode 100644 drivers/soc/renesas/rcar-topology.c

-- 
2.7.4
