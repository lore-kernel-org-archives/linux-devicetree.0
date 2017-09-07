From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL] DeviceTree updates for 4.14
Date: Thu, 7 Sep 2017 10:26:52 -0500
Message-ID: <CAL_JsqKHDb5-Tx4HtZhy96xT9HPPuxLgEQLW1kRAJ-9cgMVUdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Please pull. There's a few orphans in the conversion to %pOF printf
specifiers included here that no one picked up. There's a few trivial
conflicts with your tree in inside-secure-safexcel.txt and with the
sound tree in rockchip,pdm.txt.

Rob

The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-4.14

for you to fetch changes up to 84024468cf1612783e6ab317da5b72fa41487ac6:

  devicetree: Adjust status "ok" -> "okay" under drivers/of/
(2017-09-05 10:05:41 -0500)

----------------------------------------------------------------
DeviceTree updates for 4.14:

- Convert more DT code to use of_property_read_* API.

- Improve DT overlay support when adding multiple overlays.

- Convert printk's to %pOF format specifiers. Most went via subsystem
  trees, but picked up the remaining orphans.

- Correct unittests to use preferred "okay" for "status" property value.

- Add a KASLR seed property.

- Vendor prefixes for Mellanox, Theobroma System, Adaptrum, Moxa.

- Fix modalias buffer handling.

- Clean-up of include paths for building dtbs.

- Add bindings for amc6821, isl1208, tsl2x7x, srf02, and srf10 devices.

- Add nvmem bindings for MediaTek MT7623 and MT7622 SoC.

- Add compatible string for Allwinner H5 Mali-450 GPU.

- Fix links to old OpenFirmware docs with new mirror on devicetree.org.

- Remove status property from binding doc examples.

----------------------------------------------------------------
Alexandru Gagniuc (1):
      dt-bindings: Add vendor prefix for Adaptrum, Inc.

Andrea Merello (1):
      dt-bindings: input: ti,drv260x: fix typo in property name

Andreas Klinger (1):
      iio: srf08: add device tree binding for srf02 and srf10

Andy Shevchenko (1):
      of: Use PLATFORM_DEVID_NONE definition

Baruch Siach (1):
      dt-binding: net/phy: fix interrupts description

Bjorn Andersson (2):
      of/device: Prevent buffer overflow in of_device_modalias()
      of/device: Fix of_device_get_modalias() buffer handling

Brandon Streiff (1):
      clk: si5351: expand compatible strings in documentation

Brian Masney (1):
      staging: iio: tsl2x7x: add device tree documentation

Frank Rowand (3):
      of: overlay: add overlay unittest data for node names and symbols
      of: overlay: correctly apply overlay node with unit-address
      of: overlay: add overlay symbols to live device tree

Geert Uytterhoeven (2):
      dt-bindings: usb: musb: Grammar s/the/to/, s/is/are/
      dt-bindings: pinctrl: sh-pfc: Use generic node name

Icenowy Zheng (1):
      dt-bindings: add compatible string of Allwinner H5 Mali-450 MP4 GPU

Kees Cook (1):
      dt-bindings: chosen: document kaslr-seed property

Klaus Goger (2):
      dt-bindings: add vendor prefix for Theobroma Systems
      dt-bindings: add amc6821, isl1208 trivial bindings

Kuninori Morimoto (1):
      device property: use of_graph_get_remote_endpoint() for of_fwnode

Masahiro Yamada (3):
      of: remove drivers/of/testcase-data from include search path for CPP
      of: remove arch/$(SRCARCH)/boot/dts from include search path for CPP
      of: search scripts/dtc/include-prefixes path for both CPP and DTC

Philipp Zabel (1):
      dt-bindings: display: imx: fix parallel display interface-pix-fmt property

