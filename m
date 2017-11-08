From: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v3] dt-bindings: Remove leading zeros from bindings notation
Date: Wed, 8 Nov 2017 14:27:48 -0200
Message-ID: <1510158468-20356-1-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Improve the binding example by removing all the leading zeros to fix the
following dtc warnings:

Warning (unit_address_format): Node /XXX unit name should not have leading 0s

Converted using the following command:

perl -p -i -e 's/\@0+([0-9a-f])/\@$1/g' `find ./Documentation/devicetree/bindings "*.txt"`

Some unnecessary changes were manually fixed.

Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
---
Change since v3:
-change script to includes all the bindings directory
-change subject
-change message log
-change 'egalax_ts@4' to 'touchscreen@4' in egalax-ts.txt file
 Documentation/devicetree/bindings/arm/samsung/pmu.txt    |  2 +-
 .../devicetree/bindings/arm/samsung/samsung-boards.txt   |  2 +-
 Documentation/devicetree/bindings/arm/sp810.txt          |  2 +-
 .../devicetree/bindings/arm/vexpress-sysreg.txt          |  2 +-
 Documentation/devicetree/bindings/ata/ahci-platform.txt  |  2 +-
 Documentation/devicetree/bindings/ata/imx-sata.txt       |  2 +-
 Documentation/devicetree/bindings/bus/imx-weim.txt       |  2 +-
 Documentation/devicetree/bindings/bus/sunxi-rsb.txt      |  2 +-
 .../devicetree/bindings/clock/arm-syscon-icst.txt        |  2 +-
 .../devicetree/bindings/clock/clk-exynos-audss.txt       |  2 +-
 .../devicetree/bindings/clock/clk-s5pv210-audss.txt      |  2 +-
 .../devicetree/bindings/clock/dove-divider-clock.txt     |  2 +-
 Documentation/devicetree/bindings/clock/imx1-clock.txt   |  4 ++--
 Documentation/devicetree/bindings/clock/imx6q-clock.txt  |  4 ++--
 .../devicetree/bindings/clock/maxim,max77686.txt         |  4 ++--
 Documentation/devicetree/bindings/clock/st/st,clkgen.txt |  2 +-
 Documentation/devicetree/bindings/clock/sunxi-ccu.txt    |  4 ++--
 Documentation/devicetree/bindings/clock/sunxi.txt        | 16 ++++++++--------
 Documentation/devicetree/bindings/clock/ti,cdce706.txt   |  2 +-
 Documentation/devicetree/bindings/crypto/sun4i-ss.txt    |  2 +-
 .../devicetree/bindings/display/etnaviv/etnaviv-drm.txt  |  2 +-
 Documentation/devicetree/bindings/display/imx/hdmi.txt   |  4 ++--
 .../devicetree/bindings/display/simple-framebuffer.txt   |  2 +-
 .../devicetree/bindings/display/sunxi/sun4i-drm.txt      |  4 ++--
 Documentation/devicetree/bindings/dma/sun4i-dma.txt      |  4 ++--
 Documentation/devicetree/bindings/dma/sun6i-dma.txt      |  2 +-
 Documentation/devicetree/bindings/dma/ti-edma.txt        |  6 +++---
 Documentation/devicetree/bindings/dma/zxdma.txt          |  2 +-
 .../bindings/firmware/nvidia,tegra186-bpmp.txt           |  2 +-
 .../devicetree/bindings/gpio/gpio-dsp-keystone.txt       |  2 +-
 .../devicetree/bindings/gpio/gpio-tz1090-pdc.txt         |  2 +-
 Documentation/devicetree/bindings/gpio/gpio-tz1090.txt   |  2 +-
 Documentation/devicetree/bindings/i2c/i2c-axxia.txt      |  2 +-
 Documentation/devicetree/bindings/i2c/i2c-sunxi-p2wi.txt |  2 +-
 .../devicetree/bindings/iio/magnetometer/ak8974.txt      |  2 +-
 .../devicetree/bindings/iio/magnetometer/ak8975.txt      |  2 +-
 .../devicetree/bindings/input/sun4i-lradc-keys.txt       |  2 +-
 .../devicetree/bindings/input/touchscreen/egalax-ts.txt  |  2 +-
 .../devicetree/bindings/input/touchscreen/imx6ul_tsc.txt |  2 +-
 .../interrupt-controller/allwinner,sunxi-nmi.txt         |  2 +-
 .../bindings/interrupt-controller/ti,keystone-irq.txt    |  2 +-
 Documentation/devicetree/bindings/iommu/qcom,iommu.txt   |  2 +-
 .../devicetree/bindings/leds/register-bit-led.txt        | 16 ++++++++--------
 .../devicetree/bindings/mailbox/ti,message-manager.txt   |  2 +-
 Documentation/devicetree/bindings/marvell.txt            |  4 ++--
 Documentation/devicetree/bindings/media/i2c/tc358743.txt |  2 +-
 Documentation/devicetree/bindings/media/img-ir-rev1.txt  |  2 +-
 Documentation/devicetree/bindings/media/stih-cec.txt     |  2 +-
 .../devicetree/bindings/media/stih407-c8sectpfe.txt      |  2 +-
 Documentation/devicetree/bindings/media/sunxi-ir.txt     |  2 +-
 Documentation/devicetree/bindings/mfd/max77686.txt       |  2 +-
 Documentation/devicetree/bindings/mfd/max77802.txt       |  2 +-
 Documentation/devicetree/bindings/mfd/mfd.txt            |  2 +-
 Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt    |  4 ++--
 Documentation/devicetree/bindings/mfd/sun6i-prcm.txt     |  2 +-
 Documentation/devicetree/bindings/mfd/syscon.txt         |  2 +-
 Documentation/devicetree/bindings/mmc/mmc.txt            |  2 +-
 Documentation/devicetree/bindings/mmc/sdhci-st.txt       |  4 ++--
 Documentation/devicetree/bindings/mmc/sunxi-mmc.txt      |  4 ++--
 Documentation/devicetree/bindings/mtd/sunxi-nand.txt     |  2 +-
 .../devicetree/bindings/net/allwinner,sun4i-emac.txt     |  2 +-
 .../devicetree/bindings/net/allwinner,sun4i-mdio.txt     |  4 ++--
 .../devicetree/bindings/net/allwinner,sun7i-a20-gmac.txt |  2 +-
 Documentation/devicetree/bindings/net/brcm,bcmgenet.txt  |  2 +-
 Documentation/devicetree/bindings/net/can/m_can.txt      |  2 +-
 Documentation/devicetree/bindings/net/can/sun4i_can.txt  |  4 ++--
 .../bindings/net/wireless/brcm,bcm43xx-fmac.txt          |  2 +-
 .../devicetree/bindings/nvmem/allwinner,sunxi-sid.txt    |  4 ++--
 Documentation/devicetree/bindings/nvmem/brcm,ocotp.txt   |  2 +-
 Documentation/devicetree/bindings/nvmem/imx-ocotp.txt    |  2 +-
 Documentation/devicetree/bindings/nvmem/nvmem.txt        |  2 +-
 Documentation/devicetree/bindings/nvmem/qfprom.txt       |  2 +-
 Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt   |  2 +-
 .../devicetree/bindings/pci/nvidia,tegra20-pcie.txt      | 12 ++++++------
 .../devicetree/bindings/phy/brcm,cygnus-pcie-phy.txt     |  2 +-
 Documentation/devicetree/bindings/phy/mxs-usb-phy.txt    |  2 +-
 Documentation/devicetree/bindings/phy/sun9i-usb-phy.txt  |  2 +-
 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt         |  2 +-
 .../devicetree/bindings/pinctrl/fsl,imx-pinctrl.txt      |  4 ++--
 .../bindings/pinctrl/img,tz1090-pdc-pinctrl.txt          |  4 ++--
 .../devicetree/bindings/pinctrl/img,tz1090-pinctrl.txt   |  4 ++--
 .../bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt     |  2 +-
 .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt       |  2 +-
 Documentation/devicetree/bindings/pinctrl/pinctrl-st.txt |  2 +-
 .../devicetree/bindings/pinctrl/qcom,msm8996-pinctrl.txt |  2 +-
 Documentation/devicetree/bindings/power/fsl,imx-gpc.txt  |  4 ++--
 .../bindings/power/reset/imx-snvs-poweroff.txt           |  2 +-
 .../devicetree/bindings/power/reset/keystone-reset.txt   |  4 ++--
 .../devicetree/bindings/powerpc/fsl/mcu-mpc8349emitx.txt |  2 +-
 Documentation/devicetree/bindings/pwm/pwm-sun4i.txt      |  2 +-
 Documentation/devicetree/bindings/regulator/max77686.txt |  2 +-
 Documentation/devicetree/bindings/regulator/max77802.txt |  2 +-
 .../bindings/reset/allwinner,sunxi-clock-reset.txt       |  2 +-
 Documentation/devicetree/bindings/reset/fsl,imx-src.txt  |  6 +++---
 .../devicetree/bindings/reset/ti-syscon-reset.txt        |  2 +-
 Documentation/devicetree/bindings/rtc/sun6i-rtc.txt      |  2 +-
 Documentation/devicetree/bindings/rtc/sunxi-rtc.txt      |  2 +-
 .../devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt     |  2 +-
 .../devicetree/bindings/soc/fsl/cpm_qe/qe/pincfg.txt     |  2 +-
 .../devicetree/bindings/soc/ti/sci-pm-domain.txt         |  2 +-
 .../devicetree/bindings/sound/cdns,xtfpga-i2s.txt        |  2 +-
 Documentation/devicetree/bindings/sound/fsl,asrc.txt     |  2 +-
 Documentation/devicetree/bindings/sound/fsl,esai.txt     |  2 +-
 Documentation/devicetree/bindings/sound/fsl,spdif.txt    |  2 +-
 Documentation/devicetree/bindings/sound/imx-audmux.txt   |  2 +-
 Documentation/devicetree/bindings/sound/samsung-i2s.txt  |  2 +-
 Documentation/devicetree/bindings/sound/sun4i-codec.txt  |  4 ++--
 Documentation/devicetree/bindings/sound/sun4i-i2s.txt    |  2 +-
 .../devicetree/bindings/sound/sun8i-a33-codec.txt        |  2 +-
 .../devicetree/bindings/sound/sun8i-codec-analog.txt     |  2 +-
 .../devicetree/bindings/sound/sunxi,sun4i-spdif.txt      |  2 +-
 Documentation/devicetree/bindings/sound/zte,zx-spdif.txt |  2 +-
 Documentation/devicetree/bindings/spi/spi-sun4i.txt      |  2 +-
 Documentation/devicetree/bindings/spi/spi-sun6i.txt      |  4 ++--
 Documentation/devicetree/bindings/sram/samsung-sram.txt  |  2 +-
 Documentation/devicetree/bindings/sram/sunxi-sram.txt    |  4 ++--
 .../bindings/timer/allwinner,sun5i-a13-hstimer.txt       |  2 +-
 .../devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt |  2 +-
 Documentation/devicetree/bindings/usb/am33xx-usb.txt     |  2 +-
 Documentation/devicetree/bindings/usb/atmel-usb.txt      |  4 ++--
 Documentation/devicetree/bindings/usb/ohci-da8xx.txt     |  2 +-
 Documentation/devicetree/bindings/usb/usb-ehci.txt       |  2 +-
 Documentation/devicetree/bindings/usb/usb-ohci.txt       |  2 +-
 Documentation/devicetree/bindings/usb/usb3503.txt        |  2 +-
 Documentation/devicetree/bindings/usb/usbmisc-imx.txt    |  2 +-
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt   |  2 +-
 Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt |  2 +-
 127 files changed, 173 insertions(+), 173 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
