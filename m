From: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: [RFC PATCH v3 0/4] arm64:numa: Add numa support for arm64 platforms.
Date: Wed, 31 Dec 2014 13:03:24 +0530
Message-ID: <1420011208-7051-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: inux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Will.Deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is v3 patch set to support numa on arm64 based platforms.
Tested these patches on cavium's multinode(2 node topology) platform.

In this patchset, defined and implemented dt bindings for numa mapping for core and memory.
using device node property arm,associativity.

v2:
Defined and implemented numa map for memory, cores to node and
proximity distance matrix of nodes to each other.

v1:
Initial patchset to support numa on arm64 platforms.

Ganapatrao Kulkarni (4):
  arm64: defconfig: increase NR_CPUS range to 2-4096.
  Documentation: arm64/arm: dt bindings for numa.
  arm64:thunder: Add initial dts for Cavium's Thunder SoC in 2 Node
    topology.
  arm64:numa: adding numa support for arm64 platforms.

 Documentation/devicetree/bindings/arm/numa.txt | 198 +++++++
 arch/arm64/Kconfig                             |  36 +-
 arch/arm64/boot/dts/thunder-88xx-2n.dts        |  78 +++
 arch/arm64/boot/dts/thunder-88xx-2n.dtsi       | 789 +++++++++++++++++++++++++
 arch/arm64/include/asm/mmzone.h                |  32 +
 arch/arm64/include/asm/numa.h                  |  45 ++
 arch/arm64/kernel/Makefile                     |   1 +
 arch/arm64/kernel/dt_numa.c                    | 296 ++++++++++
 arch/arm64/kernel/setup.c                      |   8 +
 arch/arm64/kernel/smp.c                        |   2 +
 arch/arm64/mm/Makefile                         |   1 +
 arch/arm64/mm/init.c                           |  34 +-
 arch/arm64/mm/numa.c                           | 520 ++++++++++++++++
 13 files changed, 2032 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/numa.txt
 create mode 100644 arch/arm64/boot/dts/thunder-88xx-2n.dts
 create mode 100644 arch/arm64/boot/dts/thunder-88xx-2n.dtsi
 create mode 100644 arch/arm64/include/asm/mmzone.h
 create mode 100644 arch/arm64/include/asm/numa.h
 create mode 100644 arch/arm64/kernel/dt_numa.c
 create mode 100644 arch/arm64/mm/numa.c

-- 
1.8.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
