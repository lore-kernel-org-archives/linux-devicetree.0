From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree updates for 4.15
Date: Tue, 14 Nov 2017 10:00:30 -0600
Message-ID: <CAL_JsqLbJP4T014Mgb4-RTmuTtV7nOiFDBPPzak=d9NHb3-w9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull DT updates for 4.15. A bigger diffstat than usual with the
kbuild changes and a tree wide fix in the binding documentation.
There's some trivial conflicts in dts makefiles with SPDX tags in your
current tree and there will be a couple more with arm-soc.

Rob

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-4.15

for you to fetch changes up to aa25e446ce76c37bfd75ac06598c316af94e9a26:

  dt-bindings: usb: add #phy-cells to usb-nop-xceiv (2017-11-13 16:50:01 -0600)

----------------------------------------------------------------
DeviceTree for 4.15:

- kbuild cleanups and improvements for dtbs

- Code clean-up of overlay code and fixing for some long standing memory
  leak and race condition in applying overlays

- Improvements to DT memory usage making sysfs/kobjects optional and
  skipping unflattening of disabled nodes. This is part of kernel
  tinification efforts.

- Final piece of removing storing the full path for every DT node. The
  prerequisite conversion of printk's to use device_node format
  specifier happened in 4.14.

- Sync with current upstream dtc. This brings additional checks to dtb
  compiling.

- Binding doc tree wide removal of leading 0s from examples

- RTC binding documentation adding missing devices and some
  consolidation of duplicated bindings

- Vendor prefix documentation for nutsboard, Silicon Storage Technology,
  shimafuji, Tecon Microprocessor Technologies, DH electronics GmbH,
  Opal Kelly, and Next Thing

----------------------------------------------------------------
Alexandre Belloni (6):
      dt-bindings: trivial: Add RTCs
      dt-bindings: rtc: add stericsson,coh901331 bindings
      dt-bindings: rtc: Add sirf,prima2-sysrtc bindings
      dt-bindings: rtc: DS1307 and compatibles are not trivial
      dt-bindings: rtc: Add bindings for m41t80 and compatibles
      dt-bindings: rtc: merge ds1339 in ds1307 documentation

Dmitry Dunaev (1):
      Add Tecon Microprocessor Technologies, LLC vendor prefix

Fabrizio Castro (1):
      of: add vendor prefix for Silicon Storage Technology Inc.

Frank Rowand (14):
      of: overlay.c: Remove comments that state the obvious, to reduce clutter
      of: overlay.c: Convert comparisons to zero or NULL to logical expressions
      of: overlay: rename identifiers to more reflect what they do
      of: overlay: rename identifiers in dup_and_fixup_symbol_prop()
      of: overlay: minor restructuring
      of: overlay: detect cases where device tree may become corrupt
      of: overlay: expand check of whether overlay changeset can be removed
      of: overlay: loosen overly strict phandle clash check
      of: overlay: avoid race condition between applying multiple overlays
      of: overlay: simplify applying symbols from an overlay
      of: overlay: remove a dependency on device node full_name
      of: overlay: remove unneeded check for NULL kbasename()
      of: overlay: pr_err from return NOTIFY_OK to overlay apply/remove
      of: overlay: make pr_err() string unique

Geert Uytterhoeven (2):
      v4l: vsp1: Use generic node name
      dt-bindings: iommu: ipmmu-vmsa: Use generic node name

Lixin Wang (2):
      of: overlay: fix memory leak related to duplicated property
      of: dynamic: fix memory leak related to properties of __of_node_dup

Marco Franchi (1):
      dt-bindings: Remove leading zeros from bindings notation

Marek Vasut (1):
      devicetree: Add vendor-prefix for DH electronics GmbH

Martin Blumenstingl (1):
      dt-bindings: add vendor prefix for Next Thing Co.

Masahiro Yamada (5):
      .gitignore: sort normal pattern rules alphabetically
      .gitignore: move *.dtb and *.dtb.S patterns to the top-level .gitignore
      kbuild: clean up *.dtb and *.dtb.S patterns from top-level Makefile
      MIPS: dts: remove bogus bcm96358nb4ser.dtb from dtb-y entry
      kbuild: handle dtb-y and CONFIG_OF_ALL_DTBS natively in Makefile.lib

