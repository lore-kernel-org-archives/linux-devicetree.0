From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] dt-bindings: Remove "status" from examples
Date: Fri,  1 Sep 2017 16:14:47 -0500
Message-ID: <20170901211447.26865-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Pretty much any node can have a status property, so it doesn't need to
be in examples.

Converted with the following command and removed examples with SoC and
board specific splits:

git grep -l -E 'status.*=.*' Documentation/devicetree/ | xargs sed -i -E '/\sstatus.*=.*"(disabled|ok|okay)/d'

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/arch_timer.txt          |  1 -
 .../bindings/arm/marvell/cp110-system-controller0.txt         |  1 -
 Documentation/devicetree/bindings/ata/apm-xgene.txt           |  2 --
 Documentation/devicetree/bindings/ata/imx-pata.txt            |  1 -
 Documentation/devicetree/bindings/bus/mvebu-mbus.txt          |  3 ---
 Documentation/devicetree/bindings/bus/nvidia,tegra20-gmi.txt  |  2 --
 .../devicetree/bindings/bus/nvidia,tegra210-aconnect.txt      |  1 -
 Documentation/devicetree/bindings/clock/alphascale,acc.txt    |  1 -
 .../devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt         |  1 -
 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt |  1 -
 .../devicetree/bindings/clock/amlogic,meson8b-clkc.txt        |  1 -
 Documentation/devicetree/bindings/clock/brcm,kona-ccu.txt     |  1 -
 Documentation/devicetree/bindings/clock/exynos5433-clock.txt  |  1 -
 Documentation/devicetree/bindings/clock/hi3660-clock.txt      |  1 -
 Documentation/devicetree/bindings/clock/hix5hd2-clock.txt     |  1 -
 Documentation/devicetree/bindings/clock/imx21-clock.txt       |  1 -
 Documentation/devicetree/bindings/clock/imx23-clock.txt       |  1 -
 Documentation/devicetree/bindings/clock/imx25-clock.txt       |  1 -
 Documentation/devicetree/bindings/clock/imx27-clock.txt       |  1 -
 Documentation/devicetree/bindings/clock/imx28-clock.txt       |  1 -
 Documentation/devicetree/bindings/clock/imx31-clock.txt       |  1 -
 Documentation/devicetree/bindings/clock/imx5-clock.txt        |  1 -
 Documentation/devicetree/bindings/clock/imx6q-clock.txt       |  1 -
 .../devicetree/bindings/clock/nvidia,tegra124-dfll.txt        |  1 -
 Documentation/devicetree/bindings/clock/pxa-clock.txt         |  1 -
 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt  |  1 -
 .../devicetree/bindings/clock/renesas,r8a7778-cpg-clocks.txt  |  1 -
 .../devicetree/bindings/clock/renesas,rz-cpg-clocks.txt       |  1 -
 .../devicetree/bindings/clock/samsung,s3c2410-clock.txt       |  1 -
 .../devicetree/bindings/clock/samsung,s3c2412-clock.txt       |  1 -
 .../devicetree/bindings/clock/samsung,s3c2443-clock.txt       |  1 -
 .../devicetree/bindings/clock/samsung,s3c64xx-clock.txt       |  1 -
 .../devicetree/bindings/clock/samsung,s5pv210-clock.txt       |  1 -
 Documentation/devicetree/bindings/clock/ti/dra7-atl.txt       |  2 --
 Documentation/devicetree/bindings/clock/zx296702-clk.txt      |  1 -
 Documentation/devicetree/bindings/clock/zx296718-clk.txt      |  1 -
 Documentation/devicetree/bindings/crypto/fsl-dcp.txt          |  1 -
 .../devicetree/bindings/crypto/inside-secure-safexcel.txt     |  1 -
 Documentation/devicetree/bindings/crypto/marvell-cesa.txt     |  1 -
 Documentation/devicetree/bindings/crypto/mv_cesa.txt          |  1 -
 Documentation/devicetree/bindings/crypto/rockchip-crypto.txt  |  1 -
 .../devicetree/bindings/devfreq/event/rockchip-dfi.txt        |  1 -
 Documentation/devicetree/bindings/devfreq/rk3399_dmc.txt      |  1 -
 Documentation/devicetree/bindings/display/atmel,lcdc.txt      |  1 -
 Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt  |  1 -
 .../display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt        |  1 -
 .../devicetree/bindings/display/bridge/renesas,dw-hdmi.txt    |  1 -
 Documentation/devicetree/bindings/display/fsl,tcon.txt        |  1 -
 .../devicetree/bindings/display/marvell,pxa2xx-lcdc.txt       |  1 -
 .../devicetree/bindings/display/panel/innolux,p079zca.txt     |  1 -
 .../bindings/display/rockchip/analogix_dp-rockchip.txt        |  1 -
 .../devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt |  1 -
 .../bindings/display/rockchip/dw_mipi_dsi_rockchip.txt        |  2 --
 .../bindings/display/rockchip/inno_hdmi-rockchip.txt          |  1 -
 .../devicetree/bindings/display/simple-framebuffer-sunxi.txt  |  1 -
 Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt |  1 -
 Documentation/devicetree/bindings/dma/fsl-edma.txt            |  1 -
 Documentation/devicetree/bindings/dma/mv-xor.txt              |  1 -
 Documentation/devicetree/bindings/dma/qcom_adm.txt            |  1 -
 Documentation/devicetree/bindings/dma/snps-dma.txt            |  1 -
 Documentation/devicetree/bindings/dma/st_fdma.txt             |  1 -
 Documentation/devicetree/bindings/dma/ste-dma40.txt           |  1 -
 Documentation/devicetree/bindings/dma/sun4i-dma.txt           |  1 -
 Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt     |  1 -
 Documentation/devicetree/bindings/dma/ti-edma.txt             |  1 -
 .../devicetree/bindings/fpga/xilinx-slave-serial.txt          |  1 -
 Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt       |  1 -
 Documentation/devicetree/bindings/gpio/spear_spics.txt        |  1 -
 Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt        |  3 ---
 Documentation/devicetree/bindings/gpu/samsung-g2d.txt         |  1 -
 Documentation/devicetree/bindings/hsi/omap-ssi.txt            |  1 -
 Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.txt   |  1 -
 Documentation/devicetree/bindings/i2c/i2c-efm32.txt           |  1 -
 Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt  |  1 -
 .../devicetree/bindings/iio/adc/brcm,iproc-static-adc.txt     |  1 -
 Documentation/devicetree/bindings/iio/adc/lpc1850-adc.txt     |  1 -
 Documentation/devicetree/bindings/iio/dac/lpc1850-dac.txt     |  1 -
 Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt   |  1 -
 .../devicetree/bindings/input/touchscreen/colibri-vf50-ts.txt |  1 -
 .../devicetree/bindings/input/touchscreen/imx6ul_tsc.txt      |  1 -
 Documentation/devicetree/bindings/media/pxa-camera.txt        |  1 -
 Documentation/devicetree/bindings/media/s5p-cec.txt           |  1 -
 Documentation/devicetree/bindings/media/samsung-fimc.txt      |  2 --
 Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt |  1 -
 Documentation/devicetree/bindings/media/ti,da850-vpif.txt     |  1 -
 .../devicetree/bindings/memory-controllers/mvebu-devbus.txt   |  1 -
 Documentation/devicetree/bindings/mfd/act8945a.txt            |  2 --
 Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt         |  1 -
 Documentation/devicetree/bindings/mfd/da9052-i2c.txt          |  1 -
 Documentation/devicetree/bindings/mfd/mc13xxx.txt             |  1 -
 Documentation/devicetree/bindings/mfd/mxs-lradc.txt           |  2 --
 .../devicetree/bindings/mfd/samsung,exynos5433-lpass.txt      |  2 --
 Documentation/devicetree/bindings/misc/atmel-ssc.txt          |  1 -
 Documentation/devicetree/bindings/mmc/arasan,sdhci.txt        |  1 -
 Documentation/devicetree/bindings/mmc/davinci_mmc.txt         |  1 -
 Documentation/devicetree/bindings/mmc/fsl-imx-mmc.txt         |  1 -
 Documentation/devicetree/bindings/mmc/mmc-card.txt            |  1 -
 Documentation/devicetree/bindings/mmc/mmc.txt                 |  1 -
 Documentation/devicetree/bindings/mmc/orion-sdio.txt          |  1 -
 Documentation/devicetree/bindings/mmc/sdhci-st.txt            |  3 ---
 Documentation/devicetree/bindings/mmc/zx-dw-mshc.txt          |  1 -
 Documentation/devicetree/bindings/mtd/atmel-quadspi.txt       |  1 -
 Documentation/devicetree/bindings/mtd/mtk-quadspi.txt         |  1 -
 Documentation/devicetree/bindings/mtd/st-fsm.txt              |  1 -
 Documentation/devicetree/bindings/mtd/sunxi-nand.txt          |  1 -
 Documentation/devicetree/bindings/net/brcm,amac.txt           |  1 -
 Documentation/devicetree/bindings/net/brcm,bgmac-nsp.txt      |  1 -
 Documentation/devicetree/bindings/net/btusb.txt               |  1 -
 Documentation/devicetree/bindings/net/can/m_can.txt           |  1 -
 Documentation/devicetree/bindings/net/dsa/ksz.txt             |  2 --
 Documentation/devicetree/bindings/net/dsa/lan9303.txt         |  3 ---
 Documentation/devicetree/bindings/net/ftgmac100.txt           |  1 -
 .../devicetree/bindings/net/marvell-armada-370-neta.txt       |  1 -
 Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt     |  2 --
 Documentation/devicetree/bindings/net/marvell-neta-bm.txt     |  2 --
 Documentation/devicetree/bindings/net/marvell-pp2.txt         |  3 ---
 Documentation/devicetree/bindings/net/meson-dwmac.txt         |  1 -
 Documentation/devicetree/bindings/net/micrel-ksz90x1.txt      |  1 -
 Documentation/devicetree/bindings/net/microchip,enc28j60.txt  |  1 -
 Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt         |  2 --
 Documentation/devicetree/bindings/net/nfc/nxp-nci.txt         |  1 -
 Documentation/devicetree/bindings/net/nfc/pn533-i2c.txt       |  1 -
 Documentation/devicetree/bindings/net/nfc/pn544.txt           |  1 -
 Documentation/devicetree/bindings/net/nfc/s3fwrn5.txt         |  1 -
 Documentation/devicetree/bindings/net/nfc/st-nci-i2c.txt      |  1 -
 Documentation/devicetree/bindings/net/nfc/st-nci-spi.txt      |  1 -
 Documentation/devicetree/bindings/net/nfc/st21nfca.txt        |  1 -
 Documentation/devicetree/bindings/net/nfc/st95hf.txt          |  2 --
 Documentation/devicetree/bindings/net/nfc/trf7970a.txt        |  2 --
 Documentation/devicetree/bindings/net/oxnas-dwmac.txt         |  1 -
 Documentation/devicetree/bindings/net/qca,qca7000.txt         |  2 --
 Documentation/devicetree/bindings/net/rockchip-dwmac.txt      |  1 -
 Documentation/devicetree/bindings/net/smsc-lan87xx.txt        |  1 -
 Documentation/devicetree/bindings/net/socfpga-dwmac.txt       |  1 -
 Documentation/devicetree/bindings/net/sti-dwmac.txt           |  1 -
 Documentation/devicetree/bindings/net/stm32-dwmac.txt         |  1 -
 .../devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt    |  1 -
 .../devicetree/bindings/net/wireless/esp,esp8089.txt          |  1 -
 .../devicetree/bindings/net/wireless/marvell-8xxx.txt         |  1 -
 Documentation/devicetree/bindings/net/wireless/ti,wlcore.txt  |  1 -
 Documentation/devicetree/bindings/nvmem/mxs-ocotp.txt         |  1 -
 Documentation/devicetree/bindings/opp/opp.txt                 |  1 -
 Documentation/devicetree/bindings/pci/aardvark-pci.txt        |  1 -
 Documentation/devicetree/bindings/pci/hisilicon-pcie.txt      |  2 --
 Documentation/devicetree/bindings/pci/mvebu-pci.txt           | 11 -----------
 Documentation/devicetree/bindings/pci/pci-armada8k.txt        |  1 -
 Documentation/devicetree/bindings/pci/rcar-pci.txt            |  1 -
 Documentation/devicetree/bindings/pci/xgene-pci-msi.txt       |  1 -
 Documentation/devicetree/bindings/phy/apm-xgene-phy.txt       |  3 ---
 Documentation/devicetree/bindings/phy/keystone-usb-phy.txt    |  1 -
 Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt      |  4 ----
 Documentation/devicetree/bindings/phy/phy-mvebu.txt           |  1 -
 .../devicetree/bindings/phy/phy-rockchip-inno-usb2.txt        |  2 --
 Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt   |  2 --
 Documentation/devicetree/bindings/phy/samsung-phy.txt         |  1 -
 Documentation/devicetree/bindings/phy/sun9i-usb-phy.txt       |  1 -
 .../devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt        |  1 -
 Documentation/devicetree/bindings/pinctrl/fsl,imx-pinctrl.txt |  1 -
 .../devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt         |  1 -
 .../bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt         |  1 -
 Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt   |  1 -
 Documentation/devicetree/bindings/pinctrl/pinctrl-zx.txt      |  1 -
 .../devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt       |  1 -
 .../devicetree/bindings/pinctrl/rockchip,pinctrl.txt          |  1 -
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.txt          |  1 -
 Documentation/devicetree/bindings/power/power-controller.txt  |  1 -
 Documentation/devicetree/bindings/power/reset/st-reset.txt    |  1 -
 .../devicetree/bindings/power/supply/act8945a-charger.txt     |  2 --
 .../devicetree/bindings/power/supply/max8903-charger.txt      |  1 -
 .../devicetree/bindings/power/supply/maxim,max14656.txt       |  1 -
 Documentation/devicetree/bindings/ptp/brcm,ptp-dte.txt        |  1 -
 Documentation/devicetree/bindings/pwm/pwm-meson.txt           |  1 -
 Documentation/devicetree/bindings/pwm/pwm-sun4i.txt           |  1 -
 Documentation/devicetree/bindings/pwm/pwm-tipwmss.txt         |  2 --
 .../devicetree/bindings/regulator/act8865-regulator.txt       |  1 -
 .../devicetree/bindings/regulator/act8945a-regulator.txt      |  1 -
 Documentation/devicetree/bindings/reset/nxp,lpc1850-rgu.txt   |  1 -
 Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt        |  1 -
 Documentation/devicetree/bindings/scsi/hisilicon-sas.txt      |  1 -
 .../devicetree/bindings/security/tpm/st33zp24-i2c.txt         |  1 -
 .../devicetree/bindings/security/tpm/st33zp24-spi.txt         |  1 -
 Documentation/devicetree/bindings/security/tpm/tpm-i2c.txt    |  1 -
 .../devicetree/bindings/security/tpm/tpm_tis_spi.txt          |  1 -
 Documentation/devicetree/bindings/serial/arc-uart.txt         |  1 -
 .../devicetree/bindings/serial/axis,etraxfs-uart.txt          |  1 -
 .../devicetree/bindings/serial/nvidia,tegra20-hsuart.txt      |  1 -
 Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt  |  3 ---
 Documentation/devicetree/bindings/serial/serial.txt           |  2 --
 .../devicetree/bindings/serio/allwinner,sun4i-ps2.txt         |  1 -
 Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt      |  1 -
 .../devicetree/bindings/sound/armada-370db-audio.txt          |  1 -
 .../devicetree/bindings/sound/axentia,tse850-pcm5142.txt      |  1 -
 Documentation/devicetree/bindings/sound/brcm,cygnus-audio.txt |  4 ----
 Documentation/devicetree/bindings/sound/davinci-mcbsp.txt     |  1 -
 Documentation/devicetree/bindings/sound/fsl,asrc.txt          |  1 -
 Documentation/devicetree/bindings/sound/fsl,esai.txt          |  1 -
 Documentation/devicetree/bindings/sound/fsl,spdif.txt         |  1 -
 Documentation/devicetree/bindings/sound/hdmi.txt              |  1 -
 Documentation/devicetree/bindings/sound/renesas,rsnd.txt      |  2 --
 Documentation/devicetree/bindings/sound/rockchip,pdm.txt      |  1 -
 Documentation/devicetree/bindings/sound/rockchip-spdif.txt    |  1 -
 Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt  |  5 -----
 Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt |  1 -
 Documentation/devicetree/bindings/sound/tas5720.txt           |  1 -
 Documentation/devicetree/bindings/sound/zte,zx-i2s.txt        |  1 -
 Documentation/devicetree/bindings/sound/zte,zx-spdif.txt      |  1 -
 Documentation/devicetree/bindings/spi/efm32-spi.txt           |  2 --
 Documentation/devicetree/bindings/spi/nvidia,tegra114-spi.txt |  1 -
 .../devicetree/bindings/spi/nvidia,tegra20-sflash.txt         |  1 -
 .../devicetree/bindings/spi/nvidia,tegra20-slink.txt          |  1 -
 Documentation/devicetree/bindings/spi/sh-hspi.txt             |  1 -
 Documentation/devicetree/bindings/spi/sh-msiof.txt            |  1 -
 Documentation/devicetree/bindings/spi/spi-clps711x.txt        |  1 -
 Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt        |  1 -
 Documentation/devicetree/bindings/spi/spi-mt65xx.txt          |  1 -
 Documentation/devicetree/bindings/spi/spi-orion.txt           |  2 --
 Documentation/devicetree/bindings/spi/spi-sun4i.txt           |  1 -
 Documentation/devicetree/bindings/spi/spi-sun6i.txt           |  1 -
 Documentation/devicetree/bindings/spi/spi_atmel.txt           |  1 -
 Documentation/devicetree/bindings/sram/sunxi-sram.txt         |  1 -
 Documentation/devicetree/bindings/thermal/armada-thermal.txt  |  1 -
 Documentation/devicetree/bindings/thermal/exynos-thermal.txt  |  1 -
 .../devicetree/bindings/thermal/rcar-gen3-thermal.txt         |  1 -
 Documentation/devicetree/bindings/unittest.txt                |  5 -----
 .../devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt      |  1 -
 Documentation/devicetree/bindings/usb/da8xx-usb.txt           |  2 --
 Documentation/devicetree/bindings/usb/dwc3-st.txt             |  1 -
 Documentation/devicetree/bindings/usb/dwc3-xilinx.txt         |  1 -
 Documentation/devicetree/bindings/usb/ehci-st.txt             |  1 -
 Documentation/devicetree/bindings/usb/exynos-usb.txt          |  2 --
 Documentation/devicetree/bindings/usb/isp1301.txt             |  1 -
 Documentation/devicetree/bindings/usb/keystone-usb.txt        |  1 -
 Documentation/devicetree/bindings/usb/mt8173-mtu3.txt         |  2 --
 Documentation/devicetree/bindings/usb/ohci-st.txt             |  1 -
 Documentation/devicetree/bindings/usb/qcom,dwc3.txt           |  3 ---
 Documentation/devicetree/bindings/usb/rockchip,dwc3.txt       |  4 ----
 Documentation/devicetree/bindings/usb/usb-device.txt          |  1 -
 Documentation/devicetree/bindings/w1/fsl-imx-owire.txt        |  1 -
 .../devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt        |  1 -
 Documentation/devicetree/bindings/watchdog/atmel-wdt.txt      |  1 -
 Documentation/devicetree/bindings/watchdog/marvel.txt         |  1 -
 241 files changed, 311 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arch_timer.txt b/Documentation/devicetree/bindings/arm/arch_timer.txt
index e926aea1147d..68301b77e854 100644
--- a/Documentation/devicetree/bindings/arm/arch_timer.txt
+++ b/Documentation/devicetree/bindings/arm/arch_timer.txt
@@ -108,6 +108,5 @@ Example:
 			frame-number = <1>
 			interrupts = <0 15 0x8>;
 			reg = <0xf0003000 0x1000>;
-			status = "disabled";
 		};
 	};
diff --git a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
index 171d02cadea4..29cdbae6c5ac 100644
--- a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
@@ -183,7 +183,6 @@ cpm_syscon0: system-controller@440000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		gpio-ranges = <&cpm_pinctrl 0 0 32>;
-		status = "disabled";
 	};
 
 };
