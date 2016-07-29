From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree for 4.8
Date: Fri, 29 Jul 2016 17:29:51 -0500
Message-ID: <CAL_JsqJgVceT+1RC1--RA16xm0ah4DE-BLb8RghK-YEJRWc2Vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull DT updates for 4.8. The of_platform_populate series has a
couple minor conflicts with the arc and arm-soc trees. linux-next has
the correct resolutions.

Rob

The following changes since commit 5edb56491d4812c42175980759da53388e5d=
86f5:

  Linux 4.7-rc3 (2016-06-12 07:20:35 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-4.8

for you to fetch changes up to 099c0cbd2025192f098e6da7f3c8118f6833dfe9=
:

  documentation: da9052: Update regulator bindings names to match
DA9052/53 DTS expectations (2016-07-29 16:50:03 -0500)

----------------------------------------------------------------
DeviceTree update for 4.8:

- Removal of most of_platform_populate() calls in arch code. Now the DT
core code calls it in the default case and platforms only need to call
it if they have special needs.

- Use pr_fmt on all the DT core print statements.

- CoreSight binding doc improvements to block name descriptions.

- Add dt_to_config script which can parse dts files and list
corresponding kernel config options.

- Fix memory leak hit with a PowerMac DT.

- Correct a bunch of STMicro compatible strings to use the correct
vendor prefix.

- Fix DA9052 PMIC binding doc to match what is actually used in dts
files.

----------------------------------------------------------------
Aaro Koskinen (1):
      Documentation/devicetree: document cavium-pip rx-delay/tx-delay p=
roperties

=46rank Rowand (1):
      of: fix memory leak related to safe_name()

Gaurav Minocha (1):
      scripts/dtc: dt_to_config - kernel config options for a devicetre=
e

Guenter Roeck (2):
      MIPS: ath79: Add missing include file
      xtensa: Fix build error due to missing include file

Jon Hunter (1):
      of/irq: Mark initialised interrupt controllers as populated

Kefeng Wang (19):
      of: iommu: make of_iommu_init() postcore_initcall_sync
      of/platform: Add common method to populate default bus
      arc: Remove unnecessary of_platform_populate with default match t=
able
      arm: Remove unnecessary of_platform_populate with default match t=
able
      arm64: Remove unnecessary of_platform_populate with default match=
 table
      c6x: Remove unnecessary of_platform_populate with default match t=
able
      cris: Remove unnecessary of_platform_populate with default match =
table
      metag: Remove unnecessary of_platform_populate with default match=
 table
      mips: Remove unnecessary of_platform_populate with default match =
table
      nios2: Remove unnecessary of_platform_populate with default match=
 table
      sh: Remove unnecessary of_platform_populate with default match ta=
ble
      xtensa: Remove unnecessary of_platform_populate with default matc=
h table
      arm: use of_platform_default_populate() to populate
      mips: use of_platform_default_populate() to populate default bus
      bus: imx-weim: use of_platform_default_populate() to populate def=
ault bus
      bus: uniphier-system-bus: use of_platform_default_populate() to
populate default bus
      memory: omap-gpmc: use of_platform_default_populate() to
populate default bus
      of: unittest: use of_platform_default_populate() to populate defa=
ult bus
      Revert "of/platform: export of_default_bus_match_table"

Michal Suchanek (2):
      of: overlay: add resolver error prints
      of: fdt: mark unflattened tree as detached

Otto Kek=C3=A4l=C3=A4inen (1):
      Fix spelling errors in Documentation/devicetree

Rob Herring (2):
      of: use pr_fmt prefix for all console printing
      xtensa: Partially Revert "xtensa: Remove unnecessary
of_platform_populate with default match table"

Stefan Agner (3):
      Documentation: dt: i2c: use correct STMicroelectronics vendor pre=
fix
      powerpc/dts: fix STMicroelectronics compatible strings
      ARM: dts: fix STMicroelectronics compatible strings

Steve Twiss (1):
      documentation: da9052: Update regulator bindings names to match
DA9052/53 DTS expectations

mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org (1):
      coresight: document binding acronyms

 .../devicetree/bindings/arm/coresight.txt          |   35 +-
 Documentation/devicetree/bindings/arm/l2c2x0.txt   |    4 +-
 .../devicetree/bindings/i2c/trivial-devices.txt    |    8 +-
 .../devicetree/bindings/mfd/da9052-i2c.txt         |   22 +-
 .../devicetree/bindings/net/cavium-pip.txt         |    6 +
 Documentation/devicetree/bindings/net/dsa/dsa.txt  |    2 +-
 .../devicetree/bindings/powerpc/fsl/fman.txt       |    4 +-
 .../devicetree/bindings/regmap/regmap.txt          |    2 +-
 .../devicetree/bindings/serial/qcom,msm-uartdm.txt |    4 +-
 .../devicetree/bindings/sound/simple-card.txt      |    2 +-
 Documentation/devicetree/bindings/spi/ti_qspi.txt  |    2 +-
 .../bindings/timer/allwinner,sun5i-a13-hstimer.txt |    2 +-
 arch/arc/kernel/setup.c                            |    7 -
 arch/arm/boot/dts/imx28-m28.dtsi                   |    2 +-
 arch/arm/boot/dts/imx51-ts4800.dts                 |    2 +-
 arch/arm/boot/dts/imx53-m53.dtsi                   |    2 +-
 arch/arm/boot/dts/imx6q-dmo-edmqmx6.dts            |    2 +-
 arch/arm/boot/dts/socfpga_cyclone5_socrates.dts    |    2 +-
 arch/arm/kernel/setup.c                            |    8 +-
 arch/arm/mach-artpec/board-artpec6.c               |    3 -
 arch/arm/mach-at91/at91rm9200.c                    |    2 +-
 arch/arm/mach-at91/at91sam9.c                      |    2 +-
 arch/arm/mach-at91/sama5.c                         |    2 +-
 arch/arm/mach-bcm/board_bcm21664.c                 |    2 -
 arch/arm/mach-bcm/board_bcm281xx.c                 |    2 -
 arch/arm/mach-bcm/board_bcm2835.c                  |   10 -
 arch/arm/mach-cns3xxx/core.c                       |    3 +-
 arch/arm/mach-exynos/exynos.c                      |    3 -
 arch/arm/mach-highbank/highbank.c                  |    3 -
 arch/arm/mach-imx/mach-imx51.c                     |    2 -
 arch/arm/mach-imx/mach-imx53.c                     |    2 -
 arch/arm/mach-imx/mach-imx6q.c                     |    2 +-
 arch/arm/mach-imx/mach-imx6sl.c                    |    2 +-
 arch/arm/mach-imx/mach-imx6sx.c                    |    2 +-
 arch/arm/mach-imx/mach-imx6ul.c                    |    1 -
 arch/arm/mach-imx/mach-imx7d.c                     |    1 -
 arch/arm/mach-integrator/integrator_ap.c           |    3 +-
 arch/arm/mach-integrator/integrator_cp.c           |    3 +-
 arch/arm/mach-keystone/keystone.c                  |    1 -
 arch/arm/mach-lpc32xx/phy3250.c                    |    3 +-
 arch/arm/mach-mvebu/board-v7.c                     |    3 -
 arch/arm/mach-mvebu/dove.c                         |    2 -
 arch/arm/mach-mvebu/kirkwood.c                     |    2 +-
 arch/arm/mach-mxs/mach-mxs.c                       |    3 +-
 arch/arm/mach-nspire/nspire.c                      |    3 +-
 arch/arm/mach-orion5x/board-dt.c                   |    3 +-
 arch/arm/mach-picoxcell/common.c                   |    2 -
 arch/arm/mach-rockchip/rockchip.c                  |    1 -
 arch/arm/mach-s3c24xx/mach-s3c2416-dt.c            |    2 -
 arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c            |    3 -
 arch/arm/mach-shmobile/setup-r8a7740.c             |    3 -
 arch/arm/mach-shmobile/setup-sh73a0.c              |    2 -
 arch/arm/mach-spear/spear1310.c                    |    2 -
 arch/arm/mach-spear/spear1340.c                    |    1 -
 arch/arm/mach-spear/spear300.c                     |    3 +-
 arch/arm/mach-spear/spear310.c                     |    3 +-
 arch/arm/mach-spear/spear320.c                     |    3 +-
 arch/arm/mach-spear/spear6xx.c                     |    3 +-
 arch/arm/mach-tegra/tegra.c                        |    2 +-
 arch/arm/mach-u300/core.c                          |    3 +-
 arch/arm/mach-versatile/versatile_dt.c             |    3 +-
 arch/arm/mach-vt8500/vt8500.c                      |    3 -
 arch/arm/mach-zynq/common.c                        |    2 +-
 arch/arm64/kernel/setup.c                          |   15 -
 arch/c6x/platforms/Makefile                        |    2 +-
 arch/c6x/platforms/platform.c                      |   17 -
 arch/cris/kernel/setup.c                           |    8 -
 arch/metag/kernel/setup.c                          |    5 +-
 arch/mips/ath79/setup.c                            |    2 -
 arch/mips/jz4740/setup.c                           |    8 -
 arch/mips/mti-sead3/sead3-setup.c                  |    8 -
 arch/mips/pic32/pic32mzda/init.c                   |    3 +-
 arch/mips/pistachio/init.c                         |   13 -
 arch/mips/xilfpga/init.c                           |   13 -
 arch/nios2/platform/platform.c                     |    4 +-
 arch/powerpc/boot/dts/ac14xx.dts                   |    2 +-
 arch/powerpc/boot/dts/akebono.dts                  |    2 +-
 arch/powerpc/boot/dts/bluestone.dts                |    2 +-
 arch/powerpc/boot/dts/canyonlands.dts              |    2 +-
 arch/powerpc/boot/dts/currituck.dts                |    2 +-
 arch/powerpc/boot/dts/fsl/mpc8569mds.dts           |    2 +-
 arch/powerpc/boot/dts/fsl/p1022rdk.dts             |    2 +-
 arch/powerpc/boot/dts/glacier.dts                  |    2 +-
 arch/powerpc/boot/dts/icon.dts                     |    2 +-
 arch/powerpc/boot/dts/mpc5121ads.dts               |    2 +-
 arch/powerpc/boot/dts/mpc8349emitx.dts             |    2 +-
 arch/powerpc/boot/dts/mpc836x_rdk.dts              |    2 +-
 arch/powerpc/boot/dts/pdm360ng.dts                 |    2 +-
 arch/powerpc/boot/dts/sam440ep.dts                 |    2 +-
 arch/powerpc/boot/dts/xcalibur1501.dts             |    2 +-
 arch/powerpc/boot/dts/xpedite5200.dts              |    2 +-
 arch/powerpc/boot/dts/xpedite5200_xmon.dts         |    2 +-
 arch/powerpc/boot/dts/xpedite5301.dts              |    2 +-
 arch/powerpc/boot/dts/xpedite5330.dts              |    2 +-
 arch/powerpc/boot/dts/xpedite5370.dts              |    2 +-
 arch/sh/boards/of-generic.c                        |   16 -
 arch/xtensa/kernel/setup.c                         |    3 +-
 drivers/bus/imx-weim.c                             |    5 +-
 drivers/bus/uniphier-system-bus.c                  |    3 +-
 drivers/iommu/of_iommu.c                           |    5 +-
 drivers/memory/omap-gpmc.c                         |    3 +-
 drivers/of/address.c                               |   49 +-
 drivers/of/base.c                                  |   41 +-
 drivers/of/dynamic.c                               |   49 +-
 drivers/of/fdt.c                                   |   25 +-
 drivers/of/fdt_address.c                           |   35 +-
 drivers/of/irq.c                                   |    4 +
 drivers/of/of_pci.c                                |    6 +-
 drivers/of/of_private.h                            |    3 +
 drivers/of/of_reserved_mem.c                       |   22 +-
 drivers/of/overlay.c                               |   43 +-
 drivers/of/platform.c                              |   37 +-
 drivers/of/resolver.c                              |    8 +
 drivers/of/unittest.c                              |    5 +-
 include/linux/of_iommu.h                           |    2 -
 scripts/dtc/dt_to_config                           | 1213 ++++++++++++=
++++++++
 scripts/dtc/dtx_diff                               |    2 +-
 117 files changed, 1522 insertions(+), 424 deletions(-)
 delete mode 100644 arch/c6x/platforms/platform.c
 create mode 100755 scripts/dtc/dt_to_config
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