Rob Herring (16):
      powerpc: pseries: only store the device node basename in full_name
      of/fdt: only store the device node basename in full_name
      Merge branch 'dt-printf-v2' into HEAD
      scripts/dtc: add fdt_overlay.c and fdt_addresses.c to sync script
      scripts/dtc: Update to upstream version v1.4.5-3-gb1a60033c110
      of: fix missing kobject init for !SYSFS && OF_DYNAMIC config
      of: remove struct property.unique_id for FDT
      of: make struct property _flags field configurable
      of: move kobj_to_device_node() into dynamic.c
      of: wrap accesses to device_node kobject
      of: make kobject and bin_attribute support configurable
      of/fdt: add of_fdt_device_is_available function
      of/fdt: skip unflattening of disabled nodes
      scripts/dtc: Update to upstream version v1.4.5-6-gc1e55a5513e9
      Merge branch 'dt/kbuild' into dt/next
      dt-bindings: usb: add #phy-cells to usb-nop-xceiv

Stephen Boyd (4):
      of/resolver: Simplify to be32_add_cpu()
      of/resolver: Replace kmalloc + memcpy with kmemdup()
      of/fdt: Document detached argument to __unflatten_device_tree()
      of: unittest: Remove redundant OF_DETACHED flag setting

Tom McLeod (1):
      dt-bindings: Add vendor prefix for Opal Kelly Inc

Vladimir Barinov (1):
      dt: Add vendor prefix 'shimafuji'