diff --git a/Documentation/devicetree/bindings/ata/apm-xgene.txt b/Documentation/devicetree/bindings/ata/apm-xgene.txt
index a668f0e7d001..02e690a675db 100644
--- a/Documentation/devicetree/bindings/ata/apm-xgene.txt
+++ b/Documentation/devicetree/bindings/ata/apm-xgene.txt
@@ -57,7 +57,6 @@ Example:
 			      <0x0 0x1f227000 0x0 0x1000>;
 			interrupts = <0x0 0x87 0x4>;
 			dma-coherent;
-			status = "ok";
 			clocks = <&sataclk 0>;
 			phys = <&phy2 0>;
 			phy-names = "sata-phy";
@@ -72,7 +71,6 @@ Example:
 			      <0x0 0x1f237000 0x0 0x1000>;
 			interrupts = <0x0 0x88 0x4>;
 			dma-coherent;
-			status = "ok";
 			clocks = <&sataclk 0>;
 			phys = <&phy3 0>;
 			phy-names = "sata-phy";
diff --git a/Documentation/devicetree/bindings/ata/imx-pata.txt b/Documentation/devicetree/bindings/ata/imx-pata.txt
index e38d73414b0d..f1172f00188a 100644
--- a/Documentation/devicetree/bindings/ata/imx-pata.txt
+++ b/Documentation/devicetree/bindings/ata/imx-pata.txt
@@ -13,5 +13,4 @@ Example:
 		reg = <0x83fe0000 0x4000>;
 		interrupts = <70>;
 		clocks = <&clks 161>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/bus/mvebu-mbus.txt b/Documentation/devicetree/bindings/bus/mvebu-mbus.txt
