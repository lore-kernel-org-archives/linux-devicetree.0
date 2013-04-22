From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH v2 00/13] ARM: DT cpu bindings updates
Date: Mon, 22 Apr 2013 16:27:22 +0100
Message-ID: <1366644455-16550-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>, Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset is an update of a previous posting:

http://lists.infradead.org/pipermail/linux-arm-kernel/2013-April/163310.html

v2 changes:

- Reworded DT cpu bindings
- Split the set, with per-mach specific dts updates
- Updated cpu node compatible string list
- Defined behaviour of OS running on v8 in AArch32

The introduction of DT cpus/cpu bindings for ARM requires well established
rules to enforce the reg property definition for 32-bit and 64-bit ARM
processors, inclusive of legacy and current uniprocessor/SMP systems.

ARM 64 bit architecture also requires dtb compiled for 64-bit configurations
to be reused for kernels running in 32 bit mode, so the cpus/cpu bindings
specification must be made compliant to cope with this configuration.

Patch #1 of this series is a fix and is included to have a clean patch
series and should get reviewed and merged separately.

Patch #2-13, along with some kernel fixes related to DT parsing function,
update the cpu node bindings and in kernel dts files to cope with legacy,
current and upcoming ARM systems.

In-kernel device tree source files are updated to comply with the latest
specification, so thorough testing is required in order to validate all
changes on all affected ARM systems, in particular systems with exotic
MPIDR configurations that are likely to break with the changes provided.

Code relying on the reg property size to be 4-bytes will break when
dtb compiled for 64-bit kernels are used to boot a 32-bit system so
kernel code relying on that (bogus) assumption must be updated properly.

Lorenzo Pieralisi (13):
  ARM: DT: kernel: move temporary cpu map stack array to static data
  ARM: mach-mv78xx0: cpus/cpu node dts updates
  ARM: mach-at91: cpus/cpu node dts updates
  ARM: mach-exynos: cpus/cpu nodes dts updates
  ARM: mach-imx: cpus/cpu nodes dts updates
  ARM: mach-lpc32xx: cpus/cpu nodes dts updates
  ARM: mach-omap2: cpus/cpu nodes dts updates
  ARM: mach-picoxcell: cpus/cpu nodes dts updates
  ARM: mach-shmobile: cpus/cpu nodes dts updates
  ARM: mach-spear: cpus/cpu nodes dts updates
  ARM: mach-sunxi: cpus/cpu nodes dts updates
  ARM: mach-vt8500: cpus/cpu nodes dts updates
  ARM: DT: kernel: DT cpu node bindings update

 Documentation/devicetree/bindings/arm/cpus.txt | 378 ++++++++++++++++++++++---
 arch/arm/boot/dts/armada-370-xp.dtsi           |   1 +
 arch/arm/boot/dts/at91sam9260.dtsi             |   2 +-
 arch/arm/boot/dts/at91sam9263.dtsi             |   2 +-
 arch/arm/boot/dts/at91sam9g45.dtsi             |   2 +-
 arch/arm/boot/dts/at91sam9n12.dtsi             |   2 +-
 arch/arm/boot/dts/exynos5440.dtsi              |   7 +
 arch/arm/boot/dts/imx23.dtsi                   |   2 +-
 arch/arm/boot/dts/imx28.dtsi                   |   2 +-
 arch/arm/boot/dts/lpc32xx.dtsi                 |   2 +-
 arch/arm/boot/dts/omap3.dtsi                   |   4 +
 arch/arm/boot/dts/omap4.dtsi                   |   5 +
 arch/arm/boot/dts/omap5.dtsi                   |   5 +
 arch/arm/boot/dts/picoxcell-pc3x2.dtsi         |   2 +-
 arch/arm/boot/dts/picoxcell-pc3x3.dtsi         |   2 +-
 arch/arm/boot/dts/r8a7740.dtsi                 |   3 +
 arch/arm/boot/dts/sh7372.dtsi                  |   4 +
 arch/arm/boot/dts/spear3xx.dtsi                |   2 +-
 arch/arm/boot/dts/spear600.dtsi                |   2 +-
 arch/arm/boot/dts/sunxi.dtsi                   |   4 +
 arch/arm/boot/dts/wm8505.dtsi                  |   2 +-
 arch/arm/kernel/devtree.c                      |  85 ++++--
 22 files changed, 431 insertions(+), 89 deletions(-)

-- 
1.7.12