YuanCheng Cheng (1):
      dt-bindings: vendor-prefixes: Add nutsboard

 .gitignore                                         |   44 +-
 .../devicetree/bindings/arm/samsung/pmu.txt        |    2 +-
 .../bindings/arm/samsung/samsung-boards.txt        |    2 +-
 Documentation/devicetree/bindings/arm/sp810.txt    |    2 +-
 .../devicetree/bindings/arm/vexpress-sysreg.txt    |    2 +-
 .../devicetree/bindings/ata/ahci-platform.txt      |    2 +-
 Documentation/devicetree/bindings/ata/imx-sata.txt |    2 +-
 Documentation/devicetree/bindings/bus/imx-weim.txt |    2 +-
 .../devicetree/bindings/bus/sunxi-rsb.txt          |    2 +-
 .../devicetree/bindings/clock/arm-syscon-icst.txt  |    2 +-
 .../devicetree/bindings/clock/clk-exynos-audss.txt |    2 +-
 .../bindings/clock/clk-s5pv210-audss.txt           |    2 +-
 .../bindings/clock/dove-divider-clock.txt          |    2 +-
 .../devicetree/bindings/clock/imx1-clock.txt       |    4 +-
 .../devicetree/bindings/clock/imx6q-clock.txt      |    4 +-
 .../devicetree/bindings/clock/maxim,max77686.txt   |    4 +-
 .../devicetree/bindings/clock/st/st,clkgen.txt     |    2 +-
 .../devicetree/bindings/clock/sunxi-ccu.txt        |    4 +-
 Documentation/devicetree/bindings/clock/sunxi.txt  |   16 +-
 .../devicetree/bindings/clock/ti,cdce706.txt       |    2 +-
 .../devicetree/bindings/crypto/sun4i-ss.txt        |    2 +-
 .../bindings/display/etnaviv/etnaviv-drm.txt       |    2 +-
 .../devicetree/bindings/display/imx/hdmi.txt       |    4 +-
 .../bindings/display/simple-framebuffer.txt        |    2 +-
 .../bindings/display/sunxi/sun4i-drm.txt           |    4 +-
 .../devicetree/bindings/dma/sun4i-dma.txt          |    4 +-
 .../devicetree/bindings/dma/sun6i-dma.txt          |    2 +-
 Documentation/devicetree/bindings/dma/ti-edma.txt  |    6 +-
 Documentation/devicetree/bindings/dma/zxdma.txt    |    2 +-
 .../bindings/firmware/nvidia,tegra186-bpmp.txt     |    2 +-
 .../devicetree/bindings/gpio/gpio-dsp-keystone.txt |    2 +-
 .../devicetree/bindings/gpio/gpio-tz1090-pdc.txt   |    2 +-
 .../devicetree/bindings/gpio/gpio-tz1090.txt       |    2 +-
 .../devicetree/bindings/i2c/i2c-axxia.txt          |    2 +-
 .../devicetree/bindings/i2c/i2c-sunxi-p2wi.txt     |    2 +-
 .../bindings/iio/magnetometer/ak8974.txt           |    2 +-
 .../bindings/iio/magnetometer/ak8975.txt           |    2 +-
 .../devicetree/bindings/input/sun4i-lradc-keys.txt |    2 +-
 .../bindings/input/touchscreen/egalax-ts.txt       |    2 +-
 .../bindings/input/touchscreen/imx6ul_tsc.txt      |    2 +-
 .../interrupt-controller/allwinner,sunxi-nmi.txt   |    2 +-
 .../interrupt-controller/ti,keystone-irq.txt       |    2 +-
 .../devicetree/bindings/iommu/qcom,iommu.txt       |    2 +-
 .../bindings/iommu/renesas,ipmmu-vmsa.txt          |    2 +-
 .../devicetree/bindings/leds/register-bit-led.txt  |   16 +-
 .../bindings/mailbox/ti,message-manager.txt        |    2 +-
 Documentation/devicetree/bindings/marvell.txt      |    4 +-
 .../devicetree/bindings/media/i2c/tc358743.txt     |    2 +-
 .../devicetree/bindings/media/img-ir-rev1.txt      |    2 +-
 .../devicetree/bindings/media/renesas,vsp1.txt     |    2 +-
 .../devicetree/bindings/media/stih-cec.txt         |    2 +-
 .../bindings/media/stih407-c8sectpfe.txt           |    2 +-
 .../devicetree/bindings/media/sunxi-ir.txt         |    2 +-
 Documentation/devicetree/bindings/mfd/max77686.txt |    2 +-
 Documentation/devicetree/bindings/mfd/max77802.txt |    2 +-
 Documentation/devicetree/bindings/mfd/mfd.txt      |    2 +-
 .../devicetree/bindings/mfd/sun4i-gpadc.txt        |    4 +-
 .../devicetree/bindings/mfd/sun6i-prcm.txt         |    2 +-
 Documentation/devicetree/bindings/mfd/syscon.txt   |    2 +-
 Documentation/devicetree/bindings/mmc/mmc.txt      |    2 +-
 Documentation/devicetree/bindings/mmc/sdhci-st.txt |    4 +-
 .../devicetree/bindings/mmc/sunxi-mmc.txt          |    4 +-
 .../devicetree/bindings/mtd/sunxi-nand.txt         |    2 +-
 .../bindings/net/allwinner,sun4i-emac.txt          |    2 +-
 .../bindings/net/allwinner,sun4i-mdio.txt          |    4 +-
 .../bindings/net/allwinner,sun7i-a20-gmac.txt      |    2 +-
 .../devicetree/bindings/net/brcm,bcmgenet.txt      |    2 +-
 .../devicetree/bindings/net/can/m_can.txt          |    2 +-
 .../devicetree/bindings/net/can/sun4i_can.txt      |    4 +-
 .../bindings/net/wireless/brcm,bcm43xx-fmac.txt    |    2 +-
 .../bindings/nvmem/allwinner,sunxi-sid.txt         |    4 +-
 .../devicetree/bindings/nvmem/brcm,ocotp.txt       |    2 +-
 .../devicetree/bindings/nvmem/imx-ocotp.txt        |    2 +-
 Documentation/devicetree/bindings/nvmem/nvmem.txt  |    2 +-
 Documentation/devicetree/bindings/nvmem/qfprom.txt |    2 +-
 .../bindings/pci/nvidia,tegra20-pcie.txt           |   12 +-
 .../bindings/phy/brcm,cygnus-pcie-phy.txt          |    2 +-
 .../devicetree/bindings/phy/mxs-usb-phy.txt        |    2 +-
 .../devicetree/bindings/phy/sun9i-usb-phy.txt      |    2 +-
 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |    2 +-
 .../bindings/pinctrl/fsl,imx-pinctrl.txt           |    4 +-
 .../bindings/pinctrl/img,tz1090-pdc-pinctrl.txt    |    4 +-
 .../bindings/pinctrl/img,tz1090-pinctrl.txt        |    4 +-
 .../pinctrl/nvidia,tegra124-xusb-padctl.txt        |    2 +-
 .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |    2 +-
 .../devicetree/bindings/pinctrl/pinctrl-st.txt     |    2 +-
 .../bindings/pinctrl/qcom,msm8996-pinctrl.txt      |    2 +-
 .../devicetree/bindings/power/fsl,imx-gpc.txt      |    4 +-
 .../bindings/power/reset/imx-snvs-poweroff.txt     |    2 +-
 .../bindings/power/reset/keystone-reset.txt        |    4 +-
 .../bindings/powerpc/fsl/mcu-mpc8349emitx.txt      |    2 +-
 .../devicetree/bindings/pwm/pwm-sun4i.txt          |    2 +-
 .../devicetree/bindings/regulator/max77686.txt     |    2 +-
 .../devicetree/bindings/regulator/max77802.txt     |    2 +-
 .../bindings/reset/allwinner,sunxi-clock-reset.txt |    2 +-
 .../devicetree/bindings/reset/fsl,imx-src.txt      |    6 +-
 .../devicetree/bindings/reset/ti-syscon-reset.txt  |    2 +-
 .../devicetree/bindings/rtc/dallas,ds1339.txt      |   18 -
 .../devicetree/bindings/rtc/rtc-ds1307.txt         |   44 +
 .../devicetree/bindings/rtc/rtc-m41t80.txt         |   31 +
 .../devicetree/bindings/rtc/sirf,prima2-sysrtc.txt |   13 +
 .../bindings/rtc/stericsson,coh901331.txt          |   17 +
 .../devicetree/bindings/rtc/sun6i-rtc.txt          |    2 +-
 .../devicetree/bindings/rtc/sunxi-rtc.txt          |    2 +-
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt          |    2 +-
 .../bindings/soc/fsl/cpm_qe/qe/pincfg.txt          |    2 +-
 .../devicetree/bindings/soc/ti/sci-pm-domain.txt   |    2 +-
 .../devicetree/bindings/sound/cdns,xtfpga-i2s.txt  |    2 +-
 .../devicetree/bindings/sound/fsl,asrc.txt         |    2 +-
 .../devicetree/bindings/sound/fsl,esai.txt         |    2 +-
 .../devicetree/bindings/sound/fsl,spdif.txt        |    2 +-
 .../devicetree/bindings/sound/imx-audmux.txt       |    2 +-
 .../devicetree/bindings/sound/samsung-i2s.txt      |    2 +-
 .../devicetree/bindings/sound/sun4i-codec.txt      |    4 +-
 .../devicetree/bindings/sound/sun4i-i2s.txt        |    2 +-
 .../devicetree/bindings/sound/sun8i-a33-codec.txt  |    2 +-
 .../bindings/sound/sun8i-codec-analog.txt          |    2 +-
 .../bindings/sound/sunxi,sun4i-spdif.txt           |    2 +-
 .../devicetree/bindings/sound/zte,zx-spdif.txt     |    2 +-
 .../devicetree/bindings/spi/spi-sun4i.txt          |    2 +-
 .../devicetree/bindings/spi/spi-sun6i.txt          |    4 +-
 .../devicetree/bindings/sram/samsung-sram.txt      |    2 +-
 .../devicetree/bindings/sram/sunxi-sram.txt        |    4 +-
 .../bindings/timer/allwinner,sun5i-a13-hstimer.txt |    2 +-
 .../devicetree/bindings/trivial-devices.txt        |   13 +-
 .../bindings/usb/allwinner,sun4i-a10-musb.txt      |    2 +-
 .../devicetree/bindings/usb/am33xx-usb.txt         |    2 +-
 .../devicetree/bindings/usb/atmel-usb.txt          |    4 +-
 .../devicetree/bindings/usb/ohci-da8xx.txt         |    2 +-
 Documentation/devicetree/bindings/usb/usb-ehci.txt |    2 +-
 .../devicetree/bindings/usb/usb-nop-xceiv.txt      |    2 +
 Documentation/devicetree/bindings/usb/usb-ohci.txt |    2 +-
 Documentation/devicetree/bindings/usb/usb3503.txt  |    2 +-
 .../devicetree/bindings/usb/usbmisc-imx.txt        |    2 +-
 .../devicetree/bindings/vendor-prefixes.txt        |    7 +
 .../devicetree/bindings/watchdog/mtk-wdt.txt       |    2 +-
 .../devicetree/bindings/watchdog/sunxi-wdt.txt     |    2 +-
 Documentation/devicetree/overlay-notes.txt         |   12 +-
 Documentation/kbuild/makefiles.txt                 |    1 -
 Makefile                                           |    2 +-
 arch/arc/boot/.gitignore                           |    1 -
 arch/arc/boot/dts/Makefile                         |    8 +-
 arch/arm/boot/.gitignore                           |    1 -
 arch/arm/boot/dts/Makefile                         |    6 -
 arch/arm64/boot/dts/.gitignore                     |    1 -
 arch/arm64/boot/dts/Makefile                       |   58 +-
 arch/arm64/boot/dts/actions/Makefile               |    4 -
 arch/arm64/boot/dts/al/Makefile                    |    4 -
 arch/arm64/boot/dts/allwinner/Makefile             |    4 -
 arch/arm64/boot/dts/altera/Makefile                |    4 -
 arch/arm64/boot/dts/amd/Makefile                   |    4 -
 arch/arm64/boot/dts/amlogic/Makefile               |    4 -
 arch/arm64/boot/dts/apm/Makefile                   |    4 -
 arch/arm64/boot/dts/arm/Makefile                   |    4 -
 arch/arm64/boot/dts/broadcom/Makefile              |    7 +-
 arch/arm64/boot/dts/broadcom/northstar2/Makefile   |    4 -
 arch/arm64/boot/dts/broadcom/stingray/Makefile     |    4 -
 arch/arm64/boot/dts/cavium/Makefile                |    4 -
 arch/arm64/boot/dts/exynos/Makefile                |    4 -
 arch/arm64/boot/dts/freescale/Makefile             |    4 -
 arch/arm64/boot/dts/hisilicon/Makefile             |    4 -
 arch/arm64/boot/dts/lg/Makefile                    |    4 -
 arch/arm64/boot/dts/marvell/Makefile               |    4 -
 arch/arm64/boot/dts/mediatek/Makefile              |    4 -
 arch/arm64/boot/dts/nvidia/Makefile                |    3 -
 arch/arm64/boot/dts/qcom/Makefile                  |    4 -
 arch/arm64/boot/dts/realtek/Makefile               |    4 -
 arch/arm64/boot/dts/renesas/Makefile               |    3 -
 arch/arm64/boot/dts/rockchip/Makefile              |    4 -
 arch/arm64/boot/dts/socionext/Makefile             |    3 -
 arch/arm64/boot/dts/sprd/Makefile                  |    4 -
 arch/arm64/boot/dts/xilinx/Makefile                |    4 -
 arch/arm64/boot/dts/zte/Makefile                   |    4 -
 arch/c6x/boot/dts/Makefile                         |    2 -
 arch/cris/boot/dts/Makefile                        |    2 -
 arch/h8300/boot/dts/Makefile                       |    6 -
 arch/metag/boot/.gitignore                         |    1 -
 arch/metag/boot/dts/Makefile                       |    6 -
 arch/microblaze/boot/.gitignore                    |    1 -
 arch/microblaze/boot/Makefile                      |    2 +-
 arch/mips/boot/.gitignore                          |    1 -
 arch/mips/boot/dts/Makefile                        |   33 +-
 arch/mips/boot/dts/brcm/Makefile                   |    4 -
 arch/mips/boot/dts/cavium-octeon/Makefile          |    3 -
 arch/mips/boot/dts/img/Makefile                    |    3 -
 arch/mips/boot/dts/ingenic/Makefile                |    3 -
 arch/mips/boot/dts/lantiq/Makefile                 |    3 -
 arch/mips/boot/dts/mti/Makefile                    |    3 -
 arch/mips/boot/dts/netlogic/Makefile               |    3 -
 arch/mips/boot/dts/ni/Makefile                     |    3 -
 arch/mips/boot/dts/pic32/Makefile                  |    3 -
 arch/mips/boot/dts/qca/Makefile                    |    3 -
 arch/mips/boot/dts/ralink/Makefile                 |    3 -
 arch/mips/boot/dts/xilfpga/Makefile                |    3 -
 arch/nios2/boot/.gitignore                         |    1 -
 arch/nios2/boot/Makefile                           |    2 -
 arch/openrisc/boot/dts/Makefile                    |    2 -
 arch/powerpc/boot/.gitignore                       |    1 -
 arch/powerpc/boot/Makefile                         |    2 +-
 arch/powerpc/platforms/pseries/dlpar.c             |   24 +-
 arch/powerpc/platforms/pseries/reconfig.c          |    2 +-
 arch/sh/boot/dts/Makefile                          |    2 -
 arch/xtensa/boot/.gitignore                        |    1 -
 arch/xtensa/boot/dts/Makefile                      |    9 +-
 drivers/base/core.c                                |    2 +-
 drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c       |   14 +-
 drivers/of/Kconfig                                 |    4 +
 drivers/of/Makefile                                |    1 +
 drivers/of/base.c                                  |  135 +--
 drivers/of/dynamic.c                               |  190 +++-
 drivers/of/fdt.c                                   |   91 +-
 drivers/of/kobj.c                                  |  164 +++
 drivers/of/of_private.h                            |   51 +-
 drivers/of/overlay.c                               | 1049 +++++++++++++-------
 drivers/of/resolver.c                              |   15 +-
 drivers/of/unittest-data/.gitignore                |    2 -
 drivers/of/unittest.c                              |   83 +-
 include/linux/of.h                                 |   45 +-
 scripts/Makefile.dtbinst                           |    6 +-
 scripts/Makefile.lib                               |    5 +
 scripts/dtc/checks.c                               |  291 +++++-
 scripts/dtc/dtc-lexer.lex.c_shipped                |   10 +-
 scripts/dtc/dtc-parser.tab.c_shipped               |  430 ++++----
 scripts/dtc/dtc-parser.y                           |   20 +-
 scripts/dtc/dtc.c                                  |    2 +-
 scripts/dtc/dtc.h                                  |    3 +
 scripts/dtc/libfdt/fdt_addresses.c                 |   96 ++
 scripts/dtc/libfdt/fdt_empty_tree.c                |    1 -
 scripts/dtc/libfdt/fdt_overlay.c                   |  861 ++++++++++++++++
 scripts/dtc/libfdt/fdt_ro.c                        |    4 +-
 scripts/dtc/libfdt/fdt_rw.c                        |   24 +-
 scripts/dtc/libfdt/fdt_sw.c                        |   16 +-
 scripts/dtc/libfdt/fdt_wip.c                       |    4 +-
 scripts/dtc/libfdt/libfdt.h                        |   47 +
 scripts/dtc/livetree.c                             |   31 +-
 scripts/dtc/update-dtc-source.sh                   |    4 +-
 scripts/dtc/version_gen.h                          |    2 +-
 237 files changed, 3136 insertions(+), 1439 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/dallas,ds1339.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/sirf,prima2-sysrtc.txt
 create mode 100644
Documentation/devicetree/bindings/rtc/stericsson,coh901331.txt
 delete mode 100644 arch/arm64/boot/dts/.gitignore
 create mode 100644 drivers/of/kobj.c
 delete mode 100644 drivers/of/unittest-data/.gitignore
 create mode 100644 scripts/dtc/libfdt/fdt_addresses.c
 create mode 100644 scripts/dtc/libfdt/fdt_overlay.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