index fa6cde41b460..f2ab7fd013bd 100644
--- a/Documentation/devicetree/bindings/bus/mvebu-mbus.txt
+++ b/Documentation/devicetree/bindings/bus/mvebu-mbus.txt
@@ -227,7 +227,6 @@ See the example below, where a more complete device tree is shown:
 		};
 
 		devbus-bootcs {
-			status = "okay";
 			ranges = <0 MBUS_ID(0x01, 0x2f) 0 0x8000000>;
 
 			/* NOR */
@@ -240,7 +239,6 @@ See the example below, where a more complete device tree is shown:
 
 		pcie-controller {
 			compatible = "marvell,armada-xp-pcie";
-			status = "okay";
 			device_type = "pci";
 
 			#address-cells = <3>;
@@ -258,7 +256,6 @@ See the example below, where a more complete device tree is shown:
 
 			pcie@1,0 {
 				/* Port 0, Lane 0 */
-				status = "okay";
 			};
 		};
 
diff --git a/Documentation/devicetree/bindings/bus/nvidia,tegra20-gmi.txt b/Documentation/devicetree/bindings/bus/nvidia,tegra20-gmi.txt
index 83b0e54f727c..3e21eb822811 100644
--- a/Documentation/devicetree/bindings/bus/nvidia,tegra20-gmi.txt
+++ b/Documentation/devicetree/bindings/bus/nvidia,tegra20-gmi.txt
@@ -84,7 +84,6 @@ gmi@70090000 {
 	reset-names = "gmi";
 	ranges = <4 0 0xd0000000 0xfffffff>;
 
-	status = "okay";
 
 	bus@4,0 {
 		compatible = "simple-bus";
@@ -121,7 +120,6 @@ gmi@70090000 {
 	reset-names = "gmi";
 	ranges = <4 0 0xd0000000 0xfffffff>;
 
-	status = "okay";
 
 	can@4,0 {
 		reg = <4 0 0x100>;
diff --git a/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt b/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt
index 7ff13be1750b..3108d03802ee 100644
--- a/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt
+++ b/Documentation/devicetree/bindings/bus/nvidia,tegra210-aconnect.txt
@@ -33,7 +33,6 @@ Example:
 		#size-cells = <1>;
 		ranges = <0x702c0000 0x0 0x702c0000 0x00040000>;
 
-		status = "disabled";
 
 		child1 {
 			...
diff --git a/Documentation/devicetree/bindings/clock/alphascale,acc.txt b/Documentation/devicetree/bindings/clock/alphascale,acc.txt
index 62e67e883e76..b3205b21c9d0 100644
--- a/Documentation/devicetree/bindings/clock/alphascale,acc.txt
+++ b/Documentation/devicetree/bindings/clock/alphascale,acc.txt
@@ -102,7 +102,6 @@ uart4: serial@80010000 {
 	reg = <0x80010000 0x4000>;
 	clocks = <&acc CLKID_SYS_UART4>, <&acc CLKID_AHB_UART4>;
 	interrupts = <19>;
-	status = "disabled";
 };
 
 Clock consumer with only one, _AHB_ sink.
diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
index a55d31b48d6e..faa6d8ac5834 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
@@ -41,5 +41,4 @@ Example: UART controller node that consumes the clock and reset generated
 		interrupts = <0 90 1>;
 		clocks = <&clkc_AO CLKID_AO_UART1>;
 		resets = <&clkc_AO RESET_AO_UART1>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
index a09d627b5508..924040769186 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
@@ -33,5 +33,4 @@ Example: UART controller node that consumes the clock generated by the clock
 		reg = <0xc81004c0 0x14>;
 		interrupts = <0 90 1>;
 		clocks = <&clkc CLKID_CLK81>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
index 606da38c0959..207682647d33 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
@@ -39,5 +39,4 @@ Example: UART controller node that consumes the clock generated by the clock
 		reg = <0xc81004c0 0x14>;
 		interrupts = <0 90 1>;
 		clocks = <&clkc CLKID_CLK81>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/clock/brcm,kona-ccu.txt b/Documentation/devicetree/bindings/clock/brcm,kona-ccu.txt
index 5286e260fcae..8e5a7d868557 100644
--- a/Documentation/devicetree/bindings/clock/brcm,kona-ccu.txt
+++ b/Documentation/devicetree/bindings/clock/brcm,kona-ccu.txt
@@ -46,7 +46,6 @@ Device tree example:
 
 	uart@3e002000 {
 		compatible = "brcm,bcm11351-dw-apb-uart", "snps,dw-apb-uart";
-		status = "disabled";
 		reg = <0x3e002000 0x1000>;
 		clocks = <&slave_ccu BCM281XX_SLAVE_CCU_UARTB3>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
index 1dc80f8811fe..fe885abc9cb4 100644
--- a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
@@ -465,5 +465,4 @@ Example 3: UART controller node that consumes the clock generated by the clock
 		clock-names = "uart", "clk_uart_baud0";
 		pinctrl-names = "default";
 		pinctrl-0 = <&uart0_bus>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/clock/hi3660-clock.txt b/Documentation/devicetree/bindings/clock/hi3660-clock.txt
index cc9b86c35758..0035a7ecaf20 100644
--- a/Documentation/devicetree/bindings/clock/hi3660-clock.txt
+++ b/Documentation/devicetree/bindings/clock/hi3660-clock.txt
@@ -38,5 +38,4 @@ Examples:
 		clocks = <&crg_ctrl HI3660_CLK_MUX_UART0>,
 			 <&crg_ctrl HI3660_PCLK>;
 		clock-names = "uartclk", "apb_pclk";
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/clock/hix5hd2-clock.txt b/Documentation/devicetree/bindings/clock/hix5hd2-clock.txt
index 7894a64887cb..4733e58e491b 100644
--- a/Documentation/devicetree/bindings/clock/hix5hd2-clock.txt
+++ b/Documentation/devicetree/bindings/clock/hix5hd2-clock.txt
@@ -27,5 +27,4 @@ Examples:
 		interrupts = <0 49 4>;
 		clocks = <&clock HIX5HD2_FIXED_83M>;
 		clock-names = "apb_pclk";
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/clock/imx21-clock.txt b/Documentation/devicetree/bindings/clock/imx21-clock.txt
index c3b0db437c48..806f63d628bd 100644
--- a/Documentation/devicetree/bindings/clock/imx21-clock.txt
+++ b/Documentation/devicetree/bindings/clock/imx21-clock.txt
@@ -24,5 +24,4 @@ Examples:
 		clocks = <&clks IMX21_CLK_UART1_IPG_GATE>,
 			 <&clks IMX21_CLK_PER1>;
 		clock-names = "ipg", "per";
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/clock/imx23-clock.txt b/Documentation/devicetree/bindings/clock/imx23-clock.txt
index 5083c0b834b2..8385348d3bd9 100644
--- a/Documentation/devicetree/bindings/clock/imx23-clock.txt
+++ b/Documentation/devicetree/bindings/clock/imx23-clock.txt
@@ -67,5 +67,4 @@ auart0: serial@8006c000 {
 	reg = <0x8006c000 0x2000>;
 	interrupts = <24 25 23>;
 	clocks = <&clks 32>;
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/clock/imx25-clock.txt b/Documentation/devicetree/bindings/clock/imx25-clock.txt
index ba6b312ff8a5..f8135ea9ca4e 100644
--- a/Documentation/devicetree/bindings/clock/imx25-clock.txt
+++ b/Documentation/devicetree/bindings/clock/imx25-clock.txt
@@ -157,5 +157,4 @@ uart1: serial@43f90000 {
 	interrupts = <45>;
 	clocks = <&clks 79>, <&clks 50>;
 	clock-names = "ipg", "per";
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/clock/imx27-clock.txt b/Documentation/devicetree/bindings/clock/imx27-clock.txt
index cc05de9ec393..4c95c048d3b2 100644
--- a/Documentation/devicetree/bindings/clock/imx27-clock.txt
+++ b/Documentation/devicetree/bindings/clock/imx27-clock.txt
@@ -24,5 +24,4 @@ Examples:
 		clocks = <&clks IMX27_CLK_UART1_IPG_GATE>,
 			 <&clks IMX27_CLK_PER1_GATE>;
 		clock-names = "ipg", "per";
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/clock/imx28-clock.txt b/Documentation/devicetree/bindings/clock/imx28-clock.txt
index e6587af62ff0..d84a37d2885f 100644
--- a/Documentation/devicetree/bindings/clock/imx28-clock.txt
+++ b/Documentation/devicetree/bindings/clock/imx28-clock.txt
@@ -90,5 +90,4 @@ auart0: serial@8006a000 {
 	reg = <0x8006a000 0x2000>;
 	interrupts = <112 70 71>;
 	clocks = <&clks 45>;
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/clock/imx31-clock.txt b/Documentation/devicetree/bindings/clock/imx31-clock.txt
index 8163d565f697..0a291090e562 100644
--- a/Documentation/devicetree/bindings/clock/imx31-clock.txt
+++ b/Documentation/devicetree/bindings/clock/imx31-clock.txt
@@ -87,5 +87,4 @@ uart1: serial@43f90000 {
 	interrupts = <45>;
 	clocks = <&clks 10>, <&clks 30>;
 	clock-names = "ipg", "per";
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/clock/imx5-clock.txt b/Documentation/devicetree/bindings/clock/imx5-clock.txt
index cadc4d29ada6..a24ca9e582d2 100644
--- a/Documentation/devicetree/bindings/clock/imx5-clock.txt
+++ b/Documentation/devicetree/bindings/clock/imx5-clock.txt
@@ -25,5 +25,4 @@ can1: can@53fc8000 {
 	interrupts = <82>;
 	clocks = <&clks IMX5_CLK_CAN1_IPG_GATE>, <&clks IMX5_CLK_CAN1_SERIAL_GATE>;
 	clock-names = "ipg", "per";
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.txt b/Documentation/devicetree/bindings/clock/imx6q-clock.txt
index 9252912a5b0e..aa0a4d423ef5 100644
--- a/Documentation/devicetree/bindings/clock/imx6q-clock.txt
+++ b/Documentation/devicetree/bindings/clock/imx6q-clock.txt
@@ -27,5 +27,4 @@ uart1: serial@02020000 {
 	interrupts = <0 26 0x04>;
 	clocks = <&clks IMX6QDL_CLK_UART_IPG>, <&clks IMX6QDL_CLK_UART_SERIAL>;
 	clock-names = "ipg", "per";
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
index 63f9d8277d48..dff236f524a7 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
@@ -66,7 +66,6 @@ clock@70110000 {
         #clock-cells = <0>;
         clock-output-names = "dfllCPU_out";
         vdd-cpu-supply = <&vdd_cpu>;
-        status = "okay";
 
         nvidia,sample-rate = <12500>;
         nvidia,droop-ctrl = <0x00000f00>;
diff --git a/Documentation/devicetree/bindings/clock/pxa-clock.txt b/Documentation/devicetree/bindings/clock/pxa-clock.txt
index 4b4a9024bd99..8f67239411fe 100644
--- a/Documentation/devicetree/bindings/clock/pxa-clock.txt
+++ b/Documentation/devicetree/bindings/clock/pxa-clock.txt
@@ -12,5 +12,4 @@ Examples:
 pxa2xx_clks: pxa2xx_clks@41300004 {
         compatible = "marvell,pxa-clocks";
         #clock-cells = <1>;
-        status = "okay";
 };
diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
index 0cd894f987a3..707a686d8d3e 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
@@ -81,5 +81,4 @@ Examples
 		dma-names = "tx", "rx";
 		power-domains = <&cpg>;
 		resets = <&cpg 310>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a7778-cpg-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,r8a7778-cpg-clocks.txt
index e4cdaf1cb333..7cc4c0330b53 100644
--- a/Documentation/devicetree/bindings/clock/renesas,r8a7778-cpg-clocks.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,r8a7778-cpg-clocks.txt
@@ -44,5 +44,4 @@ Examples
 		interrupts = <0 87 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp3_clks R8A7778_CLK_SDHI0>;
 		power-domains = <&cpg_clocks>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt
index bb51a33a1fbf..bb5d942075fb 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,rz-cpg-clocks.txt
@@ -50,5 +50,4 @@ Examples
 		clocks = <&mstp3_clks R7S72100_CLK_MTU2>;
 		clock-names = "fck";
 		power-domains = <&cpg_clocks>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/clock/samsung,s3c2410-clock.txt b/Documentation/devicetree/bindings/clock/samsung,s3c2410-clock.txt
index 822505e715ae..2632d3f13004 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s3c2410-clock.txt
+++ b/Documentation/devicetree/bindings/clock/samsung,s3c2410-clock.txt
@@ -46,5 +46,4 @@ Example: UART controller node that consumes the clock generated by the clock
 		interrupts = <1 23 3 4>, <1 23 4 4>;
 		clock-names = "uart", "clk_uart_baud2";
 		clocks = <&clocks PCLK_UART0>, <&clocks PCLK_UART0>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/clock/samsung,s3c2412-clock.txt b/Documentation/devicetree/bindings/clock/samsung,s3c2412-clock.txt
index 2b430960ba47..21a8c23e658f 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s3c2412-clock.txt
+++ b/Documentation/devicetree/bindings/clock/samsung,s3c2412-clock.txt
@@ -46,5 +46,4 @@ Example: UART controller node that consumes the clock generated by the clock
 		clock-names = "uart", "clk_uart_baud2", "clk_uart_baud3";
 		clocks = <&clocks PCLK_UART0>, <&clocks PCLK_UART0>,
 			 <&clocks SCLK_UART>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/clock/samsung,s3c2443-clock.txt b/Documentation/devicetree/bindings/clock/samsung,s3c2443-clock.txt
index e67bb05478af..985c0f574e9a 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s3c2443-clock.txt
+++ b/Documentation/devicetree/bindings/clock/samsung,s3c2443-clock.txt
@@ -52,5 +52,4 @@ Example: UART controller node that consumes the clock generated by the clock
 				"clk_uart_baud3";
 		clocks = <&clocks PCLK_UART0>, <&clocks PCLK_UART0>,
 				<&clocks SCLK_UART>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/clock/samsung,s3c64xx-clock.txt b/Documentation/devicetree/bindings/clock/samsung,s3c64xx-clock.txt
index fa171dc4bd3c..872ee8e0f041 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s3c64xx-clock.txt
+++ b/Documentation/devicetree/bindings/clock/samsung,s3c64xx-clock.txt
@@ -73,5 +73,4 @@ Example: UART controller node that consumes the clock generated by the clock
 					"clk_uart_baud3";
 			clocks = <&clock PCLK_UART0>, <&clocks PCLK_UART0>,
 					<&clock SCLK_UART>;
-			status = "disabled";
 		};
diff --git a/Documentation/devicetree/bindings/clock/samsung,s5pv210-clock.txt b/Documentation/devicetree/bindings/clock/samsung,s5pv210-clock.txt
index effd9401c133..15b48e20a061 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s5pv210-clock.txt
+++ b/Documentation/devicetree/bindings/clock/samsung,s5pv210-clock.txt
@@ -74,5 +74,4 @@ Example: UART controller node that consumes the clock generated by the clock
 				"clk_uart_baud1";
 		clocks = <&clocks UART0>, <&clocks UART0>,
 				<&clocks SCLK_UART0>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt b/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
index 585e8c191f50..10f7047755f3 100644
--- a/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
+++ b/Documentation/devicetree/bindings/clock/ti/dra7-atl.txt
@@ -81,13 +81,11 @@ atl: atl@4843c000 {
 				<&atl_clkin2_ck>, <&atl_clkin3_ck>;
 	clocks = <&atl_gfclk_mux>;
 	clock-names = "fck";
-	status = "disabled";
 };
 
 #include <dt-bindings/clk/ti-dra7-atl.h>
 
 &atl {
-	status = "okay";
 
 	atl2 {
 		bws = <DRA7_ATL_WS_MCASP2_FSX>;
diff --git a/Documentation/devicetree/bindings/clock/zx296702-clk.txt b/Documentation/devicetree/bindings/clock/zx296702-clk.txt
index 750442b65505..e85ecb510d56 100644
--- a/Documentation/devicetree/bindings/clock/zx296702-clk.txt
+++ b/Documentation/devicetree/bindings/clock/zx296702-clk.txt
@@ -31,5 +31,4 @@ uart0: serial@0x09405000 {
         reg = <0x09405000 0x1000>;
         interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&lsp1clk ZX296702_UART0_PCLK>;
-        status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/clock/zx296718-clk.txt b/Documentation/devicetree/bindings/clock/zx296718-clk.txt
index 4ad703808407..3a46bf0b2540 100644
--- a/Documentation/devicetree/bindings/clock/zx296718-clk.txt
+++ b/Documentation/devicetree/bindings/clock/zx296718-clk.txt
@@ -34,5 +34,4 @@ usbphy0:usb-phy0 {
 	#phy-cells = <0>;
 	clocks = <&topclk USB20_PHY_CLK>;
 	clock-names = "phyclk";
-	status = "okay";
 };
diff --git a/Documentation/devicetree/bindings/crypto/fsl-dcp.txt b/Documentation/devicetree/bindings/crypto/fsl-dcp.txt
index 6949e50f1f16..76a0b4e80e83 100644
--- a/Documentation/devicetree/bindings/crypto/fsl-dcp.txt
+++ b/Documentation/devicetree/bindings/crypto/fsl-dcp.txt
@@ -13,5 +13,4 @@ dcp@80028000 {
 	compatible = "fsl,imx28-dcp", "fsl,imx23-dcp";
 	reg = <0x80028000 0x2000>;
 	interrupts = <52 53>;
-	status = "okay";
 };
diff --git a/Documentation/devicetree/bindings/crypto/inside-secure-safexcel.txt b/Documentation/devicetree/bindings/crypto/inside-secure-safexcel.txt
index f69773f4252b..c08d5ad79b1f 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure-safexcel.txt
+++ b/Documentation/devicetree/bindings/crypto/inside-secure-safexcel.txt
@@ -25,5 +25,4 @@ Example:
 				  "eip";
 		clocks = <&cpm_syscon0 1 26>;
 		dma-mask = <0xff 0xffffffff>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/crypto/marvell-cesa.txt b/Documentation/devicetree/bindings/crypto/marvell-cesa.txt
index c6c6a4a045bd..28d3f2496b89 100644
--- a/Documentation/devicetree/bindings/crypto/marvell-cesa.txt
+++ b/Documentation/devicetree/bindings/crypto/marvell-cesa.txt
@@ -41,5 +41,4 @@ Examples:
 		clock-names = "cesa0", "cesa1";
 		marvell,crypto-srams = <&crypto_sram0>, <&crypto_sram1>;
 		marvell,crypto-sram-size = <0x600>;
-		status = "okay";
 	};
diff --git a/Documentation/devicetree/bindings/crypto/mv_cesa.txt b/Documentation/devicetree/bindings/crypto/mv_cesa.txt
index c0c35f00335b..d9b92e2f3138 100644
--- a/Documentation/devicetree/bindings/crypto/mv_cesa.txt
+++ b/Documentation/devicetree/bindings/crypto/mv_cesa.txt
@@ -29,5 +29,4 @@ Examples:
 		interrupts = <22>;
 		marvell,crypto-srams = <&crypto_sram>;
 		marvell,crypto-sram-size = <0x600>;
-		status = "okay";
 	};
diff --git a/Documentation/devicetree/bindings/crypto/rockchip-crypto.txt b/Documentation/devicetree/bindings/crypto/rockchip-crypto.txt
index 096df34b11c1..5e2ba385b8c9 100644
--- a/Documentation/devicetree/bindings/crypto/rockchip-crypto.txt
+++ b/Documentation/devicetree/bindings/crypto/rockchip-crypto.txt
@@ -25,5 +25,4 @@ Examples:
 		clock-names = "aclk", "hclk", "sclk", "apb_pclk";
 		resets = <&cru SRST_CRYPTO>;
 		reset-names = "crypto-rst";
-		status = "okay";
 	};
diff --git a/Documentation/devicetree/bindings/devfreq/event/rockchip-dfi.txt b/Documentation/devicetree/bindings/devfreq/event/rockchip-dfi.txt
index f2233138eba9..001dd63979a9 100644
--- a/Documentation/devicetree/bindings/devfreq/event/rockchip-dfi.txt
+++ b/Documentation/devicetree/bindings/devfreq/event/rockchip-dfi.txt
@@ -15,5 +15,4 @@ Example:
 		rockchip,pmu = <&pmugrf>;
 		clocks = <&cru PCLK_DDR_MON>;
 		clock-names = "pclk_ddr_mon";
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/devfreq/rk3399_dmc.txt b/Documentation/devicetree/bindings/devfreq/rk3399_dmc.txt
index 7a9e8603c150..d6d2833482c9 100644
--- a/Documentation/devicetree/bindings/devfreq/rk3399_dmc.txt
+++ b/Documentation/devicetree/bindings/devfreq/rk3399_dmc.txt
@@ -205,5 +205,4 @@ Example:
 		rockchip,phy_lpddr4_ck_cs_drv = <PHY_DRV_ODT_80>;
 		rockchip,phy_lpddr4_dq_drv = <PHY_DRV_ODT_80>;
 		rockchip,phy_lpddr4_odt = <PHY_DRV_ODT_60>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/display/atmel,lcdc.txt b/Documentation/devicetree/bindings/display/atmel,lcdc.txt
index ecb8da063d07..1a21202778ee 100644
--- a/Documentation/devicetree/bindings/display/atmel,lcdc.txt
+++ b/Documentation/devicetree/bindings/display/atmel,lcdc.txt
@@ -34,7 +34,6 @@ Example:
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_fb>;
 		display = <&display0>;
-		status = "okay";
 		#address-cells = <1>;
 		#size-cells = <1>;
 
diff --git a/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt b/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
index ec94468b35be..82f2acb3d374 100644
--- a/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
+++ b/Documentation/devicetree/bindings/display/atmel/hlcdc-dc.txt
@@ -23,7 +23,6 @@ Example:
 		interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
 		clocks = <&lcdc_clk>, <&lcdck>, <&clk32k>;
 		clock-names = "periph_clk","sys_clk", "slow_clk";
-		status = "disabled";
 
 		hlcdc-display-controller {
 			compatible = "atmel,hlcdc-display-controller";
diff --git a/Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt b/Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
index 7baa6582517e..aacc8b92968c 100644
--- a/Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
+++ b/Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
@@ -33,7 +33,6 @@ stdp2690-ge-b850v3-fw required properties:
 Example:
 
 &mux2_i2c2 {
-	status = "okay";
 	clock-frequency = <100000>;
 
 	stdp4028@73 {
diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
index 81b68580e199..cb7ffc58c564 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
@@ -43,7 +43,6 @@ Example:
 		clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 729>;
 		clock-names = "iahb", "isfr";
 		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-		status = "disabled";
 
 		ports {
 			#address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/display/fsl,tcon.txt b/Documentation/devicetree/bindings/display/fsl,tcon.txt
index 6fa4ab668db5..475008747801 100644
--- a/Documentation/devicetree/bindings/display/fsl,tcon.txt
+++ b/Documentation/devicetree/bindings/display/fsl,tcon.txt
@@ -14,5 +14,4 @@ timing-controller@4003d000 {
 	reg = <0x4003d000 0x1000>;
 	clocks = <&clks VF610_CLK_TCON0>;
 	clock-names = "ipg";
-	status = "okay";
 };
diff --git a/Documentation/devicetree/bindings/display/marvell,pxa2xx-lcdc.txt b/Documentation/devicetree/bindings/display/marvell,pxa2xx-lcdc.txt
index 309c47f25b87..f79641bd5f18 100644
--- a/Documentation/devicetree/bindings/display/marvell,pxa2xx-lcdc.txt
+++ b/Documentation/devicetree/bindings/display/marvell,pxa2xx-lcdc.txt
@@ -23,7 +23,6 @@ Example:
 		reg = <0x44000000 0x10000>;
 		interrupts = <17>;
 		clocks = <&clks CLK_LCD>;
-		status = "okay";
 
 		port {
 			lcdc_out: endpoint {
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
index 5c70a8380e58..d0f55161579a 100644
--- a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
+++ b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
@@ -18,6 +18,5 @@ Example:
 			power-supply = <...>;
 			backlight = <&backlight>;
 			enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
-			status = "okay";
 		};
 	};
diff --git a/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
index 47665a12786f..43561584c13a 100644
--- a/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
+++ b/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
@@ -59,7 +59,6 @@ Example:
 		pinctrl-names = "default";
 		pinctrl-0 = <&edp_hpd>;
 
-		status = "disabled";
 
 		ports {
 			#address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
index 046076c6b277..82a348fad5d4 100644
--- a/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
+++ b/Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
@@ -43,7 +43,6 @@ hdmi: hdmi@ff980000 {
 	interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
 	clocks = <&cru  PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_HDCP>;
 	clock-names = "iahb", "isfr";
-	status = "disabled";
 	ports {
 		hdmi_in: port {
 			#address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
index 543b07435f4f..6bb59ab39f2f 100644
--- a/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
+++ b/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
@@ -36,7 +36,6 @@ Example:
 		resets = <&cru SRST_MIPIDSI0>;
 		reset-names = "apb";
 		rockchip,grf = <&grf>;
-		status = "okay";
 
 		ports {
 			#address-cells = <1>;
@@ -65,6 +64,5 @@ Example:
 			pinctrl-names = "default";
 			pinctrl-0 = <&lcd_en>;
 			backlight = <&backlight>;
-			status = "okay";
 		};
 	};
diff --git a/Documentation/devicetree/bindings/display/rockchip/inno_hdmi-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/inno_hdmi-rockchip.txt
index 8096a29f9776..cec21714f0e0 100644
--- a/Documentation/devicetree/bindings/display/rockchip/inno_hdmi-rockchip.txt
+++ b/Documentation/devicetree/bindings/display/rockchip/inno_hdmi-rockchip.txt
@@ -25,7 +25,6 @@ hdmi: hdmi@20034000 {
 	clock-names = "pclk";
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmi_ctl>;
-	status = "disabled";
 
 	hdmi_in: port {
 		#address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer-sunxi.txt b/Documentation/devicetree/bindings/display/simple-framebuffer-sunxi.txt
index c46ba641a1df..a9168ae6946c 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer-sunxi.txt
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer-sunxi.txt
@@ -28,6 +28,5 @@ chosen {
 		allwinner,pipeline = "de_be0-lcd0-hdmi";
 		clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 43>,
 			 <&ahb_gates 44>;
-		status = "disabled";
 	};
 };
diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index b83e6018041d..8ab9330ab27a 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -260,7 +260,6 @@ hdmi: hdmi@01c16000 {
 	       <&dma SUN4I_DMA_NORMAL 16>,
 	       <&dma SUN4I_DMA_DEDICATED 24>;
 	dma-names = "ddc-tx", "ddc-rx", "audio-tx";
-	status = "disabled";
 
 	ports {
 		#address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/dma/fsl-edma.txt b/Documentation/devicetree/bindings/dma/fsl-edma.txt
index 191d7bd8a6fe..97e213e07660 100644
--- a/Documentation/devicetree/bindings/dma/fsl-edma.txt
+++ b/Documentation/devicetree/bindings/dma/fsl-edma.txt
@@ -72,5 +72,4 @@ sai2: sai@40031000 {
 	dma-names = "tx", "rx";
 	dmas = <&edma0 0 21>,
 		<&edma0 0 20>;
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/dma/mv-xor.txt b/Documentation/devicetree/bindings/dma/mv-xor.txt
index c075f5988135..0ffb4d8766a8 100644
--- a/Documentation/devicetree/bindings/dma/mv-xor.txt
+++ b/Documentation/devicetree/bindings/dma/mv-xor.txt
@@ -30,7 +30,6 @@ xor@d0060900 {
 	reg = <0xd0060900 0x100
 	       0xd0060b00 0x100>;
 	clocks = <&coreclk 0>;
-	status = "okay";
 
 	xor00 {
 	      interrupts = <51>;
diff --git a/Documentation/devicetree/bindings/dma/qcom_adm.txt b/Documentation/devicetree/bindings/dma/qcom_adm.txt
index 9bcab9115982..9d3b2f917b7b 100644
--- a/Documentation/devicetree/bindings/dma/qcom_adm.txt
+++ b/Documentation/devicetree/bindings/dma/qcom_adm.txt
@@ -48,7 +48,6 @@ Each dmas request consists of 3 cells:
 Example:
 
 	spi4: spi@1a280000 {
-		status = "ok";
 		spi-max-frequency = <50000000>;
 
 		pinctrl-0 = <&spi_pins>;
diff --git a/Documentation/devicetree/bindings/dma/snps-dma.txt b/Documentation/devicetree/bindings/dma/snps-dma.txt
index 4775c66f4508..a122723907ac 100644
--- a/Documentation/devicetree/bindings/dma/snps-dma.txt
+++ b/Documentation/devicetree/bindings/dma/snps-dma.txt
@@ -63,7 +63,6 @@ Example:
 		compatible = "arm,pl011", "arm,primecell";
 		reg = <0xe0000000 0x1000>;
 		interrupts = <0 35 0x4>;
-		status = "disabled";
 		dmas = <&dmahost 12 0 1>,
 			<&dmahost 13 0 1 0>;
 		dma-names = "rx", "rx";
diff --git a/Documentation/devicetree/bindings/dma/st_fdma.txt b/Documentation/devicetree/bindings/dma/st_fdma.txt
index 495d853c569b..52cfec9e77ad 100644
--- a/Documentation/devicetree/bindings/dma/st_fdma.txt
+++ b/Documentation/devicetree/bindings/dma/st_fdma.txt
@@ -69,7 +69,6 @@ Example:
 
 	sti_uni_player2: sti-uni-player@2 {
 		compatible = "st,sti-uni-player";
-		status = "disabled";
 		#sound-dai-cells = <0>;
 		st,syscfg = <&syscfg_core>;
 		clocks = <&clk_s_d0_flexgen CLK_PCM_2>;
diff --git a/Documentation/devicetree/bindings/dma/ste-dma40.txt b/Documentation/devicetree/bindings/dma/ste-dma40.txt
index 95800ab37bb0..aa7dbd565ad0 100644
--- a/Documentation/devicetree/bindings/dma/ste-dma40.txt
+++ b/Documentation/devicetree/bindings/dma/ste-dma40.txt
@@ -135,5 +135,4 @@ Example:
 		       <&dma 13 0 0x0>; /* Logical - MemToDev */
 		dma-names = "rx", "rx";
 
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/dma/sun4i-dma.txt b/Documentation/devicetree/bindings/dma/sun4i-dma.txt
index f1634a27a830..3b484380c56a 100644
--- a/Documentation/devicetree/bindings/dma/sun4i-dma.txt
+++ b/Documentation/devicetree/bindings/dma/sun4i-dma.txt
@@ -40,7 +40,6 @@ Example:
 		clock-names = "ahb", "mod";
 		dmas = <&dma 1 29>, <&dma 1 28>;
 		dma-names = "rx", "tx";
-		status = "disabled";
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
diff --git a/Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt b/Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
index aead5869a28d..b849a1ed389d 100644
--- a/Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
+++ b/Documentation/devicetree/bindings/dma/ti-dma-crossbar.txt
@@ -62,7 +62,6 @@ uart1: serial@4806a000 {
 	interrupts-extended = <&gic GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
 	ti,hwmods = "uart1";
 	clock-frequency = <48000000>;
-	status = "disabled";
 	/* Requesting crossbar input 49 and 50 */
 	dmas = <&sdma_xbar 49>, <&sdma_xbar 50>;
 	dma-names = "tx", "rx";
diff --git a/Documentation/devicetree/bindings/dma/ti-edma.txt b/Documentation/devicetree/bindings/dma/ti-edma.txt
index 18090e7226b4..33d9e386dc45 100644
--- a/Documentation/devicetree/bindings/dma/ti-edma.txt
+++ b/Documentation/devicetree/bindings/dma/ti-edma.txt
@@ -102,7 +102,6 @@ mcasp0: mcasp@48038000 {
 	reg-names = "mpu", "dat";
 	interrupts = <80>, <81>;
 	interrupt-names = "tx", "rx";
-	status = "disabled";
 	/* DMA channels 8 and 9 executed on eDMA TC2 - high priority queue */
 	dmas = <&edma 8 2>,
 	       <&edma 9 2>;
diff --git a/Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt b/Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt
index 9766f7472f51..cfa4ed42b62f 100644
--- a/Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt
+++ b/Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt
@@ -31,7 +31,6 @@ Example for full FPGA configuration:
 		cell-index = <1>;
 		interrupts = <92>;
 		clocks = <&coreclk 0>;
-		status = "okay";
 
 		fpga_mgr_spi: fpga-mgr@0 {
 			compatible = "xlnx,fpga-slave-serial";
diff --git a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt b/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
index 4b6cc632ca5c..69d46162d0f5 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
@@ -23,7 +23,6 @@ gpio0: gpio@1100 {
 	#gpio-cells = <2>;
 	reg = <0x1100 0x080>;
 	interrupts = <78 0x8>;
-	status = "okay";
 };
 
 Example of gpio-controller node for a ls2080a SoC:
diff --git a/Documentation/devicetree/bindings/gpio/spear_spics.txt b/Documentation/devicetree/bindings/gpio/spear_spics.txt
index 96c37eb15075..dd04d96e6ff1 100644
--- a/Documentation/devicetree/bindings/gpio/spear_spics.txt
+++ b/Documentation/devicetree/bindings/gpio/spear_spics.txt
@@ -42,7 +42,6 @@ spics: spics@e0700000{
 
 
 spi0: spi@e0100000 {
-        status = "okay";
         num-cs = <3>;
         cs-gpios = <&gpio1 7 0>, <&spics 0>,
                    <&spics 1>;
diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
index b7e4c7444510..f32bbba4d3bc 100644
--- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
+++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
@@ -51,7 +51,6 @@ Example for GK20A:
 		resets = <&tegra_car 184>;
 		reset-names = "gpu";
 		iommus = <&mc TEGRA_SWGROUP_GPU>;
-		status = "disabled";
 	};
 
 Example for GM20B:
@@ -70,7 +69,6 @@ Example for GM20B:
 		resets = <&tegra_car 184>;
 		reset-names = "gpu";
 		iommus = <&mc TEGRA_SWGROUP_GPU>;
-		status = "disabled";
 	};
 
 Example for GP10B:
@@ -89,5 +87,4 @@ Example for GP10B:
 		reset-names = "gpu";
 		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_GPU>;
 		iommus = <&smmu TEGRA186_SID_GPU>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
index c4f358dafdaa..1e7959332dbc 100644
--- a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
+++ b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
@@ -24,5 +24,4 @@ Example:
 		interrupts = <0 89 0>;
 		clocks = <&clock 177>, <&clock 277>;
 		clock-names = "sclk_fimg2d", "fimg2d";
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/hsi/omap-ssi.txt b/Documentation/devicetree/bindings/hsi/omap-ssi.txt
index f26625e42693..b8eca3c7810d 100644
--- a/Documentation/devicetree/bindings/hsi/omap-ssi.txt
+++ b/Documentation/devicetree/bindings/hsi/omap-ssi.txt
@@ -92,6 +92,5 @@ ssi-controller@48058000 {
 		interrupts = <69>,
 			     <70>;
 
-		status = "disabled"; /* second port is not used on N900 */
 	}
 }
diff --git a/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.txt b/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.txt
index 7ce23ac61308..81b5d55086fa 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.txt
@@ -102,7 +102,6 @@ And for clarification, here are the snipplets for the i2c-parents:
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "i2c-gpio";
-		status = "disabled";
 		gpios = <&gpio5 6 GPIO_ACTIVE_HIGH /* sda */
 			 &gpio5 5 GPIO_ACTIVE_HIGH /* scl */
 			>;
diff --git a/Documentation/devicetree/bindings/i2c/i2c-efm32.txt b/Documentation/devicetree/bindings/i2c/i2c-efm32.txt
index 50b25c3da186..3b30e54ae3c7 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-efm32.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-efm32.txt
@@ -22,7 +22,6 @@ Example:
 		interrupts = <9>;
 		clocks = <&cmu clk_HFPERCLKI2C0>;
 		clock-frequency = <100000>;
-		status = "ok";
 		energymicro,location = <3>;
 
 		eeprom@50 {
diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
index 656716b72cc4..f64064f8bdc2 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
@@ -71,5 +71,4 @@ Example:
 		reset-names = "i2c";
 		dmas = <&apbdma 16>, <&apbdma 16>;
 		dma-names = "rx", "tx";
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/iio/adc/brcm,iproc-static-adc.txt b/Documentation/devicetree/bindings/iio/adc/brcm,iproc-static-adc.txt
index caaaed765ce4..7b1b1e4086d4 100644
--- a/Documentation/devicetree/bindings/iio/adc/brcm,iproc-static-adc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/brcm,iproc-static-adc.txt
@@ -37,5 +37,4 @@ For example:
 		clocks = <&asiu_clks BCM_CYGNUS_ASIU_ADC_CLK>;
 		clock-names = "tsc_clk";
 		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/iio/adc/lpc1850-adc.txt b/Documentation/devicetree/bindings/iio/adc/lpc1850-adc.txt
index 0bcae5140bc5..9ada5abd45fa 100644
--- a/Documentation/devicetree/bindings/iio/adc/lpc1850-adc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/lpc1850-adc.txt
@@ -17,5 +17,4 @@ adc0: adc@400e3000 {
 	clocks = <&ccu1 CLK_APB3_ADC0>;
 	vref-supply = <&reg_vdda>;
 	resets = <&rgu 40>;
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/iio/dac/lpc1850-dac.txt b/Documentation/devicetree/bindings/iio/dac/lpc1850-dac.txt
index 7d6647d4af5e..42db783c4e75 100644
--- a/Documentation/devicetree/bindings/iio/dac/lpc1850-dac.txt
+++ b/Documentation/devicetree/bindings/iio/dac/lpc1850-dac.txt
@@ -16,5 +16,4 @@ dac: dac@400e1000 {
 	clocks = <&ccu1 CLK_APB3_DAC>;
 	vref-supply = <&reg_vdda>;
 	resets = <&rgu 42>;
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt b/Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt
index b77f50bd6403..262deab73588 100644
--- a/Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt
+++ b/Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt
@@ -72,7 +72,6 @@ Example:
 		/* Required Board specific properties */
 		keypad,num-rows = <5>;
 		keypad,num-columns = <5>;
-		status = "okay";
 
 		linux,keymap = <MATRIX_KEY(0x00, 0x02, KEY_F) /* key_forward */
 		MATRIX_KEY(0x00, 0x03, KEY_HOME) /* key_home */
diff --git a/Documentation/devicetree/bindings/input/touchscreen/colibri-vf50-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/colibri-vf50-ts.txt
index 9d9e930f3251..df531b5b6a0d 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/colibri-vf50-ts.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/colibri-vf50-ts.txt
@@ -32,5 +32,4 @@ Example:
 		pinctrl-1 = <&pinctrl_touchctrl_default>;
 		pinctrl-2 = <&pinctrl_touchctrl_gpios>;
 		vf50-ts-min-pressure = <200>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/imx6ul_tsc.txt b/Documentation/devicetree/bindings/input/touchscreen/imx6ul_tsc.txt
index d4927c202aef..e67e58b61706 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/imx6ul_tsc.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/imx6ul_tsc.txt
@@ -35,5 +35,4 @@ Example:
 		measure-delay-time = <0xfff>;
 		pre-charge-time = <0xffff>;
 		touchscreen-average-samples = <32>;
-		status = "okay";
 	};
diff --git a/Documentation/devicetree/bindings/media/pxa-camera.txt b/Documentation/devicetree/bindings/media/pxa-camera.txt
index 11f5b5d51af8..bc03ec096269 100644
--- a/Documentation/devicetree/bindings/media/pxa-camera.txt
+++ b/Documentation/devicetree/bindings/media/pxa-camera.txt
@@ -24,7 +24,6 @@ Example:
 		clock-frequency = <50000000>;
 		clock-output-names = "qci_mclk";
 
-		status = "okay";
 
 		port {
 			#address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/media/s5p-cec.txt b/Documentation/devicetree/bindings/media/s5p-cec.txt
index 1b1a10ba48ce..6f3756da900f 100644
--- a/Documentation/devicetree/bindings/media/s5p-cec.txt
+++ b/Documentation/devicetree/bindings/media/s5p-cec.txt
@@ -33,5 +33,4 @@ hdmicec: cec@100B0000 {
 	hdmi-phandle = <&hdmi>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmi_cec>;
-	status = "okay";
 };
diff --git a/Documentation/devicetree/bindings/media/samsung-fimc.txt b/Documentation/devicetree/bindings/media/samsung-fimc.txt
index 922d6f8e74be..e4e15d8d7521 100644
--- a/Documentation/devicetree/bindings/media/samsung-fimc.txt
+++ b/Documentation/devicetree/bindings/media/samsung-fimc.txt
@@ -166,7 +166,6 @@ Example:
 		clock-output-names = "cam_a_clkout", "cam_b_clkout";
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam_port_a_clk_active>;
-		status = "okay";
 		#address-cells = <1>;
 		#size-cells = <1>;
 
@@ -189,7 +188,6 @@ Example:
 			compatible = "samsung,exynos4210-fimc";
 			reg = <0x11800000 0x1000>;
 			interrupts = <0 85 0>;
-			status = "okay";
 		};
 
 		csis_0: csis@11880000 {
diff --git a/Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt b/Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt
index cc51b1fd6e0c..6af3fc210ecc 100644
--- a/Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt
+++ b/Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt
@@ -52,7 +52,6 @@ Example:
 
 	c8sectpfe@08a20000 {
 		compatible = "st,stih407-c8sectpfe";
-		status = "okay";
 		reg = <0x08a20000 0x10000>, <0x08a00000 0x4000>;
 		reg-names = "stfe", "stfe-ram";
 		interrupts = <GIC_SPI 34 IRQ_TYPE_NONE>, <GIC_SPI 35 IRQ_TYPE_NONE>;
diff --git a/Documentation/devicetree/bindings/media/ti,da850-vpif.txt b/Documentation/devicetree/bindings/media/ti,da850-vpif.txt
index df7182a63e59..e47c7ccc57f1 100644
--- a/Documentation/devicetree/bindings/media/ti,da850-vpif.txt
+++ b/Documentation/devicetree/bindings/media/ti,da850-vpif.txt
@@ -59,7 +59,6 @@ I2C-connected TVP5147 decoder:
 	tvp5147@5d {
 		compatible = "ti,tvp5147";
 		reg = <0x5d>;
-		status = "okay";
 
 		port {
 			composite_in: endpoint {
diff --git a/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt b/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
index 1ee3bc09f319..8b9388cc1ccc 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/mvebu-devbus.txt
@@ -130,7 +130,6 @@ The reg property implicitly specifies the chip select as this:
 Example:
 
 	devbus-bootcs@d0010400 {
-		status = "okay";
 		ranges = <0 0xf0000000 0x1000000>; /* @addr 0xf0000000, size 0x1000000 */
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/Documentation/devicetree/bindings/mfd/act8945a.txt b/Documentation/devicetree/bindings/mfd/act8945a.txt
index 462819ac3da8..e6f168db6c72 100644
--- a/Documentation/devicetree/bindings/mfd/act8945a.txt
+++ b/Documentation/devicetree/bindings/mfd/act8945a.txt
@@ -12,7 +12,6 @@ Example:
 	pmic@5b {
 		compatible = "active-semi,act8945a";
 		reg = <0x5b>;
-		status = "okay";
 
 		active-semi,vsel-high;
 
@@ -79,6 +78,5 @@ Example:
 			active-semi,input-voltage-threshold-microvolt = <6600>;
 			active-semi,precondition-timeout = <40>;
 			active-semi,total-timeout = <3>;
-			status = "okay";
 		};
 	};
diff --git a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
index eec40be7f79a..3f643ef121ff 100644
--- a/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
+++ b/Documentation/devicetree/bindings/mfd/atmel-hlcdc.txt
@@ -25,7 +25,6 @@ Example:
 		clocks = <&lcdc_clk>, <&lcdck>, <&clk32k>;
 		clock-names = "periph_clk","sys_clk", "slow_clk";
 		interrupts = <36 IRQ_TYPE_LEVEL_HIGH 0>;
-		status = "disabled";
 
 		hlcdc-display-controller {
 			compatible = "atmel,hlcdc-display-controller";
diff --git a/Documentation/devicetree/bindings/mfd/da9052-i2c.txt b/Documentation/devicetree/bindings/mfd/da9052-i2c.txt
index 9554292dc6cb..d0d7fe4ddd1a 100644
--- a/Documentation/devicetree/bindings/mfd/da9052-i2c.txt
+++ b/Documentation/devicetree/bindings/mfd/da9052-i2c.txt
@@ -29,7 +29,6 @@ Sub-nodes:
 Examples:
 
 i2c@63fc8000 { /* I2C1 */
-	status = "okay";
 
 	pmic: dialog@48 {
 		compatible = "dlg,da9053-aa";
diff --git a/Documentation/devicetree/bindings/mfd/mc13xxx.txt b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
index 8aba48821a85..39ba4146769d 100644
--- a/Documentation/devicetree/bindings/mfd/mc13xxx.txt
+++ b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
@@ -116,7 +116,6 @@ ecspi@70010000 { /* ECSPI1 */
 	fsl,spi-num-chipselects = <2>;
 	cs-gpios = <&gpio4 24 0>, /* GPIO4_24 */
 		   <&gpio4 25 0>; /* GPIO4_25 */
-	status = "okay";
 
 	pmic: mc13892@0 {
 		#address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/mfd/mxs-lradc.txt b/Documentation/devicetree/bindings/mfd/mxs-lradc.txt
index 555fb117d4fa..755cbef0647d 100644
--- a/Documentation/devicetree/bindings/mfd/mxs-lradc.txt
+++ b/Documentation/devicetree/bindings/mfd/mxs-lradc.txt
@@ -26,7 +26,6 @@ Example for i.MX23 SoC:
 		compatible = "fsl,imx23-lradc";
 		reg = <0x80050000 0x2000>;
 		interrupts = <36 37 38 39 40 41 42 43 44>;
-		status = "okay";
 		fsl,lradc-touchscreen-wires = <4>;
 		fsl,ave-ctrl = <4>;
 		fsl,ave-delay = <2>;
@@ -39,7 +38,6 @@ Example for i.MX28 SoC:
 		compatible = "fsl,imx28-lradc";
 		reg = <0x80050000 0x2000>;
 		interrupts = <10 14 15 16 17 18 19 20 21 22 23 24 25>;
-		status = "okay";
 		fsl,lradc-touchscreen-wires = <5>;
 		fsl,ave-ctrl = <4>;
 		fsl,ave-delay = <2>;
diff --git a/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt
index df664018c148..d759da606f75 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt
+++ b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt
@@ -57,7 +57,6 @@ audio-subsystem {
 		clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2s0_bus>;
-		status = "disabled";
 	};
 
 	serial_3: serial@11460000 {
@@ -69,6 +68,5 @@ audio-subsystem {
 		clock-names = "uart", "clk_uart_baud0";
 		pinctrl-names = "default";
 		pinctrl-0 = <&uart_aud_bus>;
-		status = "disabled";
 	};
  };
diff --git a/Documentation/devicetree/bindings/misc/atmel-ssc.txt b/Documentation/devicetree/bindings/misc/atmel-ssc.txt
index f8629bb73945..f9fb412642fe 100644
--- a/Documentation/devicetree/bindings/misc/atmel-ssc.txt
+++ b/Documentation/devicetree/bindings/misc/atmel-ssc.txt
@@ -47,5 +47,4 @@ ssc0: ssc@f0010000 {
       dma-names = "tx", "rx";
       pinctrl-names = "default";
       pinctrl-0 = <&pinctrl_ssc0_tx &pinctrl_ssc0_rx>;
-      status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/mmc/arasan,sdhci.txt b/Documentation/devicetree/bindings/mmc/arasan,sdhci.txt
index 49df630bd44f..60481bfc3d31 100644
--- a/Documentation/devicetree/bindings/mmc/arasan,sdhci.txt
+++ b/Documentation/devicetree/bindings/mmc/arasan,sdhci.txt
@@ -74,5 +74,4 @@ Example:
 		phys = <&emmc_phy>;
 		phy-names = "phy_arasan";
 		#clock-cells = <0>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/mmc/davinci_mmc.txt b/Documentation/devicetree/bindings/mmc/davinci_mmc.txt
index e5a0140b2381..516fb0143d4c 100644
--- a/Documentation/devicetree/bindings/mmc/davinci_mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/davinci_mmc.txt
@@ -24,7 +24,6 @@ mmc0: mmc@1c40000 {
 	compatible = "ti,da830-mmc",
 	reg = <0x40000 0x1000>;
 	interrupts = <16>;
-	status = "okay";
 	bus-width = <4>;
 	max-frequency = <50000000>;
 	dmas = <&edma 16
diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-mmc.txt b/Documentation/devicetree/bindings/mmc/fsl-imx-mmc.txt
index db442355cd24..184ccffe2739 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-imx-mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/fsl-imx-mmc.txt
@@ -20,5 +20,4 @@ sdhci1: sdhci@10014000 {
 	dma-names = "rx-tx";
 	bus-width = <4>;
 	cd-gpios = <&gpio3 29>;
-	status = "okay";
 };
diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.txt b/Documentation/devicetree/bindings/mmc/mmc-card.txt
index a70fcd65b9ea..8d2d71758907 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-card.txt
+++ b/Documentation/devicetree/bindings/mmc/mmc-card.txt
@@ -21,7 +21,6 @@ Example:
 	vmmc-supply = <&reg_vcc3v3>;
 	bus-width = <8>;
 	non-removable;
-	status = "okay";
 
 	mmccard: mmccard@0 {
 		reg = <0>;
diff --git a/Documentation/devicetree/bindings/mmc/mmc.txt b/Documentation/devicetree/bindings/mmc/mmc.txt
index c7f4a0ec48ed..b32ade645ad9 100644
--- a/Documentation/devicetree/bindings/mmc/mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/mmc.txt
@@ -153,7 +153,6 @@ mmc3: mmc@01c12000 {
 	bus-width = <4>;
 	non-removable;
 	mmc-pwrseq = <&sdhci0_pwrseq>
-	status = "okay";
 
 	brcmf: bcrmf@1 {
 		reg = <1>;
diff --git a/Documentation/devicetree/bindings/mmc/orion-sdio.txt b/Documentation/devicetree/bindings/mmc/orion-sdio.txt
index 84f0ebd67a13..10f0818a34c5 100644
--- a/Documentation/devicetree/bindings/mmc/orion-sdio.txt
+++ b/Documentation/devicetree/bindings/mmc/orion-sdio.txt
@@ -13,5 +13,4 @@ Example:
 		reg = <0xd00d4000 0x200>;
 		interrupts = <54>;
 		clocks = <&gateclk 17>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/mmc/sdhci-st.txt b/Documentation/devicetree/bindings/mmc/sdhci-st.txt
index 230fd696eb92..e35645598315 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-st.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-st.txt
@@ -63,7 +63,6 @@ Example:
 
 mmc0: sdhci@fe81e000 {
 	compatible	= "st,sdhci";
-	status		= "disabled";
 	reg		= <0xfe81e000 0x1000>;
 	interrupts	= <GIC_SPI 127 IRQ_TYPE_NONE>;
 	interrupt-names	= "mmcirq";
@@ -77,7 +76,6 @@ mmc0: sdhci@fe81e000 {
 
 mmc1: sdhci@09080000 {
 	compatible	= "st,sdhci-stih407", "st,sdhci";
-	status		= "disabled";
 	reg		= <0x09080000 0x7ff>;
 	reg-names	= "mmc";
 	interrupts	= <GIC_SPI 90 IRQ_TYPE_NONE>;
@@ -94,7 +92,6 @@ mmc1: sdhci@09080000 {
 
 mmc0: sdhci@09060000 {
 	compatible	= "st,sdhci-stih407", "st,sdhci";
-	status		= "disabled";
 	reg		= <0x09060000 0x7ff>, <0x9061008 0x20>;
 	reg-names	= "mmc", "top-mmc-delay";
 	interrupts	= <GIC_SPI 92 IRQ_TYPE_NONE>;
diff --git a/Documentation/devicetree/bindings/mmc/zx-dw-mshc.txt b/Documentation/devicetree/bindings/mmc/zx-dw-mshc.txt
index eaade0e5adeb..9d4b3fadb9a0 100644
--- a/Documentation/devicetree/bindings/mmc/zx-dw-mshc.txt
+++ b/Documentation/devicetree/bindings/mmc/zx-dw-mshc.txt
@@ -29,5 +29,4 @@ Example:
 		max-frequency = <50000000>;
 		cap-sdio-irq;
 		cap-sd-highspeed;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt b/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
index 489807005eda..b93c1e2f25dd 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
@@ -24,7 +24,6 @@ spi@f0020000 {
 	#size-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_spi0_default>;
-	status = "okay";
 
 	m25p80@0 {
 		...
diff --git a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
index 5ded66ad7aef..840f9405dcf0 100644
--- a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
@@ -37,7 +37,6 @@ nor_flash: spi@1100d000 {
 	clock-names = "spi", "sf";
 	#address-cells = <1>;
 	#size-cells = <0>;
-	status = "disabled";
 
 	flash@0 {
 		compatible = "jedec,spi-nor";
diff --git a/Documentation/devicetree/bindings/mtd/st-fsm.txt b/Documentation/devicetree/bindings/mtd/st-fsm.txt
index c2489391c437..54cef9ef3083 100644
--- a/Documentation/devicetree/bindings/mtd/st-fsm.txt
+++ b/Documentation/devicetree/bindings/mtd/st-fsm.txt
@@ -21,6 +21,5 @@ Example:
 		st,syscfg	   = <&syscfg_rear>;
 	        st,boot-device-reg = <0x958>;
 	        st,boot-device-spi = <0x1a>;
-		status = "okay";
 	};
 
diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
index f322f56aef74..a37c67bcb43b 100644
--- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
@@ -41,7 +41,6 @@ nfc: nand@01c03000 {
 	#size-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&nand_pins_a &nand_cs0_pins_a &nand_rb0_pins_a>;
-	status = "okay";
 
 	nand@0 {
 		reg = <0>;
diff --git a/Documentation/devicetree/bindings/net/brcm,amac.txt b/Documentation/devicetree/bindings/net/brcm,amac.txt
index 2fefa1a44afd..ab6ef085389a 100644
--- a/Documentation/devicetree/bindings/net/brcm,amac.txt
+++ b/Documentation/devicetree/bindings/net/brcm,amac.txt
@@ -26,5 +26,4 @@ amac0: ethernet@18022000 {
 	      <0x18110000 0x1000>;
 	reg-names = "amac_base", "idm_base";
 	interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/net/brcm,bgmac-nsp.txt b/Documentation/devicetree/bindings/net/brcm,bgmac-nsp.txt
index 022946caa7e2..b46da51915c4 100644
--- a/Documentation/devicetree/bindings/net/brcm,bgmac-nsp.txt
+++ b/Documentation/devicetree/bindings/net/brcm,bgmac-nsp.txt
@@ -20,5 +20,4 @@ gmac0: ethernet@18022000 {
 	      <0x18110000 0x1000>;
 	reg-names = "gmac_base", "idm_base";
 	interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/net/btusb.txt b/Documentation/devicetree/bindings/net/btusb.txt
index 01fa2d4188d4..9c5e663fa1af 100644
--- a/Documentation/devicetree/bindings/net/btusb.txt
+++ b/Documentation/devicetree/bindings/net/btusb.txt
@@ -29,7 +29,6 @@ Example:
 Following example uses irq pin number 3 of gpio0 for out of band wake-on-bt:
 
 &usb_host1_ehci {
-    status = "okay";
     #address-cells = <1>;
     #size-cells = <0>;
 
diff --git a/Documentation/devicetree/bindings/net/can/m_can.txt b/Documentation/devicetree/bindings/net/can/m_can.txt
index 9e331777c203..78138333ff7a 100644
--- a/Documentation/devicetree/bindings/net/can/m_can.txt
+++ b/Documentation/devicetree/bindings/net/can/m_can.txt
@@ -56,7 +56,6 @@ m_can1: can@020e8000 {
 		 <&clks IMX6SX_CLK_CANFD>;
 	clock-names = "hclk", "cclk";
 	bosch,mram-cfg = <0x0 0 0 32 0 0 0 1>;
-	status = "disabled";
 };
 
 Board dts:
diff --git a/Documentation/devicetree/bindings/net/dsa/ksz.txt b/Documentation/devicetree/bindings/net/dsa/ksz.txt
index 0ab8b39d0b30..fd23904ac68e 100644
--- a/Documentation/devicetree/bindings/net/dsa/ksz.txt
+++ b/Documentation/devicetree/bindings/net/dsa/ksz.txt
@@ -24,7 +24,6 @@ Ethernet switch connected via SPI to the host, CPU port wired to eth0:
                                              pinctrl-0 = <&pinctrl_spi_ksz>;
                                              cs-gpios = <&pioC 25 0>;
                                              id = <1>;
-                                             status = "okay";
 
                                              ksz9477: ksz9477@0 {
                                                              compatible = "microchip,ksz9477";
@@ -34,7 +33,6 @@ Ethernet switch connected via SPI to the host, CPU port wired to eth0:
                                                              spi-cpha;
                                                              spi-cpol;
 
-                                                             status = "okay";
                                                              ports {
                                                                              #address-cells = <1>;
                                                                              #size-cells = <0>;
diff --git a/Documentation/devicetree/bindings/net/dsa/lan9303.txt b/Documentation/devicetree/bindings/net/dsa/lan9303.txt
index 04f2965a4467..4448d063ddf6 100644
--- a/Documentation/devicetree/bindings/net/dsa/lan9303.txt
+++ b/Documentation/devicetree/bindings/net/dsa/lan9303.txt
@@ -27,7 +27,6 @@ Example:
 I2C managed mode:
 
 	master: masterdevice@X {
-		status = "okay";
 
 		fixed-link { /* RMII fixed link to LAN9303 */
 			speed = <100>;
@@ -38,7 +37,6 @@ I2C managed mode:
 	switch: switch@a {
 		compatible = "smsc,lan9303-i2c";
 		reg = <0xa>;
-		status = "okay";
 		reset-gpios = <&gpio7 6 GPIO_ACTIVE_LOW>;
 		reset-duration = <200>;
 
@@ -67,7 +65,6 @@ I2C managed mode:
 MDIO managed mode:
 
 	master: masterdevice@X {
-		status = "okay";
 		phy-handle = <&switch>;
 
 		mdio {
diff --git a/Documentation/devicetree/bindings/net/ftgmac100.txt b/Documentation/devicetree/bindings/net/ftgmac100.txt
index c1ce1680246f..72e7aaf7242e 100644
--- a/Documentation/devicetree/bindings/net/ftgmac100.txt
+++ b/Documentation/devicetree/bindings/net/ftgmac100.txt
@@ -30,6 +30,5 @@ Example:
 		compatible = "aspeed,ast2500-mac", "faraday,ftgmac100";
 		reg = <0x1e660000 0x180>;
 		interrupts = <2>;
-		status = "okay";
 		use-ncsi;
 	};
diff --git a/Documentation/devicetree/bindings/net/marvell-armada-370-neta.txt b/Documentation/devicetree/bindings/net/marvell-armada-370-neta.txt
index ae4234ca4ee4..bedcfd5a52cd 100644
--- a/Documentation/devicetree/bindings/net/marvell-armada-370-neta.txt
+++ b/Documentation/devicetree/bindings/net/marvell-armada-370-neta.txt
@@ -41,7 +41,6 @@ ethernet@70000 {
 	interrupts = <8>;
 	clocks = <&gate_clk 4>;
 	tx-csum-limit = <9800>
-	status = "okay";
 	phy = <&phy0>;
 	phy-mode = "rgmii-id";
 	buffer-manager = <&bm>;
diff --git a/Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt b/Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
index 9be1059ff03f..3d27c68613a6 100644
--- a/Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
+++ b/Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
@@ -44,7 +44,6 @@ Example for SDIO device follows (calibration data is also available in
 below example).
 
 &mmc3 {
-	status = "okay";
 	vmmc-supply = <&wlan_en_reg>;
 	bus-width = <4>;
 	cap-power-off-card;
@@ -70,7 +69,6 @@ below example).
 Example for USB device:
 
 &usb_host1_ohci {
-    status = "okay";
     #address-cells = <1>;
     #size-cells = <0>;
 
diff --git a/Documentation/devicetree/bindings/net/marvell-neta-bm.txt b/Documentation/devicetree/bindings/net/marvell-neta-bm.txt
index c1b1d7c3bde1..07b31050dbe5 100644
--- a/Documentation/devicetree/bindings/net/marvell-neta-bm.txt
+++ b/Documentation/devicetree/bindings/net/marvell-neta-bm.txt
@@ -31,7 +31,6 @@ bm: bm@c8000 {
 	reg = <0xc8000 0xac>;
 	clocks = <&gateclk 13>;
 	internal-mem = <&bm_bppi>;
-	status = "okay";
 	pool2,capacity = <4096>;
 	pool1,pkt-size = <512>;
 };
@@ -45,5 +44,4 @@ bm_bppi: bm-bppi {
 	#address-cells = <1>;
 	#size-cells = <1>;
 	clocks = <&gateclk 13>;
-	status = "okay";
 };
diff --git a/Documentation/devicetree/bindings/net/marvell-pp2.txt b/Documentation/devicetree/bindings/net/marvell-pp2.txt
index 6b4956beff8c..f85a62ca9edd 100644
--- a/Documentation/devicetree/bindings/net/marvell-pp2.txt
+++ b/Documentation/devicetree/bindings/net/marvell-pp2.txt
@@ -52,12 +52,10 @@ ethernet@f0000 {
 	      <0xc5000 0x100>;
 	clocks = <&gateclk 3>, <&gateclk 19>;
 	clock-names = "pp_clk", "gop_clk";
-	status = "okay";
 
 	eth0: eth0@c4000 {
 		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 		port-id = <0>;
-		status = "okay";
 		phy = <&phy0>;
 		phy-mode = "gmii";
 	};
@@ -65,7 +63,6 @@ ethernet@f0000 {
 	eth1: eth1@c5000 {
 		interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 		port-id = <1>;
-		status = "okay";
 		phy = <&phy3>;
 		phy-mode = "gmii";
 	};
diff --git a/Documentation/devicetree/bindings/net/meson-dwmac.txt b/Documentation/devicetree/bindings/net/meson-dwmac.txt
index 0703ad3f3c1e..354dd9896bb5 100644
--- a/Documentation/devicetree/bindings/net/meson-dwmac.txt
+++ b/Documentation/devicetree/bindings/net/meson-dwmac.txt
@@ -66,5 +66,4 @@ Example for GXBB:
 				<&clkc CLKID_MPLL2>;
 		clock-names = "stmmaceth", "clkin0", "clkin1";
 		phy-mode = "rgmii";
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt b/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
index c35b5b428a7f..42a248301615 100644
--- a/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
+++ b/Documentation/devicetree/bindings/net/micrel-ksz90x1.txt
@@ -69,7 +69,6 @@ Examples:
 		};
 	};
 	ethernet@70000 {
-		status = "okay";
 		phy = <&phy0>;
 		phy-mode = "rgmii-id";
 	};
diff --git a/Documentation/devicetree/bindings/net/microchip,enc28j60.txt b/Documentation/devicetree/bindings/net/microchip,enc28j60.txt
index 1dc3bc75539d..44dff53d4dda 100644
--- a/Documentation/devicetree/bindings/net/microchip,enc28j60.txt
+++ b/Documentation/devicetree/bindings/net/microchip,enc28j60.txt
@@ -33,7 +33,6 @@ Example (for NXP i.MX28 with pin control stuff for GPIO irq):
                 compatible = "fsl,imx28-spi";
                 pinctrl-names = "default";
                 pinctrl-0 = <&spi2_pins_b &spi2_sck_cfg>;
-                status = "okay";
 
                 enc28j60: ethernet@0 {
                         compatible = "microchip,enc28j60";
diff --git a/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt b/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
index 76df9173825a..c9b35251bb20 100644
--- a/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
+++ b/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
@@ -25,7 +25,6 @@ Optional I2C-based chip specific properties:
 Example (for ARM-based BeagleBoard Black with 88W8887 on UART5):
 
 &uart5 {
-	status = "okay";
 
 	nfcmrvluart: nfcmrvluart@5 {
 		compatible = "marvell,nfc-uart";
@@ -41,7 +40,6 @@ Example (for ARM-based BeagleBoard Black with 88W8887 on UART5):
 Example (for ARM-based BeagleBoard Black with 88W8887 on I2C1):
 
 &i2c1 {
-	status = "okay";
 	clock-frequency = <400000>;
 
 	nfcmrvli2c0: i2c@1 {
diff --git a/Documentation/devicetree/bindings/net/nfc/nxp-nci.txt b/Documentation/devicetree/bindings/net/nfc/nxp-nci.txt
index 5b6cd9b3f628..92486733df71 100644
--- a/Documentation/devicetree/bindings/net/nfc/nxp-nci.txt
+++ b/Documentation/devicetree/bindings/net/nfc/nxp-nci.txt
@@ -17,7 +17,6 @@ Example (for ARM-based BeagleBone with NPC100 NFC controller on I2C2):
 
 &i2c2 {
 
-	status = "okay";
 
 	npc100: npc100@29 {
 
diff --git a/Documentation/devicetree/bindings/net/nfc/pn533-i2c.txt b/Documentation/devicetree/bindings/net/nfc/pn533-i2c.txt
index 1aea822d4530..122460e42e3c 100644
--- a/Documentation/devicetree/bindings/net/nfc/pn533-i2c.txt
+++ b/Documentation/devicetree/bindings/net/nfc/pn533-i2c.txt
@@ -15,7 +15,6 @@ Example (for ARM-based BeagleBone with PN532 on I2C2):
 
 &i2c2 {
 
-	status = "okay";
 
 	pn532: pn532@24 {
 
diff --git a/Documentation/devicetree/bindings/net/nfc/pn544.txt b/Documentation/devicetree/bindings/net/nfc/pn544.txt
index dab69f36167c..538a86f7b2b0 100644
--- a/Documentation/devicetree/bindings/net/nfc/pn544.txt
+++ b/Documentation/devicetree/bindings/net/nfc/pn544.txt
@@ -17,7 +17,6 @@ Example (for ARM-based BeagleBone with PN544 on I2C2):
 
 &i2c2 {
 
-	status = "okay";
 
 	pn544: pn544@28 {
 
diff --git a/Documentation/devicetree/bindings/net/nfc/s3fwrn5.txt b/Documentation/devicetree/bindings/net/nfc/s3fwrn5.txt
index fb1e75facf1b..ed5b3eaadb39 100644
--- a/Documentation/devicetree/bindings/net/nfc/s3fwrn5.txt
+++ b/Documentation/devicetree/bindings/net/nfc/s3fwrn5.txt
@@ -12,7 +12,6 @@ Required properties:
 Example:
 
 &hsi2c_4 {
-	status = "okay";
 	s3fwrn5@27 {
 		compatible = "samsung,s3fwrn5-i2c";
 
diff --git a/Documentation/devicetree/bindings/net/nfc/st-nci-i2c.txt b/Documentation/devicetree/bindings/net/nfc/st-nci-i2c.txt
index 263732e8879f..b46d473be425 100644
--- a/Documentation/devicetree/bindings/net/nfc/st-nci-i2c.txt
+++ b/Documentation/devicetree/bindings/net/nfc/st-nci-i2c.txt
@@ -20,7 +20,6 @@ Example (for ARM-based BeagleBoard xM with ST21NFCB on I2C2):
 
 &i2c2 {
 
-	status = "okay";
 
 	st21nfcb: st21nfcb@8 {
 
diff --git a/Documentation/devicetree/bindings/net/nfc/st-nci-spi.txt b/Documentation/devicetree/bindings/net/nfc/st-nci-spi.txt
index 711ca85a363d..54ce8e7ac681 100644
--- a/Documentation/devicetree/bindings/net/nfc/st-nci-spi.txt
+++ b/Documentation/devicetree/bindings/net/nfc/st-nci-spi.txt
@@ -19,7 +19,6 @@ Example (for ARM-based BeagleBoard xM with ST21NFCB on SPI4):
 
 &mcspi4 {
 
-	status = "okay";
 
 	st21nfcb: st21nfcb@0 {
 
diff --git a/Documentation/devicetree/bindings/net/nfc/st21nfca.txt b/Documentation/devicetree/bindings/net/nfc/st21nfca.txt
index 7bb2e213d6f9..5ee9440fa9ad 100644
--- a/Documentation/devicetree/bindings/net/nfc/st21nfca.txt
+++ b/Documentation/devicetree/bindings/net/nfc/st21nfca.txt
@@ -20,7 +20,6 @@ Example (for ARM-based BeagleBoard xM with ST21NFCA on I2C2):
 
 &i2c2 {
 
-	status = "okay";
 
 	st21nfca: st21nfca@1 {
 
diff --git a/Documentation/devicetree/bindings/net/nfc/st95hf.txt b/Documentation/devicetree/bindings/net/nfc/st95hf.txt
index ea3178bc9ddd..08a202e00d47 100644
--- a/Documentation/devicetree/bindings/net/nfc/st95hf.txt
+++ b/Documentation/devicetree/bindings/net/nfc/st95hf.txt
@@ -35,12 +35,10 @@ spi@9840000 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	cs-gpios = <&pio0 4>;
-	status = "okay";
 
 	st95hf@0{
 		reg = <0>;
 		compatible = "st,st95hf";
-		status = "okay";
 		spi-max-frequency = <1000000>;
 		enable-gpio = <&pio4 0>;
 		interrupt-parent = <&pio0>;
diff --git a/Documentation/devicetree/bindings/net/nfc/trf7970a.txt b/Documentation/devicetree/bindings/net/nfc/trf7970a.txt
index 60c833d62181..5ca9362ef127 100644
--- a/Documentation/devicetree/bindings/net/nfc/trf7970a.txt
+++ b/Documentation/devicetree/bindings/net/nfc/trf7970a.txt
@@ -23,7 +23,6 @@ Optional SoC Specific Properties:
 Example (for ARM-based BeagleBone with TRF7970A on SPI1):
 
 &spi1 {
-	status = "okay";
 
 	nfc@0 {
 		compatible = "ti,trf7970a";
@@ -41,6 +40,5 @@ Example (for ARM-based BeagleBone with TRF7970A on SPI1):
 		irq-status-read-quirk;
 		en2-rf-quirk;
 		clock-frequency = <27120000>;
-		status = "okay";
 	};
 };
diff --git a/Documentation/devicetree/bindings/net/oxnas-dwmac.txt b/Documentation/devicetree/bindings/net/oxnas-dwmac.txt
index df0534e2eda1..d7117a22fd87 100644
--- a/Documentation/devicetree/bindings/net/oxnas-dwmac.txt
+++ b/Documentation/devicetree/bindings/net/oxnas-dwmac.txt
@@ -35,5 +35,4 @@ etha: ethernet@40400000 {
 	/* Regmap for sys registers */
 	oxsemi,sys-ctrl = <&sys>;
 
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/net/qca,qca7000.txt b/Documentation/devicetree/bindings/net/qca,qca7000.txt
index 6d9efb2eb9a5..3987846b3fd3 100644
--- a/Documentation/devicetree/bindings/net/qca,qca7000.txt
+++ b/Documentation/devicetree/bindings/net/qca,qca7000.txt
@@ -41,7 +41,6 @@ ssp2: spi@80014000 {
 	compatible = "fsl,imx28-spi";
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi2_pins_a>;
-	status = "okay";
 
 	qca7000: ethernet@0 {
 		compatible = "qca,qca7000";
@@ -78,7 +77,6 @@ auart0: serial@8006a000 {
 	reg = <0x8006a000 0x2000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&auart0_2pins_a>;
-	status = "okay";
 
 	qca7000: ethernet {
 		compatible = "qca,qca7000";
diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.txt b/Documentation/devicetree/bindings/net/rockchip-dwmac.txt
index 8f427550720a..f4766855483e 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.txt
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.txt
@@ -70,5 +70,4 @@ gmac: ethernet@ff290000 {
 	tx_delay = <0x30>;
 	rx_delay = <0x10>;
 
-	status = "ok";
 };
diff --git a/Documentation/devicetree/bindings/net/smsc-lan87xx.txt b/Documentation/devicetree/bindings/net/smsc-lan87xx.txt
index 974edd5c85cc..8b7c719b0bb9 100644
--- a/Documentation/devicetree/bindings/net/smsc-lan87xx.txt
+++ b/Documentation/devicetree/bindings/net/smsc-lan87xx.txt
@@ -15,7 +15,6 @@ smsc phy with disabled energy detect mode on an am335x based board.
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&davinci_mdio_default>;
 	pinctrl-1 = <&davinci_mdio_sleep>;
-	status = "okay";
 
 	ethernetphy0: ethernet-phy@0 {
 		reg = <0>;
diff --git a/Documentation/devicetree/bindings/net/socfpga-dwmac.txt b/Documentation/devicetree/bindings/net/socfpga-dwmac.txt
index 2e68a3cd8513..b30d04b54ee9 100644
--- a/Documentation/devicetree/bindings/net/socfpga-dwmac.txt
+++ b/Documentation/devicetree/bindings/net/socfpga-dwmac.txt
@@ -40,7 +40,6 @@ gmii_to_sgmii_converter: phy@0x100000240 {
 gmac0: ethernet@ff700000 {
 	compatible = "altr,socfpga-stmmac", "snps,dwmac-3.70a", "snps,dwmac";
 	altr,sysmgr-syscon = <&sysmgr 0x60 0>;
-	status = "disabled";
 	reg = <0xff700000 0x2000>;
 	interrupts = <0 115 4>;
 	interrupt-names = "macirq";
diff --git a/Documentation/devicetree/bindings/net/sti-dwmac.txt b/Documentation/devicetree/bindings/net/sti-dwmac.txt
index d05c1e1fd9b6..062c5174add3 100644
--- a/Documentation/devicetree/bindings/net/sti-dwmac.txt
+++ b/Documentation/devicetree/bindings/net/sti-dwmac.txt
@@ -34,7 +34,6 @@ Example:
 
 ethernet0: dwmac@9630000 {
 	device_type = "network";
-	status = "disabled";
 	compatible = "st,stih407-dwmac", "snps,dwmac", "snps,dwmac-3.710";
 	reg = <0x9630000 0x8000>;
 	reg-names = "stmmaceth";
diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.txt b/Documentation/devicetree/bindings/net/stm32-dwmac.txt
index c35afb7e956a..489dbcb66c5a 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.txt
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.txt
@@ -18,7 +18,6 @@ Example:
 
 	ethernet@40028000 {
 		compatible = "st,stm32-dwmac", "snps,dwmac-3.50a";
-		status = "disabled";
 		reg = <0x40028000 0x8000>;
 		reg-names = "stmmaceth";
 		interrupts = <0 61 0>, <0 62 0>;
diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
index 590f622188de..b2bd4704f859 100644
--- a/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
+++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
@@ -29,7 +29,6 @@ mmc3: mmc@01c12000 {
 	vmmc-supply = <&reg_vmmc3>;
 	bus-width = <4>;
 	non-removable;
-	status = "okay";
 
 	brcmf: wifi@1 {
 		reg = <1>;
diff --git a/Documentation/devicetree/bindings/net/wireless/esp,esp8089.txt b/Documentation/devicetree/bindings/net/wireless/esp,esp8089.txt
index 19331bb4ff6e..6830c4786f8a 100644
--- a/Documentation/devicetree/bindings/net/wireless/esp,esp8089.txt
+++ b/Documentation/devicetree/bindings/net/wireless/esp,esp8089.txt
@@ -21,7 +21,6 @@ Example:
 	mmc-pwrseq = <&wifi_pwrseq>;
 	bus-width = <4>;
 	non-removable;
-	status = "okay";
 
 	esp8089: sdio_wifi@1 {
 		compatible = "esp,esp8089";
diff --git a/Documentation/devicetree/bindings/net/wireless/marvell-8xxx.txt b/Documentation/devicetree/bindings/net/wireless/marvell-8xxx.txt
index 0854451ff91d..59de8646862d 100644
--- a/Documentation/devicetree/bindings/net/wireless/marvell-8xxx.txt
+++ b/Documentation/devicetree/bindings/net/wireless/marvell-8xxx.txt
@@ -48,7 +48,6 @@ IRQ pin 38 is used as system wakeup source interrupt. wakeup pin 3 is configured
 so that firmware can wakeup host using this device side pin.
 
 &mmc3 {
-	status = "okay";
 	vmmc-supply = <&wlan_en_reg>;
 	mmc-pwrseq = <&wifi_pwrseq>;
 	bus-width = <4>;
diff --git a/Documentation/devicetree/bindings/net/wireless/ti,wlcore.txt b/Documentation/devicetree/bindings/net/wireless/ti,wlcore.txt
index 7b2cbb14113e..f42f6b0f1bc7 100644
--- a/Documentation/devicetree/bindings/net/wireless/ti,wlcore.txt
+++ b/Documentation/devicetree/bindings/net/wireless/ti,wlcore.txt
@@ -31,7 +31,6 @@ clock, new bindings (for parsing the clock nodes) have to be added.
 Example:
 
 &mmc3 {
-	status = "okay";
 	vmmc-supply = <&wlan_en_reg>;
 	bus-width = <4>;
 	cap-power-off-card;
diff --git a/Documentation/devicetree/bindings/nvmem/mxs-ocotp.txt b/Documentation/devicetree/bindings/nvmem/mxs-ocotp.txt
index daebce9e6b07..372c72fd64dc 100644
--- a/Documentation/devicetree/bindings/nvmem/mxs-ocotp.txt
+++ b/Documentation/devicetree/bindings/nvmem/mxs-ocotp.txt
@@ -21,5 +21,4 @@ Example for i.MX28:
 		#size-cells = <1>;
 		reg = <0x8002c000 0x2000>;
 		clocks = <&clks 25>;
-		status = "okay";
 	};
diff --git a/Documentation/devicetree/bindings/opp/opp.txt b/Documentation/devicetree/bindings/opp/opp.txt
index e36d261b9ba6..9d733af26be7 100644
--- a/Documentation/devicetree/bindings/opp/opp.txt
+++ b/Documentation/devicetree/bindings/opp/opp.txt
@@ -464,7 +464,6 @@ Example 5: opp-supported-hw
 
 	opp_table {
 		compatible = "operating-points-v2";
-		status = "okay";
 		opp-shared;
 
 		opp-600000000 {
diff --git a/Documentation/devicetree/bindings/pci/aardvark-pci.txt b/Documentation/devicetree/bindings/pci/aardvark-pci.txt
index bbcd9f4c501f..310ef7145c47 100644
--- a/Documentation/devicetree/bindings/pci/aardvark-pci.txt
+++ b/Documentation/devicetree/bindings/pci/aardvark-pci.txt
@@ -33,7 +33,6 @@ Example:
 	pcie0: pcie@d0070000 {
 		compatible = "marvell,armada-3700-pcie";
 		device_type = "pci";
-		status = "disabled";
 		reg = <0 0xd0070000 0 0x20000>;
 		#address-cells = <3>;
 		#size-cells = <2>;
diff --git a/Documentation/devicetree/bindings/pci/hisilicon-pcie.txt b/Documentation/devicetree/bindings/pci/hisilicon-pcie.txt
index a339dbb15493..7a579c816951 100644
--- a/Documentation/devicetree/bindings/pci/hisilicon-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/hisilicon-pcie.txt
@@ -40,7 +40,6 @@ Hip05 Example (note that Hip06 is the same except compatible):
 				 0x0 0 0 2 &mbigen_pcie 2 11
 				 0x0 0 0 3 &mbigen_pcie 3 12
 				 0x0 0 0 4 &mbigen_pcie 4 13>;
-		status = "ok";
 	};
 
 HiSilicon Hip06/Hip07 PCIe host bridge DT (almost-ECAM) description.
@@ -83,5 +82,4 @@ Example:
 				 0x0 0 0 2 &mbigen_pcie0 650 4
 				 0x0 0 0 3 &mbigen_pcie0 650 4
 				 0x0 0 0 4 &mbigen_pcie0 650 4>;
-		status = "ok";
 	};
diff --git a/Documentation/devicetree/bindings/pci/mvebu-pci.txt b/Documentation/devicetree/bindings/pci/mvebu-pci.txt
index 2de6f65ecfb1..9c7fce69570b 100644
--- a/Documentation/devicetree/bindings/pci/mvebu-pci.txt
+++ b/Documentation/devicetree/bindings/pci/mvebu-pci.txt
@@ -85,7 +85,6 @@ Example:
 
 pcie-controller {
 	compatible = "marvell,armada-xp-pcie";
-	status = "disabled";
 	device_type = "pci";
 
 	#address-cells = <3>;
@@ -147,7 +146,6 @@ pcie-controller {
 		/* wait 20ms for device settle after reset deassertion */
 		reset-delay-us = <20000>;
 		clocks = <&gateclk 5>;
-		status = "disabled";
 	};
 
 	pcie@2,0 {
@@ -164,7 +162,6 @@ pcie-controller {
 		marvell,pcie-port = <0>;
 		marvell,pcie-lane = <1>;
 		clocks = <&gateclk 6>;
-		status = "disabled";
 	};
 
 	pcie@3,0 {
@@ -181,7 +178,6 @@ pcie-controller {
 		marvell,pcie-port = <0>;
 		marvell,pcie-lane = <2>;
 		clocks = <&gateclk 7>;
-		status = "disabled";
 	};
 
 	pcie@4,0 {
@@ -198,7 +194,6 @@ pcie-controller {
 		marvell,pcie-port = <0>;
 		marvell,pcie-lane = <3>;
 		clocks = <&gateclk 8>;
-		status = "disabled";
 	};
 
 	pcie@5,0 {
@@ -215,7 +210,6 @@ pcie-controller {
 		marvell,pcie-port = <1>;
 		marvell,pcie-lane = <0>;
 		clocks = <&gateclk 9>;
-		status = "disabled";
 	};
 
 	pcie@6,0 {
@@ -232,7 +226,6 @@ pcie-controller {
 		marvell,pcie-port = <1>;
 		marvell,pcie-lane = <1>;
 		clocks = <&gateclk 10>;
-		status = "disabled";
 	};
 
 	pcie@7,0 {
@@ -249,7 +242,6 @@ pcie-controller {
 		marvell,pcie-port = <1>;
 		marvell,pcie-lane = <2>;
 		clocks = <&gateclk 11>;
-		status = "disabled";
 	};
 
 	pcie@8,0 {
@@ -266,7 +258,6 @@ pcie-controller {
 		marvell,pcie-port = <1>;
 		marvell,pcie-lane = <3>;
 		clocks = <&gateclk 12>;
-		status = "disabled";
 	};
 
 	pcie@9,0 {
@@ -283,7 +274,6 @@ pcie-controller {
 		marvell,pcie-port = <2>;
 		marvell,pcie-lane = <0>;
 		clocks = <&gateclk 26>;
-		status = "disabled";
 	};
 
 	pcie@10,0 {
@@ -300,6 +290,5 @@ pcie-controller {
 		marvell,pcie-port = <3>;
 		marvell,pcie-lane = <0>;
 		clocks = <&gateclk 27>;
-		status = "disabled";
 	};
 };
diff --git a/Documentation/devicetree/bindings/pci/pci-armada8k.txt b/Documentation/devicetree/bindings/pci/pci-armada8k.txt
index 598533a57d79..6b115fd10fec 100644
--- a/Documentation/devicetree/bindings/pci/pci-armada8k.txt
+++ b/Documentation/devicetree/bindings/pci/pci-armada8k.txt
@@ -34,5 +34,4 @@ Example:
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 		num-lanes = <1>;
 		clocks = <&cpm_syscon0 1 13>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/pci/rcar-pci.txt b/Documentation/devicetree/bindings/pci/rcar-pci.txt
index bd27428dda61..a7e3dd43b2a8 100644
--- a/Documentation/devicetree/bindings/pci/rcar-pci.txt
+++ b/Documentation/devicetree/bindings/pci/rcar-pci.txt
@@ -54,5 +54,4 @@ SoC specific DT Entry:
 		interrupt-map = <0 0 0 0 &gic 0 116 4>;
 		clocks = <&mstp3_clks R8A7791_CLK_PCIE>, <&pcie_bus_clk>;
 		clock-names = "pcie", "pcie_bus";
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/pci/xgene-pci-msi.txt b/Documentation/devicetree/bindings/pci/xgene-pci-msi.txt
index 36d881c8e6d4..54bac7f8860c 100644
--- a/Documentation/devicetree/bindings/pci/xgene-pci-msi.txt
+++ b/Documentation/devicetree/bindings/pci/xgene-pci-msi.txt
@@ -44,7 +44,6 @@ SoC DTSI:
 
 	+ PCIe controller node with msi-parent property pointing to MSI node:
 	pcie0: pcie@1f2b0000 {
-		status = "disabled";
 		device_type = "pci";
 		compatible = "apm,xgene-storm-pcie", "apm,xgene-pcie";
 		#interrupt-cells = <1>;
diff --git a/Documentation/devicetree/bindings/phy/apm-xgene-phy.txt b/Documentation/devicetree/bindings/phy/apm-xgene-phy.txt
index 5f3a65a9dd88..e1bb12711fbf 100644
--- a/Documentation/devicetree/bindings/phy/apm-xgene-phy.txt
+++ b/Documentation/devicetree/bindings/phy/apm-xgene-phy.txt
@@ -61,19 +61,16 @@ Example:
 			compatible = "apm,xgene-phy";
 			reg = <0x0 0x1f21a000 0x0 0x100>;
 			#phy-cells = <1>;
-			status = "disabled";
 		};
 
 		phy2: phy@1f22a000 {
 			compatible = "apm,xgene-phy";
 			reg = <0x0 0x1f22a000 0x0 0x100>;
 			#phy-cells = <1>;
-			status = "ok";
 		};
 
 		phy3: phy@1f23a000 {
 			compatible = "apm,xgene-phy";
 			reg = <0x0 0x1f23a000 0x0 0x100>;
 			#phy-cells = <1>;
-			status = "ok";
 		};
diff --git a/Documentation/devicetree/bindings/phy/keystone-usb-phy.txt b/Documentation/devicetree/bindings/phy/keystone-usb-phy.txt
index f37b3a86341d..300830dda0bf 100644
--- a/Documentation/devicetree/bindings/phy/keystone-usb-phy.txt
+++ b/Documentation/devicetree/bindings/phy/keystone-usb-phy.txt
@@ -16,5 +16,4 @@ usb_phy: usb_phy@2620738 {
 	#address-cells = <1>;
 	#size-cells = <1>;
 	reg = <0x2620738 32>;
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt b/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
index 0acc5a99fb79..7cfdfd1a1856 100644
--- a/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
+++ b/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
@@ -44,14 +44,12 @@ u3phy: usb-phy@11290000 {
 	#address-cells = <2>;
 	#size-cells = <2>;
 	ranges;
-	status = "okay";
 
 	u2port0: usb-phy@11290800 {
 		reg = <0 0x11290800 0 0x100>;
 		clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>;
 		clock-names = "ref";
 		#phy-cells = <1>;
-		status = "okay";
 	};
 
 	u3port0: usb-phy@11290900 {
@@ -59,7 +57,6 @@ u3phy: usb-phy@11290000 {
 		clocks = <&clk26m>;
 		clock-names = "ref";
 		#phy-cells = <1>;
-		status = "okay";
 	};
 
 	u2port1: usb-phy@11291000 {
@@ -67,7 +64,6 @@ u3phy: usb-phy@11290000 {
 		clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>;
 		clock-names = "ref";
 		#phy-cells = <1>;
-		status = "okay";
 	};
 };
 
diff --git a/Documentation/devicetree/bindings/phy/phy-mvebu.txt b/Documentation/devicetree/bindings/phy/phy-mvebu.txt
index f95b6260a3b3..64afdd13d91d 100644
--- a/Documentation/devicetree/bindings/phy/phy-mvebu.txt
+++ b/Documentation/devicetree/bindings/phy/phy-mvebu.txt
@@ -18,7 +18,6 @@ Example:
 			clocks = <&gate_clk 15>;
 			clock-names = "sata";
 			#phy-cells = <0>;
-			status = "ok";
 		};
 
 Armada 375 USB cluster
diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
index 84d59b0db8df..f6954b188cef 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
@@ -58,14 +58,12 @@ grf: syscon@ff770000 {
 				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "otg-id", "otg-bvalid", "linestate";
-			status = "okay";
 		};
 
 		u2phy_host: host-port {
 			#phy-cells = <0>;
 			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "linestate";
-			status = "okay";
 		};
 	};
 };
diff --git a/Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt b/Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt
index 86f2dbe07ed4..a1697c27aecd 100644
--- a/Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt
@@ -25,7 +25,6 @@ Example:
 			clock-names = "ref";
 			#phy-cells = <0>;
 
-			status = "ok";
 		};
 
 		phy@100f8830 {
@@ -35,5 +34,4 @@ Example:
 			clock-names = "ref";
 			#phy-cells = <0>;
 
-			status = "ok";
 		};
diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
index ab80bfe31cb3..1c40ccd40ce4 100644
--- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
+++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
@@ -82,7 +82,6 @@ usbphy: phy@125b0000 {
 	reg = <0x125b0000 0x100>;
 	clocks = <&clock 305>, <&clock 2>;
 	clock-names = "phy", "ref";
-	status = "okay";
 	#phy-cells = <1>;
 	samsung,sysreg-phandle = <&sys_reg>;
 	samsung,pmureg-phandle = <&pmu_reg>;
diff --git a/Documentation/devicetree/bindings/phy/sun9i-usb-phy.txt b/Documentation/devicetree/bindings/phy/sun9i-usb-phy.txt
index 1cca85c709d1..f9853156e311 100644
--- a/Documentation/devicetree/bindings/phy/sun9i-usb-phy.txt
+++ b/Documentation/devicetree/bindings/phy/sun9i-usb-phy.txt
@@ -33,6 +33,5 @@ Example:
 		clock-names = "hsic_480M", "hsic_12M", "phy";
 		resets = <&usb_phy_clk 18>, <&usb_phy_clk 19>;
 		reset-names = "hsic", "phy";
-		status = "disabled";
 		#phy-cells = <0>;
 	};
diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
index 590e60378be3..3e23fece99da 100644
--- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
@@ -148,5 +148,4 @@ dbgu: serial@fffff200 {
 	interrupts = <1 4 7>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_dbgu>;
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx-pinctrl.txt
index 9fde25f1401a..42d74f8a1bcc 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx-pinctrl.txt
@@ -61,7 +61,6 @@ Examples:
 usdhc@0219c000 { /* uSDHC4 */
 	non-removable;
 	vmmc-supply = <&reg_3p3v>;
-	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usdhc4_1>;
 };
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
index 8c5d27c5b562..6666277c3acb 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
@@ -61,7 +61,6 @@ iomuxc-lpsr controller and SDA pad from iomuxc controller as:
 i2c1: i2c@30a20000 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c1_1 &pinctrl_i2c1_2>;
-	status = "okay";
 };
 
 iomuxc-lpsr@302c0000 {
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt
index f2abdaee9022..e0e886b73527 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-dpaux-padctl.txt
@@ -56,5 +56,4 @@ Example:
 		pinctrl-0 = <&state_dpaux_i2c>;
 		pinctrl-1 = <&state_dpaux_off>;
 		pinctrl-names = "default", "idle";
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt
index 09e81a95bbfd..b1159434f593 100644
--- a/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt
@@ -50,7 +50,6 @@ uart2: serial@900000 {
 	reg-io-width = <1>;
 	current-speed = <115200>;
 	no-loopback-test;
-	status = "disabled";
 	resets = <&reset 22>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-zx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-zx.txt
index e219849b21ca..39170f372599 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-zx.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-zx.txt
@@ -81,5 +81,4 @@ pmm: pin-controller@1462000 {
 &vga {
 	pinctrl-names = "default";
 	pinctrl-0 = <&vga_pins>;
-	status = "okay";
 };
diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
index dbee03b52145..6fba875838f5 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
@@ -172,5 +172,4 @@ Example 4: KZM-A9-GT (SH-Mobile AG5) default pin state for the MMCIF device
 
 		bus-width = <8>;
 		vmmc-supply = <&reg_1p8v>;
-		status = "okay";
 	};
diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
index ee01ab58224d..02c0388a12b2 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
@@ -120,7 +120,6 @@ uart2: serial@20064000 {
 	reg-shift = <2>;
 	reg-io-width = <1>;
 	clocks = <&mux_uart2>;
-	status = "okay";
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart2_xfer>;
diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
index d907a74f8dc0..33e3d3c47552 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt
@@ -180,5 +180,4 @@ pin-controller {
 &usart1 {
 	pinctrl-0 = <&usart1_pins_a>;
 	pinctrl-names = "default";
-	status = "okay";
 };
diff --git a/Documentation/devicetree/bindings/power/power-controller.txt b/Documentation/devicetree/bindings/power/power-controller.txt
index 4f7a3bc9c407..e45affea8078 100644
--- a/Documentation/devicetree/bindings/power/power-controller.txt
+++ b/Documentation/devicetree/bindings/power/power-controller.txt
@@ -13,6 +13,5 @@ Example:
 
 act8846: act8846@5 {
 	 compatible = "active-semi,act8846";
-	 status = "okay";
 	 system-power-controller;
 }
diff --git a/Documentation/devicetree/bindings/power/reset/st-reset.txt b/Documentation/devicetree/bindings/power/reset/st-reset.txt
index 83734dc3a389..b63948737d80 100644
--- a/Documentation/devicetree/bindings/power/reset/st-reset.txt
+++ b/Documentation/devicetree/bindings/power/reset/st-reset.txt
@@ -8,5 +8,4 @@ Example node:
 	restart {
 		compatible = "st,stih407-restart";
 		st,syscfg = <&syscfg_sbc_reg>;
-		status = "okay";
 	};
diff --git a/Documentation/devicetree/bindings/power/supply/act8945a-charger.txt b/Documentation/devicetree/bindings/power/supply/act8945a-charger.txt
index de78d761ce44..b86ecada4f84 100644
--- a/Documentation/devicetree/bindings/power/supply/act8945a-charger.txt
+++ b/Documentation/devicetree/bindings/power/supply/act8945a-charger.txt
@@ -29,7 +29,6 @@ Example:
 	pmic@5b {
 		compatible = "active-semi,act8945a";
 		reg = <0x5b>;
-		status = "okay";
 
 		charger {
 			compatible = "active-semi,act8945a-charger";
@@ -43,6 +42,5 @@ Example:
 			active-semi,input-voltage-threshold-microvolt = <6600>;
 			active-semi,precondition-timeout = <40>;
 			active-semi,total-timeout = <3>;
-			status = "okay";
 		};
 	};
diff --git a/Documentation/devicetree/bindings/power/supply/max8903-charger.txt b/Documentation/devicetree/bindings/power/supply/max8903-charger.txt
index f0f4e12b076e..bab947fef025 100644
--- a/Documentation/devicetree/bindings/power/supply/max8903-charger.txt
+++ b/Documentation/devicetree/bindings/power/supply/max8903-charger.txt
@@ -21,5 +21,4 @@ Example:
 		flt-gpios = <&gpio2 2 GPIO_ACTIVE_LOW>;
 		chg-gpios = <&gpio3 15 GPIO_ACTIVE_LOW>;
 		cen-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
-		status = "okay";
 	};
diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max14656.txt b/Documentation/devicetree/bindings/power/supply/maxim,max14656.txt
index e03e85ae6572..d6e8dfd0a581 100644
--- a/Documentation/devicetree/bindings/power/supply/maxim,max14656.txt
+++ b/Documentation/devicetree/bindings/power/supply/maxim,max14656.txt
@@ -12,7 +12,6 @@ Example:
 	clock-frequency = <50000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c2>;
-	status = "okay";
 
 	max14656@35 {
 		compatible = "maxim,max14656";
diff --git a/Documentation/devicetree/bindings/ptp/brcm,ptp-dte.txt b/Documentation/devicetree/bindings/ptp/brcm,ptp-dte.txt
index 07590bcdad15..16e3389c8118 100644
--- a/Documentation/devicetree/bindings/ptp/brcm,ptp-dte.txt
+++ b/Documentation/devicetree/bindings/ptp/brcm,ptp-dte.txt
@@ -9,5 +9,4 @@ Example:
 ptp_dte: ptp_dte@180af650 {
 	compatible = "brcm,ptp-dte";
 	reg = <0x180af650 0x10>;
-	status = "okay";
 };
diff --git a/Documentation/devicetree/bindings/pwm/pwm-meson.txt b/Documentation/devicetree/bindings/pwm/pwm-meson.txt
index 5b07bebbf6f7..1ee81321c35e 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-meson.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-meson.txt
@@ -19,7 +19,6 @@ Example:
 		compatible = "amlogic,meson-gxbb-pwm";
 		reg = <0x0 0x08550 0x0 0x10>;
 		#pwm-cells = <3>;
-		status = "disabled";
 		clocks = <&xtal>, <&xtal>;
 		clock-names = "clkin0", "clkin1";
 	}
diff --git a/Documentation/devicetree/bindings/pwm/pwm-sun4i.txt b/Documentation/devicetree/bindings/pwm/pwm-sun4i.txt
index f1cbeefb3087..c5171660eaf9 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-sun4i.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-sun4i.txt
@@ -19,5 +19,4 @@ Example:
 		reg = <0x01c20e00 0xc>;
 		clocks = <&osc24M>;
 		#pwm-cells = <3>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/pwm/pwm-tipwmss.txt b/Documentation/devicetree/bindings/pwm/pwm-tipwmss.txt
index 1a5d7b71db89..4633697fbda1 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-tipwmss.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-tipwmss.txt
@@ -26,7 +26,6 @@ epwmss0: epwmss@48300000 { /* PWMSS for am33xx */
 	ti,hwmods = "epwmss0";
 	#address-cells = <1>;
 	#size-cells = <1>;
-	status = "disabled";
 	ranges = <0x48300100 0x48300100 0x80   /* ECAP */
 		  0x48300180 0x48300180 0x80   /* EQEP */
 		  0x48300200 0x48300200 0x80>; /* EHRPWM */
@@ -40,7 +39,6 @@ epwmss0: epwmss@48300000 { /* PWMSS for am4372 */
 	ti,hwmods = "epwmss0";
 	#address-cells = <1>;
 	#size-cells = <1>;
-	status = "disabled";
 	ranges = <0x48300100 0x48300100 0x80   /* ECAP */
 		  0x48300180 0x48300180 0x80   /* EQEP */
 		  0x48300200 0x48300200 0x80>; /* EHRPWM */
diff --git a/Documentation/devicetree/bindings/regulator/act8865-regulator.txt b/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
index 6067d9830d07..3ae9f1088845 100644
--- a/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/act8865-regulator.txt
@@ -52,7 +52,6 @@ Example:
 				compatible = "active-semi,act8865";
 				reg = <0x5b>;
 				active-semi,vsel-high;
-				status = "disabled";
 
 				regulators {
 					vcc_1v8_reg: DCDC_REG1 {
diff --git a/Documentation/devicetree/bindings/regulator/act8945a-regulator.txt b/Documentation/devicetree/bindings/regulator/act8945a-regulator.txt
index 5c80a7779552..ac955dea00d1 100644
--- a/Documentation/devicetree/bindings/regulator/act8945a-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/act8945a-regulator.txt
@@ -23,7 +23,6 @@ Example:
 	pmic@5b {
 		compatible = "active-semi,act8945a";
 		reg = <0x5b>;
-		status = "okay";
 
 		active-semi,vsel-high;
 
diff --git a/Documentation/devicetree/bindings/reset/nxp,lpc1850-rgu.txt b/Documentation/devicetree/bindings/reset/nxp,lpc1850-rgu.txt
index b4e96a278445..05d5be48dae4 100644
--- a/Documentation/devicetree/bindings/reset/nxp,lpc1850-rgu.txt
+++ b/Documentation/devicetree/bindings/reset/nxp,lpc1850-rgu.txt
@@ -80,5 +80,4 @@ mac: ethernet@40010000 {
 	clock-names = "stmmaceth";
 	resets = <&rgu 22>;
 	reset-names = "stmmaceth";
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt
index 0a4c371a9b7a..a66692a08ace 100644
--- a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.txt
@@ -45,5 +45,4 @@ Example:
 		interrupts = <17 1>;
 		interrupt-names = "alarm";
 		st,syscfg = <&pwrcfg>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/scsi/hisilicon-sas.txt b/Documentation/devicetree/bindings/scsi/hisilicon-sas.txt
index 2a42a323fa1a..b6a869f97715 100644
--- a/Documentation/devicetree/bindings/scsi/hisilicon-sas.txt
+++ b/Documentation/devicetree/bindings/scsi/hisilicon-sas.txt
@@ -85,5 +85,4 @@ Example:
 				<366 1>,<367 1>/* cq30-31 */
 				<376 4>,/* fatal ecc */
 				<381 4>;/* fatal axi */
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/security/tpm/st33zp24-i2c.txt b/Documentation/devicetree/bindings/security/tpm/st33zp24-i2c.txt
index 3ad115efed1e..6a4e0d30d8c4 100644
--- a/Documentation/devicetree/bindings/security/tpm/st33zp24-i2c.txt
+++ b/Documentation/devicetree/bindings/security/tpm/st33zp24-i2c.txt
@@ -19,7 +19,6 @@ Example (for ARM-based BeagleBoard xM with ST33ZP24 on I2C2):
 
 &i2c2 {
 
-        status = "okay";
 
         st33zp24: st33zp24@13 {
 
diff --git a/Documentation/devicetree/bindings/security/tpm/st33zp24-spi.txt b/Documentation/devicetree/bindings/security/tpm/st33zp24-spi.txt
index 158b0165e01c..604dce901b60 100644
--- a/Documentation/devicetree/bindings/security/tpm/st33zp24-spi.txt
+++ b/Documentation/devicetree/bindings/security/tpm/st33zp24-spi.txt
@@ -18,7 +18,6 @@ Example (for ARM-based BeagleBoard xM with ST33ZP24 on SPI4):
 
 &mcspi4 {
 
-        status = "okay";
 
         st33zp24@0 {
 
diff --git a/Documentation/devicetree/bindings/security/tpm/tpm-i2c.txt b/Documentation/devicetree/bindings/security/tpm/tpm-i2c.txt
index 8cb638b7e89c..3eca6de6369d 100644
--- a/Documentation/devicetree/bindings/security/tpm/tpm-i2c.txt
+++ b/Documentation/devicetree/bindings/security/tpm/tpm-i2c.txt
@@ -17,5 +17,4 @@ tpm@57 {
 	compatible = "nuvoton,npct650", "nuvoton,npct601";
 	linux,sml-base = <0x7f 0xfd450000>;
 	linux,sml-size = <0x10000>;
-	status = "okay";
 };
diff --git a/Documentation/devicetree/bindings/security/tpm/tpm_tis_spi.txt b/Documentation/devicetree/bindings/security/tpm/tpm_tis_spi.txt
index 85741cd468cc..b800667da92b 100644
--- a/Documentation/devicetree/bindings/security/tpm/tpm_tis_spi.txt
+++ b/Documentation/devicetree/bindings/security/tpm/tpm_tis_spi.txt
@@ -13,7 +13,6 @@ Example (for ARM-based BeagleBoard xM with TPM_TIS on SPI4):
 
 &mcspi4 {
 
-        status = "okay";
 
         tpm_tis@0 {
 
diff --git a/Documentation/devicetree/bindings/serial/arc-uart.txt b/Documentation/devicetree/bindings/serial/arc-uart.txt
index 5cae2eb686f8..256cc150ca7e 100644
--- a/Documentation/devicetree/bindings/serial/arc-uart.txt
+++ b/Documentation/devicetree/bindings/serial/arc-uart.txt
@@ -15,7 +15,6 @@ arcuart0: serial@c0fc1000 {
 	interrupts = <5>;
 	clock-frequency = <80000000>;
 	current-speed = <115200>;
-	status = "okay";
 };
 
 Note: Each port should have an alias correctly numbered in "aliases" node.
diff --git a/Documentation/devicetree/bindings/serial/axis,etraxfs-uart.txt b/Documentation/devicetree/bindings/serial/axis,etraxfs-uart.txt
index 51b3c9e80ad9..048c3818c826 100644
--- a/Documentation/devicetree/bindings/serial/axis,etraxfs-uart.txt
+++ b/Documentation/devicetree/bindings/serial/axis,etraxfs-uart.txt
@@ -15,7 +15,6 @@ serial@b00260000 {
 	compatible = "axis,etraxfs-uart";
 	reg = <0xb0026000 0x1000>;
 	interrupts = <68>;
-	status = "disabled";
 	dtr-gpios = <&sysgpio 0 GPIO_ACTIVE_LOW>;
 	dsr-gpios = <&sysgpio 1 GPIO_ACTIVE_LOW>;
 	rng-gpios = <&sysgpio 2 GPIO_ACTIVE_LOW>;
diff --git a/Documentation/devicetree/bindings/serial/nvidia,tegra20-hsuart.txt b/Documentation/devicetree/bindings/serial/nvidia,tegra20-hsuart.txt
index c93a2d1c1a65..d7edf732eb7f 100644
--- a/Documentation/devicetree/bindings/serial/nvidia,tegra20-hsuart.txt
+++ b/Documentation/devicetree/bindings/serial/nvidia,tegra20-hsuart.txt
@@ -33,5 +33,4 @@ serial@70006000 {
 	reset-names = "serial";
 	dmas = <&apbdma 8>, <&apbdma 8>;
 	dma-names = "rx", "tx";
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt b/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt
index d5f73b8f614f..9d098cf73b53 100644
--- a/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt
+++ b/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt
@@ -72,13 +72,10 @@ Examples:
 	};
 
 	uarta: serial@12490000 {
-		status = "ok";
 	};
 
 	uartb: serial@16340000 {
-		status = "ok";
 	};
 
 	uartc: serial@1a240000 {
-		status = "ok";
 	};
diff --git a/Documentation/devicetree/bindings/serial/serial.txt b/Documentation/devicetree/bindings/serial/serial.txt
index b542a0ecf06e..863c2893759e 100644
--- a/Documentation/devicetree/bindings/serial/serial.txt
+++ b/Documentation/devicetree/bindings/serial/serial.txt
@@ -43,7 +43,6 @@ Examples:
 		rng-gpios = <&gpio2 25 GPIO_ACTIVE_LOW>;
 		cts-gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
 		rts-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
-		status = "okay";
 	};
 
 	scifa4: serial@e6c80000 {
@@ -54,5 +53,4 @@ Examples:
 		clock-names = "fck";
 		power-domains = <&pd_a3sp>;
 		uart-has-rtscts;
-		status = "okay";
 	};
diff --git a/Documentation/devicetree/bindings/serio/allwinner,sun4i-ps2.txt b/Documentation/devicetree/bindings/serio/allwinner,sun4i-ps2.txt
index 362a76925bcd..f311472990a7 100644
--- a/Documentation/devicetree/bindings/serio/allwinner,sun4i-ps2.txt
+++ b/Documentation/devicetree/bindings/serio/allwinner,sun4i-ps2.txt
@@ -19,5 +19,4 @@ Example:
 		reg = <0x01c2a000 0x400>;
 		interrupts = <0 62 4>;
 		clocks = <&apb1_gates 6>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt
index 2f5ede39bea2..fe1855f09dcc 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt
@@ -78,7 +78,6 @@ Example for APQ8064:
 			interrupts = <0 152 0x0>;
 			clocks = <&gcc GSBI4_UART_CLK>, <&gcc GSBI4_H_CLK>;
 			clock-names = "core", "iface";
-			status = "ok";
 		};
 	};
 
diff --git a/Documentation/devicetree/bindings/sound/armada-370db-audio.txt b/Documentation/devicetree/bindings/sound/armada-370db-audio.txt
index bf984d238620..953c092db72f 100644
--- a/Documentation/devicetree/bindings/sound/armada-370db-audio.txt
+++ b/Documentation/devicetree/bindings/sound/armada-370db-audio.txt
@@ -23,5 +23,4 @@ Example:
 	      compatible = "marvell,a370db-audio";
 	      marvell,audio-controller = <&audio_controller>;
 	      marvell,audio-codec = <&audio_codec &spdif_out &spdif_in>;
-	      status = "okay";
 	};
diff --git a/Documentation/devicetree/bindings/sound/axentia,tse850-pcm5142.txt b/Documentation/devicetree/bindings/sound/axentia,tse850-pcm5142.txt
index fdb25b492514..9d049d4bfd58 100644
--- a/Documentation/devicetree/bindings/sound/axentia,tse850-pcm5142.txt
+++ b/Documentation/devicetree/bindings/sound/axentia,tse850-pcm5142.txt
@@ -45,7 +45,6 @@ Example:
 	&ssc0 {
 		#sound-dai-cells = <0>;
 
-		status = "okay";
 	};
 
 	&i2c {
diff --git a/Documentation/devicetree/bindings/sound/brcm,cygnus-audio.txt b/Documentation/devicetree/bindings/sound/brcm,cygnus-audio.txt
index b139e66d2a11..630bf7c0344d 100644
--- a/Documentation/devicetree/bindings/sound/brcm,cygnus-audio.txt
+++ b/Documentation/devicetree/bindings/sound/brcm,cygnus-audio.txt
@@ -47,21 +47,17 @@ Example:
 
 		ssp0: ssp_port@0 {
 			reg = <0>;
-			status = "okay";
 		};
 
 		ssp1: ssp_port@1 {
 			reg = <1>;
-			status = "disabled";
 		};
 
 		ssp2: ssp_port@2 {
 			reg = <2>;
-			status = "disabled";
 		};
 
 		spdif: spdif_port@3 {
 			reg = <3>;
-			status = "disabled";
 		};
 	};
diff --git a/Documentation/devicetree/bindings/sound/davinci-mcbsp.txt b/Documentation/devicetree/bindings/sound/davinci-mcbsp.txt
index e0b6165c9cfc..3ffc2562fb31 100644
--- a/Documentation/devicetree/bindings/sound/davinci-mcbsp.txt
+++ b/Documentation/devicetree/bindings/sound/davinci-mcbsp.txt
@@ -47,5 +47,4 @@ mcbsp0: mcbsp@1d10000 {
 	dmas = <&edma0 3 1
 		&edma0 2 1>;
 	dma-names = "tx", "rx";
-	status = "okay";
 };
diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
index 3e26a9478e57..65979b205893 100644
--- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
+++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
@@ -61,5 +61,4 @@ asrc: asrc@02034000 {
 		"txa", "txb", "txc";
 	fsl,asrc-rate  = <48000>;
 	fsl,asrc-width = <16>;
-	status = "okay";
 };
diff --git a/Documentation/devicetree/bindings/sound/fsl,esai.txt b/Documentation/devicetree/bindings/sound/fsl,esai.txt
index cd3ee5d84f03..21c401e2ccda 100644
--- a/Documentation/devicetree/bindings/sound/fsl,esai.txt
+++ b/Documentation/devicetree/bindings/sound/fsl,esai.txt
@@ -59,5 +59,4 @@ esai: esai@02024000 {
 	fsl,fifo-depth = <128>;
 	fsl,esai-synchronous;
 	big-endian;
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/sound/fsl,spdif.txt b/Documentation/devicetree/bindings/sound/fsl,spdif.txt
index 4ca39ddc0417..0f97e54c3d43 100644
--- a/Documentation/devicetree/bindings/sound/fsl,spdif.txt
+++ b/Documentation/devicetree/bindings/sound/fsl,spdif.txt
@@ -59,5 +59,4 @@ spdif: spdif@02004000 {
 		"rxtx7";
 
 	big-endian;
-	status = "okay";
 };
diff --git a/Documentation/devicetree/bindings/sound/hdmi.txt b/Documentation/devicetree/bindings/sound/hdmi.txt
index 31af7bca3099..56407c30e954 100644
--- a/Documentation/devicetree/bindings/sound/hdmi.txt
+++ b/Documentation/devicetree/bindings/sound/hdmi.txt
@@ -13,5 +13,4 @@ Example node:
 
 	hdmi_audio: hdmi_audio@0 {
 		compatible = "linux,hdmi-audio";
-		status = "okay";
 	};
diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
index 7246bb268bf9..8fad27da9e9a 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
@@ -621,7 +621,6 @@ Example: simple sound card
 	/* Single DAI */
 	#sound-dai-cells = <0>;
 
-	status = "okay";
 
 	rcar_sound,dai {
 		dai0 {
@@ -667,7 +666,6 @@ Example: simple sound card for Multi channel
 	/* Single DAI */
 	#sound-dai-cells = <0>;
 
-	status = "okay";
 
 	rcar_sound,dai {
 		dai0 {
diff --git a/Documentation/devicetree/bindings/sound/rockchip,pdm.txt b/Documentation/devicetree/bindings/sound/rockchip,pdm.txt
index 921729de7346..beb32ca26e5d 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,pdm.txt
+++ b/Documentation/devicetree/bindings/sound/rockchip,pdm.txt
@@ -35,5 +35,4 @@ pdm: pdm@ff040000 {
 		     &pdmm0_sdi2
 		     &pdmm0_sdi3>;
 	pinctrl-1 = <&pdmm0_sleep>;
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.txt b/Documentation/devicetree/bindings/sound/rockchip-spdif.txt
index 4706b96d450b..0a1dc4e1815c 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-spdif.txt
+++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.txt
@@ -41,6 +41,5 @@ spdif: spdif@0x1011e000 {
 	dma-names = "tx";
 	clock-names = "hclk", "mclk";
 	clocks = <&cru HCLK_SPDIF>, <&cru SCLK_SPDIF>;
-	status = "disabled";
 	#sound-dai-cells = <0>;
 };
diff --git a/Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt b/Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
index 745dc62f76ea..40068ec0e9a5 100644
--- a/Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
+++ b/Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
@@ -53,7 +53,6 @@ Example:
 
 	sti_uni_player1: sti-uni-player@0x8D81000 {
 		compatible = "st,stih407-uni-player-hdmi";
-		status = "okay";
 		#sound-dai-cells = <0>;
 		st,syscfg = <&syscfg_core>;
 		clocks = <&clk_s_d0_flexgen CLK_PCM_1>;
@@ -66,7 +65,6 @@ Example:
 
 	sti_uni_player2: sti-uni-player@0x8D82000 {
 		compatible = "st,stih407-uni-player-pcm-out";
-		status = "okay";
 		#sound-dai-cells = <0>;
 		st,syscfg = <&syscfg_core>;
 		clocks = <&clk_s_d0_flexgen CLK_PCM_2>;
@@ -78,7 +76,6 @@ Example:
 
 	sti_uni_player3: sti-uni-player@0x8D85000 {
 		compatible = "st,stih407-uni-player-spdif";
-		status = "okay";
 		#sound-dai-cells = <0>;
 		st,syscfg = <&syscfg_core>;
 		clocks = <&clk_s_d0_flexgen CLK_SPDIFF>;
@@ -90,7 +87,6 @@ Example:
 
 	sti_uni_reader1: sti-uni-reader@0x8D84000 {
 		compatible = "st,stih407-uni-reader-hdmi";
-		status = "disabled";
 		#sound-dai-cells = <0>;
 		st,syscfg = <&syscfg_core>;
 		reg = <0x8D84000 0x158>;
@@ -125,7 +121,6 @@ Example of audio card declaration:
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "sti audio card";
-		status = "okay";
 
 		simple-audio-card,dai-link@0 {
 			/* DAC */
diff --git a/Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt b/Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt
index fe0a65e6d629..70ee177901d3 100644
--- a/Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt
+++ b/Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt
@@ -39,5 +39,4 @@ spdif: spdif@01c21000 {
 	clock-names = "apb", "spdif";
 	dmas = <&dma 0 2>, <&dma 0 2>;
 	dma-names = "rx", "tx";
-	status = "okay";
 };
diff --git a/Documentation/devicetree/bindings/sound/tas5720.txt b/Documentation/devicetree/bindings/sound/tas5720.txt
index 806ea7381483..40d94f82beb3 100644
--- a/Documentation/devicetree/bindings/sound/tas5720.txt
+++ b/Documentation/devicetree/bindings/sound/tas5720.txt
@@ -17,7 +17,6 @@ Required properties:
 Example:
 
 tas5720: tas5720@6c {
-	status = "okay";
 	compatible = "ti,tas5720";
 	reg = <0x6c>;
 	dvdd-supply = <&vdd_3v3_reg>;
diff --git a/Documentation/devicetree/bindings/sound/zte,zx-i2s.txt b/Documentation/devicetree/bindings/sound/zte,zx-i2s.txt
index 292ad5083704..3927251464f0 100644
--- a/Documentation/devicetree/bindings/sound/zte,zx-i2s.txt
+++ b/Documentation/devicetree/bindings/sound/zte,zx-i2s.txt
@@ -27,7 +27,6 @@ Example:
 		interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
 		dmas = <&dma 5>, <&dma 6>;
 		dma-names = "tx", "rx";
-		status = "okay";
 	};
 
 	sound {
diff --git a/Documentation/devicetree/bindings/sound/zte,zx-spdif.txt b/Documentation/devicetree/bindings/sound/zte,zx-spdif.txt
index 989544ea6eb5..b5a5ca4502f9 100644
--- a/Documentation/devicetree/bindings/sound/zte,zx-spdif.txt
+++ b/Documentation/devicetree/bindings/sound/zte,zx-spdif.txt
@@ -24,5 +24,4 @@ Example:
 		interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
 		dmas = <&dma 4>;
 		dma-names = "tx";
-		status = "okay";
 	};
diff --git a/Documentation/devicetree/bindings/spi/efm32-spi.txt b/Documentation/devicetree/bindings/spi/efm32-spi.txt
index 750e29aff9bc..2c1e6a43930b 100644
--- a/Documentation/devicetree/bindings/spi/efm32-spi.txt
+++ b/Documentation/devicetree/bindings/spi/efm32-spi.txt
@@ -28,7 +28,6 @@ spi1: spi@0x4000c400 { /* USART1 */
 	clocks = <&cmu 20>;
 	cs-gpios = <&gpio 51 1>; // D3
 	energymicro,location = <1>;
-	status = "ok";
 
 	ks8851@0 {
 		compatible = "ks8851";
@@ -36,6 +35,5 @@ spi1: spi@0x4000c400 { /* USART1 */
 		reg = <0>;
 		interrupt-parent = <&boardfpga>;
 		interrupts = <4>;
-		status = "ok";
 	};
 };
diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra114-spi.txt b/Documentation/devicetree/bindings/spi/nvidia,tegra114-spi.txt
index b785976fe98a..9ba7c5a273b4 100644
--- a/Documentation/devicetree/bindings/spi/nvidia,tegra114-spi.txt
+++ b/Documentation/devicetree/bindings/spi/nvidia,tegra114-spi.txt
@@ -38,5 +38,4 @@ spi@7000d600 {
 	reset-names = "spi";
 	dmas = <&apbdma 16>, <&apbdma 16>;
 	dma-names = "rx", "tx";
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra20-sflash.txt b/Documentation/devicetree/bindings/spi/nvidia,tegra20-sflash.txt
index bdf08e6dec9b..c212491929b5 100644
--- a/Documentation/devicetree/bindings/spi/nvidia,tegra20-sflash.txt
+++ b/Documentation/devicetree/bindings/spi/nvidia,tegra20-sflash.txt
@@ -34,5 +34,4 @@ spi@7000c380 {
 	reset-names = "spi";
 	dmas = <&apbdma 11>, <&apbdma 11>;
 	dma-names = "rx", "tx";
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra20-slink.txt b/Documentation/devicetree/bindings/spi/nvidia,tegra20-slink.txt
index 5db9144a33c8..40d80b93e327 100644
--- a/Documentation/devicetree/bindings/spi/nvidia,tegra20-slink.txt
+++ b/Documentation/devicetree/bindings/spi/nvidia,tegra20-slink.txt
@@ -34,5 +34,4 @@ spi@7000d600 {
 	reset-names = "spi";
 	dmas = <&apbdma 16>, <&apbdma 16>;
 	dma-names = "rx", "tx";
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/spi/sh-hspi.txt b/Documentation/devicetree/bindings/spi/sh-hspi.txt
index 319bad4af875..585fed90376e 100644
--- a/Documentation/devicetree/bindings/spi/sh-hspi.txt
+++ b/Documentation/devicetree/bindings/spi/sh-hspi.txt
@@ -24,6 +24,5 @@ Example:
 		interrupts = <0 63 IRQ_TYPE_LEVEL_HIGH>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		status = "disabled";
 	};
 
diff --git a/Documentation/devicetree/bindings/spi/sh-msiof.txt b/Documentation/devicetree/bindings/spi/sh-msiof.txt
index 64ee489571c4..1dcd400eeea0 100644
--- a/Documentation/devicetree/bindings/spi/sh-msiof.txt
+++ b/Documentation/devicetree/bindings/spi/sh-msiof.txt
@@ -78,5 +78,4 @@ Example:
 		dma-names = "tx", "rx";
 		#address-cells = <1>;
 		#size-cells = <0>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/spi/spi-clps711x.txt b/Documentation/devicetree/bindings/spi/spi-clps711x.txt
index 4c3ec13f423f..5122dc7860af 100644
--- a/Documentation/devicetree/bindings/spi/spi-clps711x.txt
+++ b/Documentation/devicetree/bindings/spi/spi-clps711x.txt
@@ -23,7 +23,6 @@ spi@80000500 {
 	reg = <0x80000500 0x4>;
 	interrupts = <15>;
 	clocks = <&clks CLPS711X_CLK_SPI>;
-	status = "disabled";
 };
 
 syscon3: syscon@80002200 {
diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt b/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
index ff5893d275a2..13b1fcc8469e 100644
--- a/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
+++ b/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
@@ -39,7 +39,6 @@ dspi0@4002c000 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_dspi0_1>;
 	big-endian;
-	status = "okay";
 
 	sflash: at26df081a@0 {
 		#address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/spi/spi-mt65xx.txt b/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
index e0318cf92d73..236dcb0faf37 100644
--- a/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
+++ b/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
@@ -57,5 +57,4 @@ spi: spi@1100a000 {
 	clock-names = "parent-clk", "sel-clk", "spi-clk";
 	cs-gpios = <&pio 105 GPIO_ACTIVE_LOW>, <&pio 72 GPIO_ACTIVE_LOW>;
 	mediatek,pad-select = <1>, <0>;
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/spi/spi-orion.txt b/Documentation/devicetree/bindings/spi/spi-orion.txt
index 4f629cc7634a..df8ec31f2f07 100644
--- a/Documentation/devicetree/bindings/spi/spi-orion.txt
+++ b/Documentation/devicetree/bindings/spi/spi-orion.txt
@@ -29,7 +29,6 @@ Example:
 	       cell-index = <0>;
 	       reg = <0x10600 0x28>;
 	       interrupts = <23>;
-	       status = "disabled";
        };
 
 Example with SPI direct mode support (optionally):
@@ -48,7 +47,6 @@ Example with SPI direct mode support (optionally):
 		      <MBUS_ID(0x01, 0x9f) 0 0xffffffff>, /* CS6 */
 		      <MBUS_ID(0x01, 0xdf) 0 0xffffffff>; /* CS7 */
 		interrupts = <23>;
-		status = "disabled";
 	};
 
 To enable the direct mode, the board specific 'ranges' property in the
diff --git a/Documentation/devicetree/bindings/spi/spi-sun4i.txt b/Documentation/devicetree/bindings/spi/spi-sun4i.txt
index de827f5a301e..484bbff5337e 100644
--- a/Documentation/devicetree/bindings/spi/spi-sun4i.txt
+++ b/Documentation/devicetree/bindings/spi/spi-sun4i.txt
@@ -18,7 +18,6 @@ spi1: spi@01c06000 {
 	interrupts = <11>;
 	clocks = <&ahb_gates 21>, <&spi1_clk>;
 	clock-names = "ahb", "mod";
-	status = "disabled";
 	#address-cells = <1>;
 	#size-cells = <0>;
 };
diff --git a/Documentation/devicetree/bindings/spi/spi-sun6i.txt b/Documentation/devicetree/bindings/spi/spi-sun6i.txt
index 2ec99b86b622..ab1811354cce 100644
--- a/Documentation/devicetree/bindings/spi/spi-sun6i.txt
+++ b/Documentation/devicetree/bindings/spi/spi-sun6i.txt
@@ -39,7 +39,6 @@ spi0: spi@01c68000 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pins>;
 	resets = <&ccu RST_BUS_SPI0>;
-	status = "disabled";
 	#address-cells = <1>;
 	#size-cells = <0>;
 };
diff --git a/Documentation/devicetree/bindings/spi/spi_atmel.txt b/Documentation/devicetree/bindings/spi/spi_atmel.txt
index fb588b3e6a9a..f99c733d75c1 100644
--- a/Documentation/devicetree/bindings/spi/spi_atmel.txt
+++ b/Documentation/devicetree/bindings/spi/spi_atmel.txt
@@ -26,7 +26,6 @@ spi1: spi@fffcc000 {
 	clock-names = "spi_clk";
 	cs-gpios = <&pioB 3 0>;
 	atmel,fifo-size = <32>;
-	status = "okay";
 
 	mmc-slot@0 {
 		compatible = "mmc-spi-slot";
diff --git a/Documentation/devicetree/bindings/sram/sunxi-sram.txt b/Documentation/devicetree/bindings/sram/sunxi-sram.txt
index 8d5665468fe7..170034e6c8b0 100644
--- a/Documentation/devicetree/bindings/sram/sunxi-sram.txt
+++ b/Documentation/devicetree/bindings/sram/sunxi-sram.txt
@@ -59,7 +59,6 @@ sram-controller@01c00000 {
 		emac_sram: sram-section@8000 {
 			compatible = "allwinner,sun4i-a10-sram-a3-a4";
 			reg = <0x8000 0x4000>;
-			status = "disabled";
 		};
 	};
 };
diff --git a/Documentation/devicetree/bindings/thermal/armada-thermal.txt b/Documentation/devicetree/bindings/thermal/armada-thermal.txt
index 4698e0edc205..24aacf8948c5 100644
--- a/Documentation/devicetree/bindings/thermal/armada-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/armada-thermal.txt
@@ -20,5 +20,4 @@ Example:
 		compatible = "marvell,armada370-thermal";
                 reg = <0xd0018300 0x4
 		       0xd0018304 0x4>;
-		status = "okay";
 	};
diff --git a/Documentation/devicetree/bindings/thermal/exynos-thermal.txt b/Documentation/devicetree/bindings/thermal/exynos-thermal.txt
index 70b4c16c7ed8..9b4c7b017495 100644
--- a/Documentation/devicetree/bindings/thermal/exynos-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/exynos-thermal.txt
@@ -77,7 +77,6 @@ Example 1):
 		interrupts = <2 4>;
 		clocks = <&clock 383>;
 		clock-names = "tmu_apbif";
-		status = "disabled";
 		vtmu-supply = <&tmu_regulator_node>;
 		#include "exynos4412-tmu-sensor-conf.dtsi"
 	};
diff --git a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
index 07a9713ae6a7..fdf5caa6229b 100644
--- a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
@@ -36,7 +36,6 @@ Example:
 		clocks = <&cpg CPG_MOD 522>;
 		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 		#thermal-sensor-cells = <1>;
-		status = "okay";
 	};
 
 	thermal-zones {
diff --git a/Documentation/devicetree/bindings/unittest.txt b/Documentation/devicetree/bindings/unittest.txt
index 3bf58c20fe94..9a5b311f4434 100644
--- a/Documentation/devicetree/bindings/unittest.txt
+++ b/Documentation/devicetree/bindings/unittest.txt
@@ -10,7 +10,6 @@ All other properties are optional.
 Example:
 	unittest {
 		compatible = "unittest";
-		status = "okay";
 	};
 
 2) OF unittest i2c adapter platform device
@@ -25,7 +24,6 @@ Children nodes contain unittest i2c devices.
 Example:
 	unittest-i2c-bus {
 		compatible = "unittest-i2c-bus";
-		status = "okay";
 	};
 
 3) OF unittest i2c device
@@ -40,7 +38,6 @@ All other properties are optional
 Example:
 	unittest-i2c-dev {
 		compatible = "unittest-i2c-dev";
-		status = "okay";
 	};
 
 4) OF unittest i2c mux device
@@ -55,7 +52,6 @@ Children nodes contain unittest i2c bus nodes per channel.
 Example:
 	unittest-i2c-mux {
 		compatible = "unittest-i2c-mux";
-		status = "okay";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		channel-0 {
@@ -65,7 +61,6 @@ Example:
 			i2c-dev {
 				reg = <8>;
 				compatible = "unittest-i2c-dev";
-				status = "okay";
 			};
 		};
 	};
diff --git a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
index d9b42da016f3..cb2bd83fa89a 100644
--- a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
+++ b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
@@ -25,5 +25,4 @@ Example:
 		phys = <&usbphy 0>;
 		phy-names = "usb";
 		extcon = <&usbphy 0>;
-		status = "disabled";
 	};
diff --git a/Documentation/devicetree/bindings/usb/da8xx-usb.txt b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
index 717c5f656237..9ce22551b2b3 100644
--- a/Documentation/devicetree/bindings/usb/da8xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
@@ -42,7 +42,6 @@ Example:
 	usb_phy: usb-phy {
 		compatible = "ti,da830-usb-phy";
 		#phy-cells = <0>;
-		status = "okay";
 	};
 	usb0: usb@200000 {
 		compatible = "ti,da830-musb";
@@ -66,7 +65,6 @@ Example:
 			"rx1", "rx2", "rx3", "rx4",
 			"tx1", "tx2", "tx3", "tx4";
 
-		status = "okay";
 
 		cppi41dma: dma-controller@201000 {
 			compatible = "ti,da830-cppi41";
diff --git a/Documentation/devicetree/bindings/usb/dwc3-st.txt b/Documentation/devicetree/bindings/usb/dwc3-st.txt
index 50dee3b44665..df0e02e1ee43 100644
--- a/Documentation/devicetree/bindings/usb/dwc3-st.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3-st.txt
@@ -42,7 +42,6 @@ or "device".
 Example:
 
 st_dwc3: dwc3@8f94000 {
-	status		= "disabled";
 	compatible	= "st,stih407-dwc3";
 	reg		= <0x08f94000 0x1000>, <0x110 0x4>;
 	reg-names	= "reg-glue", "syscfg-reg";
diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.txt b/Documentation/devicetree/bindings/usb/dwc3-xilinx.txt
index 30361b32a460..4aae5b2cef56 100644
--- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.txt
@@ -18,7 +18,6 @@ Example device node:
 		usb@0 {
 			#address-cells = <0x2>;
 			#size-cells = <0x1>;
-			status = "okay";
 			compatible = "xlnx,zynqmp-dwc3";
 			clock-names = "bus_clk" "ref_clk";
 			clocks = <&clk125>, <&clk125>;
diff --git a/Documentation/devicetree/bindings/usb/ehci-st.txt b/Documentation/devicetree/bindings/usb/ehci-st.txt
index 410d922cfdd7..9feea6c3e4d9 100644
--- a/Documentation/devicetree/bindings/usb/ehci-st.txt
+++ b/Documentation/devicetree/bindings/usb/ehci-st.txt
@@ -31,7 +31,6 @@ Example:
 		clocks = <&clk_s_a1_ls 0>;
 		phys = <&usb2_phy>;
 		phy-names = "usb";
-		status = "okay";
 
 		resets = <&powerdown STIH416_USB1_POWERDOWN>,
 			 <&softreset STIH416_USB1_SOFTRESET>;
diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt b/Documentation/devicetree/bindings/usb/exynos-usb.txt
index 78ebebb66dad..c97374315049 100644
--- a/Documentation/devicetree/bindings/usb/exynos-usb.txt
+++ b/Documentation/devicetree/bindings/usb/exynos-usb.txt
@@ -40,7 +40,6 @@ Example:
 		port@0 {
 		    reg = <0>;
 		    phys = <&usb2phy 1>;
-		    status = "disabled";
 		};
 	};
 
@@ -75,7 +74,6 @@ Example:
 		port@0 {
 		    reg = <0>;
 		    phys = <&usb2phy 1>;
-		    status = "disabled";
 		};
 
 	};
diff --git a/Documentation/devicetree/bindings/usb/isp1301.txt b/Documentation/devicetree/bindings/usb/isp1301.txt
index 5405d99d9aaa..ecd607dacba5 100644
--- a/Documentation/devicetree/bindings/usb/isp1301.txt
+++ b/Documentation/devicetree/bindings/usb/isp1301.txt
@@ -21,5 +21,4 @@ Example:
 		interrupt-parent = <&mic>;
 		interrupts = <0x3d 0>, <0x3e 0>, <0x3c 0>, <0x3a 0>;
 		transceiver = <&isp1301>;
-		status = "okay";
 	};
diff --git a/Documentation/devicetree/bindings/usb/keystone-usb.txt b/Documentation/devicetree/bindings/usb/keystone-usb.txt
index 60527d335b58..ac2c7cc41f83 100644
--- a/Documentation/devicetree/bindings/usb/keystone-usb.txt
+++ b/Documentation/devicetree/bindings/usb/keystone-usb.txt
@@ -31,7 +31,6 @@ Example:
 		clock-names = "usb";
 		interrupts = <GIC_SPI 393 IRQ_TYPE_EDGE_RISING>;
 		ranges;
-		status = "disabled";
 
 		dwc3@2690000 {
 			compatible = "synopsys,dwc3";
diff --git a/Documentation/devicetree/bindings/usb/mt8173-mtu3.txt b/Documentation/devicetree/bindings/usb/mt8173-mtu3.txt
index 1d7c3bc677f7..717914c1482a 100644
--- a/Documentation/devicetree/bindings/usb/mt8173-mtu3.txt
+++ b/Documentation/devicetree/bindings/usb/mt8173-mtu3.txt
@@ -71,7 +71,6 @@ ssusb: usb@11271000 {
 	#address-cells = <2>;
 	#size-cells = <2>;
 	ranges;
-	status = "disabled";
 
 	usb_host: xhci@11270000 {
 		compatible = "mediatek,mt8173-xhci";
@@ -82,6 +81,5 @@ ssusb: usb@11271000 {
 		clocks = <&topckgen CLK_TOP_USB30_SEL>, <&clk26m>;
 		clock-names = "sys_ck", "ref_ck";
 		vusb33-supply = <&mt6397_vusb_reg>;
-		status = "disabled";
 	};
 };
diff --git a/Documentation/devicetree/bindings/usb/ohci-st.txt b/Documentation/devicetree/bindings/usb/ohci-st.txt
index 6d8393748da2..d893ec9131c3 100644
--- a/Documentation/devicetree/bindings/usb/ohci-st.txt
+++ b/Documentation/devicetree/bindings/usb/ohci-st.txt
@@ -29,7 +29,6 @@ Example:
 		clock-names = "ic", "clk48";
 		phys = <&usb2_phy>;
 		phy-names = "usb";
-		status = "okay";
 
 		resets = <&powerdown STIH416_USB0_POWERDOWN>,
 			 <&softreset STIH416_USB0_SOFTRESET>;
diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
index 73cc0963e823..bc8a2fa5d2bf 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
@@ -29,7 +29,6 @@ Example device nodes:
 			clock-names = "ref";
 			#phy-cells = <0>;
 
-			status = "ok";
 		};
 
 		ss_phy: phy@100f8830 {
@@ -39,7 +38,6 @@ Example device nodes:
 			clock-names = "ref";
 			#phy-cells = <0>;
 
-			status = "ok";
 		};
 
 		usb3_0: usb30@0 {
@@ -51,7 +49,6 @@ Example device nodes:
 
 			ranges;
 
-			status = "ok";
 
 			dwc3@10000000 {
 				compatible = "snps,dwc3";
diff --git a/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt b/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
index 0536a938e3ab..50a31536e975 100644
--- a/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
@@ -29,13 +29,11 @@ Example device nodes:
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
-		status = "disabled";
 		usbdrd_dwc3_0: dwc3@fe800000 {
 			compatible = "snps,dwc3";
 			reg = <0x0 0xfe800000 0x0 0x100000>;
 			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
 			dr_mode = "otg";
-			status = "disabled";
 		};
 	};
 
@@ -48,12 +46,10 @@ Example device nodes:
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
-		status = "disabled";
 		usbdrd_dwc3_1: dwc3@fe900000 {
 			compatible = "snps,dwc3";
 			reg = <0x0 0xfe900000 0x0 0x100000>;
 			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 			dr_mode = "otg";
-			status = "disabled";
 		};
 	};
diff --git a/Documentation/devicetree/bindings/usb/usb-device.txt b/Documentation/devicetree/bindings/usb/usb-device.txt
index d5f1992b797c..ce02cebac26a 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.txt
+++ b/Documentation/devicetree/bindings/usb/usb-device.txt
@@ -16,7 +16,6 @@ Required properties:
 Example:
 
 &usb1 {
-	status = "okay";
 
 	#address-cells = <1>;
 	#size-cells = <0>;
diff --git a/Documentation/devicetree/bindings/w1/fsl-imx-owire.txt b/Documentation/devicetree/bindings/w1/fsl-imx-owire.txt
index ecf42c07684d..cbaa6467ab2c 100644
--- a/Documentation/devicetree/bindings/w1/fsl-imx-owire.txt
+++ b/Documentation/devicetree/bindings/w1/fsl-imx-owire.txt
@@ -15,5 +15,4 @@ owire: owire@63fa4000 {
 	compatible = "fsl,imx53-owire", "fsl,imx21-owire";
 	reg = <0x63fa4000 0x4000>;
 	clocks = <&clks 159>;
-	status = "disabled";
 };
diff --git a/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt b/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
index f7cc7c060910..4fec1e3725b4 100644
--- a/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
@@ -31,5 +31,4 @@ Example:
 		atmel,watchdog-type = "hardware";
 		atmel,dbg-halt;
 		atmel,idle-halt;
-		status = "okay";
 	};
diff --git a/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt b/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt
index 86fa6de1019b..711a880b3d3b 100644
--- a/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/atmel-wdt.txt
@@ -48,5 +48,4 @@ Example:
 		atmel,idle-halt;
 		atmel,max-heartbeat-sec = <16>;
 		atmel,min-heartbeat-sec = <0>;
-		status = "okay";
 	};
diff --git a/Documentation/devicetree/bindings/watchdog/marvel.txt b/Documentation/devicetree/bindings/watchdog/marvel.txt
index 858ed9221ac4..c1b67a78f00c 100644
--- a/Documentation/devicetree/bindings/watchdog/marvel.txt
+++ b/Documentation/devicetree/bindings/watchdog/marvel.txt
@@ -41,6 +41,5 @@ Example:
 		reg = <0x20300 0x28>, <0x20108 0x4>;
 		interrupts = <3>;
 		timeout-sec = <10>;
-		status = "okay";
 		clocks = <&gate_clk 7>;
 	};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