Rob Herring (9):
      of: Convert to using %pOF instead of full_name
      of/device: use of_property_for_each_string to parse compatible strings
      of/irq: use of_property_read_u32_index to parse interrupts property
      dt-bindings: update OpenFirmware document links to devicetree.org
      microblaze: Convert to using %pOF instead of full_name
      ide: pmac: Convert to using %pOF instead of full_name
      macintosh: Convert to using %pOF instead of full_name
      virt: Convert to using %pOF instead of full_name
      dt-bindings: Remove "status" from examples

Robert P. J. Day (1):
      devicetree: Adjust status "ok" -> "okay" under drivers/of/

SZ Lin (1):
      of: Update Moxa vendor prefix description

Sean Wang (1):
      dt-bindings: nvmem: mediatek: add support for MediaTek MT7623
and MT7622 SoC

Sergei Shtylyov (6):
      of: irq: use of_property_read_bool() for "interrupt-controller" prop
      of: irq: use of_property_read_u32()
      of: base: use of_property_read_u32()
      of: base: use of_property_read_string()
      of_pci: use of_property_read_u32()
      of_pci: use of_property_read_u32_array()

Shawn Lin (1):
      of: remove unused pci_space variable from address.c

Sudeep Holla (1):
      of: return of_get_cpu_node from of_cpu_device_node_get if CPUs
are not registered

Suman Anna (1):
      dt-bindings: clock: ti-sci: Fix incorrect usage of headers

