Return-Path: <SRS0=ytGm=NT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-os2jpn01on0120.outbound.protection.outlook.com ([104.47.92.120]:62345
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726027AbeKHQ7P (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 8 Nov 2018 11:59:15 -0500
From: Gaku Inami <gaku.inami.xh@renesas.com>
Subject: [PATCH v2 0/2] Optimization with aware of cpu capacity for R-Car Gen3
Date: Thu,  8 Nov 2018 16:24:53 +0900
Message-Id: <1541661895-7064-1-git-send-email-gaku.inami.xh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Gaku Inami <gaku.inami.xh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

The commit 05484e098448 ("sched/topology: Add SD_ASYM_CPUCAPACITY
flag detection") to automatically detect asymmetric CPU capacity
has been merged into v4.20-rc1, so I will post this patch series
as v2 again.

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

UnixBench (1 parallel) on r8a7796 SoC (CA57x2 + CA53x4) :
                                            before      after
 - Dhrystone 2 using register variables    4777159   11353624   +58%
 - Double-Precision Whetstone                  866       1218   +29%
 - Execl Throughput                            728        920   +21%
 - File Copy 1024 bufsize 2000 maxblocks     69405     115962   +40%
 - File Copy 256 bufsize 500 maxblocks       21404      28685   +25%
 - File Copy 4096 bufsize 8000 maxblocks    102749     159978   +36%
 - Pipe Throughput                           93876     150848   +38%
 - Pipe-based Context Switching              27257      25317    -8%
 - Process Creation                           1885       2292   +18%
 - Shell Scripts (1 concurrent)                135        137    +1%
 - Shell Scripts (8 concurrent)                 35         34    -3%
 - System Call Overhead                      99169     140146   +29%
 - System Benchmarks Index Score               112        152   +26%

UnixBench (8 parallel) on r8a7795 SoC (CA57x4 + CA53x4) :
                                            before      after
 - Dhrystone 2 using register variables   64686060   64472624     0%
 - Double-Precision Whetstone                 8380       8423    +1%
 - Execl Throughput                           5856       6147    +5%
 - File Copy 1024 bufsize 2000 maxblocks    142923     164482   +13%
 - File Copy 256 bufsize 500 maxblocks       46257      51344   +10%
 - File Copy 4096 bufsize 8000 maxblocks    360398     393339    +8%
 - Pipe Throughput                          974106     972545     0%
 - Pipe-based Context Switching             162455     146567   -11%
 - Process Creation                          10164       9659    -5%
 - Shell Scripts (1 concurrent)                317        317     0%
 - Shell Scripts (8 concurrent)                 30         31    +3%
 - System Call Overhead                     897596     899274     0%
 - System Benchmarks Index Score               523        534    +2%

based on renesas-devel-20181105-v4.20-rc1

v1 -> v2:
 - Consolidate two patches for r8a7795 and r8a7796 into one patch
 - Add the formula for capacity-dmips-mhz into description
 - Remove the static setting of SD_ASYM_CPUCAPACITY for R-Car

Gaku Inami (2):
  arm64: dts: renesas: Add CPU topology on R-Car Gen3 SoCs
  arm64: dts: renesas: Add CPU capacity-dmips-mhz

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 40 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 32 +++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

-- 
2.7.4
