From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] Devicetree updates for 4.20
Date: Fri, 26 Oct 2018 11:06:59 -0500
Message-ID: <CAL_JsqJKkPiHBbJWMF5=JzxZyO+UTN0qLFLnjvd9txkUQPdznw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Linus,

Please pull DT updates for 4.20. A bit bigger than normal as I've been
busy this cycle. There's a few things with dependencies and a few
things subsystem maintainers didn't pick up, so I'm taking them thru
my tree. The fixes from Johan didn't get into linux-next, but they've
been waiting for some time now and they are what's left of what
subsystem maintainers didn't pick up. There's no conflicts yet with
your tree, but there are 2 conflicts I'm aware of. One is with the c6x
tree and the other is in drivers/soc/qcom/apr.c. The correct
resolutions are in linux-next.

Rob

The following changes since commit 57361846b52bc686112da6ca5368d11210796804:

  Linux 4.19-rc2 (2018-09-02 14:37:30 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-4.20

for you to fetch changes up to d061864b89c3234b53d8884027b0cd6f06bd3149:

  ARM: dt: relicense two DT binding IRQ headers (2018-10-26 07:46:32 -0500)

----------------------------------------------------------------
Devicetree updates for 4.20:

- Sync dtc with upstream version v1.4.7-14-gc86da84d30e4

- Work to get rid of direct accesses to struct device_node name and
  type pointers in preparation for removing them. New helpers for
  parsing DT cpu nodes and conversions to use the helpers. printk
  conversions to %pOFn for printing DT node names. Most went thru
  subystem trees, so this is the remainder.

- Fixes to DT child node lookups to actually be restricted to child
  nodes instead of treewide.

- Refactoring of dtb targets out of arch code. This makes the support
  more uniform and enables building all dtbs on c6x, microblaze, and
  powerpc.

- Various DT binding updates for Renesas r8a7744 SoC

- Vendor prefixes for Facebook, OLPC

- Restructuring of some ARM binding docs moving some peripheral bindings
  out of board/SoC binding files

- New "secure-chosen" binding for secure world settings on ARM

- Dual licensing of 2 DT IRQ binding headers

----------------------------------------------------------------
Alan Tull (1):
      dt-bindings: fpga: fix freeze controller compatible in region doc

Anson Huang (1):
      dt-bindings: reset: imx7: update the compatible string

Biju Das (5):
      dt-bindings: thermal: rcar: Add device tree support for r8a7744
      dt-bindings: watchdog: renesas-wdt: Document r8a7744 support
      dt-bindings: timer: renesas, cmt: Document r8a7744 CMT support
      dt-bindings: can: rcar_can: Add r8a7744 support
      dt-bindings: phy: rcar-gen2: Add r8a7744 support

Charles Keepax (1):
      mfd: arizona: Correct link for sound binding document

Chris Brandt (1):
      dt-bindings: timer: ostm: Add R7S9210 support

Guenter Roeck (1):
      of: unittest: Disable interrupt node tests for old world MAC systems

Jerome Forissier (1):
      Documentation: dt: Add binding for /secure-chosen/stdout-path

Johan Hovold (6):
      drm/mediatek: fix OF sibling-node lookup
      drm/msm: fix OF child-node lookup
      net: bcmgenet: fix OF child-node lookup
      net: stmmac: dwmac-sun8i: fix OF child-node lookup
      NFC: nfcmrvl_uart: fix OF child-node lookup
      power: supply: twl4030-charger: fix OF sibling-node lookup

Jonathan Cameron (1):
      dt-bindings: crypto: hip07-sec, drop incorrect commas

Krzysztof Kozlowski (2):
      dt-bindings: clock: samsung: Add SPDX license identifiers
      dt-bindings: thermal: samsung: Add SPDX license identifier

Lubomir Rintel (1):
      dt-bindings: Add OLPC vendor prefix

Lukasz Majewski (1):
      dt-bindings: misc: bk4: Add device tree binding for Liebherr's BK4 SPI bus

Rob Herring (56):
      of/unittest: remove use of node name pointer in overlay high level test
      of/unittest: add printf tests for node name
      of: Convert to using %pOFn instead of device_node.name
      vsprintf: print OF node name using full_name
      of: make default address and size cells sizes private
      of: make PowerMac cache node search conditional on CONFIG_PPC_PMAC
      of: fix phandle cache creation for DTs with no phandles
      Merge branch 'dt/linus' into HEAD
      of/unittest: Fix I2C bus unit-address error
      libfdt: Ensure INT_MAX is defined in libfdt_env.h
      scripts/dtc: Add yamltree.c to dtc sources
      scripts/dtc: Update to upstream version v1.4.7-14-gc86da84d30e4
      of: Add cpu node iterator for_each_of_cpu_node()
      of: Support matching cpu nodes with no 'reg' property
      ARM: use for_each_of_cpu_node iterator
      ARM: topology: remove unneeded check for /cpus node
      ARM: shmobile: use for_each_of_cpu_node iterator
      arm64: use for_each_of_cpu_node iterator
      c6x: use for_each_of_cpu_node iterator
      nios2: get cpu node with of_get_cpu_node
      openrisc: use for_each_of_cpu_node iterator
      powerpc: use for_each_of_cpu_node iterator
      powerpc: 4xx: get cpu node with of_get_cpu_node
      powerpc: 8xx: get cpu node with of_get_cpu_node
      SH: use for_each_of_cpu_node iterator
      x86: DT: use for_each_of_cpu_node iterator
      clk: mvebu: use for_each_of_cpu_node iterator
      edac: cpc925: use for_each_of_cpu_node iterator
      iommu: fsl_pamu: use for_each_of_cpu_node iterator
      of: use for_each_of_cpu_node iterator
      fbdev: fsl-diu: get cpu node with of_get_cpu_node
      microblaze: get cpu node with of_get_cpu_node
      Merge branch 'dt/cpu-type-rework' into dt/next
      nios2: Convert to using %pOFn instead of device_node.name
      xtensa: Convert to using %pOFn instead of device_node.name
      bus: fsl-mc: Convert to using %pOFn instead of device_node.name
      bus: mvebu-mbus: Convert to using %pOFn instead of device_node.name
      devfreq: Convert to using %pOFn instead of device_node.name
      powerpc: build .dtb files in dts directory
      nios2: build .dtb files in dts directory
      nios2: use common rules to build built-in dtb
      nios2: fix building all dtbs
      c6x: use common built-in dtb support
      kbuild: consolidate Devicetree dtb build rules
      powerpc: enable building all dtbs
      c6x: enable building all dtbs
      microblaze: enable building all dtbs
      firmware: Convert to using %pOFn instead of device_node.name
      soc: Convert to using %pOFn instead of device_node.name
      of: Fix property name in of_node_get_device_type
      Merge branch 'all-dtbs' into dt/next
      dt-bindings: arm: alpine: Move CPU control related binding to
cpu-enable-method/al,alpine-smp
      dt-bindings: arm: atmel: Move various sys registers out of SoC binding doc
      dt-bindings: arm: fsl: Move DCFG and SCFG bindings to their own docs
      dt-bindings: arm: zte: Move sysctrl bindings to their own doc
      of: Add missing exports of node name compare functions

Stephen Warren (1):
      ARM: dt: relicense two DT binding IRQ headers

Vijay Khemka (1):
      ARM: dt-bindings: Add vendor prefix for Facebook

Vincent Guittot (1):
      dt-binding: arm/cpus.txt: fix dynamic-power-coefficient unit

sim manseop (1):
      dt-bindings: i2c: Fix SMBus typo

 .../devicetree/bindings/arm/al,alpine.txt          |  72 ------
 .../devicetree/bindings/arm/atmel-at91.txt         | 170 --------------
 .../devicetree/bindings/arm/atmel-sysregs.txt      | 171 ++++++++++++++
 .../bindings/arm/cpu-enable-method/al,alpine-smp   |  34 ++-
 Documentation/devicetree/bindings/arm/cpus.txt     |   4 +-
 .../bindings/arm/freescale/fsl,layerscape-dcfg.txt |  19 ++
 .../bindings/arm/freescale/fsl,layerscape-scfg.txt |  19 ++
 Documentation/devicetree/bindings/arm/fsl.txt      |  39 ----
 Documentation/devicetree/bindings/arm/secure.txt   |  19 +-
 .../devicetree/bindings/arm/zte,sysctrl.txt        |  30 +++
 Documentation/devicetree/bindings/arm/zte.txt      |  27 +--
 .../bindings/crypto/hisilicon,hip07-sec.txt        |   2 +-
 .../devicetree/bindings/fpga/fpga-region.txt       |   4 +-
 Documentation/devicetree/bindings/i2c/i2c.txt      |   2 +-
 Documentation/devicetree/bindings/mfd/arizona.txt  |   2 +-
 Documentation/devicetree/bindings/misc/lwn-bk4.txt |  26 +++
 .../devicetree/bindings/net/can/rcar_can.txt       |   1 +
 .../devicetree/bindings/phy/rcar-gen2-phy.txt      |   1 +
 .../devicetree/bindings/reset/fsl,imx7-src.txt     |   2 +-
 .../devicetree/bindings/thermal/rcar-thermal.txt   |   1 +
 .../devicetree/bindings/timer/renesas,cmt.txt      |   2 +
 .../devicetree/bindings/timer/renesas,ostm.txt     |   3 +-
 .../devicetree/bindings/vendor-prefixes.txt        |   2 +
 .../devicetree/bindings/watchdog/renesas-wdt.txt   |   1 +
 Makefile                                           |  37 ++-
 arch/arc/Makefile                                  |   6 -
 arch/arm/Makefile                                  |  20 +-
 arch/arm/boot/compressed/libfdt_env.h              |   2 +
 arch/arm/kernel/devtree.c                          |   5 +-
 arch/arm/kernel/topology.c                         |   6 -
 arch/arm/mach-shmobile/pm-rcar-gen2.c              |   8 +-
 arch/arm/mach-shmobile/pm-rmobile.c                |   2 +-
 arch/arm/mach-shmobile/timer.c                     |  10 +-
 arch/arm64/Makefile                                |  17 +-
 arch/arm64/kernel/smp.c                            |   2 +-
 arch/c6x/Makefile                                  |   2 -
 arch/c6x/boot/dts/Makefile                         |  17 +-
 arch/c6x/boot/dts/linked_dtb.S                     |   2 -
 arch/c6x/include/asm/sections.h                    |   1 -
 arch/c6x/kernel/setup.c                            |  15 +-
 arch/c6x/kernel/vmlinux.lds.S                      |  10 -
 arch/h8300/Makefile                                |  11 +-
 arch/microblaze/Makefile                           |   4 +-
 arch/microblaze/boot/dts/Makefile                  |   4 +
 arch/microblaze/kernel/cpu/cpuinfo.c               |   6 +-
 arch/mips/Makefile                                 |  15 +-
 arch/nds32/Makefile                                |   2 +-
 arch/nios2/Makefile                                |  11 +-
 arch/nios2/boot/Makefile                           |  22 --
 arch/nios2/boot/dts/Makefile                       |   6 +
 arch/nios2/boot/linked_dtb.S                       |  19 --
 arch/nios2/kernel/cpuinfo.c                        |   4 +-
 arch/nios2/kernel/time.c                           |   4 +-
 arch/openrisc/kernel/setup.c                       |   3 +-
 arch/powerpc/Makefile                              |   3 -
 arch/powerpc/boot/Makefile                         |  55 +++--
 arch/powerpc/boot/dts/Makefile                     |   6 +
 arch/powerpc/boot/dts/fsl/Makefile                 |   4 +
 arch/powerpc/boot/libfdt_env.h                     |   2 +
 arch/powerpc/platforms/4xx/soc.c                   |   2 +-
 arch/powerpc/platforms/8xx/m8xx_setup.c            |   5 +-
 arch/powerpc/platforms/powermac/feature.c          |  51 ++---
 arch/powerpc/platforms/powermac/setup.c            |  15 +-
 arch/sh/boards/of-generic.c                        |   2 +-
 arch/sparc/include/asm/prom.h                      |   3 -
 arch/x86/kernel/devicetree.c                       |   2 +-
 arch/xtensa/Makefile                               |  12 +-
 arch/xtensa/platforms/xtfpga/setup.c               |   6 +-
 drivers/bus/fsl-mc/fsl-mc-bus.c                    |   6 +-
 drivers/bus/mvebu-mbus.c                           |   2 +-
 drivers/clk/mvebu/clk-cpu.c                        |   4 +-
 drivers/devfreq/event/exynos-ppmu.c                |   4 +-
 drivers/edac/cpc925_edac.c                         |  20 +-
 drivers/firmware/scpi_pm_domain.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   5 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   5 +-
 drivers/iommu/fsl_pamu.c                           |   2 +-
 drivers/net/ethernet/broadcom/genet/bcmmii.c       |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  |  12 +-
 drivers/nfc/nfcmrvl/uart.c                         |   5 +-
 drivers/of/base.c                                  |  50 ++++-
 drivers/of/device.c                                |   5 +-
 drivers/of/of_mdio.c                               |  12 +-
 drivers/of/of_numa.c                               |  19 +-
 drivers/of/of_private.h                            |   8 +
 drivers/of/overlay.c                               |   4 +-
 drivers/of/platform.c                              |   8 +-
 drivers/of/unittest-data/overlay_15.dts            |   4 +-
 drivers/of/unittest-data/tests-overlay.dtsi        |   4 +-
 drivers/of/unittest.c                              |  55 +++--
 drivers/power/supply/twl4030_charger.c             |   5 +-
 drivers/soc/dove/pmu.c                             |   8 +-
 drivers/soc/fsl/qe/qe_tdm.c                        |   4 +-
 drivers/soc/qcom/apr.c                             |   2 +-
 drivers/soc/rockchip/pm_domains.c                  |  44 ++--
 drivers/soc/tegra/pmc.c                            |  12 +-
 drivers/soc/ti/knav_dma.c                          |   8 +-
 drivers/soc/ti/knav_qmss_queue.c                   |   8 +-
 drivers/video/fbdev/fsl-diu-fb.c                   |   2 +-
 include/dt-bindings/clock/exynos3250.h             |   5 +-
 include/dt-bindings/clock/exynos4.h                |   7 +-
 include/dt-bindings/clock/exynos5250.h             |   7 +-
 include/dt-bindings/clock/exynos5260-clk.h         |   7 +-
 include/dt-bindings/clock/exynos5410.h             |   7 +-
 include/dt-bindings/clock/exynos5420.h             |   7 +-
 include/dt-bindings/clock/exynos5433.h             |   5 +-
 include/dt-bindings/clock/exynos7-clk.h            |   7 +-
 include/dt-bindings/clock/s3c2410.h                |   5 +-
 include/dt-bindings/clock/s3c2412.h                |   5 +-
 include/dt-bindings/clock/s3c2443.h                |   5 +-
 include/dt-bindings/interrupt-controller/arm-gic.h |   2 +-
 include/dt-bindings/interrupt-controller/irq.h     |   2 +-
 include/dt-bindings/thermal/thermal_exynos.h       |  12 +-
 include/linux/libfdt_env.h                         |   1 +
 include/linux/of.h                                 |  19 +-
 lib/vsprintf.c                                     |   7 +-
 scripts/Makefile                                   |   3 +-
 scripts/Makefile.lib                               |   2 +-
 scripts/dtc/Makefile                               |   9 +-
 scripts/dtc/Makefile.dtc                           |   4 +
 scripts/dtc/checks.c                               | 143 ++++++++++++
 scripts/dtc/data.c                                 |   4 +-
 scripts/dtc/dtc-parser.y                           |  16 +-
 scripts/dtc/dtc.c                                  |  11 +
 scripts/dtc/dtc.h                                  |  13 ++
 scripts/dtc/flattree.c                             |   2 +-
 scripts/dtc/libfdt/fdt.c                           |  81 ++++++-
 scripts/dtc/libfdt/fdt_addresses.c                 |  35 ++-
 scripts/dtc/libfdt/fdt_overlay.c                   |   6 +-
 scripts/dtc/libfdt/fdt_ro.c                        | 199 ++++++++++++++---
 scripts/dtc/libfdt/fdt_rw.c                        |  28 +--
 scripts/dtc/libfdt/fdt_sw.c                        | 109 +++++++--
 scripts/dtc/libfdt/libfdt.h                        |  76 ++++++-
 scripts/dtc/libfdt/libfdt_env.h                    |   1 +
 scripts/dtc/libfdt/libfdt_internal.h               |   5 +-
 scripts/dtc/livetree.c                             |  12 +-
 scripts/dtc/treesource.c                           | 225 +++++++++++--------
 scripts/dtc/update-dtc-source.sh                   |   2 +-
 scripts/dtc/util.c                                 |  23 +-
 scripts/dtc/util.h                                 |  20 +-
 scripts/dtc/version_gen.h                          |   2 +-
 scripts/dtc/yamltree.c                             | 247 +++++++++++++++++++++
 142 files changed, 1760 insertions(+), 1053 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/atmel-sysregs.txt
 create mode 100644
Documentation/devicetree/bindings/arm/freescale/fsl,layerscape-dcfg.txt
 create mode 100644
Documentation/devicetree/bindings/arm/freescale/fsl,layerscape-scfg.txt
 create mode 100644 Documentation/devicetree/bindings/arm/zte,sysctrl.txt
 create mode 100644 Documentation/devicetree/bindings/misc/lwn-bk4.txt
 delete mode 100644 arch/c6x/boot/dts/linked_dtb.S
 create mode 100644 arch/nios2/boot/dts/Makefile
 delete mode 100644 arch/nios2/boot/linked_dtb.S
 create mode 100644 arch/powerpc/boot/dts/Makefile
 create mode 100644 arch/powerpc/boot/dts/fsl/Makefile
 create mode 100644 scripts/dtc/yamltree.c
