From: Rob Herring <robherring2@gmail.com>
Subject: [GIT PULL] DeviceTree for 4.7
Date: Fri, 20 May 2016 16:05:46 -0500
Message-ID: <CAL_JsqL6JyLAK3ugFPeXv4nvLB_J-TYbw4Zryy+sOaQg9q4qgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Linus,

Please pull DT updates for 4.7. There's a small merge conflict with
the iommu tree. The correct resolution is in -next. There's also a one
line conflict in nvidia,gk20a.txt with the same change made in both
branches.

Rob

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc=
69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-4.7

for you to fetch changes up to f2c27767af0a91cbdc3d832231f953110473e853=
:

  devicetree: Add Creative Technology vendor id (2016-05-19 09:16:36 -0=
500)

----------------------------------------------------------------
Devicetree for 4.7:

- Rewrite of the unflattening code to avoid recursion and lessen the
  stack usage.

- Rewrite of the phandle args parsing code to get rid of the fixed args
  size. This is needed for IOMMU code.

- Sync to latest dtc which adds more dts style checking. These warnings
  are enabled with "W=3D1" compiles.

- Tegra documentation updates related to the above warnings.

- A bunch of spelling and other doc fixes.

- Various vendor prefix additions.

----------------------------------------------------------------
Andreas F=C3=A4rber (1):
      Documentation: devicetree: Clean up gpio-keys example

Arnd Bergmann (1):
      of: include errno.h in of_graph.h

Christian Lamparter (1):
      gpio: dt-bindings: add ibm,ppc4xx-gpio binding

Dr. H. Nikolaus Schaller (1):
      Documentation: bindings: fix palmas-rtc documentation

Eric Engestrom (15):
      Documentation: dt: arm: fix spelling mistakes
      Documentation: dt: clock: fix spelling mistakes
      Documentation: dt: display: fix spelling mistake
      Documentation: dt: dma: fix spelling mistake
      Documentation: dt: input: fix spelling mistakes
      Documentation: dt: interrupt-controller: fix spelling mistakes
      Documentation: dt: media: fix spelling mistake
      Documentation: dt: mfd: fix spelling mistakes
      Documentation: dt: mmc: fix spelling mistake
      Documentation: dt: mtd: fix spelling mistake
      Documentation: dt: net: fix spelling mistakes
      Documentation: dt: opp: fix spelling mistake
      Documentation: dt: pinctrl: fix spelling mistake
      Documentation: dt: power: fix spelling mistake
      Documentation: dt: soc: fix spelling mistakes

Gavin Shan (7):
      drivers/of: Split unflatten_dt_node()
      drivers/of: Avoid recursively calling unflatten_dt_node()
      drivers/of: Rename unflatten_dt_node()
      drivers/of: Specify parent node in of_fdt_unflatten_tree()
      drivers/of: Return allocated memory from of_fdt_unflatten_tree()
      drivers/of: Export of_detach_node()
      drivers/of: Fix build warning in populate_node()

Geert Uytterhoeven (4):
      misc: sram: DT spelling s/#adress-cells/#address-cells/
      PCI: hisi: DT spelling s/interrupts-*/interrupt-*/
      phy: phy-stih41x-usb: DT spelling s/#phy-cell/#phy-cells/
      serial: Move Marvell UART DT bindings to correct location

Javier Martinez Canillas (1):
      of/unittest: Remove unnecessary module.h header inclusion

Joerg Roedel (6):
      of: Introduce struct of_phandle_iterator
      of: Move phandle walking to of_phandle_iterator_next()
      of: Remove counting special case from __of_parse_phandle_with_arg=
s()
      of: Introduce of_for_each_phandle() helper macro
      of: Introduce of_phandle_iterator_args()
      iommu/arm-smmu: Make use of phandle iterators in device-tree pars=
ing

Jon Hunter (1):
      dt-bindings: Correct path for ARM GIC documentation

Marek Vasut (1):
      devicetree: Add Creative Technology vendor id

Masahiro Yamada (1):
      of: document refcount incrementation of of_get_cpu_node()

Max Uvarov (1):
      fdt: fix extend of cmd line

Pantelis Antoniou (1):
      of: dynamic: changeset prop-update revert fix

Rhyland Klein (1):
      drivers/of: Fix depth when unflattening devicetree

Rob Herring (2):
      scripts/dtc: Update to upstream version 53bf130b1cdd
      dtc: turn off dtc unit address warnings by default

Schuyler Patton (1):
      Documentation: devicetree: bindings: regulator: palmas-pmic.txt

Sergio Prado (1):
      of: Add vendor prefix for Shenzhen Embest Technology

Srinivas Kandagatla (2):
      of: Add Arrow Electronics to vendor prefix list
      of: Add Inforce Computing to vendor prefix list

Stephen Boyd (1):
      devicetree: bindings: designware-pcie: Fix unit address

