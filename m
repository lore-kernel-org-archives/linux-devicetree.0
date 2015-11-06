From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree for 4.4
Date: Fri, 6 Nov 2015 07:28:56 -0600
Message-ID: <CAL_JsqJOz7+spUgBf56RkwGKbvgOYHn8tgf1X9UuoUu4ttFSTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull for 4.4. A fairly large (by DT standards) pull request
this time with the majority being some overdue moving DT binding docs
around to consolidate similar bindings. Binding docs rarely change and
I've not seen any conflicts in -next as a result of the move.

Also note that the tag is signed with a new sub-key.

Rob


The following changes since commit 9ffecb10283508260936b96022d4ee43a7798b4c:

  Linux 4.3-rc3 (2015-09-27 07:50:08 -0400)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-4.4

for you to fetch changes up to 2d799dde8e69494e0234b8ecd5ce95cd06224329:

  MAINTAINERS: update DT binding doc locations (2015-11-05 13:40:40 -0600)

----------------------------------------------------------------
DeviceTree updates for 4.4:

- DT binding doc consolidation moving similar bindings to common
  locations. The majority of these are display related which were
  scattered in video/, fb/, drm/, gpu/, and panel/ directories.
- Add new config option, CONFIG_OF_ALL_DTBS, to enable building all dtbs
  in the tree for most arches with dts files (except powerpc for now).
- OF_IRQ=n fixes for user enabled CONFIG_OF.
- of_node_put ref counting fixes from Julia Lawall.
- Common DT binding for wakeup-source and deprecation of all similar
  bindings.
- DT binding for PXA LCD controller.
- Allow ignoring failed PCI resource translations in order to ignore
  64-bit addresses on non-LPAE 32-bit kernels.
- Support setting the NUMA node from DT instead of only from parent
  device.
- Couple of earlycon DT parsing fixes for address and options.

----------------------------------------------------------------
Bjorn Helgaas (1):
      Documentation/devicetree: Update PCI Device Tree bindings

Geert Uytterhoeven (1):
      serial: pl011: Spelling s/clocks-names/clock-names/

Jarkko Nikula (1):
      DT: ARM: pxa: Remove incorrect binding from documentation

Jonas Gorski (3):
      of/irq: move of_msi_configure to the right guard and add a dummy
      of/irq: make of_irq_find_parent static
      of/irq: fix guards for irq_of_parse_and_map prototype

Julia Lawall (4):
      of/unittest: add missing of_node_put
      of/irq: add missing of_node_put
      of/platform: add missing of_node_put
      of/overlay: add missing of_node_put

Mans Rullgard (1):
      devicetree: add Sigma Designs vendor prefix

Masahiro Yamada (2):
      of/fdt: fix error checking for earlycon address
      of: simplify arch_find_n_match_cpu_physical_id() function

Michael Opdenacker (1):
      drm: sti: fix typos in stih4xx binding

Mitchel Humpherys (1):
      of: Check for overlap in reserved memory regions

Moritz Fischer (1):
      Documentation: arm: Fixed typo in socfpga fpga mgr example

Pavel Fedin (2):
      PCI: of: Add 64-bit address recognition without LPAE support
      PCI: of: Ignore resources with failed translation

Rob Herring (22):
      dt-bindings: consolidate display related bindings
      dt-bindings: move backlight bindings under leds
      dt-bindings: consolidate eeprom bindings
      dt-bindings: consolidate RNG bindings
      dt-bindings: consolidate various misc bindings
      dt-bindings: consolidate USB PHYs in bindings/phy
      dt-bindings: move Calxeda bindings to appropriate subsystems
      dt-bindings: merge ina209 binding into ina2xx binding
      dt-bindings: consolidate interrupt controller bindings
      Merge branch 'dt-doc-cleanup' into for-next
      of: add config option to enable building of all dtbs
      arc: use common make variables for dtb builds
      arc: enable building of all dtbs
      arm: enable building of all dtbs
      arm64: enable building of all dtbs
      h8300: enable building of all dtbs
      metag: use common make variables for dtb builds
      metag: enable building of all dtbs
      mips: enable building of all dtbs
      xtensa: enable building of all dtbs
      Merge branch 'all-dtbs-v2' into for-next
      MAINTAINERS: update DT binding doc locations