Vadim Pasternak (1):
      dt-bindings: Add vendor Mellanox

 .../devicetree/bindings/arm/arch_timer.txt         |   1 -
 .../arm/marvell/cp110-system-controller0.txt       |   1 -
 .../devicetree/bindings/ata/apm-xgene.txt          |   2 -
 Documentation/devicetree/bindings/ata/imx-pata.txt |   1 -
 .../devicetree/bindings/bus/mvebu-mbus.txt         |   3 -
 .../devicetree/bindings/bus/nvidia,tegra20-gmi.txt |   2 -
 .../bindings/bus/nvidia,tegra210-aconnect.txt      |   1 -
 Documentation/devicetree/bindings/chosen.txt       |  26 +++-
 .../devicetree/bindings/clock/alphascale,acc.txt   |   1 -
 .../bindings/clock/amlogic,gxbb-aoclkc.txt         |   1 -
 .../bindings/clock/amlogic,gxbb-clkc.txt           |   1 -
 .../bindings/clock/amlogic,meson8b-clkc.txt        |   1 -
 .../devicetree/bindings/clock/brcm,kona-ccu.txt    |   1 -
 .../devicetree/bindings/clock/exynos5433-clock.txt |   1 -
 .../devicetree/bindings/clock/hi3660-clock.txt     |   1 -
 .../devicetree/bindings/clock/hix5hd2-clock.txt    |   1 -
 .../devicetree/bindings/clock/imx21-clock.txt      |   1 -
 .../devicetree/bindings/clock/imx23-clock.txt      |   1 -
 .../devicetree/bindings/clock/imx25-clock.txt      |   1 -
 .../devicetree/bindings/clock/imx27-clock.txt      |   1 -
 .../devicetree/bindings/clock/imx28-clock.txt      |   1 -
 .../devicetree/bindings/clock/imx31-clock.txt      |   1 -
 .../devicetree/bindings/clock/imx5-clock.txt       |   1 -
 .../devicetree/bindings/clock/imx6q-clock.txt      |   1 -
 .../bindings/clock/nvidia,tegra124-dfll.txt        |   1 -
 .../devicetree/bindings/clock/pxa-clock.txt        |   1 -
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   1 -
 .../bindings/clock/renesas,r8a7778-cpg-clocks.txt  |   1 -
 .../bindings/clock/renesas,rz-cpg-clocks.txt       |   1 -
 .../bindings/clock/samsung,s3c2410-clock.txt       |   1 -
 .../bindings/clock/samsung,s3c2412-clock.txt       |   1 -
 .../bindings/clock/samsung,s3c2443-clock.txt       |   1 -
 .../bindings/clock/samsung,s3c64xx-clock.txt       |   1 -
 .../bindings/clock/samsung,s5pv210-clock.txt       |   1 -
 .../devicetree/bindings/clock/silabs,si5351.txt    |   6 +-
 .../devicetree/bindings/clock/ti,sci-clk.txt       |   7 +-
 .../devicetree/bindings/clock/ti/dra7-atl.txt      |   2 -
 .../devicetree/bindings/clock/zx296702-clk.txt     |   1 -
 .../devicetree/bindings/clock/zx296718-clk.txt     |   1 -
 .../devicetree/bindings/crypto/fsl-dcp.txt         |   1 -
 .../bindings/crypto/inside-secure-safexcel.txt     |   1 -
 .../devicetree/bindings/crypto/marvell-cesa.txt    |   1 -
 .../devicetree/bindings/crypto/mv_cesa.txt         |   1 -
 .../devicetree/bindings/crypto/rockchip-crypto.txt |   1 -
 .../bindings/devfreq/event/rockchip-dfi.txt        |   1 -
 .../devicetree/bindings/devfreq/rk3399_dmc.txt     |   1 -
 .../devicetree/bindings/display/atmel,lcdc.txt     |   1 -
 .../devicetree/bindings/display/atmel/hlcdc-dc.txt |   1 -
 .../bridge/megachips-stdpxxxx-ge-b850v3-fw.txt     |   1 -
 .../bindings/display/bridge/renesas,dw-hdmi.txt    |   1 -
 .../devicetree/bindings/display/fsl,tcon.txt       |   1 -
 .../bindings/display/imx/fsl-imx-drm.txt           |   2 +-
 .../bindings/display/marvell,pxa2xx-lcdc.txt       |   1 -
 .../bindings/display/panel/innolux,p079zca.txt     |   1 -
 .../display/rockchip/analogix_dp-rockchip.txt      |   1 -
 .../bindings/display/rockchip/dw_hdmi-rockchip.txt |   1 -
 .../display/rockchip/dw_mipi_dsi_rockchip.txt      |   2 -
 .../display/rockchip/inno_hdmi-rockchip.txt        |   1 -
 .../bindings/display/simple-framebuffer-sunxi.txt  |   1 -
 .../bindings/display/sunxi/sun4i-drm.txt           |   1 -
 Documentation/devicetree/bindings/dma/fsl-edma.txt |   1 -
 Documentation/devicetree/bindings/dma/mv-xor.txt   |   1 -
 Documentation/devicetree/bindings/dma/qcom_adm.txt |   1 -
 Documentation/devicetree/bindings/dma/snps-dma.txt |   1 -
 Documentation/devicetree/bindings/dma/st_fdma.txt  |   1 -
 .../devicetree/bindings/dma/ste-dma40.txt          |   1 -
 .../devicetree/bindings/dma/sun4i-dma.txt          |   1 -
 .../devicetree/bindings/dma/ti-dma-crossbar.txt    |   1 -
 Documentation/devicetree/bindings/dma/ti-edma.txt  |   1 -
 .../bindings/fpga/xilinx-slave-serial.txt          |   1 -
 .../devicetree/bindings/gpio/gpio-mpc8xxx.txt      |   1 -
 .../devicetree/bindings/gpio/spear_spics.txt       |   1 -
 .../devicetree/bindings/gpu/arm,mali-utgard.txt    |   5 +
 .../devicetree/bindings/gpu/nvidia,gk20a.txt       |   3 -
 .../devicetree/bindings/gpu/samsung-g2d.txt        |   1 -
 Documentation/devicetree/bindings/hsi/omap-ssi.txt |   1 -
 .../devicetree/bindings/i2c/i2c-demux-pinctrl.txt  |   1 -
 .../devicetree/bindings/i2c/i2c-efm32.txt          |   1 -
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |   1 -
 .../bindings/iio/adc/brcm,iproc-static-adc.txt     |   1 -
 .../devicetree/bindings/iio/adc/lpc1850-adc.txt    |   1 -
 .../devicetree/bindings/iio/dac/lpc1850-dac.txt    |   1 -
 .../devicetree/bindings/input/brcm,bcm-keypad.txt  |   1 -
 .../devicetree/bindings/input/ti,drv260x.txt       |   2 +-
 .../bindings/input/touchscreen/colibri-vf50-ts.txt |   1 -
 .../bindings/input/touchscreen/imx6ul_tsc.txt      |   1 -
 .../devicetree/bindings/media/pxa-camera.txt       |   1 -
 .../devicetree/bindings/media/s5p-cec.txt          |   1 -
 .../devicetree/bindings/media/samsung-fimc.txt     |   2 -
 .../bindings/media/stih407-c8sectpfe.txt           |   1 -
 .../devicetree/bindings/media/ti,da850-vpif.txt    |   1 -
 .../bindings/memory-controllers/mvebu-devbus.txt   |   1 -
 Documentation/devicetree/bindings/mfd/act8945a.txt |   2 -
 .../devicetree/bindings/mfd/atmel-hlcdc.txt        |   1 -
 .../devicetree/bindings/mfd/da9052-i2c.txt         |   1 -
 Documentation/devicetree/bindings/mfd/mc13xxx.txt  |   1 -
 .../devicetree/bindings/mfd/mxs-lradc.txt          |   2 -
 .../bindings/mfd/samsung,exynos5433-lpass.txt      |   2 -
 .../devicetree/bindings/misc/atmel-ssc.txt         |   1 -
 .../devicetree/bindings/mmc/arasan,sdhci.txt       |   1 -
 .../devicetree/bindings/mmc/davinci_mmc.txt        |   1 -
 .../devicetree/bindings/mmc/fsl-imx-mmc.txt        |   1 -
 Documentation/devicetree/bindings/mmc/mmc-card.txt |   1 -
 Documentation/devicetree/bindings/mmc/mmc.txt      |   1 -
 .../devicetree/bindings/mmc/orion-sdio.txt         |   1 -
 Documentation/devicetree/bindings/mmc/sdhci-st.txt |   3 -
 .../devicetree/bindings/mmc/zx-dw-mshc.txt         |   1 -
 .../devicetree/bindings/mtd/atmel-quadspi.txt      |   1 -
 .../devicetree/bindings/mtd/mtk-quadspi.txt        |   1 -
 Documentation/devicetree/bindings/mtd/st-fsm.txt   |   1 -
 .../devicetree/bindings/mtd/sunxi-nand.txt         |   1 -
 .../devicetree/bindings/net/brcm,amac.txt          |   1 -
 .../devicetree/bindings/net/brcm,bgmac-nsp.txt     |   1 -
 Documentation/devicetree/bindings/net/btusb.txt    |   1 -
 .../devicetree/bindings/net/can/m_can.txt          |   1 -
 Documentation/devicetree/bindings/net/dsa/ksz.txt  |   2 -
 .../devicetree/bindings/net/dsa/lan9303.txt        |   3 -
 .../devicetree/bindings/net/ftgmac100.txt          |   1 -
 .../bindings/net/marvell-armada-370-neta.txt       |   1 -
 .../devicetree/bindings/net/marvell-bt-8xxx.txt    |   2 -
 .../devicetree/bindings/net/marvell-neta-bm.txt    |   2 -
 .../devicetree/bindings/net/marvell-pp2.txt        |   3 -
 .../devicetree/bindings/net/meson-dwmac.txt        |   1 -
 .../devicetree/bindings/net/micrel-ksz90x1.txt     |   1 -
 .../devicetree/bindings/net/microchip,enc28j60.txt |   1 -
 .../devicetree/bindings/net/nfc/nfcmrvl.txt        |   2 -
 .../devicetree/bindings/net/nfc/nxp-nci.txt        |   1 -
 .../devicetree/bindings/net/nfc/pn533-i2c.txt      |   1 -
 .../devicetree/bindings/net/nfc/pn544.txt          |   1 -
 .../devicetree/bindings/net/nfc/s3fwrn5.txt        |   1 -
 .../devicetree/bindings/net/nfc/st-nci-i2c.txt     |   1 -
 .../devicetree/bindings/net/nfc/st-nci-spi.txt     |   1 -
 .../devicetree/bindings/net/nfc/st21nfca.txt       |   1 -
 .../devicetree/bindings/net/nfc/st95hf.txt         |   2 -
 .../devicetree/bindings/net/nfc/trf7970a.txt       |   2 -
 .../devicetree/bindings/net/oxnas-dwmac.txt        |   1 -
 Documentation/devicetree/bindings/net/phy.txt      |  10 +-
 .../devicetree/bindings/net/qca,qca7000.txt        |   2 -
 .../devicetree/bindings/net/rockchip-dwmac.txt     |   1 -
 .../devicetree/bindings/net/smsc-lan87xx.txt       |   1 -
 .../devicetree/bindings/net/socfpga-dwmac.txt      |   1 -
 .../devicetree/bindings/net/sti-dwmac.txt          |   1 -
 .../devicetree/bindings/net/stm32-dwmac.txt        |   1 -
 .../bindings/net/wireless/brcm,bcm43xx-fmac.txt    |   1 -
 .../bindings/net/wireless/esp,esp8089.txt          |   1 -
 .../bindings/net/wireless/marvell-8xxx.txt         |   1 -
 .../devicetree/bindings/net/wireless/ti,wlcore.txt |   1 -
 .../devicetree/bindings/nvmem/mtk-efuse.txt        |   5 +-
 .../devicetree/bindings/nvmem/mxs-ocotp.txt        |   1 -
 Documentation/devicetree/bindings/opp/opp.txt      |   1 -
 .../devicetree/bindings/pci/aardvark-pci.txt       |   1 -
 .../devicetree/bindings/pci/hisilicon-pcie.txt     |   2 -
 .../devicetree/bindings/pci/mvebu-pci.txt          |  11 --
 .../devicetree/bindings/pci/pci-armada8k.txt       |   1 -
 Documentation/devicetree/bindings/pci/pci.txt      |   4 +-
 Documentation/devicetree/bindings/pci/rcar-pci.txt |   1 -
 .../devicetree/bindings/pci/xgene-pci-msi.txt      |   1 -
 .../devicetree/bindings/phy/apm-xgene-phy.txt      |   3 -
 .../devicetree/bindings/phy/keystone-usb-phy.txt   |   1 -
 .../devicetree/bindings/phy/phy-mt65xx-usb.txt     |   4 -
 .../devicetree/bindings/phy/phy-mvebu.txt          |   1 -
 .../bindings/phy/phy-rockchip-inno-usb2.txt        |   2 -
 .../devicetree/bindings/phy/qcom-dwc3-usb-phy.txt  |   2 -
 .../devicetree/bindings/phy/samsung-phy.txt        |   1 -
 .../devicetree/bindings/phy/sun9i-usb-phy.txt      |   1 -
 .../bindings/pinctrl/atmel,at91-pinctrl.txt        |   1 -
 .../bindings/pinctrl/fsl,imx-pinctrl.txt           |   1 -
 .../bindings/pinctrl/fsl,imx7d-pinctrl.txt         |   1 -
 .../pinctrl/nvidia,tegra124-dpaux-padctl.txt       |   1 -
 .../devicetree/bindings/pinctrl/oxnas,pinctrl.txt  |   1 -
 .../devicetree/bindings/pinctrl/pinctrl-zx.txt     |   1 -
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |   3 +-
 .../bindings/pinctrl/rockchip,pinctrl.txt          |   1 -
 .../bindings/pinctrl/st,stm32-pinctrl.txt          |   1 -
 .../devicetree/bindings/power/power-controller.txt |   1 -
 .../devicetree/bindings/power/reset/st-reset.txt   |   1 -
 .../bindings/power/supply/act8945a-charger.txt     |   2 -
 .../bindings/power/supply/max8903-charger.txt      |   1 -
 .../bindings/power/supply/maxim,max14656.txt       |   1 -
 .../devicetree/bindings/ptp/brcm,ptp-dte.txt       |   1 -
 .../devicetree/bindings/pwm/pwm-meson.txt          |   1 -
 .../devicetree/bindings/pwm/pwm-sun4i.txt          |   1 -
 .../devicetree/bindings/pwm/pwm-tipwmss.txt        |   2 -
 .../bindings/regulator/act8865-regulator.txt       |   1 -
 .../bindings/regulator/act8945a-regulator.txt      |   1 -
 .../devicetree/bindings/reset/nxp,lpc1850-rgu.txt  |   1 -
 .../devicetree/bindings/rtc/st,stm32-rtc.txt       |   1 -
 .../devicetree/bindings/scsi/hisilicon-sas.txt     |   1 -
 .../bindings/security/tpm/st33zp24-i2c.txt         |   1 -
 .../bindings/security/tpm/st33zp24-spi.txt         |   1 -
 .../devicetree/bindings/security/tpm/tpm-i2c.txt   |   1 -
 .../bindings/security/tpm/tpm_tis_spi.txt          |   1 -
 .../devicetree/bindings/serial/arc-uart.txt        |   1 -
 .../bindings/serial/axis,etraxfs-uart.txt          |   1 -
 .../bindings/serial/nvidia,tegra20-hsuart.txt      |   1 -
 .../devicetree/bindings/serial/qcom,msm-uartdm.txt |   3 -
 .../devicetree/bindings/serial/serial.txt          |   2 -
 .../bindings/serio/allwinner,sun4i-ps2.txt         |   1 -
 .../devicetree/bindings/soc/qcom/qcom,gsbi.txt     |   1 -
 .../bindings/sound/armada-370db-audio.txt          |   1 -
 .../bindings/sound/axentia,tse850-pcm5142.txt      |   1 -
 .../bindings/sound/brcm,cygnus-audio.txt           |   4 -
 .../devicetree/bindings/sound/davinci-mcbsp.txt    |   1 -
 .../devicetree/bindings/sound/fsl,asrc.txt         |   1 -
 .../devicetree/bindings/sound/fsl,esai.txt         |   1 -
 .../devicetree/bindings/sound/fsl,spdif.txt        |   1 -
 Documentation/devicetree/bindings/sound/hdmi.txt   |   1 -
 .../devicetree/bindings/sound/renesas,rsnd.txt     |   2 -
 .../devicetree/bindings/sound/rockchip,pdm.txt     |   1 -
 .../devicetree/bindings/sound/rockchip-spdif.txt   |   1 -
 .../devicetree/bindings/sound/st,sti-asoc-card.txt |   5 -
 .../bindings/sound/sunxi,sun4i-spdif.txt           |   1 -
 .../devicetree/bindings/sound/tas5720.txt          |   1 -
 .../devicetree/bindings/sound/zte,zx-i2s.txt       |   1 -
 .../devicetree/bindings/sound/zte,zx-spdif.txt     |   1 -
 .../devicetree/bindings/spi/efm32-spi.txt          |   2 -
 .../bindings/spi/nvidia,tegra114-spi.txt           |   1 -
 .../bindings/spi/nvidia,tegra20-sflash.txt         |   1 -
 .../bindings/spi/nvidia,tegra20-slink.txt          |   1 -
 Documentation/devicetree/bindings/spi/sh-hspi.txt  |   1 -
 Documentation/devicetree/bindings/spi/sh-msiof.txt |   1 -
 .../devicetree/bindings/spi/spi-clps711x.txt       |   1 -
 .../devicetree/bindings/spi/spi-fsl-dspi.txt       |   1 -
 .../devicetree/bindings/spi/spi-mt65xx.txt         |   1 -
 .../devicetree/bindings/spi/spi-orion.txt          |   2 -
 .../devicetree/bindings/spi/spi-sun4i.txt          |   1 -
 .../devicetree/bindings/spi/spi-sun6i.txt          |   1 -
 .../devicetree/bindings/spi/spi_atmel.txt          |   1 -
 .../devicetree/bindings/sram/sunxi-sram.txt        |   1 -
 .../devicetree/bindings/thermal/armada-thermal.txt |   1 -
 .../devicetree/bindings/thermal/exynos-thermal.txt |   1 -
 .../bindings/thermal/rcar-gen3-thermal.txt         |   1 -
 .../devicetree/bindings/trivial-devices.txt        |  14 ++
 Documentation/devicetree/bindings/unittest.txt     |   5 -
 .../bindings/usb/allwinner,sun4i-a10-musb.txt      |   1 -
 .../devicetree/bindings/usb/am33xx-usb.txt         |   4 +-
 .../devicetree/bindings/usb/da8xx-usb.txt          |   2 -
 Documentation/devicetree/bindings/usb/dwc3-st.txt  |   1 -
 .../devicetree/bindings/usb/dwc3-xilinx.txt        |   1 -
 Documentation/devicetree/bindings/usb/ehci-st.txt  |   1 -
 .../devicetree/bindings/usb/exynos-usb.txt         |   2 -
 Documentation/devicetree/bindings/usb/isp1301.txt  |   1 -
 .../devicetree/bindings/usb/keystone-usb.txt       |   1 -
 .../devicetree/bindings/usb/mt8173-mtu3.txt        |   2 -
 Documentation/devicetree/bindings/usb/ohci-st.txt  |   1 -
 .../devicetree/bindings/usb/qcom,dwc3.txt          |   3 -
 .../devicetree/bindings/usb/rockchip,dwc3.txt      |   4 -
 .../devicetree/bindings/usb/usb-device.txt         |   3 +-
 .../devicetree/bindings/vendor-prefixes.txt        |   5 +-
 .../devicetree/bindings/w1/fsl-imx-owire.txt       |   1 -
 .../bindings/watchdog/atmel-sama5d4-wdt.txt        |   1 -
 .../devicetree/bindings/watchdog/atmel-wdt.txt     |   1 -
 .../devicetree/bindings/watchdog/marvel.txt        |   1 -
 Documentation/devicetree/booting-without-of.txt    |   2 +-
 arch/microblaze/kernel/timer.c                     |   2 +-
 arch/microblaze/pci/pci-common.c                   |  14 +-
 drivers/ide/pmac.c                                 |  18 +--
 drivers/macintosh/macio_sysfs.c                    |   2 +-
 drivers/macintosh/rack-meter.c                     |   4 +-
 drivers/macintosh/smu.c                            |   8 +-
 drivers/macintosh/via-cuda.c                       |   4 +-
 drivers/macintosh/windfarm_fcu_controls.c          |   4 +-
 drivers/macintosh/windfarm_lm87_sensor.c           |   4 +-
 drivers/macintosh/windfarm_smu_sat.c               |   2 +-
 drivers/of/address.c                               |  24 ++--
 drivers/of/base.c                                  |  46 +++----
 drivers/of/device.c                                |  75 +++++------
 drivers/of/dynamic.c                               |  33 +++--
 drivers/of/irq.c                                   |  77 +++++------
 drivers/of/of_mdio.c                               |   4 +-
 drivers/of/of_pci.c                                |  72 +++++------
 drivers/of/overlay.c                               | 142 ++++++++++++++++++---
 drivers/of/platform.c                              |  34 ++---
 drivers/of/property.c                              |  23 ++--
 drivers/of/unittest-data/Makefile                  |  19 ++-
 drivers/of/unittest-data/overlay.dts               |  31 ++++-
 drivers/of/unittest-data/overlay_bad_symbol.dts    |  22 ++++
 drivers/of/unittest-data/overlay_base.dts          |  11 ++
 drivers/of/unittest.c                              |  77 ++++++-----
 drivers/virt/fsl_hypervisor.c                      |  12 +-
 include/linux/of_device.h                          |   2 +-
 scripts/Makefile.lib                               |   8 +-
 282 files changed, 531 insertions(+), 650 deletions(-)
 create mode 100644 drivers/of/unittest-data/overlay_bad_symbol.dts
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
