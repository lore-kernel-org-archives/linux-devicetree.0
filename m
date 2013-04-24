From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH v3 00/17] ARM: DT cpu bindings updates
Date: Wed, 24 Apr 2013 18:28:05 +0100
Message-ID: <1366824502-19729-1-git-send-email-lorenzo.pieralisi@arm.com>
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
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>, Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset is an update of a previous posting:

http://lists.infradead.org/pipermail/linux-arm-kernel/2013-April/164587.html

v3 changes:

- More dts fixes of in-kernel dts
- Defined ARM v8 behaviour with different cpus node #address-cells
- Added pre ARM11 processors suffixes in the cpu node compatible list
- Reordered series
- Reworded #address-cells definition
- Added ARM v8 - cores running on AArch32 bindings example
- Moved WARN* calls on one line to prevent grepping issues

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

Patch #2-17, along with some kernel fixes related to DT parsing function,
update the cpu node bindings and in kernel dts files to cope with legacy,
current and upcoming ARM systems.

In-kernel device tree source files are updated to comply with the latest
specification, so thorough testing is required in order to validate all
changes on all affected ARM systems, in particular systems with exotic
MPIDR configurations that are likely to break with the changes provided.

Code relying on the reg property size to be 4-bytes must be updated so that
dtbs compiled for 64-bit kernels can also be used to boot a 32-bit system.

Lorenzo Pieralisi (17):
  ARM: DT: kernel: move temporary cpu map stack array to static data
  Documentation: devicetree: arm: cpus/cpu nodes bindings updates
  ARM: dts: am33xx: cpus/cpu nodes dts updates
  ARM: dts: armada-370-xp: cpus/cpu node dts updates
  ARM: dts: at91: cpus/cpu node dts updates
  ARM: dts: exynos5440: cpus/cpu nodes dts updates
  ARM: dts: imx: cpus/cpu nodes dts updates
  ARM: dts: lpc32xx: cpus/cpu nodes dts updates
  ARM: dts: omap: cpus/cpu nodes dts updates
  ARM: dts: picoxcell: cpus/cpu nodes dts updates
  ARM: dts: prima2: cpus/cpu node dts updates
  ARM: dts: pxa2xx: cpus/cpu nodes dts updates
  ARM: dts: r8a7740: cpus/cpu nodes dts updates
  ARM: dts: sh7372: cpus/cpu nodes dts updates
  ARM: dts: spear: cpus/cpu nodes dts updates
  ARM: dts: sunxi: cpus/cpu nodes dts updates
  ARM: DT: kernel: DT cpus/cpu node bindings update

 Documentation/devicetree/bindings/arm/cpus.txt | 457 ++++++++++++++++++++++---
 arch/arm/boot/dts/am33xx.dtsi                  |   4 +
 arch/arm/boot/dts/armada-370-xp.dtsi           |   4 +
 arch/arm/boot/dts/at91rm9200.dtsi              |   6 +-
 arch/arm/boot/dts/at91sam9260.dtsi             |   8 +-
 arch/arm/boot/dts/at91sam9263.dtsi             |   8 +-
 arch/arm/boot/dts/at91sam9g45.dtsi             |   8 +-
 arch/arm/boot/dts/at91sam9n12.dtsi             |   8 +-
 arch/arm/boot/dts/at91sam9x5.dtsi              |   8 +-
 arch/arm/boot/dts/exynos5440.dtsi              |  11 +
 arch/arm/boot/dts/imx23.dtsi                   |   8 +-
 arch/arm/boot/dts/imx28.dtsi                   |   8 +-
 arch/arm/boot/dts/imx6dl.dtsi                  |   2 +
 arch/arm/boot/dts/imx6q.dtsi                   |   1 +
 arch/arm/boot/dts/lpc32xx.dtsi                 |   8 +-
 arch/arm/boot/dts/omap2.dtsi                   |   6 +-
 arch/arm/boot/dts/omap3.dtsi                   |   5 +
 arch/arm/boot/dts/omap4.dtsi                   |   7 +
 arch/arm/boot/dts/omap5.dtsi                   |   7 +
 arch/arm/boot/dts/picoxcell-pc3x2.dtsi         |   8 +-
 arch/arm/boot/dts/picoxcell-pc3x3.dtsi         |   8 +-
 arch/arm/boot/dts/prima2.dtsi                  |   2 +
 arch/arm/boot/dts/pxa2xx.dtsi                  |   7 +-
 arch/arm/boot/dts/r8a7740.dtsi                 |   4 +
 arch/arm/boot/dts/sh7372.dtsi                  |   5 +
 arch/arm/boot/dts/spear13xx.dtsi               |   2 +
 arch/arm/boot/dts/spear3xx.dtsi                |   8 +-
 arch/arm/boot/dts/spear600.dtsi                |   8 +-
 arch/arm/boot/dts/sunxi.dtsi                   |   5 +
 arch/arm/kernel/devtree.c                      |  81 +++--
 30 files changed, 602 insertions(+), 110 deletions(-)

-- 
1.7.12