Robert Jarzmik (1):
      video: fbdev: add Marvell PXA LCD controller binding

Saurabh Sengar (1):
      drivers: of: removing assignment of 0 to static variable

Stefan Agner (1):
      of/fdt: fix aliases with baudrate in earlycon

Sudeep Holla (2):
      Documentation: devicetree: standardize/consolidate on
"wakeup-source" property
      Documentation: devicetree: fix reference to legacy wakeup properties

Uri Mashiach (1):
      devicetree: bindings: Document CompuLab vendor

Zhen Lei (1):
      of: to support binding numa node to specified device in devicetree

 .../bindings/{nvec => arm/tegra}/nvidia,nvec.txt   |   0
 .../devicetree/bindings/crypto/fsl-sec4.txt        |   4 +-
 .../bindings/{video => display}/arm,pl11x.txt      |   0
 .../{drm => display}/armada/marvell,dove-lcd.txt   |   0
 .../bindings/{video => display}/atmel,lcdc.txt     |   0
 .../bindings/{drm => display}/atmel/hlcdc-dc.txt   |   0
 .../{video => display/bridge}/adi,adv7123.txt      |   0
 .../{video => display/bridge}/adi,adv7511.txt      |   0
 .../bindings/{drm => display}/bridge/dw_hdmi.txt   |   4 +-
 .../bindings/{video => display}/bridge/ps8622.txt  |   0
 .../bindings/{video => display}/bridge/ptn3460.txt |   0
 .../{drm/i2c => display/bridge}/tda998x.txt        |   0
 .../bridge/thine,thc63lvdm83d.txt}                 |   0
 .../{video => display}/cirrus,clps711x-fb.txt      |   2 +-
 .../connector}/analog-tv-connector.txt             |   0
 .../{video => display/connector}/dvi-connector.txt |   0
 .../connector}/hdmi-connector.txt                  |   0
 .../{video => display/connector}/vga-connector.txt |   0
 .../{video => display/exynos}/exynos-mic.txt       |   0
 .../{video => display/exynos}/exynos5433-decon.txt |   0
 .../{video => display/exynos}/exynos7-decon.txt    |   2 +-
 .../{video => display/exynos}/exynos_dp.txt        |   2 +-
 .../{video => display/exynos}/exynos_dsim.txt      |   2 +-
 .../{video => display/exynos}/exynos_hdmi.txt      |   0
 .../{video => display/exynos}/exynos_hdmiddc.txt   |   0
 .../{video => display/exynos}/exynos_hdmiphy.txt   |   0
 .../{video => display/exynos}/exynos_mixer.txt     |   0
 .../{video => display/exynos}/samsung-fimd.txt     |   2 +-
 .../bindings/{video => display}/fsl,dcu.txt        |   0
 .../bindings/{video => display/imx}/fsl,imx-fb.txt |   2 +-
 .../bindings/{drm => display}/imx/fsl-imx-drm.txt  |   0
 .../bindings/{drm => display}/imx/hdmi.txt         |   0
 .../bindings/{drm => display}/imx/ldb.txt          |   2 +-
 .../bindings/display/marvell,pxa2xx-lcdc.txt       |  34 ++++++
 .../{mipi/dsi => display}/mipi-dsi-bus.txt         |   0
 .../bindings/{drm => display}/msm/dsi.txt          |   2 +-
 .../bindings/{drm => display}/msm/edp.txt          |   0
 .../bindings/{drm => display}/msm/gpu.txt          |   0
 .../bindings/{drm => display}/msm/hdmi.txt         |   0
 .../bindings/{drm => display}/msm/mdp.txt          |   0
 .../devicetree/bindings/{fb => display}/mxsfb.txt  |   0
 .../panel/ampire,am800480r3tmqwa1h.txt             |   0
 .../bindings/{ => display}/panel/auo,b080uan01.txt |   0
 .../bindings/{ => display}/panel/auo,b101aw03.txt  |   0
 .../bindings/{ => display}/panel/auo,b101ean01.txt |   0
 .../bindings/{ => display}/panel/auo,b101xtn01.txt |   0
 .../bindings/{ => display}/panel/auo,b116xw03.txt  |   0
 .../bindings/{ => display}/panel/auo,b133htn01.txt |   0
 .../bindings/{ => display}/panel/auo,b133xtn01.txt |   0
 .../{ => display}/panel/avic,tm070ddh03.txt        |   0
 .../{ => display}/panel/chunghwa,claa101wa01a.txt  |   0
 .../{ => display}/panel/chunghwa,claa101wb03.txt   |   0
 .../{video => display/panel}/display-timing.txt    |   0
 .../{ => display}/panel/edt,et057090dhu.txt        |   0
 .../{ => display}/panel/edt,et070080dh6.txt        |   0
 .../{ => display}/panel/edt,etm0700g0dh6.txt       |   0
 .../{ => display}/panel/foxlink,fl500wvr00-a0t.txt |   0
 .../{ => display}/panel/giantplus,gpg482739qs5.txt |   0
 .../{ => display}/panel/hannstar,hsd070pww1.txt    |   0
 .../{ => display}/panel/hannstar,hsd100pxn1.txt    |   0
 .../{ => display}/panel/hit,tx23d38vm0caa.txt      |   0
 .../{ => display}/panel/innolux,at043tn24.txt      |   0
 .../{ => display}/panel/innolux,g121i1-l01.txt     |   0
 .../{ => display}/panel/innolux,n116bge.txt        |   0
 .../{ => display}/panel/innolux,n156bge-l21.txt    |   0
 .../{ => display}/panel/innolux,zj070na-01p.txt    |   0
 .../bindings/{ => display}/panel/lg,lb070wv8.txt   |   0
 .../{ => display}/panel/lg,ld070wx3-sl01.txt       |   0
 .../bindings/{ => display}/panel/lg,lg4573.txt     |   0
 .../{ => display}/panel/lg,lh500wx1-sd03.txt       |   0
 .../bindings/{ => display}/panel/lg,lp129qe.txt    |   0
 .../panel}/lgphilips,lb035q02.txt                  |   0
 .../{ => display}/panel/nec,nl4827hc19-05b.txt     |   0
 .../{ => display}/panel/okaya,rs800480t-7x0gp.txt  |   0
 .../panel/ortustech,com43h4m85ulc.txt              |   0
 .../{ => display}/panel/panasonic,vvx10f004b00.txt |   0
 .../{video => display/panel}/panel-dpi.txt         |   2 +-
 .../{video => display/panel}/panel-dsi-cm.txt      |   0
 .../{ => display}/panel/samsung,ld9040.txt         |   2 +-
 .../{ => display}/panel/samsung,ltn101nt05.txt     |   0
 .../{ => display}/panel/samsung,ltn140at29-301.txt |   0
 .../{ => display}/panel/samsung,s6e8aa0.txt        |   2 +-
 .../{ => display}/panel/sharp,lq101r1sx01.txt      |   0
 .../{video => display/panel}/sharp,ls037v7dw01.txt |   0
 .../panel/shelly,sca07010-bfn-lnn.txt              |   0
 .../bindings/{ => display}/panel/simple-panel.txt  |   0
 .../{video => display/panel}/sony,acx565akm.txt    |   0
 .../panel}/toppoly,td028ttec1.txt                  |   0
 .../{video => display/panel}/tpo,td043mtea1.txt    |   0
 .../bindings/{video => display}/renesas,du.txt     |   0
 .../rockchip}/dw_hdmi-rockchip.txt                 |   0
 .../{video => display/rockchip}/rockchip-drm.txt   |   2 +-
 .../{video => display/rockchip}/rockchip-vop.txt   |   0
 .../simple-framebuffer-sunxi.txt                   |   0
 .../{video => display}/simple-framebuffer.txt      |   0
 .../bindings/{fb => display}/sm501fb.txt           |   0
 .../bindings/{video => display}/ssd1289fb.txt      |   0
 .../bindings/{video => display}/ssd1307fb.txt      |   0
 .../bindings/{gpu => display}/st,stih4xx.txt       |   4 +-
 .../tegra}/nvidia,tegra114-mipi.txt                |   0
 .../tegra}/nvidia,tegra20-host1x.txt               |   2 +-
 .../bindings/{video => display/ti}/ti,dra7-dss.txt |   2 +-
 .../bindings/{video => display/ti}/ti,omap-dss.txt |   0
 .../{video => display/ti}/ti,omap2-dss.txt         |   2 +-
 .../{video => display/ti}/ti,omap3-dss.txt         |   2 +-
 .../{video => display/ti}/ti,omap4-dss.txt         |   2 +-
 .../{video => display/ti}/ti,omap5-dss.txt         |   2 +-
 .../bindings/{video => display/ti}/ti,opa362.txt   |   0
 .../bindings/{video => display/ti}/ti,tfp410.txt   |   0
 .../{video => display/ti}/ti,tpd12s015.txt         |   0
 .../bindings/{drm => display}/tilcdc/panel.txt     |   2 +-
 .../bindings/{drm => display}/tilcdc/tfp410.txt    |   0
 .../bindings/{drm => display}/tilcdc/tilcdc.txt    |   0
 .../bindings/{video => display}/via,vt8500-fb.txt  |   0
 .../{video => display}/wm,prizm-ge-rops.txt        |   0
 .../bindings/{video => display}/wm,wm8505-fb.txt   |   0
 .../devicetree/bindings/{misc => eeprom}/at25.txt  |   0
 .../devicetree/bindings/{ => eeprom}/eeprom.txt    |   0
 .../bindings/fpga/altera-socfpga-fpga-mgr.txt      |   2 +-
 Documentation/devicetree/bindings/hwmon/ina209.txt |  18 ----
 Documentation/devicetree/bindings/hwmon/ina2xx.txt |   1 +
 .../bindings/{misc => iio/accel}/lis302.txt        |   0
 .../bindings/{misc => iio/dac}/ti,dac7512.txt      |   0
 .../bindings/{misc => iio/pressure}/bmp085.txt     |   0
 .../devicetree/bindings/input/ads7846.txt          |   3 +-
 .../devicetree/bindings/input/gpio-keys-polled.txt |   1 +
 .../devicetree/bindings/input/gpio-keys.txt        |   1 +
 .../bindings/input/gpio-matrix-keypad.txt          |   1 +
 .../bindings/{hid => input}/hid-over-i2c.txt       |   0
 .../bindings/input/nvidia,tegra20-kbc.txt          |   3 +-
 .../bindings/input/qcom,pm8xxx-keypad.txt          |   1 +
 .../devicetree/bindings/input/samsung-keypad.txt   |   3 +-
 .../arm,gic-v3.txt}                                |   0
 .../gic.txt => interrupt-controller/arm,gic.txt}   |   0
 .../arm,versatile-fpga-irq.txt}                    |   0
 .../vic.txt => interrupt-controller/arm,vic.txt}   |   0
 .../axis,crisv32-intc.txt}                         |   0
 .../img,meta-intc.txt}                             |   0
 .../img,pdc-intc.txt}                              |   0
 .../intel,ce4100-ioapic.txt}                       |   0
 .../mediatek,sysirq.txt                            |   0
 .../mrvl,intc.txt}                                 |   0
 .../nxp,lpc3220-mic.txt}                           |   0
 .../{ => interrupt-controller}/open-pic.txt        |   0
 .../samsung,exynos4210-combiner.txt}               |   0
 .../snps,arc700-intc.txt}                          |   0
 .../snps,archs-idu-intc.txt}                       |   0
 .../snps,archs-intc.txt}                           |   0
 .../st,spear3xx-shirq.txt}                         |   0
 .../ti,c64x+megamod-pic.txt}                       |   0
 .../ti,cp-intc.txt}                                |   0
 .../ti,omap2-intc.txt}                             |   0
 .../via,vt8500-intc.txt                            |   0
 .../{video => leds}/backlight/88pm860x.txt         |   0
 .../{video => leds}/backlight/gpio-backlight.txt   |   0
 .../bindings/{video => leds}/backlight/lp855x.txt  |   0
 .../backlight/max8925-backlight.txt                |   0
 .../{video => leds}/backlight/pm8941-wled.txt      |   0
 .../{video => leds}/backlight/pwm-backlight.txt    |   0
 .../backlight/sky81452-backlight.txt               |   0
 .../backlight/tps65217-backlight.txt               |   0
 .../calxeda-ddr-ctrlr.txt}                         |   0
 .../devicetree/bindings/mfd/atmel-hlcdc.txt        |   2 +-
 Documentation/devicetree/bindings/mfd/sky81452.txt |   2 +-
 Documentation/devicetree/bindings/mfd/tc3589x.txt  |   1 +
 Documentation/devicetree/bindings/mmc/mmc.txt      |   5 +-
 Documentation/devicetree/bindings/pci/pci.txt      |   4 +-
 .../combophy.txt => phy/calxeda-combophy.txt}      |   0
 .../keystone-phy.txt => phy/keystone-usb-phy.txt}  |   0
 .../{usb/mxs-phy.txt => phy/mxs-usb-phy.txt}       |   0
 .../{usb => phy}/nvidia,tegra20-usb-phy.txt        |   0
 .../bindings/{usb => phy}/qcom,usb-8x16-phy.txt    |   0
 .../devicetree/bindings/power/wakeup-source.txt    |  71 +++++++++++++
 .../bindings/{hwrng => rng}/atmel-trng.txt         |   0
 .../bindings/{hwrng => rng}/brcm,iproc-rng200.txt  |   0
 .../bindings/{hwrng => rng}/omap_rng.txt           |   0
 .../bindings/{hwrng => rng}/timeriomem_rng.txt     |   0
 .../devicetree/bindings/rtc/isil,isl12057.txt      |  10 +-
 Documentation/devicetree/bindings/rtc/rtc-opal.txt |   5 +-
 .../devicetree/bindings/serial/mrvl,pxa-ssp.txt    |   1 -
 Documentation/devicetree/bindings/serial/pl011.txt |   2 +-
 .../devicetree/bindings/usb/samsung-usbphy.txt     | 117 ---------------------
 .../devicetree/bindings/vendor-prefixes.txt        |   2 +
 MAINTAINERS                                        |  19 ++--
 arch/arc/Makefile                                  |   2 +-
 arch/arc/boot/dts/Makefile                         |   6 +-
 arch/arm/boot/dts/Makefile                         |   3 +
 arch/arm64/boot/dts/Makefile                       |   6 ++
 arch/h8300/boot/dts/Makefile                       |   3 +
 arch/metag/Makefile                                |   2 +-
 arch/metag/boot/dts/Makefile                       |   7 +-
 arch/mips/boot/dts/Makefile                        |   3 +
 arch/xtensa/Makefile                               |   4 +
 arch/xtensa/boot/dts/Makefile                      |   7 +-
 drivers/base/core.c                                |   2 +-
 drivers/of/Kconfig                                 |  10 ++
 drivers/of/address.c                               |   6 ++
 drivers/of/base.c                                  |   5 +-
 drivers/of/device.c                                |  11 +-
 drivers/of/fdt.c                                   |  12 ++-
 drivers/of/irq.c                                   |   9 +-
 drivers/of/of_pci.c                                |   6 +-
 drivers/of/of_reserved_mem.c                       |  43 +++++++-
 drivers/of/overlay.c                               |   5 +-
 drivers/of/platform.c                              |   8 +-
 drivers/of/unittest.c                              |   8 +-
 include/linux/of_irq.h                             |  15 ++-
 207 files changed, 311 insertions(+), 231 deletions(-)
 rename Documentation/devicetree/bindings/{nvec =>
arm/tegra}/nvidia,nvec.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display}/arm,pl11x.txt (100%)
 rename Documentation/devicetree/bindings/{drm =>
display}/armada/marvell,dove-lcd.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display}/atmel,lcdc.txt (100%)
 rename Documentation/devicetree/bindings/{drm =>
display}/atmel/hlcdc-dc.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/bridge}/adi,adv7123.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/bridge}/adi,adv7511.txt (100%)
 rename Documentation/devicetree/bindings/{drm =>
display}/bridge/dw_hdmi.txt (91%)
 rename Documentation/devicetree/bindings/{video =>
display}/bridge/ps8622.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display}/bridge/ptn3460.txt (100%)
 rename Documentation/devicetree/bindings/{drm/i2c =>
display/bridge}/tda998x.txt (100%)
 rename Documentation/devicetree/bindings/{video/thine,thc63lvdm83d =>
display/bridge/thine,thc63lvdm83d.txt} (100%)
 rename Documentation/devicetree/bindings/{video =>
display}/cirrus,clps711x-fb.txt (94%)
 rename Documentation/devicetree/bindings/{video =>
display/connector}/analog-tv-connector.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/connector}/dvi-connector.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/connector}/hdmi-connector.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/connector}/vga-connector.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/exynos}/exynos-mic.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/exynos}/exynos5433-decon.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/exynos}/exynos7-decon.txt (97%)
 rename Documentation/devicetree/bindings/{video =>
display/exynos}/exynos_dp.txt (98%)
 rename Documentation/devicetree/bindings/{video =>
display/exynos}/exynos_dsim.txt (98%)
 rename Documentation/devicetree/bindings/{video =>
display/exynos}/exynos_hdmi.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/exynos}/exynos_hdmiddc.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/exynos}/exynos_hdmiphy.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/exynos}/exynos_mixer.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/exynos}/samsung-fimd.txt (98%)
 rename Documentation/devicetree/bindings/{video => display}/fsl,dcu.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/imx}/fsl,imx-fb.txt (96%)
 rename Documentation/devicetree/bindings/{drm =>
display}/imx/fsl-imx-drm.txt (100%)
 rename Documentation/devicetree/bindings/{drm => display}/imx/hdmi.txt (100%)
 rename Documentation/devicetree/bindings/{drm => display}/imx/ldb.txt (98%)
 create mode 100644