Thierry Reding (2):
      dt-bindings: tegra: Remove 0, prefix from unit-addresses
      dt-bindings: tegra: Rename some bindings for consistency

 Documentation/devicetree/bindings/arm/cci.txt      |   2 +-
 .../devicetree/bindings/arm/omap/crossbar.txt      |   3 +-
 .../devicetree/bindings/arm/spear-misc.txt         |   2 +-
 .../devicetree/bindings/arm/ux500/boards.txt       |   2 +-
 .../{tegra-sata.txt =3D> nvidia,tegra124-ahci.txt}   |   0
 .../bindings/clock/nvidia,tegra124-dfll.txt        |   2 +-
 .../bindings/clock/rockchip,rk3188-cru.txt         |   2 +-
 .../bindings/clock/rockchip,rk3288-cru.txt         |   2 +-
 .../devicetree/bindings/clock/st/st,clkgen.txt     |   2 +-
 ...124-cpufreq.txt =3D> nvidia,tegra124-cpufreq.txt} |   0
 .../bindings/display/exynos/exynos_dsim.txt        |   2 +-
 ...egra20-apbdma.txt =3D> nvidia,tegra20-apbdma.txt} |   0
 .../devicetree/bindings/dma/xilinx/xilinx_dma.txt  |   2 +-
 .../devicetree/bindings/gpio/ibm,ppc4xx-gpio.txt   |  24 ++
 .../devicetree/bindings/gpu/nvidia,gk20a.txt       |   2 +-
 .../devicetree/bindings/input/ads7846.txt          |   2 +-
 .../devicetree/bindings/input/gpio-keys.txt        |  10 +-
 .../bindings/input/touchscreen/fsl-mx25-tcq.txt    |   2 +-
 .../interrupt-controller/mediatek,sysirq.txt       |   3 +-
 ...ia,tegra-ictlr.txt =3D> nvidia,tegra20-ictlr.txt} |   0
 .../interrupt-controller/ti,omap4-wugen-mpu        |   4 +-
 .../devicetree/bindings/media/xilinx/video.txt     |   2 +-
 .../{tegra-emc.txt =3D> nvidia,tegra124-emc.txt}     |   4 +-
 .../{nvidia,tegra-mc.txt =3D> nvidia,tegra30-mc.txt} |   6 +-
 Documentation/devicetree/bindings/mfd/qcom-rpm.txt |   4 +-
 .../devicetree/bindings/mmc/mmc-pwrseq-emmc.txt    |   2 +-
 .../devicetree/bindings/mtd/brcm,brcmnand.txt      |   2 +-
 .../devicetree/bindings/net/hisilicon-hns-nic.txt  |   2 +-
 Documentation/devicetree/bindings/net/stmmac.txt   |   4 +-
 .../devicetree/bindings/net/ti,dp83867.txt         |   2 +-
 Documentation/devicetree/bindings/opp/opp.txt      |   2 +-
 .../devicetree/bindings/pci/designware-pcie.txt    |   2 +-
 .../devicetree/bindings/pci/hisilicon-pcie.txt     |  12 +-
 .../devicetree/bindings/phy/phy-stih41x-usb.txt    |   2 +-
 .../pinctrl/nvidia,tegra124-xusb-padctl.txt        |   6 +-
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt |   2 +-
 .../bindings/power/qcom,coincell-charger.txt       |   2 +-
 .../devicetree/bindings/regulator/palmas-pmic.txt  |   8 +
 .../devicetree/bindings/rtc/rtc-palmas.txt         |   6 +-
 .../bindings/{tty =3D> }/serial/mvebu-uart.txt       |   0
 .../bindings/soc/ti/keystone-navigator-qmss.txt    |   6 +-
 .../bindings/sound/nvidia,tegra30-hda.txt          |   2 +-
 Documentation/devicetree/bindings/sram/sram.txt    |   2 +-
 ...a-soctherm.txt =3D> nvidia,tegra124-soctherm.txt} |   2 +-
 .../devicetree/bindings/vendor-prefixes.txt        |   4 +
 drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c       |   2 +-
 drivers/iommu/arm-smmu.c                           |  38 +-
 drivers/of/base.c                                  | 209 +++++++----
 drivers/of/dynamic.c                               |   6 +
 drivers/of/fdt.c                                   | 382 +++++++++++++=
--------
 drivers/of/unittest.c                              |   3 +-
 include/linux/of.h                                 |  56 +++
 include/linux/of_fdt.h                             |   5 +-
 include/linux/of_graph.h                           |   1 +
 scripts/Makefile.lib                               |   5 +
 scripts/dtc/checks.c                               |  26 ++
 scripts/dtc/flattree.c                             |   4 +-
 scripts/dtc/libfdt/fdt_ro.c                        |   6 +-
 scripts/dtc/version_gen.h                          |   2 +-
 59 files changed, 602 insertions(+), 297 deletions(-)
 rename Documentation/devicetree/bindings/ata/{tegra-sata.txt =3D>
nvidia,tegra124-ahci.txt} (100%)
 rename Documentation/devicetree/bindings/cpufreq/{tegra124-cpufreq.txt
=3D> nvidia,tegra124-cpufreq.txt} (100%)
 rename Documentation/devicetree/bindings/dma/{tegra20-apbdma.txt =3D>
nvidia,tegra20-apbdma.txt} (100%)
 create mode 100644 Documentation/devicetree/bindings/gpio/ibm,ppc4xx-g=
pio.txt
 rename Documentation/devicetree/bindings/interrupt-controller/{nvidia,=
tegra-ictlr.txt
=3D> nvidia,tegra20-ictlr.txt} (100%)
 rename Documentation/devicetree/bindings/memory-controllers/{tegra-emc=
=2Etxt
=3D> nvidia,tegra124-emc.txt} (99%)
 rename Documentation/devicetree/bindings/memory-controllers/{nvidia,te=
gra-mc.txt
=3D> nvidia,tegra30-mc.txt} (97%)
 rename Documentation/devicetree/bindings/{tty =3D> }/serial/mvebu-uart=
=2Etxt (100%)
 rename Documentation/devicetree/bindings/thermal/{tegra-soctherm.txt
=3D> nvidia,tegra124-soctherm.txt} (98%)