index 87ed955..779f561 100644
--- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
@@ -61,7 +61,7 @@ pmu_system_controller: system-controller@10040000 {
 
 Example of clock consumer :
 
-usb3503: usb3503@08 {
+usb3503: usb3503@8 {
 	/* ... */
 	clock-names = "refclk";
 	clocks = <&pmu_system_controller 0>;
diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
index 5e95e3e..e134596 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
@@ -72,7 +72,7 @@ Optional nodes:
         - compatible: only "samsung,secure-firmware" is currently supported
         - reg: address of non-secure SYSRAM used for communication with firmware
 
-	firmware@0203F000 {
+	firmware@203F000 {
 		compatible = "samsung,secure-firmware";
 		reg = <0x0203F000 0x1000>;
 	};
diff --git a/Documentation/devicetree/bindings/arm/sp810.txt b/Documentation/devicetree/bindings/arm/sp810.txt
index 6808fb5..1b2ab1f 100644
--- a/Documentation/devicetree/bindings/arm/sp810.txt
+++ b/Documentation/devicetree/bindings/arm/sp810.txt
@@ -33,7 +33,7 @@ Required properties:
 		property with the highest frequency
 
 Example:
-	v2m_sysctl: sysctl@020000 {
+	v2m_sysctl: sysctl@20000 {
 		compatible = "arm,sp810", "arm,primecell";
 		reg = <0x020000 0x1000>;
 		clocks = <&v2m_refclk32khz>, <&v2m_refclk1mhz>, <&smbclk>;
diff --git a/Documentation/devicetree/bindings/arm/vexpress-sysreg.txt b/Documentation/devicetree/bindings/arm/vexpress-sysreg.txt
index 00318d0..5009580 100644
--- a/Documentation/devicetree/bindings/arm/vexpress-sysreg.txt
+++ b/Documentation/devicetree/bindings/arm/vexpress-sysreg.txt
@@ -37,7 +37,7 @@ Example:
  		compatible = "arm,vexpress-sysreg";
  		reg = <0x10000000 0x1000>;
 
-		v2m_led_gpios: sys_led@08 {
+		v2m_led_gpios: sys_led@8 {
 			compatible = "arm,vexpress-sysreg,sys_led";
 			gpio-controller;
 			#gpio-cells = <2>;
diff --git a/Documentation/devicetree/bindings/ata/ahci-platform.txt b/Documentation/devicetree/bindings/ata/ahci-platform.txt
index fedc213..c760ecb 100644
--- a/Documentation/devicetree/bindings/ata/ahci-platform.txt
+++ b/Documentation/devicetree/bindings/ata/ahci-platform.txt
@@ -56,7 +56,7 @@ Examples:
 		interrupts = <115>;
         };
 
-	ahci: sata@01c18000 {
+	ahci: sata@1c18000 {
 		compatible = "allwinner,sun4i-a10-ahci";
 		reg = <0x01c18000 0x1000>;
 		interrupts = <56>;
diff --git a/Documentation/devicetree/bindings/ata/imx-sata.txt b/Documentation/devicetree/bindings/ata/imx-sata.txt
index fa511db..a3d1471 100644
--- a/Documentation/devicetree/bindings/ata/imx-sata.txt
+++ b/Documentation/devicetree/bindings/ata/imx-sata.txt
@@ -25,7 +25,7 @@ Optional properties:
 
 Examples:
 
-sata@02200000 {
+sata@2200000 {
 	compatible = "fsl,imx6q-ahci";
 	reg = <0x02200000 0x4000>;
 	interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/Documentation/devicetree/bindings/bus/imx-weim.txt b/Documentation/devicetree/bindings/bus/imx-weim.txt
index 6630d84..683eaf3 100644
--- a/Documentation/devicetree/bindings/bus/imx-weim.txt
+++ b/Documentation/devicetree/bindings/bus/imx-weim.txt
@@ -61,7 +61,7 @@ Timing property for child nodes. It is mandatory, not optional.
 
 Example for an imx6q-sabreauto board, the NOR flash connected to the WEIM:
 
-	weim: weim@021b8000 {
+	weim: weim@21b8000 {
 		compatible = "fsl,imx6q-weim";
 		reg = <0x021b8000 0x4000>;
 		clocks = <&clks 196>;
diff --git a/Documentation/devicetree/bindings/bus/sunxi-rsb.txt b/Documentation/devicetree/bindings/bus/sunxi-rsb.txt
index 3dd2834..eb3ed628 100644
--- a/Documentation/devicetree/bindings/bus/sunxi-rsb.txt
+++ b/Documentation/devicetree/bindings/bus/sunxi-rsb.txt
@@ -28,7 +28,7 @@ which can normally be found in the datasheet.
 
 Example:
 
-	rsb@01f03400 {
+	rsb@1f03400 {
 		compatible = "allwinner,sun8i-a23-rsb";
 		reg = <0x01f03400 0x400>;
 		interrupts = <0 39 4>;
diff --git a/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt b/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt
index 2746811..4cd8174 100644
--- a/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt
+++ b/Documentation/devicetree/bindings/clock/arm-syscon-icst.txt
@@ -59,7 +59,7 @@ syscon: syscon@10000000 {
 	compatible = "syscon";
 	reg = <0x10000000 0x1000>;
 
-	oscclk0: osc0@0c {
+	oscclk0: osc0@c {
 		compatible = "arm,syscon-icst307";
 		#clock-cells = <0>;
 		lock-offset = <0x20>;
diff --git a/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt b/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
index f3635d5..6030afb 100644
--- a/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
+++ b/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
@@ -86,7 +86,7 @@ Example 3: I2S controller node that consumes the clock generated by the clock
            controller. Refer to the standard clock bindings for information
            about 'clocks' and 'clock-names' property.
 
-i2s0: i2s@03830000 {
+i2s0: i2s@3830000 {
 	compatible = "samsung,i2s-v5";
 	reg = <0x03830000 0x100>;
 	dmas = <&pdma0 10
diff --git a/Documentation/devicetree/bindings/clock/clk-s5pv210-audss.txt b/Documentation/devicetree/bindings/clock/clk-s5pv210-audss.txt
index 4fc869b..f6272dc 100644
--- a/Documentation/devicetree/bindings/clock/clk-s5pv210-audss.txt
+++ b/Documentation/devicetree/bindings/clock/clk-s5pv210-audss.txt
@@ -43,7 +43,7 @@ Example: I2S controller node that consumes the clock generated by the clock
 	 controller. Refer to the standard clock bindings for information
          about 'clocks' and 'clock-names' property.
 
-	i2s0: i2s@03830000 {
+	i2s0: i2s@3830000 {
 		/* ... */
 		clock-names = "iis", "i2s_opclk0",
 				"i2s_opclk1";
diff --git a/Documentation/devicetree/bindings/clock/dove-divider-clock.txt b/Documentation/devicetree/bindings/clock/dove-divider-clock.txt
index e3eb0f6..217871f 100644
--- a/Documentation/devicetree/bindings/clock/dove-divider-clock.txt
+++ b/Documentation/devicetree/bindings/clock/dove-divider-clock.txt
@@ -21,7 +21,7 @@ Required properties:
    a size of 8.
 - #clock-cells : from common clock binding; shall be set to 1
 
-divider_clk: core-clock@0064 {
+divider_clk: core-clock@64 {
 	compatible = "marvell,dove-divider-clock";
 	reg = <0x0064 0x8>;
 	#clock-cells = <1>;
diff --git a/Documentation/devicetree/bindings/clock/imx1-clock.txt b/Documentation/devicetree/bindings/clock/imx1-clock.txt
index b7adf4e..9823baf 100644
--- a/Documentation/devicetree/bindings/clock/imx1-clock.txt
+++ b/Documentation/devicetree/bindings/clock/imx1-clock.txt
@@ -10,13 +10,13 @@ ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx1-clock.h
 for the full list of i.MX1 clock IDs.
 
 Examples:
-	clks: ccm@0021b000 {
+	clks: ccm@21b000 {
 		#clock-cells = <1>;
 		compatible = "fsl,imx1-ccm";
 		reg = <0x0021b000 0x1000>;
 	};
 
-	pwm: pwm@00208000 {
+	pwm: pwm@208000 {
 		#pwm-cells = <2>;
 		compatible = "fsl,imx1-pwm";
 		reg = <0x00208000 0x1000>;
diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.txt b/Documentation/devicetree/bindings/clock/imx6q-clock.txt
index aa0a4d4..a45ca67a 100644
--- a/Documentation/devicetree/bindings/clock/imx6q-clock.txt
+++ b/Documentation/devicetree/bindings/clock/imx6q-clock.txt
@@ -14,14 +14,14 @@ Examples:
 
 #include <dt-bindings/clock/imx6qdl-clock.h>
 
-clks: ccm@020c4000 {
+clks: ccm@20c4000 {
 	compatible = "fsl,imx6q-ccm";
 	reg = <0x020c4000 0x4000>;
 	interrupts = <0 87 0x04 0 88 0x04>;
 	#clock-cells = <1>;
 };
 
-uart1: serial@02020000 {
+uart1: serial@2020000 {
 	compatible = "fsl,imx6q-uart", "fsl,imx21-uart";
 	reg = <0x02020000 0x4000>;
 	interrupts = <0 26 0x04>;
diff --git a/Documentation/devicetree/bindings/clock/maxim,max77686.txt b/Documentation/devicetree/bindings/clock/maxim,max77686.txt
index 8398a3a..3472b46 100644
--- a/Documentation/devicetree/bindings/clock/maxim,max77686.txt
+++ b/Documentation/devicetree/bindings/clock/maxim,max77686.txt
@@ -46,7 +46,7 @@ Example:
 /* ... */
 
 	Node of the MFD chip
-		max77686: max77686@09 {
+		max77686: max77686@9 {
 			compatible = "maxim,max77686";
 			interrupt-parent = <&wakeup_eint>;
 			interrupts = <26 0>;
@@ -71,7 +71,7 @@ Example:
 /* ... */
 
 	Node of the MFD chip
-		max77802: max77802@09 {
+		max77802: max77802@9 {
 			compatible = "maxim,max77802";
 			interrupt-parent = <&wakeup_eint>;
 			interrupts = <26 0>;
diff --git a/Documentation/devicetree/bindings/clock/st/st,clkgen.txt b/Documentation/devicetree/bindings/clock/st/st,clkgen.txt
index c35390f..7364953 100644
--- a/Documentation/devicetree/bindings/clock/st/st,clkgen.txt
+++ b/Documentation/devicetree/bindings/clock/st/st,clkgen.txt
@@ -42,7 +42,7 @@ Required properties:
 
 Example:
 
-	clockgen-a@090ff000 {
+	clockgen-a@90ff000 {
 		compatible = "st,clkgen-c32";
 		reg = <0x90ff000 0x1000>;
 
diff --git a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
index 7eda08e..4ca21c3 100644
--- a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
@@ -36,7 +36,7 @@ For the PRCM CCUs on A83T/H3/A64, two more clocks are needed:
 - "iosc": the SoC's internal frequency oscillator
 
 Example for generic CCU:
-ccu: clock@01c20000 {
+ccu: clock@1c20000 {
 	compatible = "allwinner,sun8i-h3-ccu";
 	reg = <0x01c20000 0x400>;
 	clocks = <&osc24M>, <&osc32k>;
@@ -46,7 +46,7 @@ ccu: clock@01c20000 {
 };
 
 Example for PRCM CCU:
-r_ccu: clock@01f01400 {
+r_ccu: clock@1f01400 {
 	compatible = "allwinner,sun50i-a64-r-ccu";
 	reg = <0x01f01400 0x100>;
 	clocks = <&osc24M>, <&osc32k>, <&iosc>, <&ccu CLK_PLL_PERIPH0>;
diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
index 8f7619d..1a042e2 100644
--- a/Documentation/devicetree/bindings/clock/sunxi.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi.txt
@@ -137,7 +137,7 @@ the address block, which is related to the overall mmc block.
 
 For example:
 
-osc24M: clk@01c20050 {
+osc24M: clk@1c20050 {
 	#clock-cells = <0>;
 	compatible = "allwinner,sun4i-a10-osc-clk";
 	reg = <0x01c20050 0x4>;
@@ -145,7 +145,7 @@ osc24M: clk@01c20050 {
 	clock-output-names = "osc24M";
 };
 
-pll1: clk@01c20000 {
+pll1: clk@1c20000 {
 	#clock-cells = <0>;
 	compatible = "allwinner,sun4i-a10-pll1-clk";
 	reg = <0x01c20000 0x4>;
@@ -153,7 +153,7 @@ pll1: clk@01c20000 {
 	clock-output-names = "pll1";
 };
 
-pll5: clk@01c20020 {
+pll5: clk@1c20020 {
 	#clock-cells = <1>;
 	compatible = "allwinner,sun4i-pll5-clk";
 	reg = <0x01c20020 0x4>;
@@ -161,7 +161,7 @@ pll5: clk@01c20020 {
 	clock-output-names = "pll5_ddr", "pll5_other";
 };
 
-pll6: clk@01c20028 {
+pll6: clk@1c20028 {
 	#clock-cells = <1>;
 	compatible = "allwinner,sun6i-a31-pll6-clk";
 	reg = <0x01c20028 0x4>;
@@ -169,7 +169,7 @@ pll6: clk@01c20028 {
 	clock-output-names = "pll6", "pll6x2";
 };
 
-cpu: cpu@01c20054 {
+cpu: cpu@1c20054 {
 	#clock-cells = <0>;
 	compatible = "allwinner,sun4i-a10-cpu-clk";
 	reg = <0x01c20054 0x4>;
@@ -177,7 +177,7 @@ cpu: cpu@01c20054 {
 	clock-output-names = "cpu";
 };
 
-mmc0_clk: clk@01c20088 {
+mmc0_clk: clk@1c20088 {
 	#clock-cells = <1>;
 	compatible = "allwinner,sun4i-a10-mmc-clk";
 	reg = <0x01c20088 0x4>;
@@ -199,7 +199,7 @@ gmac_int_tx_clk: clk@3 {
 	clock-output-names = "gmac_int_tx";
 };
 
-gmac_clk: clk@01c20164 {
+gmac_clk: clk@1c20164 {
 	#clock-cells = <0>;
 	compatible = "allwinner,sun7i-a20-gmac-clk";
 	reg = <0x01c20164 0x4>;
@@ -211,7 +211,7 @@ gmac_clk: clk@01c20164 {
 	clock-output-names = "gmac";
 };
 
-mmc_config_clk: clk@01c13000 {
+mmc_config_clk: clk@1c13000 {
 	compatible = "allwinner,sun9i-a80-mmc-config-clk";
 	reg = <0x01c13000 0x10>;
 	clocks = <&ahb0_gates 8>;
diff --git a/Documentation/devicetree/bindings/clock/ti,cdce706.txt b/Documentation/devicetree/bindings/clock/ti,cdce706.txt
index 616836e..959d966 100644
--- a/Documentation/devicetree/bindings/clock/ti,cdce706.txt
+++ b/Documentation/devicetree/bindings/clock/ti,cdce706.txt
@@ -25,7 +25,7 @@ Example:
 		};
 	};
 	...
-	i2c0: i2c-master@0d090000 {
+	i2c0: i2c-master@d090000 {
 		...
 		cdce706: clock-synth@69 {
 			compatible = "ti,cdce706";
diff --git a/Documentation/devicetree/bindings/crypto/sun4i-ss.txt b/Documentation/devicetree/bindings/crypto/sun4i-ss.txt
index 5d38e9b..f2dc3d9 100644
--- a/Documentation/devicetree/bindings/crypto/sun4i-ss.txt
+++ b/Documentation/devicetree/bindings/crypto/sun4i-ss.txt
@@ -14,7 +14,7 @@ Optional properties:
  - reset-names : must contain "ahb"
 
 Example:
-	crypto: crypto-engine@01c15000 {
+	crypto: crypto-engine@1c15000 {
 		compatible = "allwinner,sun4i-a10-crypto";
 		reg = <0x01c15000 0x1000>;
 		interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
index ed5e0a7..05176f1 100644
--- a/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
+++ b/Documentation/devicetree/bindings/display/etnaviv/etnaviv-drm.txt
@@ -42,7 +42,7 @@ Optional properties:
 
 example:
 
-gpu_3d: gpu@00130000 {
+gpu_3d: gpu@130000 {
 	compatible = "vivante,gc";
 	reg = <0x00130000 0x4000>;
 	interrupts = <0 9 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/Documentation/devicetree/bindings/display/imx/hdmi.txt b/Documentation/devicetree/bindings/display/imx/hdmi.txt
index 66a8f86..6d021e7 100644
--- a/Documentation/devicetree/bindings/display/imx/hdmi.txt
+++ b/Documentation/devicetree/bindings/display/imx/hdmi.txt
@@ -32,11 +32,11 @@ Optional properties
 
 Example:
 
-	gpr: iomuxc-gpr@020e0000 {
+	gpr: iomuxc-gpr@20e0000 {
 		/* ... */
 	};
 
-        hdmi: hdmi@0120000 {
+        hdmi: hdmi@120000 {
                 #address-cells = <1>;
                 #size-cells = <0>;
                 compatible = "fsl,imx6q-hdmi";
diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.txt b/Documentation/devicetree/bindings/display/simple-framebuffer.txt
index 8c9e9f5..5a9ce51 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.txt
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.txt
@@ -78,7 +78,7 @@ chosen {
 	stdout-path = "display0";
 };
 
-soc@01c00000 {
+soc@1c00000 {
 	lcdc0: lcdc@1c0c000 {
 		compatible = "allwinner,sun4i-a10-lcdc";
 		...
diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index 013e76b..50cc72e 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -278,7 +278,7 @@ connector {
 	};
 };
 
-hdmi: hdmi@01c16000 {
+hdmi: hdmi@1c16000 {
 	compatible = "allwinner,sun5i-a10s-hdmi";
 	reg = <0x01c16000 0x1000>;
 	interrupts = <58>;
@@ -317,7 +317,7 @@ hdmi: hdmi@01c16000 {
 	};
 };
 
-tve0: tv-encoder@01c0a000 {
+tve0: tv-encoder@1c0a000 {
 	compatible = "allwinner,sun4i-a10-tv-encoder";
 	reg = <0x01c0a000 0x1000>;
 	clocks = <&ahb_gates 34>;
diff --git a/Documentation/devicetree/bindings/dma/sun4i-dma.txt b/Documentation/devicetree/bindings/dma/sun4i-dma.txt
index 3b48438..8ad556a 100644
--- a/Documentation/devicetree/bindings/dma/sun4i-dma.txt
+++ b/Documentation/devicetree/bindings/dma/sun4i-dma.txt
@@ -12,7 +12,7 @@ Required properties:
 		second cell holding the request line number.
 
 Example:
-	dma: dma-controller@01c02000 {
+	dma: dma-controller@1c02000 {
 		compatible = "allwinner,sun4i-a10-dma";
 		reg = <0x01c02000 0x1000>;
 		interrupts = <27>;
@@ -32,7 +32,7 @@ The three cells in order are:
 3. The port ID as specified in the datasheet
 
 Example:
-	spi2: spi@01c17000 {
+	spi2: spi@1c17000 {
 		compatible = "allwinner,sun4i-a10-spi";
 		reg = <0x01c17000 0x1000>;
 		interrupts = <0 12 4>;
diff --git a/Documentation/devicetree/bindings/dma/sun6i-dma.txt b/Documentation/devicetree/bindings/dma/sun6i-dma.txt
index b2df4f0..7fccc20 100644
--- a/Documentation/devicetree/bindings/dma/sun6i-dma.txt
+++ b/Documentation/devicetree/bindings/dma/sun6i-dma.txt
@@ -64,7 +64,7 @@ The two cells in order are:
 2. The port ID as specified in the datasheet
 
 Example:
-spi2: spi@01c6a000 {
+spi2: spi@1c6a000 {
 	compatible = "allwinner,sun6i-a31-spi";
 	reg = <0x01c6a000 0x1000>;
 	interrupts = <0 67 4>;
diff --git a/Documentation/devicetree/bindings/dma/ti-edma.txt b/Documentation/devicetree/bindings/dma/ti-edma.txt
index 41f0c1a..66026dc 100644
--- a/Documentation/devicetree/bindings/dma/ti-edma.txt
+++ b/Documentation/devicetree/bindings/dma/ti-edma.txt
@@ -142,7 +142,7 @@ mcasp0: mcasp@48038000 {
 };
 
 2.
-edma1: edma@02728000 {
+edma1: edma@2728000 {
 	compatible = "ti,k2g-edma3-tpcc", "ti,edma3-tpcc";
 	reg =	<0x02728000 0x8000>;
 	reg-names = "edma3_cc";
@@ -165,13 +165,13 @@ edma1: edma@02728000 {
 	power-domains = <&k2g_pds 0x4f>;
 };
 
-edma1_tptc0: tptc@027b0000 {
+edma1_tptc0: tptc@27b0000 {
 	compatible = "ti,k2g-edma3-tptc", "ti,edma3-tptc";
 	reg =	<0x027b0000 0x400>;
 	power-domains = <&k2g_pds 0x4f>;
 };
 
-edma1_tptc1: tptc@027b8000 {
+edma1_tptc1: tptc@27b8000 {
 	compatible = "ti, k2g-edma3-tptc", "ti,edma3-tptc";
 	reg =	<0x027b8000 0x400>;
 	power-domains = <&k2g_pds 0x4f>;
diff --git a/Documentation/devicetree/bindings/dma/zxdma.txt b/Documentation/devicetree/bindings/dma/zxdma.txt
index 3207ceb..abec59f 100644
--- a/Documentation/devicetree/bindings/dma/zxdma.txt
+++ b/Documentation/devicetree/bindings/dma/zxdma.txt
@@ -26,7 +26,7 @@ Controller:
 Client:
 Use specific request line passing from dmax
 For example, spdif0 tx channel request line is 4
-	spdif0: spdif0@0b004000 {
+	spdif0: spdif0@b004000 {
 		#sound-dai-cells = <0>;
 		compatible = "zte,zx296702-spdif";
 		reg = <0x0b004000 0x1000>;
diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
index e821e16..0c10802 100644
--- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
+++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
@@ -66,7 +66,7 @@ See ".../sram/sram.txt" for the bindings.
 
 Example:
 
-hsp_top0: hsp@03c00000 {
+hsp_top0: hsp@3c00000 {
 	...
 	#mbox-cells = <2>;
 };
diff --git a/Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt b/Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
index 6c7e6c7..0423699 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-dsp-keystone.txt
@@ -25,7 +25,7 @@ Please refer to gpio.txt in this directory for details of the common GPIO
 bindings used by client devices.
 
 Example:
-	dspgpio0: keystone_dsp_gpio@02620240 {
+	dspgpio0: keystone_dsp_gpio@2620240 {
 		compatible = "ti,keystone-dsp-gpio";
 		ti,syscon-dev = <&devctrl 0x240>;
 		gpio-controller;
diff --git a/Documentation/devicetree/bindings/gpio/gpio-tz1090-pdc.txt b/Documentation/devicetree/bindings/gpio/gpio-tz1090-pdc.txt
index 1fd98ff..528f5ef 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-tz1090-pdc.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-tz1090-pdc.txt
@@ -30,7 +30,7 @@ Optional properties:
 
 Example:
 
-	pdc_gpios: gpio-controller@02006500 {
+	pdc_gpios: gpio-controller@2006500 {
 		gpio-controller;
 		#gpio-cells = <2>;
 
diff --git a/Documentation/devicetree/bindings/gpio/gpio-tz1090.txt b/Documentation/devicetree/bindings/gpio/gpio-tz1090.txt
index 174cdf3..b05a90e 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-tz1090.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-tz1090.txt
@@ -59,7 +59,7 @@ Required properties:
 
 Example:
 
-	gpios: gpio-controller@02005800 {
+	gpios: gpio-controller@2005800 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "img,tz1090-gpio";
diff --git a/Documentation/devicetree/bindings/i2c/i2c-axxia.txt b/Documentation/devicetree/bindings/i2c/i2c-axxia.txt
index 2296d78..7d53a2b 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-axxia.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-axxia.txt
@@ -17,7 +17,7 @@ Optional properties :
 
 Example :
 
-i2c@02010084000 {
+i2c@2010084000 {
 	compatible = "lsi,api2c";
 	device_type = "i2c";
 	#address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/i2c/i2c-sunxi-p2wi.txt b/Documentation/devicetree/bindings/i2c/i2c-sunxi-p2wi.txt
index 6b76548..49df005 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-sunxi-p2wi.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-sunxi-p2wi.txt
@@ -24,7 +24,7 @@ Slave device properties:
 
 Example:
 
-	p2wi@01f03400 {
+	p2wi@1f03400 {
 		compatible = "allwinner,sun6i-a31-p2wi";
 		reg = <0x01f03400 0x400>;
 		interrupts = <0 39 4>;
diff --git a/Documentation/devicetree/bindings/iio/magnetometer/ak8974.txt b/Documentation/devicetree/bindings/iio/magnetometer/ak8974.txt
index 77d5aba1..baecc4a 100644
--- a/Documentation/devicetree/bindings/iio/magnetometer/ak8974.txt
+++ b/Documentation/devicetree/bindings/iio/magnetometer/ak8974.txt
@@ -19,7 +19,7 @@ Optional properties:
 
 Example:
 
-ak8974@0f {
+ak8974@f {
 	compatible = "asahi-kasei,ak8974";
 	reg = <0x0f>;
 	avdd-supply = <&foo_reg>;
diff --git a/Documentation/devicetree/bindings/iio/magnetometer/ak8975.txt b/Documentation/devicetree/bindings/iio/magnetometer/ak8975.txt
index e1e7dd32..aa67ceb 100644
--- a/Documentation/devicetree/bindings/iio/magnetometer/ak8975.txt
+++ b/Documentation/devicetree/bindings/iio/magnetometer/ak8975.txt
@@ -13,7 +13,7 @@ Optional properties:
 
 Example:
 
-ak8975@0c {
+ak8975@c {
         compatible = "asahi-kasei,ak8975";
         reg = <0x0c>;
         gpios = <&gpj0 7 0>;
diff --git a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
index 4357e49..1458c31 100644
--- a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
+++ b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
@@ -19,7 +19,7 @@ Example:
 
 #include <dt-bindings/input/input.h>
 
-	lradc: lradc@01c22800 {
+	lradc: lradc@1c22800 {
 		compatible = "allwinner,sun4i-a10-lradc-keys";
 		reg = <0x01c22800 0x100>;
 		interrupts = <31>;
diff --git a/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
index 49fa14e..298e344 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
@@ -10,7 +10,7 @@ Required properties:
 
 Example:
 
-	egalax_ts@04 {
+	touchscreen@4 {
 		compatible = "eeti,egalax_ts";
 		reg = <0x04>;
 		interrupt-parent = <&gpio1>;
diff --git a/Documentation/devicetree/bindings/input/touchscreen/imx6ul_tsc.txt b/Documentation/devicetree/bindings/input/touchscreen/imx6ul_tsc.txt
index e67e58b..1649150 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/imx6ul_tsc.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/imx6ul_tsc.txt
@@ -21,7 +21,7 @@ Optional properties:
   each read. Valid values are 1, 4, 8, 16 and 32.
 
 Example:
-	tsc: tsc@02040000 {
+	tsc: tsc@2040000 {
 		compatible = "fsl,imx6ul-tsc";
 		reg = <0x02040000 0x4000>, <0x0219c000 0x4000>;
 		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sunxi-nmi.txt b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sunxi-nmi.txt
index 4ae553e..4903fb7 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sunxi-nmi.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sunxi-nmi.txt
@@ -20,7 +20,7 @@ Required properties:
 
 Example:
 
-sc-nmi-intc@01c00030 {
+sc-nmi-intc@1c00030 {
 	compatible = "allwinner,sun7i-a20-sc-nmi";
 	interrupt-controller;
 	#interrupt-cells = <2>;
diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,keystone-irq.txt b/Documentation/devicetree/bindings/interrupt-controller/ti,keystone-irq.txt
index d9bb106..5f94d77 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,keystone-irq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,keystone-irq.txt
@@ -20,7 +20,7 @@ Please refer to interrupts.txt in this directory for details of the common
 Interrupt Controllers bindings used by client devices.
 
 Example:
-	kirq0: keystone_irq0@026202a0 {
+	kirq0: keystone_irq0@26202a0 {
 		compatible = "ti,keystone-irq";
 		ti,syscon-dev = <&devctrl 0x2a0>;
 		interrupts = <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
index b2641ce..059139a 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
@@ -115,7 +115,7 @@ to non-secure vs secure interrupt line.
 		iommus = <&apps_iommu 4>;
 	};
 
-	gpu@01c00000 {
+	gpu@1c00000 {
 		...
 		iommus = <&gpu_iommu 1>, <&gpu_iommu 2>;
 	};
diff --git a/Documentation/devicetree/bindings/leds/register-bit-led.txt b/Documentation/devicetree/bindings/leds/register-bit-led.txt
index 59b5636..cf1ea40 100644
--- a/Documentation/devicetree/bindings/leds/register-bit-led.txt
+++ b/Documentation/devicetree/bindings/leds/register-bit-led.txt
@@ -32,7 +32,7 @@ syscon: syscon@10000000 {
 	compatible = "arm,realview-pb1176-syscon", "syscon";
 	reg = <0x10000000 0x1000>;
 
-	led@08.0 {
+	led@8.0 {
 		compatible = "register-bit-led";
 		offset = <0x08>;
 		mask = <0x01>;
@@ -40,7 +40,7 @@ syscon: syscon@10000000 {
 		linux,default-trigger = "heartbeat";
 		default-state = "on";
 	};
-	led@08.1 {
+	led@8.1 {
 		compatible = "register-bit-led";
 		offset = <0x08>;
 		mask = <0x02>;
@@ -48,7 +48,7 @@ syscon: syscon@10000000 {
 		linux,default-trigger = "mmc0";
 		default-state = "off";
 	};
-	led@08.2 {
+	led@8.2 {
 		compatible = "register-bit-led";
 		offset = <0x08>;
 		mask = <0x04>;
@@ -56,35 +56,35 @@ syscon: syscon@10000000 {
 		linux,default-trigger = "cpu0";
 		default-state = "off";
 	};
-	led@08.3 {
+	led@8.3 {
 		compatible = "register-bit-led";
 		offset = <0x08>;
 		mask = <0x08>;
 		label = "versatile:3";
 		default-state = "off";
 	};
-	led@08.4 {
+	led@8.4 {
 		compatible = "register-bit-led";
 		offset = <0x08>;
 		mask = <0x10>;
 		label = "versatile:4";
 		default-state = "off";
 	};
-	led@08.5 {
+	led@8.5 {
 		compatible = "register-bit-led";
 		offset = <0x08>;
 		mask = <0x20>;
 		label = "versatile:5";
 		default-state = "off";
 	};
-	led@08.6 {
+	led@8.6 {
 		compatible = "register-bit-led";
 		offset = <0x08>;
 		mask = <0x40>;
 		label = "versatile:6";
 		default-state = "off";
 	};
-	led@08.7 {
+	led@8.7 {
 		compatible = "register-bit-led";
 		offset = <0x08>;
 		mask = <0x80>;
diff --git a/Documentation/devicetree/bindings/mailbox/ti,message-manager.txt b/Documentation/devicetree/bindings/mailbox/ti,message-manager.txt
index b449d02..c3b55b3 100644
--- a/Documentation/devicetree/bindings/mailbox/ti,message-manager.txt
+++ b/Documentation/devicetree/bindings/mailbox/ti,message-manager.txt
@@ -29,7 +29,7 @@ Required properties:
 Example(K2G):
 ------------
 
-	msgmgr: msgmgr@02a00000 {
+	msgmgr: msgmgr@2a00000 {
 		compatible = "ti,k2g-message-manager";
 		#mbox-cells = <2>;
 		reg-names = "queue_proxy_region", "queue_state_debug_region";
diff --git a/Documentation/devicetree/bindings/marvell.txt b/Documentation/devicetree/bindings/marvell.txt
index ea2b16c..7f72231 100644
--- a/Documentation/devicetree/bindings/marvell.txt
+++ b/Documentation/devicetree/bindings/marvell.txt
@@ -446,7 +446,7 @@ prefixed with the string "marvell,", for Marvell Technology Group Ltd.
        that services interrupts for this device.
 
    Example Discovery CPU Error node:
-     cpu-error@0070 {
+     cpu-error@70 {
 	     compatible = "marvell,mv64360-cpu-error";
 	     reg = <0x70 0x10 0x128 0x28>;
 	     interrupts = <3>;
@@ -466,7 +466,7 @@ prefixed with the string "marvell,", for Marvell Technology Group Ltd.
        that services interrupts for this device.
 
    Example Discovery SRAM Controller node:
-     sram-ctrl@0380 {
+     sram-ctrl@380 {
 	     compatible = "marvell,mv64360-sram-ctrl";
 	     reg = <0x380 0x80>;
 	     interrupts = <13>;
diff --git a/Documentation/devicetree/bindings/media/i2c/tc358743.txt b/Documentation/devicetree/bindings/media/i2c/tc358743.txt
index 5218921..49f8bcc 100644
--- a/Documentation/devicetree/bindings/media/i2c/tc358743.txt
+++ b/Documentation/devicetree/bindings/media/i2c/tc358743.txt
@@ -27,7 +27,7 @@ Documentation/devicetree/bindings/media/video-interfaces.txt.
 
 Example:
 
-	tc358743@0f {
+	tc358743@f {
 		compatible = "toshiba,tc358743";
 		reg = <0x0f>;
 		clocks = <&hdmi_osc>;
diff --git a/Documentation/devicetree/bindings/media/img-ir-rev1.txt b/Documentation/devicetree/bindings/media/img-ir-rev1.txt
index 5434ce6..ed9ec52 100644
--- a/Documentation/devicetree/bindings/media/img-ir-rev1.txt
+++ b/Documentation/devicetree/bindings/media/img-ir-rev1.txt
@@ -25,7 +25,7 @@ Optional properties:
 
 Example:
 
-	ir@02006200 {
+	ir@2006200 {
 		compatible = "img,ir-rev1";
 		reg = <0x02006200 0x100>;
 		interrupts = <29 4>;
diff --git a/Documentation/devicetree/bindings/media/stih-cec.txt b/Documentation/devicetree/bindings/media/stih-cec.txt
index 8be2a04..ece0832 100644
--- a/Documentation/devicetree/bindings/media/stih-cec.txt
+++ b/Documentation/devicetree/bindings/media/stih-cec.txt
@@ -13,7 +13,7 @@ Required properties:
 
 Example for STIH407:
 
-sti-cec@094a087c {
+sti-cec@94a087c {
 	compatible = "st,stih-cec";
 	reg = <0x94a087c 0x64>;
 	clocks = <&clk_sysin>;
diff --git a/Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt b/Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt
index 6af3fc2..c7888d6 100644
--- a/Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt
+++ b/Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt
@@ -50,7 +50,7 @@ Example:
 
 /* stih410 SoC b2120 + b2004a + stv0367-pll(NIMB) + stv0367-tda18212 (NIMA) DT example) */
 
-	c8sectpfe@08a20000 {
+	c8sectpfe@8a20000 {
 		compatible = "st,stih407-c8sectpfe";
 		reg = <0x08a20000 0x10000>, <0x08a00000 0x4000>;
 		reg-names = "stfe", "stfe-ram";
diff --git a/Documentation/devicetree/bindings/media/sunxi-ir.txt b/Documentation/devicetree/bindings/media/sunxi-ir.txt
index 302a0b1..91648c5 100644
--- a/Documentation/devicetree/bindings/media/sunxi-ir.txt
+++ b/Documentation/devicetree/bindings/media/sunxi-ir.txt
@@ -14,7 +14,7 @@ Optional properties:
 
 Example:
 
-ir0: ir@01c21800 {
+ir0: ir@1c21800 {
 	compatible = "allwinner,sun4i-a10-ir";
 	clocks = <&apb0_gates 6>, <&ir0_clk>;
 	clock-names = "apb", "ir";
diff --git a/Documentation/devicetree/bindings/mfd/max77686.txt b/Documentation/devicetree/bindings/mfd/max77686.txt
index 741e766..0f2587fa 100644
--- a/Documentation/devicetree/bindings/mfd/max77686.txt
+++ b/Documentation/devicetree/bindings/mfd/max77686.txt
@@ -19,7 +19,7 @@ Required properties:
 
 Example:
 
-	max77686: pmic@09 {
+	max77686: pmic@9 {
 		compatible = "maxim,max77686";
 		interrupt-parent = <&wakeup_eint>;
 		interrupts = <26 0>;
diff --git a/Documentation/devicetree/bindings/mfd/max77802.txt b/Documentation/devicetree/bindings/mfd/max77802.txt
index 51fc1a6..f2f3fe7 100644
--- a/Documentation/devicetree/bindings/mfd/max77802.txt
+++ b/Documentation/devicetree/bindings/mfd/max77802.txt
@@ -18,7 +18,7 @@ Required properties:
 
 Example:
 
-	max77802: pmic@09 {
+	max77802: pmic@9 {
 		compatible = "maxim,max77802";
 		interrupt-parent = <&intc>;
 		interrupts = <26 IRQ_TYPE_NONE>;
diff --git a/Documentation/devicetree/bindings/mfd/mfd.txt b/Documentation/devicetree/bindings/mfd/mfd.txt
index bcb6abb..336c049 100644
--- a/Documentation/devicetree/bindings/mfd/mfd.txt
+++ b/Documentation/devicetree/bindings/mfd/mfd.txt
@@ -41,7 +41,7 @@ foo@1000 {
 	compatible = "syscon", "simple-mfd";
 	reg = <0x01000 0x1000>;
 
-	led@08.0 {
+	led@8.0 {
 		compatible = "register-bit-led";
 		offset = <0x08>;
 		mask = <0x01>;
diff --git a/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt b/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
index badff36..86dd819 100644
--- a/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
+++ b/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
@@ -10,7 +10,7 @@ Required properties:
   - #io-channel-cells: shall be 0,
 
 Example:
-	ths: ths@01c25000 {
+	ths: ths@1c25000 {
 		compatible = "allwinner,sun8i-a33-ths";
 		reg = <0x01c25000 0x100>;
 		#thermal-sensor-cells = <0>;
@@ -47,7 +47,7 @@ Optional properties:
 
 Example:
 
-	rtp: rtp@01c25000 {
+	rtp: rtp@1c25000 {
 		compatible = "allwinner,sun4i-a10-ts";
 		reg = <0x01c25000 0x100>;
 		interrupts = <29>;
diff --git a/Documentation/devicetree/bindings/mfd/sun6i-prcm.txt b/Documentation/devicetree/bindings/mfd/sun6i-prcm.txt
index 03c5a55..dd2c065 100644
--- a/Documentation/devicetree/bindings/mfd/sun6i-prcm.txt
+++ b/Documentation/devicetree/bindings/mfd/sun6i-prcm.txt
@@ -15,7 +15,7 @@ The prcm node may contain several subdevices definitions:
 
 Example:
 
-	prcm: prcm@01f01400 {
+	prcm: prcm@1f01400 {
 		compatible = "allwinner,sun6i-a31-prcm";
 		reg = <0x01f01400 0x200>;
 
diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Documentation/devicetree/bindings/mfd/syscon.txt
index 408f768..8b92d45 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.txt
+++ b/Documentation/devicetree/bindings/mfd/syscon.txt
@@ -18,7 +18,7 @@ Optional property:
   performed on the device.
 
 Examples:
-gpr: iomuxc-gpr@020e0000 {
+gpr: iomuxc-gpr@20e0000 {
 	compatible = "fsl,imx6q-iomuxc-gpr", "syscon";
 	reg = <0x020e0000 0x38>;
 };
diff --git a/Documentation/devicetree/bindings/mmc/mmc.txt b/Documentation/devicetree/bindings/mmc/mmc.txt
index 94a90b4..fb11ae8 100644
--- a/Documentation/devicetree/bindings/mmc/mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/mmc.txt
@@ -146,7 +146,7 @@ sdhci@ab000000 {
 
 Example with sdio function subnode:
 
-mmc3: mmc@01c12000 {
+mmc3: mmc@1c12000 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
diff --git a/Documentation/devicetree/bindings/mmc/sdhci-st.txt b/Documentation/devicetree/bindings/mmc/sdhci-st.txt
index e356455..6b3d40c 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-st.txt
+++ b/Documentation/devicetree/bindings/mmc/sdhci-st.txt
@@ -74,7 +74,7 @@ mmc0: sdhci@fe81e000 {
 
 /* Example SD stih407 family configuration */
 
-mmc1: sdhci@09080000 {
+mmc1: sdhci@9080000 {
 	compatible	= "st,sdhci-stih407", "st,sdhci";
 	reg		= <0x09080000 0x7ff>;
 	reg-names	= "mmc";
@@ -90,7 +90,7 @@ mmc1: sdhci@09080000 {
 
 /* Example eMMC stih407 family configuration */
 
-mmc0: sdhci@09060000 {
+mmc0: sdhci@9060000 {
 	compatible	= "st,sdhci-stih407", "st,sdhci";
 	reg		= <0x09060000 0x7ff>, <0x9061008 0x20>;
 	reg-names	= "mmc", "top-mmc-delay";
diff --git a/Documentation/devicetree/bindings/mmc/sunxi-mmc.txt b/Documentation/devicetree/bindings/mmc/sunxi-mmc.txt
index 63b57e2..132e000 100644
--- a/Documentation/devicetree/bindings/mmc/sunxi-mmc.txt
+++ b/Documentation/devicetree/bindings/mmc/sunxi-mmc.txt
@@ -29,7 +29,7 @@ Optional properties:
 
 Examples:
 	- Within .dtsi:
-	mmc0: mmc@01c0f000 {
+	mmc0: mmc@1c0f000 {
 		compatible = "allwinner,sun5i-a13-mmc";
 		reg = <0x01c0f000 0x1000>;
 		clocks = <&ahb_gates 8>, <&mmc0_clk>, <&mmc0_output_clk>, <&mmc0_sample_clk>;
@@ -39,7 +39,7 @@ Examples:
 	};
 
 	- Within dts:
-	mmc0: mmc@01c0f000 {
+	mmc0: mmc@1c0f000 {
 		pinctrl-names = "default", "default";
 		pinctrl-0 = <&mmc0_pins_a>;
 		pinctrl-1 = <&mmc0_cd_pin_reference_design>;
diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
index a37c67b..5e13a5c 100644
--- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
@@ -31,7 +31,7 @@ see Documentation/devicetree/bindings/mtd/nand.txt for generic bindings.
 
 
 Examples:
-nfc: nand@01c03000 {
+nfc: nand@1c03000 {
 	compatible = "allwinner,sun4i-a10-nand";
 	reg = <0x01c03000 0x1000>;
 	interrupts = <0 37 1>;
diff --git a/Documentation/devicetree/bindings/net/allwinner,sun4i-emac.txt b/Documentation/devicetree/bindings/net/allwinner,sun4i-emac.txt
index 10640b1..e98118a 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun4i-emac.txt
+++ b/Documentation/devicetree/bindings/net/allwinner,sun4i-emac.txt
@@ -10,7 +10,7 @@ Required properties:
 
 Example:
 
-emac: ethernet@01c0b000 {
+emac: ethernet@1c0b000 {
        compatible = "allwinner,sun4i-a10-emac";
        reg = <0x01c0b000 0x1000>;
        interrupts = <55>;
diff --git a/Documentation/devicetree/bindings/net/allwinner,sun4i-mdio.txt b/Documentation/devicetree/bindings/net/allwinner,sun4i-mdio.txt
index 4ec5641..ab5b861 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun4i-mdio.txt
+++ b/Documentation/devicetree/bindings/net/allwinner,sun4i-mdio.txt
@@ -9,7 +9,7 @@ Optional properties:
 - phy-supply: phandle to a regulator if the PHY needs one
 
 Example at the SoC level:
-mdio@01c0b080 {
+mdio@1c0b080 {
 	compatible = "allwinner,sun4i-a10-mdio";
 	reg = <0x01c0b080 0x14>;
 	#address-cells = <1>;
@@ -18,7 +18,7 @@ mdio@01c0b080 {
 
 And at the board level:
 
-mdio@01c0b080 {
+mdio@1c0b080 {
 	phy-supply = <&reg_emac_3v3>;
 
 	phy0: ethernet-phy@0 {
diff --git a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.txt b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.txt
index ea4d752..8b3f953 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.txt
+++ b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.txt
@@ -15,7 +15,7 @@ Optional properties:
 
 Examples:
 
-	gmac: ethernet@01c50000 {
+	gmac: ethernet@1c50000 {
 		compatible = "allwinner,sun7i-a20-gmac";
 		reg = <0x01c50000 0x10000>,
 		      <0x01c20164 0x4>;
diff --git a/Documentation/devicetree/bindings/net/brcm,bcmgenet.txt b/Documentation/devicetree/bindings/net/brcm,bcmgenet.txt
index 26c77d9..3956af1 100644
--- a/Documentation/devicetree/bindings/net/brcm,bcmgenet.txt
+++ b/Documentation/devicetree/bindings/net/brcm,bcmgenet.txt
@@ -109,7 +109,7 @@ ethernet@f0ba0000 {
 	reg = <0xf0ba0000 0xfc4c>;
 	interrupts = <0x0 0x18 0x0>, <0x0 0x19 0x0>;
 
-	mdio@0e14 {
+	mdio@e14 {
 		compatible = "brcm,genet-mdio-v4";
 		#address-cells = <0x1>;
 		#size-cells = <0x0>;
diff --git a/Documentation/devicetree/bindings/net/can/m_can.txt b/Documentation/devicetree/bindings/net/can/m_can.txt
index 7813833..63e9042 100644
--- a/Documentation/devicetree/bindings/net/can/m_can.txt
+++ b/Documentation/devicetree/bindings/net/can/m_can.txt
@@ -45,7 +45,7 @@ Required properties:
 
 Example:
 SoC dtsi:
-m_can1: can@020e8000 {
+m_can1: can@20e8000 {
 	compatible = "bosch,m_can";
 	reg = <0x020e8000 0x4000>, <0x02298000 0x4000>;
 	reg-names = "m_can", "message_ram";
diff --git a/Documentation/devicetree/bindings/net/can/sun4i_can.txt b/Documentation/devicetree/bindings/net/can/sun4i_can.txt
index 84ed190..f69845e 100644
--- a/Documentation/devicetree/bindings/net/can/sun4i_can.txt
+++ b/Documentation/devicetree/bindings/net/can/sun4i_can.txt
@@ -19,7 +19,7 @@ SoC common .dtsi file:
 		allwinner,pull = <0>;
 	};
 ...
-	can0: can@01c2bc00 {
+	can0: can@1c2bc00 {
 		compatible = "allwinner,sun4i-a10-can";
 		reg = <0x01c2bc00 0x400>;
 		interrupts = <0 26 4>;
@@ -29,7 +29,7 @@ SoC common .dtsi file:
 
 Board specific .dts file:
 
-	can0: can@01c2bc00 {
+	can0: can@1c2bc00 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&can0_pins_a>;
 		status = "okay";
diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
index b2bd470..86602f2 100644
--- a/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
+++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt
@@ -20,7 +20,7 @@ Optional properties:
 
 Example:
 
-mmc3: mmc@01c12000 {
+mmc3: mmc@1c12000 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
index ef06d06..081c49c 100644
--- a/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
+++ b/Documentation/devicetree/bindings/nvmem/allwinner,sunxi-sid.txt
@@ -13,13 +13,13 @@ Are child nodes of qfprom, bindings of which as described in
 bindings/nvmem/nvmem.txt
 
 Example for sun4i:
-	sid@01c23800 {
+	sid@1c23800 {
 		compatible = "allwinner,sun4i-a10-sid";
 		reg = <0x01c23800 0x10>
 	};
 
 Example for sun7i:
-	sid@01c23800 {
+	sid@1c23800 {
 		compatible = "allwinner,sun7i-a20-sid";
 		reg = <0x01c23800 0x200>
 	};
diff --git a/Documentation/devicetree/bindings/nvmem/brcm,ocotp.txt b/Documentation/devicetree/bindings/nvmem/brcm,ocotp.txt
index 6462e12..0415265 100644
--- a/Documentation/devicetree/bindings/nvmem/brcm,ocotp.txt
+++ b/Documentation/devicetree/bindings/nvmem/brcm,ocotp.txt
@@ -10,7 +10,7 @@ Required Properties:
 
 Example:
 
-otp: otp@0301c800 {
+otp: otp@301c800 {
 	compatible = "brcm,ocotp";
 	reg = <0x0301c800 0x2c>;
 	brcm,ocotp-size = <2048>;
diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
index 70d791b..f162c72 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
@@ -19,7 +19,7 @@ Optional properties:
 
 Example:
 
-	ocotp: ocotp@021bc000 {
+	ocotp: ocotp@21bc000 {
 		compatible = "fsl,imx6q-ocotp", "syscon";
 		reg = <0x021bc000 0x4000>;
 		clocks = <&clks IMX6QDL_CLK_IIM>;
diff --git a/Documentation/devicetree/bindings/nvmem/nvmem.txt b/Documentation/devicetree/bindings/nvmem/nvmem.txt
index b52bc11..fd06c09 100644
--- a/Documentation/devicetree/bindings/nvmem/nvmem.txt
+++ b/Documentation/devicetree/bindings/nvmem/nvmem.txt
@@ -33,7 +33,7 @@ bits:	Is pair of bit location and number of bits, which specifies offset
 For example:
 
 	/* Provider */
-	qfprom: qfprom@00700000 {
+	qfprom: qfprom@700000 {
 		...
 
 		/* Data cells */
diff --git a/Documentation/devicetree/bindings/nvmem/qfprom.txt b/Documentation/devicetree/bindings/nvmem/qfprom.txt
index 4ad68b7..26fe878 100644
--- a/Documentation/devicetree/bindings/nvmem/qfprom.txt
+++ b/Documentation/devicetree/bindings/nvmem/qfprom.txt
@@ -12,7 +12,7 @@ bindings/nvmem/nvmem.txt
 
 Example:
 
-	qfprom: qfprom@00700000 {
+	qfprom: qfprom@700000 {
 		compatible 	= "qcom,qfprom";
 		reg		= <0x00700000 0x8000>;
 		...
diff --git a/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt b/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
index 20bc49b..5a78ae6 100644
--- a/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
+++ b/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
@@ -10,7 +10,7 @@ Required properties:
 	"fsl,imx6ul-snvs-lpgpr" for Freescale i.MX6UL
 
 Example:
-snvs: snvs@020cc000 {
+snvs: snvs@20cc000 {
 	compatible = "fsl,sec-v4.0-mon", "syscon", "simple-mfd";
 	reg = <0x020cc000 0x4000>;
 
diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
index 33d2e21..145a4f0 100644
--- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
@@ -270,7 +270,7 @@ Tegra30:
 
 SoC DTSI:
 
-	pcie-controller@00003000 {
+	pcie-controller@3000 {
 		compatible = "nvidia,tegra30-pcie";
 		device_type = "pci";
 		reg = <0x00003000 0x00000800   /* PADS registers */
@@ -349,7 +349,7 @@ SoC DTSI:
 
 Board DTS:
 
-	pcie-controller@00003000 {
+	pcie-controller@3000 {
 		status = "okay";
 
 		avdd-pexa-supply = <&ldo1_reg>;
@@ -375,7 +375,7 @@ Tegra124:
 
 SoC DTSI:
 
-	pcie-controller@01003000 {
+	pcie-controller@1003000 {
 		compatible = "nvidia,tegra124-pcie";
 		device_type = "pci";
 		reg = <0x0 0x01003000 0x0 0x00000800   /* PADS registers */
@@ -440,7 +440,7 @@ SoC DTSI:
 
 Board DTS:
 
-	pcie-controller@01003000 {
+	pcie-controller@1003000 {
 		status = "okay";
 
 		avddio-pex-supply = <&vdd_1v05_run>;
@@ -471,7 +471,7 @@ Tegra210:
 
 SoC DTSI:
 
-	pcie-controller@01003000 {
+	pcie-controller@1003000 {
 		compatible = "nvidia,tegra210-pcie";
 		device_type = "pci";
 		reg = <0x0 0x01003000 0x0 0x00000800   /* PADS registers */
@@ -536,7 +536,7 @@ SoC DTSI:
 
 Board DTS:
 
-	pcie-controller@01003000 {
+	pcie-controller@1003000 {
 		status = "okay";
 
 		avdd-pll-uerefe-supply = <&avdd_1v05_pll>;
diff --git a/Documentation/devicetree/bindings/phy/brcm,cygnus-pcie-phy.txt b/Documentation/devicetree/bindings/phy/brcm,cygnus-pcie-phy.txt
index 761c4bc..10efff2 100644
--- a/Documentation/devicetree/bindings/phy/brcm,cygnus-pcie-phy.txt
+++ b/Documentation/devicetree/bindings/phy/brcm,cygnus-pcie-phy.txt
@@ -15,7 +15,7 @@ Required properties For the child node:
 - #phy-cells: must be 0
 
 Example:
-	pcie_phy: phy@0301d0a0 {
+	pcie_phy: phy@301d0a0 {
 		compatible = "brcm,cygnus-pcie-phy";
 		reg = <0x0301d0a0 0x14>;
 
diff --git a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt b/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
index 1d25b04..6ac98b3 100644
--- a/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
+++ b/Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
@@ -23,7 +23,7 @@ Optional properties:
   the 17.78mA TX reference current. Default: 100
 
 Example:
-usbphy1: usbphy@020c9000 {
+usbphy1: usbphy@20c9000 {
 	compatible = "fsl,imx6q-usbphy", "fsl,imx23-usbphy";
 	reg = <0x020c9000 0x1000>;
 	interrupts = <0 44 0x04>;
diff --git a/Documentation/devicetree/bindings/phy/sun9i-usb-phy.txt b/Documentation/devicetree/bindings/phy/sun9i-usb-phy.txt
index f985315..64f7109 100644
--- a/Documentation/devicetree/bindings/phy/sun9i-usb-phy.txt
+++ b/Documentation/devicetree/bindings/phy/sun9i-usb-phy.txt
@@ -25,7 +25,7 @@ It is recommended to list all clocks and resets available.
 The driver will only use those matching the phy_type.
 
 Example:
-	usbphy1: phy@00a01800 {
+	usbphy1: phy@a01800 {
 		compatible = "allwinner,sun9i-a80-usb-phy";
 		reg = <0x00a01800 0x4>;
 		clocks = <&usb_phy_clk 2>, <&usb_phy_clk 10>,
diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
index 6f2ec9a..09789fd 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
@@ -89,7 +89,7 @@ Optional subnode-properties:
 
 Examples:
 
-pio: pinctrl@01c20800 {
+pio: pinctrl@1c20800 {
 	compatible = "allwinner,sun5i-a13-pinctrl";
 	reg = <0x01c20800 0x400>;
 	#address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx-pinctrl.txt
index 42d74f8..a1050b5 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx-pinctrl.txt
@@ -58,14 +58,14 @@ Some requirements for using fsl,imx-pinctrl binding:
    configurations by referring to the phandle of that pin configuration node.
 
 Examples:
-usdhc@0219c000 { /* uSDHC4 */
+usdhc@219c000 { /* uSDHC4 */
 	non-removable;
 	vmmc-supply = <&reg_3p3v>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usdhc4_1>;
 };
 
-iomuxc@020e0000 {
+iomuxc@20e0000 {
 	compatible = "fsl,imx6q-iomuxc";
 	reg = <0x020e0000 0x4000>;
 
diff --git a/Documentation/devicetree/bindings/pinctrl/img,tz1090-pdc-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/img,tz1090-pdc-pinctrl.txt
index 51b943c..cf9ccdf 100644
--- a/Documentation/devicetree/bindings/pinctrl/img,tz1090-pdc-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/img,tz1090-pdc-pinctrl.txt
@@ -89,7 +89,7 @@ Valid values for pin and group names are:
 
 Example:
 
-	pinctrl_pdc: pinctrl@02006500 {
+	pinctrl_pdc: pinctrl@2006500 {
 		#gpio-range-cells = <3>;
 		compatible = "img,tz1090-pdc-pinctrl";
 		reg = <0x02006500 0x100>;
@@ -121,7 +121,7 @@ Example board file extracts:
 		};
 	};
 
-	ir: ir@02006200 {
+	ir: ir@2006200 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&irmod_default>;
 	};
diff --git a/Documentation/devicetree/bindings/pinctrl/img,tz1090-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/img,tz1090-pinctrl.txt
index 509faa8..2dfd9a3 100644
--- a/Documentation/devicetree/bindings/pinctrl/img,tz1090-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/img,tz1090-pinctrl.txt
@@ -197,7 +197,7 @@ Valid values for pin and group names are:
 
 Example:
 
-	pinctrl: pinctrl@02005800 {
+	pinctrl: pinctrl@2005800 {
 		#gpio-range-cells = <3>;
 		compatible = "img,tz1090-pinctrl";
 		reg = <0x02005800 0xe4>;
@@ -221,7 +221,7 @@ Example board file extract:
 		};
 	};
 
-	uart@02004b00 {
+	uart@2004b00 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&uart0_default>;
 	};
diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
index 4048f43a..02e971c 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
@@ -97,7 +97,7 @@ SoC file extract:
 Board file extract:
 -------------------
 
-	pcie-controller@01003000 {
+	pcie-controller@1003000 {
 		...
 
 		phys = <&padctl 0>;
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
index 37d7447..231fa1d 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
@@ -86,7 +86,7 @@ Examples:
 		reg = <0 0x1020C020 0 0x1000>;
 	};
 
-	pinctrl@01c20800 {
+	pinctrl@1c20800 {
 		compatible = "mediatek,mt8135-pinctrl";
 		reg = <0 0x1000B000 0 0x1000>;
 		mediatek,pctl-regmap = <&syscfg_pctl_a &syscfg_pctl_b>;
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-st.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-st.txt
index 013c675..48b9be4 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-st.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-st.txt
@@ -89,7 +89,7 @@ Example:
 		interrupt-names = "irqmux";
 		ranges = <0 0x09610000 0x6000>;
 
-		pio0: gpio@09610000 {
+		pio0: gpio@9610000 {
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8996-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8996-pinctrl.txt
index e312a71..aaf01e9 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8996-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8996-pinctrl.txt
@@ -175,7 +175,7 @@ to specify in a pin configuration subnode:
 
 Example:
 
-	tlmm: pinctrl@01010000 {
+	tlmm: pinctrl@1010000 {
 		compatible = "qcom,msm8996-pinctrl";
 		reg = <0x01010000 0x300000>;
 		interrupts = <0 208 0>;
diff --git a/Documentation/devicetree/bindings/power/fsl,imx-gpc.txt b/Documentation/devicetree/bindings/power/fsl,imx-gpc.txt
index 6c14989..e371b26 100644
--- a/Documentation/devicetree/bindings/power/fsl,imx-gpc.txt
+++ b/Documentation/devicetree/bindings/power/fsl,imx-gpc.txt
@@ -40,7 +40,7 @@ Optional properties:
 
 Example:
 
-	gpc: gpc@020dc000 {
+	gpc: gpc@20dc000 {
 		compatible = "fsl,imx6q-gpc";
 		reg = <0x020dc000 0x4000>;
 		interrupts = <0 89 IRQ_TYPE_LEVEL_HIGH>,
@@ -80,7 +80,7 @@ that is a phandle pointing to the power domain the device belongs to.
 
 Example of a device that is part of the PU power domain:
 
-	vpu: vpu@02040000 {
+	vpu: vpu@2040000 {
 		reg = <0x02040000 0x3c000>;
 		/* ... */
 		power-domains = <&pd_pu>;
diff --git a/Documentation/devicetree/bindings/power/reset/imx-snvs-poweroff.txt b/Documentation/devicetree/bindings/power/reset/imx-snvs-poweroff.txt
index dc7c9ba..1b81fcd 100644
--- a/Documentation/devicetree/bindings/power/reset/imx-snvs-poweroff.txt
+++ b/Documentation/devicetree/bindings/power/reset/imx-snvs-poweroff.txt
@@ -10,7 +10,7 @@ Required Properties:
 -reg: Specifies the physical address of the SNVS_LPCR register
 
 Example:
-	snvs@020cc000 {
+	snvs@20cc000 {
 		compatible = "fsl,sec-v4.0-mon", "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/Documentation/devicetree/bindings/power/reset/keystone-reset.txt b/Documentation/devicetree/bindings/power/reset/keystone-reset.txt
index c82f12e..c5c0378 100644
--- a/Documentation/devicetree/bindings/power/reset/keystone-reset.txt
+++ b/Documentation/devicetree/bindings/power/reset/keystone-reset.txt
@@ -37,12 +37,12 @@ Example 1:
 Setup keystone reset so that in case software reset or
 WDT0 is triggered it issues hard reset for SoC.
 
-pllctrl: pll-controller@02310000 {
+pllctrl: pll-controller@2310000 {
 	compatible = "ti,keystone-pllctrl", "syscon";
 	reg = <0x02310000 0x200>;
 };
 
-devctrl: device-state-control@02620000 {
+devctrl: device-state-control@2620000 {
 	compatible = "ti,keystone-devctrl", "syscon";
 	reg = <0x02620000 0x1000>;
 };
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/mcu-mpc8349emitx.txt b/Documentation/devicetree/bindings/powerpc/fsl/mcu-mpc8349emitx.txt
index 0f76633..37f91fa 100644
--- a/Documentation/devicetree/bindings/powerpc/fsl/mcu-mpc8349emitx.txt
+++ b/Documentation/devicetree/bindings/powerpc/fsl/mcu-mpc8349emitx.txt
@@ -8,7 +8,7 @@ Required properties:
 
 Example:
 
-mcu@0a {
+mcu@a {
 	#gpio-cells = <2>;
 	compatible = "fsl,mc9s08qg8-mpc8349emitx",
 		     "fsl,mcu-mpc8349emitx";
diff --git a/Documentation/devicetree/bindings/pwm/pwm-sun4i.txt b/Documentation/devicetree/bindings/pwm/pwm-sun4i.txt
index c517166..51ff54c 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-sun4i.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-sun4i.txt
@@ -14,7 +14,7 @@ Required properties:
 
 Example:
 
-	pwm: pwm@01c20e00 {
+	pwm: pwm@1c20e00 {
 		compatible = "allwinner,sun7i-a20-pwm";
 		reg = <0x01c20e00 0xc>;
 		clocks = <&osc24M>;
diff --git a/Documentation/devicetree/bindings/regulator/max77686.txt b/Documentation/devicetree/bindings/regulator/max77686.txt
index 0dded64..e9f7578 100644
--- a/Documentation/devicetree/bindings/regulator/max77686.txt
+++ b/Documentation/devicetree/bindings/regulator/max77686.txt
@@ -40,7 +40,7 @@ to get matched with their hardware counterparts as follow:
 
 Example:
 
-	max77686: pmic@09 {
+	max77686: pmic@9 {
 		compatible = "maxim,max77686";
 		interrupt-parent = <&wakeup_eint>;
 		interrupts = <26 IRQ_TYPE_NONE>;
diff --git a/Documentation/devicetree/bindings/regulator/max77802.txt b/Documentation/devicetree/bindings/regulator/max77802.txt
index 879e98d..b82943d 100644
--- a/Documentation/devicetree/bindings/regulator/max77802.txt
+++ b/Documentation/devicetree/bindings/regulator/max77802.txt
@@ -71,7 +71,7 @@ has not been disabled for that state using "regulator-off-in-suspend".
 
 Example:
 
-	max77802@09 {
+	max77802@9 {
 		compatible = "maxim,max77802";
 		interrupt-parent = <&wakeup_eint>;
 		interrupts = <26 0>;
diff --git a/Documentation/devicetree/bindings/reset/allwinner,sunxi-clock-reset.txt b/Documentation/devicetree/bindings/reset/allwinner,sunxi-clock-reset.txt
index c8f7757..4ca66c9 100644
--- a/Documentation/devicetree/bindings/reset/allwinner,sunxi-clock-reset.txt
+++ b/Documentation/devicetree/bindings/reset/allwinner,sunxi-clock-reset.txt
@@ -14,7 +14,7 @@ Required properties:
 
 example:
 
-ahb1_rst: reset@01c202c0 {
+ahb1_rst: reset@1c202c0 {
 	#reset-cells = <1>;
 	compatible = "allwinner,sun6i-a31-ahb1-reset";
 	reg = <0x01c202c0 0xc>;
diff --git a/Documentation/devicetree/bindings/reset/fsl,imx-src.txt b/Documentation/devicetree/bindings/reset/fsl,imx-src.txt
index 1330177..6ed79e6 100644
--- a/Documentation/devicetree/bindings/reset/fsl,imx-src.txt
+++ b/Documentation/devicetree/bindings/reset/fsl,imx-src.txt
@@ -14,7 +14,7 @@ Required properties:
 
 example:
 
-src: src@020d8000 {
+src: src@20d8000 {
         compatible = "fsl,imx6q-src";
         reg = <0x020d8000 0x4000>;
         interrupts = <0 91 0x04 0 96 0x04>;
@@ -33,10 +33,10 @@ reset.txt
 
 example:
 
-        ipu1: ipu@02400000 {
+        ipu1: ipu@2400000 {
                 resets = <&src 2>;
         };
-        ipu2: ipu@02800000 {
+        ipu2: ipu@2800000 {
                 resets = <&src 4>;
         };
 
diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
index c516d24..8694550 100644
--- a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
+++ b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
@@ -67,7 +67,7 @@ using the syscon node, and a consumer (a DSP device) on the TI Keystone 2
 
 / {
 	soc {
-		psc: power-sleep-controller@02350000 {
+		psc: power-sleep-controller@2350000 {
 			compatible = "syscon", "simple-mfd";
 			reg = <0x02350000 0x1000>;
 
diff --git a/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt b/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
index d5e26d3..12c083c 100644
--- a/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
@@ -17,7 +17,7 @@ Required properties for new device trees
 
 Example:
 
-rtc: rtc@01f00000 {
+rtc: rtc@1f00000 {
 	compatible = "allwinner,sun6i-a31-rtc";
 	reg = <0x01f00000 0x54>;
 	interrupts = <0 40 4>, <0 41 4>;
diff --git a/Documentation/devicetree/bindings/rtc/sunxi-rtc.txt b/Documentation/devicetree/bindings/rtc/sunxi-rtc.txt
index 6983aad..4a8d79c 100644
--- a/Documentation/devicetree/bindings/rtc/sunxi-rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/sunxi-rtc.txt
@@ -10,7 +10,7 @@ Required properties:
 
 Example:
 
-rtc: rtc@01c20d00 {
+rtc: rtc@1c20d00 {
 	compatible = "allwinner,sun4i-a10-rtc";
 	reg = <0x01c20d00 0x20>;
 	interrupts = <24>;
diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
index 6098426..09b1b05 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
@@ -18,7 +18,7 @@ par_io@1400 {
 	#size-cells = <0>;
 	device_type = "par_io";
 	num-ports = <7>;
-	ucc_pin@01 {
+	ucc_pin@1 {
 		......
 	};
 
diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/pincfg.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/pincfg.txt
index ec6ee2e..5bde8b9 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/pincfg.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/pincfg.txt
@@ -26,7 +26,7 @@ Required properties:
     interrupts.
 
 Example:
-     ucc_pin@01 {
+     ucc_pin@1 {
 	pio-map = <
 	/* port  pin  dir  open_drain  assignment  has_irq */
 		0  3  1  0  1  0 	/* TxD0 */
diff --git a/Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt b/Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
index 66e6265..f7b00a7 100644
--- a/Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
+++ b/Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
@@ -51,7 +51,7 @@ of valid identifiers for k2g.
 
 Example (K2G):
 --------------------
-	uart0: serial@02530c00 {
+	uart0: serial@2530c00 {
 		compatible = "ns16550a";
 		...
 		power-domains = <&k2g_pds 0x002c>;
diff --git a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
index befd125..860fc0d 100644
--- a/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
+++ b/Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
@@ -9,7 +9,7 @@ Required properties:
 
 Examples:
 
-	i2s0: xtfpga-i2s@0d080000 {
+	i2s0: xtfpga-i2s@d080000 {
 		#sound-dai-cells = <0>;
 		compatible = "cdns,xtfpga-i2s";
 		reg = <0x0d080000 0x40>;
diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
index 65979b2..f5a1411 100644
--- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
+++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
@@ -41,7 +41,7 @@ Required properties:
 
 Example:
 
-asrc: asrc@02034000 {
+asrc: asrc@2034000 {
 	compatible = "fsl,imx53-asrc";
 	reg = <0x02034000 0x4000>;
 	interrupts = <0 50 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/Documentation/devicetree/bindings/sound/fsl,esai.txt b/Documentation/devicetree/bindings/sound/fsl,esai.txt
index 21c401e..cacd18b 100644
--- a/Documentation/devicetree/bindings/sound/fsl,esai.txt
+++ b/Documentation/devicetree/bindings/sound/fsl,esai.txt
@@ -48,7 +48,7 @@ Required properties:
 
 Example:
 
-esai: esai@02024000 {
+esai: esai@2024000 {
 	compatible = "fsl,imx35-esai";
 	reg = <0x02024000 0x4000>;
 	interrupts = <0 51 0x04>;
diff --git a/Documentation/devicetree/bindings/sound/fsl,spdif.txt b/Documentation/devicetree/bindings/sound/fsl,spdif.txt
index 0f97e54..38cfa75 100644
--- a/Documentation/devicetree/bindings/sound/fsl,spdif.txt
+++ b/Documentation/devicetree/bindings/sound/fsl,spdif.txt
@@ -39,7 +39,7 @@ Required properties:
 
 Example:
 
-spdif: spdif@02004000 {
+spdif: spdif@2004000 {
 	compatible = "fsl,imx35-spdif";
 	reg = <0x02004000 0x4000>;
 	interrupts = <0 52 0x04>;
diff --git a/Documentation/devicetree/bindings/sound/imx-audmux.txt b/Documentation/devicetree/bindings/sound/imx-audmux.txt
index b30a737..2db4dcb 100644
--- a/Documentation/devicetree/bindings/sound/imx-audmux.txt
+++ b/Documentation/devicetree/bindings/sound/imx-audmux.txt
@@ -22,7 +22,7 @@ Required properties of optional child nodes:
 
 Example:
 
-audmux@021d8000 {
+audmux@21d8000 {
 	compatible = "fsl,imx6q-audmux", "fsl,imx31-audmux";
 	reg = <0x021d8000 0x4000>;
 };
diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.txt b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
index 09e0e18..bf100cd 100644
--- a/Documentation/devicetree/bindings/sound/samsung-i2s.txt
+++ b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
@@ -63,7 +63,7 @@ Optional SoC Specific Properties:
 
 Example:
 
-i2s0: i2s@03830000 {
+i2s0: i2s@3830000 {
 	compatible = "samsung,s5pv210-i2s";
 	reg = <0x03830000 0x100>;
 	dmas = <&pdma0 10
diff --git a/Documentation/devicetree/bindings/sound/sun4i-codec.txt b/Documentation/devicetree/bindings/sound/sun4i-codec.txt
index 2d4e10d..66579bb 100644
--- a/Documentation/devicetree/bindings/sound/sun4i-codec.txt
+++ b/Documentation/devicetree/bindings/sound/sun4i-codec.txt
@@ -62,7 +62,7 @@ Required properties for the following compatibles:
 				   block in the PRCM.
 
 Example:
-codec: codec@01c22c00 {
+codec: codec@1c22c00 {
 	#sound-dai-cells = <0>;
 	compatible = "allwinner,sun7i-a20-codec";
 	reg = <0x01c22c00 0x40>;
@@ -73,7 +73,7 @@ codec: codec@01c22c00 {
 	dma-names = "rx", "tx";
 };
 
-codec: codec@01c22c00 {
+codec: codec@1c22c00 {
 	#sound-dai-cells = <0>;
 	compatible = "allwinner,sun6i-a31-codec";
 	reg = <0x01c22c00 0x98>;
diff --git a/Documentation/devicetree/bindings/sound/sun4i-i2s.txt b/Documentation/devicetree/bindings/sound/sun4i-i2s.txt
index fc5da608..05d7135 100644
--- a/Documentation/devicetree/bindings/sound/sun4i-i2s.txt
+++ b/Documentation/devicetree/bindings/sound/sun4i-i2s.txt
@@ -28,7 +28,7 @@ Required properties for the following compatibles:
 
 Example:
 
-i2s0: i2s@01c22400 {
+i2s0: i2s@1c22400 {
 	#sound-dai-cells = <0>;
 	compatible = "allwinner,sun4i-a10-i2s";
 	reg = <0x01c22400 0x400>;
diff --git a/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt b/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
index 399b1b4..2ca3d13 100644
--- a/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
+++ b/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
@@ -48,7 +48,7 @@ are similar to A33 using simple-card:
 			sound-dai = <&codec>;
 		};
 
-	soc@01c00000 {
+	soc@1c00000 {
 		[...]
 
 		audio-codec@1c22e00 {
diff --git a/Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt b/Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt
index 1b6e7c4..0735675 100644
--- a/Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt
+++ b/Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt
@@ -10,7 +10,7 @@ Required properties if not a sub-node of the PRCM node:
 - reg: must contain the registers location and length
 
 Example:
-prcm: prcm@01f01400 {
+prcm: prcm@1f01400 {
 	codec_analog: codec-analog {
 		compatible = "allwinner,sun8i-a23-codec-analog";
 	};
diff --git a/Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt b/Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt
index 70ee177..0c64a20 100644
--- a/Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt
+++ b/Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt
@@ -31,7 +31,7 @@ Required properties:
 
 Example:
 
-spdif: spdif@01c21000 {
+spdif: spdif@1c21000 {
 	compatible = "allwinner,sun4i-a10-spdif";
 	reg = <0x01c21000 0x40>;
 	interrupts = <13>;
diff --git a/Documentation/devicetree/bindings/sound/zte,zx-spdif.txt b/Documentation/devicetree/bindings/sound/zte,zx-spdif.txt
index b5a5ca4..09231d7 100644
--- a/Documentation/devicetree/bindings/sound/zte,zx-spdif.txt
+++ b/Documentation/devicetree/bindings/sound/zte,zx-spdif.txt
@@ -16,7 +16,7 @@ please check:
 	* dma/dma.txt
 
 Example:
-	spdif0: spdif0@0b004000 {
+	spdif0: spdif0@b004000 {
 		compatible = "zte,zx296702-spdif";
 		reg = <0x0b004000 0x1000>;
 		clocks = <&lsp0clk ZX296702_SPDIF0_DIV>;
diff --git a/Documentation/devicetree/bindings/spi/spi-sun4i.txt b/Documentation/devicetree/bindings/spi/spi-sun4i.txt
index 484bbff..c75d604 100644
--- a/Documentation/devicetree/bindings/spi/spi-sun4i.txt
+++ b/Documentation/devicetree/bindings/spi/spi-sun4i.txt
@@ -12,7 +12,7 @@ Required properties:
 
 Example:
 
-spi1: spi@01c06000 {
+spi1: spi@1c06000 {
 	compatible = "allwinner,sun4i-a10-spi";
 	reg = <0x01c06000 0x1000>;
 	interrupts = <11>;
diff --git a/Documentation/devicetree/bindings/spi/spi-sun6i.txt b/Documentation/devicetree/bindings/spi/spi-sun6i.txt
index ab18113..435a8e0 100644
--- a/Documentation/devicetree/bindings/spi/spi-sun6i.txt
+++ b/Documentation/devicetree/bindings/spi/spi-sun6i.txt
@@ -19,7 +19,7 @@ Optional properties:
 
 Example:
 
-spi1: spi@01c69000 {
+spi1: spi@1c69000 {
 	compatible = "allwinner,sun6i-a31-spi";
 	reg = <0x01c69000 0x1000>;
 	interrupts = <0 66 4>;
@@ -28,7 +28,7 @@ spi1: spi@01c69000 {
 	resets = <&ahb1_rst 21>;
 };
 
-spi0: spi@01c68000 {
+spi0: spi@1c68000 {
 	compatible = "allwinner,sun8i-h3-spi";
 	reg = <0x01c68000 0x1000>;
 	interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/Documentation/devicetree/bindings/sram/samsung-sram.txt b/Documentation/devicetree/bindings/sram/samsung-sram.txt
index 6bc474b..61a9bbe 100644
--- a/Documentation/devicetree/bindings/sram/samsung-sram.txt
+++ b/Documentation/devicetree/bindings/sram/samsung-sram.txt
@@ -19,7 +19,7 @@ found in Documentation/devicetree/bindings/sram/sram.txt
 
 Example:
 
-	sysram@02020000 {
+	sysram@2020000 {
 		compatible = "mmio-sram";
 		reg = <0x02020000 0x54000>;
 		#address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/sram/sunxi-sram.txt b/Documentation/devicetree/bindings/sram/sunxi-sram.txt
index 6bb92a1..d087f04 100644
--- a/Documentation/devicetree/bindings/sram/sunxi-sram.txt
+++ b/Documentation/devicetree/bindings/sram/sunxi-sram.txt
@@ -47,7 +47,7 @@ This valid values for this argument are:
 
 Example
 -------
-sram-controller@01c00000 {
+sram-controller@1c00000 {
 	compatible = "allwinner,sun4i-a10-sram-controller";
 	reg = <0x01c00000 0x30>;
 	#address-cells = <1>;
@@ -68,7 +68,7 @@ sram-controller@01c00000 {
 	};
 };
 
-emac: ethernet@01c0b000 {
+emac: ethernet@1c0b000 {
 	compatible = "allwinner,sun4i-a10-emac";
 	...
 
diff --git a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.txt b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.txt
index 8d6e4fd..2c5c1be 100644
--- a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.txt
+++ b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.txt
@@ -14,7 +14,7 @@ Optional properties:
 
 Example:
 
-timer@01c60000 {
+timer@1c60000 {
 	compatible = "allwinner,sun7i-a20-hstimer";
 	reg = <0x01c60000 0x1000>;
 	interrupts = <0 51 1>,
diff --git a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
index cb2bd83..50abb20f 100644
--- a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
+++ b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
@@ -16,7 +16,7 @@ Required properties:
 
 Example:
 
-	usb_otg: usb@01c13000 {
+	usb_otg: usb@1c13000 {
 		compatible = "allwinner,sun4i-a10-musb";
 		reg = <0x01c13000 0x0400>;
 		clocks = <&ahb_gates 0>;
diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
index 16920d7..7a33f22 100644
--- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
@@ -181,7 +181,7 @@ usb: usb@47400000 {
 			"tx14", "tx15";
 	};
 
-	cppi41dma: dma-controller@07402000 {
+	cppi41dma: dma-controller@7402000 {
 		compatible = "ti,am3359-cppi41";
 		reg =  <0x47400000 0x1000
 			0x47402000 0x1000
diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
index ad8ea56..44e8015 100644
--- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
+++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
@@ -18,7 +18,7 @@ Required properties:
  - atmel,oc-gpio: If present, specifies a gpio that needs to be
    activated for the overcurrent detection.
 
-usb0: ohci@00500000 {
+usb0: ohci@500000 {
 	compatible = "atmel,at91rm9200-ohci", "usb-ohci";
 	reg = <0x00500000 0x100000>;
 	clocks = <&uhphs_clk>, <&uhphs_clk>, <&uhpck>;
@@ -39,7 +39,7 @@ Required properties:
 		"ehci_clk" for the peripheral clock
 		"usb_clk" for the UTMI clock
 
-usb1: ehci@00800000 {
+usb1: ehci@800000 {
 	compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
 	reg = <0x00800000 0x100000>;
 	interrupts = <22 4>;
diff --git a/Documentation/devicetree/bindings/usb/ohci-da8xx.txt b/Documentation/devicetree/bindings/usb/ohci-da8xx.txt
index 2dc8f67..24a826d 100644
--- a/Documentation/devicetree/bindings/usb/ohci-da8xx.txt
+++ b/Documentation/devicetree/bindings/usb/ohci-da8xx.txt
@@ -13,7 +13,7 @@ Optional properties:
 
 Example:
 
-ohci: usb@0225000 {
+ohci: usb@225000 {
         compatible = "ti,da830-ohci";
         reg = <0x225000 0x1000>;
         interrupts = <59>;
diff --git a/Documentation/devicetree/bindings/usb/usb-ehci.txt b/Documentation/devicetree/bindings/usb/usb-ehci.txt
index a12d601..3efde12 100644
--- a/Documentation/devicetree/bindings/usb/usb-ehci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-ehci.txt
@@ -30,7 +30,7 @@ Example (Sequoia 440EPx):
    };
 
 Example (Allwinner sun4i A10 SoC):
-   ehci0: usb@01c14000 {
+   ehci0: usb@1c14000 {
 	   compatible = "allwinner,sun4i-a10-ehci", "generic-ehci";
 	   reg = <0x01c14000 0x100>;
 	   interrupts = <39>;
diff --git a/Documentation/devicetree/bindings/usb/usb-ohci.txt b/Documentation/devicetree/bindings/usb/usb-ohci.txt
index e8766b0..09e70c8 100644
--- a/Documentation/devicetree/bindings/usb/usb-ohci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-ohci.txt
@@ -19,7 +19,7 @@ Optional properties:
 
 Example:
 
-	ohci0: usb@01c14400 {
+	ohci0: usb@1c14400 {
 		compatible = "allwinner,sun4i-a10-ohci", "generic-ohci";
 		reg = <0x01c14400 0x100>;
 		interrupts = <64>;
diff --git a/Documentation/devicetree/bindings/usb/usb3503.txt b/Documentation/devicetree/bindings/usb/usb3503.txt
index c1a0a91..057dd38 100644
--- a/Documentation/devicetree/bindings/usb/usb3503.txt
+++ b/Documentation/devicetree/bindings/usb/usb3503.txt
@@ -26,7 +26,7 @@ Optional properties:
 	clock frequencies table is used)
 
 Examples:
-	usb3503@08 {
+	usb3503@8 {
 		compatible = "smsc,usb3503";
 		reg = <0x08>;
 		connect-gpios = <&gpx3 0 1>;
diff --git a/Documentation/devicetree/bindings/usb/usbmisc-imx.txt b/Documentation/devicetree/bindings/usb/usbmisc-imx.txt
index f1e27fa..a85a631 100644
--- a/Documentation/devicetree/bindings/usb/usbmisc-imx.txt
+++ b/Documentation/devicetree/bindings/usb/usbmisc-imx.txt
@@ -10,7 +10,7 @@ Required properties:
 - reg: Should contain registers location and length
 
 Examples:
-usbmisc@02184800 {
+usbmisc@2184800 {
 	#index-cells = <1>;
 	compatible = "fsl,imx6q-usbmisc";
 	reg = <0x02184800 0x200>;
diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index 235de06..5b38a30 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -13,7 +13,7 @@ Required properties:
 
 Example:
 
-wdt: watchdog@010000000 {
+wdt: watchdog@10000000 {
 	compatible = "mediatek,mt6589-wdt";
 	reg = <0x10000000 0x18>;
 };
diff --git a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
index b8f75c5..62dd5ba 100644
--- a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
@@ -8,7 +8,7 @@ Required properties:
 
 Example:
 
-wdt: watchdog@01c20c90 {
+wdt: watchdog@1c20c90 {
 	compatible = "allwinner,sun4i-a10-wdt";
 	reg = <0x01c20c90 0x10>;
 };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
