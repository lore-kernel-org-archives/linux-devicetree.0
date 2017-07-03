From: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/3 v7] hsdk: initial port for HSDK board
Date: Mon,  3 Jul 2017 19:51:06 +0300
Message-ID: <20170703165109.31535-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series introduces some required preparations and initial
port of ARC HS Development Kit board with some basic features such
as serial port, USB, SD/MMC and Ethernet.

Essentially we run Linux kernel on all 4 cores (i.e. utilize SMP) and
heavily use IO Coherency for speeding-up DMA-aware peripherals.

Note as opposed to other ARC boards we link Linux kernel to
0x9000_0000 intentionally because cores 1 and 3 configured with DCCM
situated at our more usual link base 0x8000_0000.

Note that two patches of this series ("ARC: Decouple linux kernel memory
address and link address" and "ARC: Set IO-coherency aperture base to 
LINUX_LINK_BASE") are prerequisites for HDSK support as its hardware
configuration differs quite a bit from what we used to have on other
ARC boards.

Alexey Brodkin (1):
  ARC: hsdk: initial port for HSDK board

Eugeniy Paltsev (2):
  ARC: Set IO-coherency aperture base to LINUX_LINK_BASE
  ARC: Decouple linux kernel memory address and link address

Changes v6 -> v7:
 * DTS: get rid of skeleton.dts, move cpus nodes to hsdk.dts
 * DTS: style fixes
 * Enable loadable modules, module unloading and NFS client as defaults
 * Get rid of ARC_PLAT_HSDK board config option

Changes v5 -> v6:
 * Add support of USB-to-HDMI adapter
 * Revert removing of resetting CREG_PAE bits.
   PAE remapping for DMA clients does not work due to an RTL bug, so
   CREG_PAE register must be programmed to all zeroes, otherwise it
   will cause problems with DMA to/from peripherals even if PAE40 is
   not used.

Changes v4 -> v5:
 * Move DCCM outside of 0x8000_0000 adress at kernel boot time.
 * Decouple linux kernel memory address and link address.
 * Remove hardcoding of IO-coherency aperture base.
 * Remove resetting CREG_PAE bits as default value is suitable for us.

Changes v3 -> v4:
 * Removed senseless "ranges" property from "memory" node in .dts
 * Refined early-boot code:
    - ICCM relocation should be done on each and every core that sports ICCM
      so we leave it in init_per_cpu(). Even though init_per_cpu() gets called
      on the master core pretty late still it is way much earlier than that
      moment when it might affect us - as it only huts us when addresses in
      0x7z-0x7fff_ffff range are used, i.e. virtual addresses that we don't
      use during init. This also makes code much cleaner compared to
      additional check in case of master etc.

Changes v2 -> v3:
 * Added Rob to Cc-list for DT binding approval
 * Removed mention of prerequsite patch from commit message
 * Removed hsdk_early_init() as hsdk_init_per_cpu() is executed on
   all cores anyways including master
 * Cleaned-up board's .dts a little bit
 * Removed CONFIG_DP83867_PHY from defconfig as it was only used on
   FPGA prototype, on real board we use MICREL PHY which is still selected

Changes v1 -> v2:
 * Update copyright year from 2016 to more up to date 2017
 * Merge early UART clock with AXS10x as in both cases that's 33.3 MHz
 * Bump memory to 1Gb, we don't use more for now because it requires
   trickier IOC setup and usage
 * Update early platform init code:
    - Added missing fixup_pae_regs() to per-cpu init
    - Mark most of functions as "static __init"
    - Use writel_relaxed() for setting CREG_PAE, CREG_PAE_UPDATE is still
      written with stronger writel() since we don't want reordering to happen,
      otherwise value written to CREG_PAE won't be applied

 Documentation/devicetree/bindings/arc/hsdk.txt |   7 ++
 arch/arc/Kconfig                               |   6 +
 arch/arc/Makefile                              |   1 +
 arch/arc/boot/dts/hsdk.dts                     | 150 +++++++++++++++++++++++++
 arch/arc/boot/dts/include/dt-bindings          |   1 +
 arch/arc/configs/hsdk_defconfig                |  72 ++++++++++++
 arch/arc/include/asm/page.h                    |   2 +-
 arch/arc/kernel/devtree.c                      |   5 +-
 arch/arc/mm/cache.c                            |  33 ++++--
 arch/arc/mm/init.c                             |   6 +-
 arch/arc/plat-hsdk/Kconfig                     |  12 ++
 arch/arc/plat-hsdk/Makefile                    |   9 ++
 arch/arc/plat-hsdk/platform.c                  |  77 +++++++++++++
 13 files changed, 366 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arc/hsdk.txt
 create mode 100644 arch/arc/boot/dts/hsdk.dts
 create mode 120000 arch/arc/boot/dts/include/dt-bindings
 create mode 100644 arch/arc/configs/hsdk_defconfig
 create mode 100644 arch/arc/plat-hsdk/Kconfig
 create mode 100644 arch/arc/plat-hsdk/Makefile
 create mode 100644 arch/arc/plat-hsdk/platform.c

-- 
2.9.3
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