Documentation/devicetree/bindings/display/marvell,pxa2xx-lcdc.txt
 rename Documentation/devicetree/bindings/{mipi/dsi =>
display}/mipi-dsi-bus.txt (100%)
 rename Documentation/devicetree/bindings/{drm => display}/msm/dsi.txt (98%)
 rename Documentation/devicetree/bindings/{drm => display}/msm/edp.txt (100%)
 rename Documentation/devicetree/bindings/{drm => display}/msm/gpu.txt (100%)
 rename Documentation/devicetree/bindings/{drm => display}/msm/hdmi.txt (100%)
 rename Documentation/devicetree/bindings/{drm => display}/msm/mdp.txt (100%)
 rename Documentation/devicetree/bindings/{fb => display}/mxsfb.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/ampire,am800480r3tmqwa1h.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/auo,b080uan01.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/auo,b101aw03.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/auo,b101ean01.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/auo,b101xtn01.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/auo,b116xw03.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/auo,b133htn01.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/auo,b133xtn01.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/avic,tm070ddh03.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/chunghwa,claa101wa01a.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/chunghwa,claa101wb03.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/panel}/display-timing.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/edt,et057090dhu.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/edt,et070080dh6.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/edt,etm0700g0dh6.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/foxlink,fl500wvr00-a0t.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/giantplus,gpg482739qs5.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/hannstar,hsd070pww1.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/hannstar,hsd100pxn1.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/hit,tx23d38vm0caa.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/innolux,at043tn24.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/innolux,g121i1-l01.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/innolux,n116bge.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/innolux,n156bge-l21.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/innolux,zj070na-01p.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/lg,lb070wv8.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/lg,ld070wx3-sl01.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/lg,lg4573.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/lg,lh500wx1-sd03.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/lg,lp129qe.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/panel}/lgphilips,lb035q02.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/nec,nl4827hc19-05b.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/okaya,rs800480t-7x0gp.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/ortustech,com43h4m85ulc.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/panasonic,vvx10f004b00.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/panel}/panel-dpi.txt (94%)
 rename Documentation/devicetree/bindings/{video =>
display/panel}/panel-dsi-cm.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/samsung,ld9040.txt (96%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/samsung,ltn101nt05.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/samsung,ltn140at29-301.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/samsung,s6e8aa0.txt (95%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/sharp,lq101r1sx01.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/panel}/sharp,ls037v7dw01.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/shelly,sca07010-bfn-lnn.txt (100%)
 rename Documentation/devicetree/bindings/{ =>
display}/panel/simple-panel.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/panel}/sony,acx565akm.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/panel}/toppoly,td028ttec1.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/panel}/tpo,td043mtea1.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display}/renesas,du.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/rockchip}/dw_hdmi-rockchip.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/rockchip}/rockchip-drm.txt (88%)
 rename Documentation/devicetree/bindings/{video =>
display/rockchip}/rockchip-vop.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display}/simple-framebuffer-sunxi.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display}/simple-framebuffer.txt (100%)
 rename Documentation/devicetree/bindings/{fb => display}/sm501fb.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display}/ssd1289fb.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display}/ssd1307fb.txt (100%)
 rename Documentation/devicetree/bindings/{gpu => display}/st,stih4xx.txt (98%)
 rename Documentation/devicetree/bindings/{mipi =>
display/tegra}/nvidia,tegra114-mipi.txt (100%)
 rename Documentation/devicetree/bindings/{gpu =>
display/tegra}/nvidia,tegra20-host1x.txt (99%)
 rename Documentation/devicetree/bindings/{video =>
display/ti}/ti,dra7-dss.txt (95%)
 rename Documentation/devicetree/bindings/{video =>
display/ti}/ti,omap-dss.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/ti}/ti,omap2-dss.txt (93%)
 rename Documentation/devicetree/bindings/{video =>
display/ti}/ti,omap3-dss.txt (95%)
 rename Documentation/devicetree/bindings/{video =>
display/ti}/ti,omap4-dss.txt (97%)
 rename Documentation/devicetree/bindings/{video =>
display/ti}/ti,omap5-dss.txt (96%)
 rename Documentation/devicetree/bindings/{video =>
display/ti}/ti,opa362.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/ti}/ti,tfp410.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display/ti}/ti,tpd12s015.txt (100%)
 rename Documentation/devicetree/bindings/{drm =>
display}/tilcdc/panel.txt (96%)
 rename Documentation/devicetree/bindings/{drm =>
display}/tilcdc/tfp410.txt (100%)
 rename Documentation/devicetree/bindings/{drm =>
display}/tilcdc/tilcdc.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display}/via,vt8500-fb.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display}/wm,prizm-ge-rops.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
display}/wm,wm8505-fb.txt (100%)
 rename Documentation/devicetree/bindings/{misc => eeprom}/at25.txt (100%)
 rename Documentation/devicetree/bindings/{ => eeprom}/eeprom.txt (100%)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/ina209.txt
 rename Documentation/devicetree/bindings/{misc => iio/accel}/lis302.txt (100%)
 rename Documentation/devicetree/bindings/{misc =>
iio/dac}/ti,dac7512.txt (100%)
 rename Documentation/devicetree/bindings/{misc =>
iio/pressure}/bmp085.txt (100%)
 rename Documentation/devicetree/bindings/{hid => input}/hid-over-i2c.txt (100%)
 rename Documentation/devicetree/bindings/{arm/gic-v3.txt =>
interrupt-controller/arm,gic-v3.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/gic.txt =>
interrupt-controller/arm,gic.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/versatile-fpga-irq.txt
=> interrupt-controller/arm,versatile-fpga-irq.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/vic.txt =>
interrupt-controller/arm,vic.txt} (100%)
 rename Documentation/devicetree/bindings/{cris/interrupts.txt =>
interrupt-controller/axis,crisv32-intc.txt} (100%)
 rename Documentation/devicetree/bindings/{metag/meta-intc.txt =>
interrupt-controller/img,meta-intc.txt} (100%)
 rename Documentation/devicetree/bindings/{metag/pdc-intc.txt =>
interrupt-controller/img,pdc-intc.txt} (100%)
 rename Documentation/devicetree/bindings/{x86/interrupt.txt =>
interrupt-controller/intel,ce4100-ioapic.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/mediatek =>
interrupt-controller}/mediatek,sysirq.txt (100%)
 rename Documentation/devicetree/bindings/{arm/mrvl/intc.txt =>
interrupt-controller/mrvl,intc.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/lpc32xx-mic.txt =>
interrupt-controller/nxp,lpc3220-mic.txt} (100%)
 rename Documentation/devicetree/bindings/{ =>
interrupt-controller}/open-pic.txt (100%)
 rename Documentation/devicetree/bindings/{arm/samsung/interrupt-combiner.txt
=> interrupt-controller/samsung,exynos4210-combiner.txt} (100%)
 rename Documentation/devicetree/bindings/{arc/interrupts.txt =>
interrupt-controller/snps,arc700-intc.txt} (100%)
 rename Documentation/devicetree/bindings/{arc/archs-idu-intc.txt =>
interrupt-controller/snps,archs-idu-intc.txt} (100%)
 rename Documentation/devicetree/bindings/{arc/archs-intc.txt =>
interrupt-controller/snps,archs-intc.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/spear/shirq.txt =>
interrupt-controller/st,spear3xx-shirq.txt} (100%)
 rename Documentation/devicetree/bindings/{c6x/interrupt.txt =>
interrupt-controller/ti,c64x+megamod-pic.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/davinci/cp-intc.txt =>
interrupt-controller/ti,cp-intc.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/omap/intc.txt =>
interrupt-controller/ti,omap2-intc.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/vt8500 =>
interrupt-controller}/via,vt8500-intc.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
leds}/backlight/88pm860x.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
leds}/backlight/gpio-backlight.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
leds}/backlight/lp855x.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
leds}/backlight/max8925-backlight.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
leds}/backlight/pm8941-wled.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
leds}/backlight/pwm-backlight.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
leds}/backlight/sky81452-backlight.txt (100%)
 rename Documentation/devicetree/bindings/{video =>
leds}/backlight/tps65217-backlight.txt (100%)
 rename Documentation/devicetree/bindings/{arm/calxeda/mem-ctrlr.txt
=> memory-controllers/calxeda-ddr-ctrlr.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/calxeda/combophy.txt =>
phy/calxeda-combophy.txt} (100%)
 rename Documentation/devicetree/bindings/{usb/keystone-phy.txt =>
phy/keystone-usb-phy.txt} (100%)
 rename Documentation/devicetree/bindings/{usb/mxs-phy.txt =>
phy/mxs-usb-phy.txt} (100%)
 rename Documentation/devicetree/bindings/{usb =>
phy}/nvidia,tegra20-usb-phy.txt (100%)
 rename Documentation/devicetree/bindings/{usb =>
phy}/qcom,usb-8x16-phy.txt (100%)
 create mode 100644 Documentation/devicetree/bindings/power/wakeup-source.txt
 rename Documentation/devicetree/bindings/{hwrng => rng}/atmel-trng.txt (100%)
 rename Documentation/devicetree/bindings/{hwrng =>
rng}/brcm,iproc-rng200.txt (100%)
 rename Documentation/devicetree/bindings/{hwrng => rng}/omap_rng.txt (100%)
 rename Documentation/devicetree/bindings/{hwrng =>
rng}/timeriomem_rng.txt (100%)
 delete mode 100644 Documentation/devicetree/bindings/usb/samsung-usbphy.txt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
