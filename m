From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] dt-bindings: Use lower case hex in unit-addresses
Date: Thu, 21 Dec 2017 12:35:22 -0600
Message-ID: <20171221183522.27536-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

DT unit addresses should be lower case hex. Fix all the
binding examples.

Converted with the following command from Krzysztof Kozlowski:

sed -e 's/@\([a-fA-F0-9_-]*\) {/@\L\1 {/' -i $(find Documentation/devicetree/bindings -name '*.txt')

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt |  6 +++---
 .../devicetree/bindings/arm/samsung/samsung-boards.txt       |  2 +-
 Documentation/devicetree/bindings/clock/exynos3250-clock.txt |  2 +-
 Documentation/devicetree/bindings/clock/exynos5260-clock.txt |  2 +-
 Documentation/devicetree/bindings/clock/exynos5410-clock.txt |  2 +-
 Documentation/devicetree/bindings/clock/exynos5433-clock.txt |  2 +-
 Documentation/devicetree/bindings/crypto/atmel-crypto.txt    |  2 +-
 .../devicetree/bindings/devfreq/event/exynos-nocp.txt        |  2 +-
 .../devicetree/bindings/display/exynos/exynos_dsim.txt       |  2 +-
 Documentation/devicetree/bindings/display/st,stih4xx.txt     |  2 +-
 Documentation/devicetree/bindings/dma/ste-dma40.txt          |  2 +-
 Documentation/devicetree/bindings/gpio/abilis,tb10x-gpio.txt |  2 +-
 Documentation/devicetree/bindings/gpio/gpio-stp-xway.txt     |  2 +-
 Documentation/devicetree/bindings/gpio/gpio.txt              |  2 +-
 .../devicetree/bindings/i2c/i2c-arb-gpio-challenge.txt       |  2 +-
 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt      |  2 +-
 Documentation/devicetree/bindings/input/samsung-keypad.txt   |  2 +-
 .../bindings/input/touchscreen/brcm,iproc-touchscreen.txt    |  2 +-
 Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt   |  2 +-
 Documentation/devicetree/bindings/mailbox/omap-mailbox.txt   |  2 +-
 Documentation/devicetree/bindings/media/s5p-cec.txt          |  2 +-
 Documentation/devicetree/bindings/media/samsung-s5c73m3.txt  |  2 +-
 .../devicetree/bindings/memory-controllers/ti-aemif.txt      |  2 +-
 Documentation/devicetree/bindings/mfd/cros-ec.txt            |  2 +-
 Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt        |  2 +-
 Documentation/devicetree/bindings/net/cpsw.txt               |  4 ++--
 Documentation/devicetree/bindings/net/davinci-mdio.txt       |  4 ++--
 Documentation/devicetree/bindings/net/fsl-tsec-phy.txt       |  2 +-
 Documentation/devicetree/bindings/phy/ti-phy.txt             |  2 +-
 .../devicetree/bindings/pinctrl/abilis,tb10x-iomux.txt       |  6 +++---
 .../devicetree/bindings/pinctrl/img,pistachio-pinctrl.txt    |  2 +-
 .../devicetree/bindings/pinctrl/lantiq,pinctrl-xway.txt      |  2 +-
 Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |  2 +-
 .../devicetree/bindings/powerpc/fsl/interlaken-lac.txt       | 12 ++++++------
 .../devicetree/bindings/regulator/st,stm32-vrefbuf.txt       |  2 +-
 Documentation/devicetree/bindings/serial/lantiq_asc.txt      |  2 +-
 Documentation/devicetree/bindings/sound/img,i2s-out.txt      |  2 +-
 Documentation/devicetree/bindings/sound/img,parallel-out.txt |  2 +-
 Documentation/devicetree/bindings/sound/img,spdif-in.txt     |  2 +-
 Documentation/devicetree/bindings/sound/img,spdif-out.txt    |  2 +-
 Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt |  8 ++++----
 Documentation/devicetree/bindings/spi/spi-davinci.txt        |  2 +-
 Documentation/devicetree/bindings/spi/spi-lantiq-ssc.txt     |  2 +-
 Documentation/devicetree/bindings/thermal/exynos-thermal.txt |  2 +-
 Documentation/devicetree/bindings/thermal/thermal.txt        |  6 +++---
 .../devicetree/bindings/timer/samsung,exynos4210-mct.txt     |  2 +-
 Documentation/devicetree/bindings/watchdog/pnx4008-wdt.txt   |  2 +-
 Documentation/devicetree/bindings/watchdog/samsung-wdt.txt   |  2 +-
 48 files changed, 64 insertions(+), 64 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
index ccaaec6014bd..6c49db7f8ad2 100644
--- a/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
@@ -55,7 +55,7 @@ Note: child nodes can be added for auto probing from device tree.
 
 Example: adding device info in dtsi file
 
-adc: adc@12D10000 {
+adc: adc@12d10000 {
 	compatible = "samsung,exynos-adc-v1";
 	reg = <0x12D10000 0x100>;
 	interrupts = <0 106 0>;
@@ -71,7 +71,7 @@ adc: adc@12D10000 {
 
 Example: adding device info in dtsi file for Exynos3250 with additional sclk
 
-adc: adc@126C0000 {
+adc: adc@126c0000 {
 	compatible = "samsung,exynos3250-adc", "samsung,exynos-adc-v2;
 	reg = <0x126C0000 0x100>;
 	interrupts = <0 137 0>;
@@ -87,7 +87,7 @@ adc: adc@126C0000 {
 
 Example: Adding child nodes in dts file
 
-adc@12D10000 {
+adc@12d10000 {
 
 	/* NTC thermistor is a hwmon device */
 	ncp15wb473@0 {
diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
index e13459618581..469ac98ecf8f 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
@@ -72,7 +72,7 @@ Optional nodes:
         - compatible: only "samsung,secure-firmware" is currently supported
         - reg: address of non-secure SYSRAM used for communication with firmware
 
-	firmware@203F000 {
+	firmware@203f000 {
 		compatible = "samsung,secure-firmware";
 		reg = <0x0203F000 0x1000>;
 	};
diff --git a/Documentation/devicetree/bindings/clock/exynos3250-clock.txt b/Documentation/devicetree/bindings/clock/exynos3250-clock.txt
index f1738b88c225..7441ed519f02 100644
--- a/Documentation/devicetree/bindings/clock/exynos3250-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos3250-clock.txt
@@ -32,7 +32,7 @@ Example 1: Examples of clock controller nodes are listed below.
 		#clock-cells = <1>;
 	};
 
-	cmu_dmc: clock-controller@105C0000 {
+	cmu_dmc: clock-controller@105c0000 {
 		compatible = "samsung,exynos3250-cmu-dmc";
 		reg = <0x105C0000 0x2000>;
 		#clock-cells = <1>;
diff --git a/Documentation/devicetree/bindings/clock/exynos5260-clock.txt b/Documentation/devicetree/bindings/clock/exynos5260-clock.txt
index 5496b2fac483..c79d31f7f66e 100644
--- a/Documentation/devicetree/bindings/clock/exynos5260-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5260-clock.txt
@@ -180,7 +180,7 @@ Example 2: UART controller node that consumes the clock generated by the
 		peri clock controller. Refer to the standard clock bindings for
 		information about 'clocks' and 'clock-names' property.
 
-	serial@12C00000 {
+	serial@12c00000 {
 		compatible = "samsung,exynos4210-uart";
 		reg = <0x12C00000 0x100>;
 		interrupts = <0 146 0>;
diff --git a/Documentation/devicetree/bindings/clock/exynos5410-clock.txt b/Documentation/devicetree/bindings/clock/exynos5410-clock.txt
index c68b0d29b3d0..217beb27c30e 100644
--- a/Documentation/devicetree/bindings/clock/exynos5410-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5410-clock.txt
@@ -41,7 +41,7 @@ Example 2: UART controller node that consumes the clock generated by the clock
 	   controller. Refer to the standard clock bindings for information
 	   about 'clocks' and 'clock-names' property.
 
-	serial@12C20000 {
+	serial@12c20000 {
 		compatible = "samsung,exynos4210-uart";
 		reg = <0x12C00000 0x100>;
 		interrupts = <0 51 0>;
diff --git a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
index c473dd38dd55..50d5897c9849 100644
--- a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
@@ -472,7 +472,7 @@ Example 2: Examples of clock controller nodes are listed below.
 Example 3: UART controller node that consumes the clock generated by the clock
 	   controller.
 
-	serial_0: serial@14C10000 {
+	serial_0: serial@14c10000 {
 		compatible = "samsung,exynos5433-uart";
 		reg = <0x14C10000 0x100>;
 		interrupts = <0 421 0>;
diff --git a/Documentation/devicetree/bindings/crypto/atmel-crypto.txt b/Documentation/devicetree/bindings/crypto/atmel-crypto.txt
index 7de1a9674c70..6b458bb2440d 100644
--- a/Documentation/devicetree/bindings/crypto/atmel-crypto.txt
+++ b/Documentation/devicetree/bindings/crypto/atmel-crypto.txt
@@ -75,7 +75,7 @@ Required properties:
 - clock-frequency: must be present in the i2c controller node.
 
 Example:
-atecc508a@C0 {
+atecc508a@c0 {
 	compatible = "atmel,atecc508a";
 	reg = <0xC0>;
 };
diff --git a/Documentation/devicetree/bindings/devfreq/event/exynos-nocp.txt b/Documentation/devicetree/bindings/devfreq/event/exynos-nocp.txt
index fd459f00aa5a..aeaebd425d1f 100644
--- a/Documentation/devicetree/bindings/devfreq/event/exynos-nocp.txt
+++ b/Documentation/devicetree/bindings/devfreq/event/exynos-nocp.txt
@@ -20,7 +20,7 @@ Optional properties:
 
 Example : NoC Probe nodes in Device Tree are listed below.
 
-	nocp_mem0_0: nocp@10CA1000 {
+	nocp_mem0_0: nocp@10ca1000 {
 		compatible = "samsung,exynos5420-nocp";
 		reg = <0x10CA1000 0x200>;
 	};
diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
index ca5204b3bc21..2fff8b406f4c 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
@@ -54,7 +54,7 @@ Video interfaces:
 
 Example:
 
-	dsi@11C80000 {
+	dsi@11c80000 {
 		compatible = "samsung,exynos4210-mipi-dsi";
 		reg = <0x11C80000 0x10000>;
 		interrupts = <0 79 0>;
diff --git a/Documentation/devicetree/bindings/display/st,stih4xx.txt b/Documentation/devicetree/bindings/display/st,stih4xx.txt
index a352ed30cd70..6778b3e7ad5b 100644
--- a/Documentation/devicetree/bindings/display/st,stih4xx.txt
+++ b/Documentation/devicetree/bindings/display/st,stih4xx.txt
@@ -119,7 +119,7 @@ Example:
 / {
 	...
 
-	vtg_main_slave: sti-vtg-main-slave@fe85A800 {
+	vtg_main_slave: sti-vtg-main-slave@fe85a800 {
 		compatible	= "st,vtg";
 		reg		= <0xfe85A800 0x300>;
 		interrupts	= <GIC_SPI 175 IRQ_TYPE_NONE>;
diff --git a/Documentation/devicetree/bindings/dma/ste-dma40.txt b/Documentation/devicetree/bindings/dma/ste-dma40.txt
index aa7dbd565ad0..99ab5c4d331e 100644
--- a/Documentation/devicetree/bindings/dma/ste-dma40.txt
+++ b/Documentation/devicetree/bindings/dma/ste-dma40.txt
@@ -15,7 +15,7 @@ Optional properties:
 
 Example:
 
-	dma: dma-controller@801C0000 {
+	dma: dma-controller@801c0000 {
 		compatible = "stericsson,db8500-dma40", "stericsson,dma40";
 		reg = <0x801C0000 0x1000  0x40010000 0x800>;
 		reg-names = "base", "lcpa";
diff --git a/Documentation/devicetree/bindings/gpio/abilis,tb10x-gpio.txt b/Documentation/devicetree/bindings/gpio/abilis,tb10x-gpio.txt
index 00611aceed3e..a25c87b650e5 100644
--- a/Documentation/devicetree/bindings/gpio/abilis,tb10x-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/abilis,tb10x-gpio.txt
@@ -21,7 +21,7 @@ Documentation/devicetree/bindings/gpio/gpio.txt
 
 Example:
 
-	gpioa: gpio@FF140000 {
+	gpioa: gpio@ff140000 {
 		compatible = "abilis,tb10x-gpio";
 		interrupt-controller;
 		#interrupt-cells = <1>;
diff --git a/Documentation/devicetree/bindings/gpio/gpio-stp-xway.txt b/Documentation/devicetree/bindings/gpio/gpio-stp-xway.txt
index 854de130a971..78458adbf4b7 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-stp-xway.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-stp-xway.txt
@@ -27,7 +27,7 @@ Optional properties:
 
 Example:
 
-gpio1: stp@E100BB0 {
+gpio1: stp@e100bb0 {
 	compatible = "lantiq,gpio-stp-xway";
 	reg = <0xE100BB0 0x40>;
 	#gpio-cells = <2>;
diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index 802402f6cc5d..b5de08e3b1a2 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -290,7 +290,7 @@ pins 50..69.
 
 Example 2:
 
-	gpio_pio_i: gpio-controller@14B0 {
+	gpio_pio_i: gpio-controller@14b0 {
 		#gpio-cells = <2>;
 		compatible = "fsl,qe-pario-bank-e", "fsl,qe-pario-bank";
 		reg = <0x1480 0x18>;
diff --git a/Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.txt b/Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.txt
index 248a155414c2..548a73cde796 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-arb-gpio-challenge.txt
@@ -54,7 +54,7 @@ Optional properties:
 
 
 Example:
-	i2c@12CA0000 {
+	i2c@12ca0000 {
 		compatible = "acme,some-i2c-device";
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt
index 70c054a9a997..60fe90d69f4e 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.txt
@@ -11,7 +11,7 @@ Required properties:
 
 Examples:
 
-lpi2c7: lpi2c7@40A50000 {
+lpi2c7: lpi2c7@40a50000 {
 	compatible = "fsl,imx8dv-lpi2c";
 	reg = <0x40A50000 0x10000>;
 	interrupt-parent = <&intc>;
diff --git a/Documentation/devicetree/bindings/input/samsung-keypad.txt b/Documentation/devicetree/bindings/input/samsung-keypad.txt
index 5305e74e5742..4c5c0a82586d 100644
--- a/Documentation/devicetree/bindings/input/samsung-keypad.txt
+++ b/Documentation/devicetree/bindings/input/samsung-keypad.txt
@@ -45,7 +45,7 @@ Optional Properties specific to linux:
 
 
 Example:
-	keypad@100A0000 {
+	keypad@100a0000 {
 		compatible = "samsung,s5pv210-keypad";
 		reg = <0x100A0000 0x100>;
 		interrupts = <173>;
diff --git a/Documentation/devicetree/bindings/input/touchscreen/brcm,iproc-touchscreen.txt b/Documentation/devicetree/bindings/input/touchscreen/brcm,iproc-touchscreen.txt
index ac5dff412e25..f127a2117072 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/brcm,iproc-touchscreen.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/brcm,iproc-touchscreen.txt
@@ -66,7 +66,7 @@ Example: An example of touchscreen node
 		reg = <0x180a6000 0xc30>;
 	};
 
-	touchscreen: touchscreen@180A6000 {
+	touchscreen: touchscreen@180a6000 {
 		compatible = "brcm,iproc-touchscreen";
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt b/Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt
index 85f068805dd8..b1682c80b490 100644
--- a/Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt
+++ b/Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt
@@ -56,7 +56,7 @@ Examples:
 		iommus = <&sysmmu_gsc0>;
 	};
 
-	sysmmu_gsc0: sysmmu@13E80000 {
+	sysmmu_gsc0: sysmmu@13e80000 {
 		compatible = "samsung,exynos-sysmmu";
 		reg = <0x13E80000 0x1000>;
 		interrupt-parent = <&combiner>;
diff --git a/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt b/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
index 9b40c4925aa9..0ef372656a3e 100644
--- a/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
+++ b/Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
@@ -124,7 +124,7 @@ dsp {
 };
 
 /* AM33xx */
-mailbox: mailbox@480C8000 {
+mailbox: mailbox@480c8000 {
 	compatible = "ti,omap4-mailbox";
 	reg = <0x480C8000 0x200>;
 	interrupts = <77>;
diff --git a/Documentation/devicetree/bindings/media/s5p-cec.txt b/Documentation/devicetree/bindings/media/s5p-cec.txt
index 6f3756da900f..e847291d4aff 100644
--- a/Documentation/devicetree/bindings/media/s5p-cec.txt
+++ b/Documentation/devicetree/bindings/media/s5p-cec.txt
@@ -23,7 +23,7 @@ Optional:
 
 Example:
 
-hdmicec: cec@100B0000 {
+hdmicec: cec@100b0000 {
 	compatible = "samsung,s5p-cec";
 	reg = <0x100B0000 0x200>;
 	interrupts = <0 114 0>;
diff --git a/Documentation/devicetree/bindings/media/samsung-s5c73m3.txt b/Documentation/devicetree/bindings/media/samsung-s5c73m3.txt
index 2c85c4538a6d..21f31fdf5543 100644
--- a/Documentation/devicetree/bindings/media/samsung-s5c73m3.txt
+++ b/Documentation/devicetree/bindings/media/samsung-s5c73m3.txt
@@ -62,7 +62,7 @@ For more details see description of the SPI busses bindings
 
 Example:
 
-i2c@138A000000 {
+i2c@138a000000 {
 	...
 	s5c73m3@3c {
 		compatible = "samsung,s5c73m3";
diff --git a/Documentation/devicetree/bindings/memory-controllers/ti-aemif.txt b/Documentation/devicetree/bindings/memory-controllers/ti-aemif.txt
index 9592717f483f..190437a0c146 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti-aemif.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/ti-aemif.txt
@@ -138,7 +138,7 @@ from the corresponding HW reg.
 
 Example for aemif, davinci nand and nor flash chip select shown below.
 
-memory-controller@21000A00 {
+memory-controller@21000a00 {
 	compatible = "ti,davinci-aemif";
 	#address-cells = <2>;
 	#size-cells = <1>;
diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.txt b/Documentation/devicetree/bindings/mfd/cros-ec.txt
index 136e0c2da44d..6245c9b1a68b 100644
--- a/Documentation/devicetree/bindings/mfd/cros-ec.txt
+++ b/Documentation/devicetree/bindings/mfd/cros-ec.txt
@@ -41,7 +41,7 @@ Optional properties (all):
 
 Example for I2C:
 
-i2c@12CA0000 {
+i2c@12ca0000 {
 	cros-ec@1e {
 		reg = <0x1e>;
 		compatible = "google,cros-ec-i2c";
diff --git a/Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt b/Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt
index d0a37252eb22..6d60bc3063f5 100644
--- a/Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt
+++ b/Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt
@@ -23,7 +23,7 @@ Optional subnodes:
 
 Example:
 
-	mlc: flash@200A8000 {
+	mlc: flash@200a8000 {
 		compatible = "nxp,lpc3220-mlc";
 		reg = <0x200A8000 0x11000>;
 		interrupts = <11 0>;
diff --git a/Documentation/devicetree/bindings/net/cpsw.txt b/Documentation/devicetree/bindings/net/cpsw.txt
index 7cc15c96ea95..4cb4925a28ab 100644
--- a/Documentation/devicetree/bindings/net/cpsw.txt
+++ b/Documentation/devicetree/bindings/net/cpsw.txt
@@ -61,7 +61,7 @@ file.
 
 Examples:
 
-	mac: ethernet@4A100000 {
+	mac: ethernet@4a100000 {
 		compatible = "ti,cpsw";
 		reg = <0x4A100000 0x1000>;
 		interrupts = <55 0x4>;
@@ -91,7 +91,7 @@ Examples:
 	};
 
 (or)
-	mac: ethernet@4A100000 {
+	mac: ethernet@4a100000 {
 		compatible = "ti,cpsw";
 		ti,hwmods = "cpgmac0";
 		cpdma_channels = <8>;
diff --git a/Documentation/devicetree/bindings/net/davinci-mdio.txt b/Documentation/devicetree/bindings/net/davinci-mdio.txt
index 621156ca4ffd..e6527de80f10 100644
--- a/Documentation/devicetree/bindings/net/davinci-mdio.txt
+++ b/Documentation/devicetree/bindings/net/davinci-mdio.txt
@@ -21,7 +21,7 @@ file.
 
 Examples:
 
-	mdio: davinci_mdio@4A101000 {
+	mdio: davinci_mdio@4a101000 {
 		compatible = "ti,davinci_mdio";
 		reg = <0x4A101000 0x1000>;
 		bus_freq = <1000000>;
@@ -29,7 +29,7 @@ Examples:
 
 (or)
 
-	mdio: davinci_mdio@4A101000 {
+	mdio: davinci_mdio@4a101000 {
 		compatible = "ti,davinci_mdio";
 		ti,hwmods = "davinci_mdio";
 		bus_freq = <1000000>;
diff --git a/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt b/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
index db74f0dc290c..594982c6b9f9 100644
--- a/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
+++ b/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
@@ -136,7 +136,7 @@ Clock Properties:
 
 Example:
 
-	ptp_clock@24E00 {
+	ptp_clock@24e00 {
 		compatible = "fsl,etsec-ptp";
 		reg = <0x24E00 0xB0>;
 		interrupts = <12 0x8 13 0x8>;
diff --git a/Documentation/devicetree/bindings/phy/ti-phy.txt b/Documentation/devicetree/bindings/phy/ti-phy.txt
index cd13e6157088..57dfda8a7a1d 100644
--- a/Documentation/devicetree/bindings/phy/ti-phy.txt
+++ b/Documentation/devicetree/bindings/phy/ti-phy.txt
@@ -120,7 +120,7 @@ usb3phy@4a084400 {
 			"refclk";
 };
 
-sata_phy: phy@4A096000 {
+sata_phy: phy@4a096000 {
 	compatible = "ti,phy-pipe3-sata";
 	reg = <0x4A096000 0x80>, /* phy_rx */
 	      <0x4A096400 0x64>, /* phy_tx */
diff --git a/Documentation/devicetree/bindings/pinctrl/abilis,tb10x-iomux.txt b/Documentation/devicetree/bindings/pinctrl/abilis,tb10x-iomux.txt
index 2c11866221c2..c591b9cb5ba0 100644
--- a/Documentation/devicetree/bindings/pinctrl/abilis,tb10x-iomux.txt
+++ b/Documentation/devicetree/bindings/pinctrl/abilis,tb10x-iomux.txt
@@ -49,7 +49,7 @@ explained in Documentation/devicetree/bindings/gpio/gpio.txt.
 Example
 -------
 
-iomux: iomux@FF10601c {
+iomux: iomux@ff10601c {
 	compatible = "abilis,tb10x-iomux";
 	reg = <0xFF10601c 0x4>;
 	pctl_gpio_a: pctl-gpio-a {
@@ -59,7 +59,7 @@ iomux: iomux@FF10601c {
 		abilis,function = "uart0";
 	};
 };
-uart@FF100000 {
+uart@ff100000 {
 	compatible = "snps,dw-apb-uart";
 	reg = <0xFF100000 0x100>;
 	clock-frequency = <166666666>;
@@ -69,7 +69,7 @@ uart@FF100000 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pctl_uart0>;
 };
-gpioa: gpio@FF140000 {
+gpioa: gpio@ff140000 {
 	compatible = "abilis,tb10x-gpio";
 	reg = <0xFF140000 0x1000>;
 	gpio-controller;
diff --git a/Documentation/devicetree/bindings/pinctrl/img,pistachio-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/img,pistachio-pinctrl.txt
index 0326154c7925..a72dc3178179 100644
--- a/Documentation/devicetree/bindings/pinctrl/img,pistachio-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/img,pistachio-pinctrl.txt
@@ -152,7 +152,7 @@ resetn
 
 Example:
 --------
-pinctrl@18101C00 {
+pinctrl@18101c00 {
 	compatible = "img,pistachio-system-pinctrl";
 	reg = <0x18101C00 0x400>;
 
diff --git a/Documentation/devicetree/bindings/pinctrl/lantiq,pinctrl-xway.txt b/Documentation/devicetree/bindings/pinctrl/lantiq,pinctrl-xway.txt
index 8e5216bcd748..4658f105fa09 100644
--- a/Documentation/devicetree/bindings/pinctrl/lantiq,pinctrl-xway.txt
+++ b/Documentation/devicetree/bindings/pinctrl/lantiq,pinctrl-xway.txt
@@ -163,7 +163,7 @@ Valid values for xRX300 pin names:
 						io42-io43,io48-io61.
 
 Example:
-	gpio: pinmux@E100B10 {
+	gpio: pinmux@e100b10 {
 		compatible = "lantiq,danube-pinctrl";
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
index 231fa1db7c5e..afa8a18ea11a 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
@@ -81,7 +81,7 @@ Examples:
 		reg = <0 0x10005000 0 0x1000>;
 	};
 
-	syscfg_pctl_b: syscfg_pctl_b@1020C020 {
+	syscfg_pctl_b: syscfg_pctl_b@1020c020 {
 		compatible = "mediatek,mt8135-pctl-b-syscfg", "syscon";
 		reg = <0 0x1020C020 0 0x1000>;
 	};
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/interlaken-lac.txt b/Documentation/devicetree/bindings/powerpc/fsl/interlaken-lac.txt
index 641bc13983e1..ed6a414b2e10 100644
--- a/Documentation/devicetree/bindings/powerpc/fsl/interlaken-lac.txt
+++ b/Documentation/devicetree/bindings/powerpc/fsl/interlaken-lac.txt
@@ -223,37 +223,37 @@ lac-portals {
 		reg = <0x9000 0x1000>;
 	};
 
-	lportal10: lac-portal@A000 {
+	lportal10: lac-portal@a000 {
 		compatible = "fsl,interlaken-lac-portal-v1.0";
 		fsl,liodn = <0x20E>;
 		reg = <0xA000 0x1000>;
 	};
 
-	lportal11: lac-portal@B000 {
+	lportal11: lac-portal@b000 {
 		compatible = "fsl,interlaken-lac-portal-v1.0";
 		fsl,liodn = <0x20F>;
 		reg = <0xB000 0x1000>;
 	};
 
-	lportal12: lac-portal@C000 {
+	lportal12: lac-portal@c000 {
 		compatible = "fsl,interlaken-lac-portal-v1.0";
 		fsl,liodn = <0x210>;
 		reg = <0xC000 0x1000>;
 	};
 
-	lportal13: lac-portal@D000 {
+	lportal13: lac-portal@d000 {
 		compatible = "fsl,interlaken-lac-portal-v1.0";
 		fsl,liodn = <0x211>;
 		reg = <0xD000 0x1000>;
 	};
 
-	lportal14: lac-portal@E000 {
+	lportal14: lac-portal@e000 {
 		compatible = "fsl,interlaken-lac-portal-v1.0";
 		fsl,liodn = <0x212>;
 		reg = <0xE000 0x1000>;
 	};
 
-	lportal15: lac-portal@F000 {
+	lportal15: lac-portal@f000 {
 		compatible = "fsl,interlaken-lac-portal-v1.0";
 		fsl,liodn = <0x213>;
 		reg = <0xF000 0x1000>;
diff --git a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt
index 3944ee3e731e..5ddb8500a929 100644
--- a/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt
+++ b/Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt
@@ -10,7 +10,7 @@ Required properties:
 - clocks:		Must contain an entry for peripheral clock.
 
 Example:
-	vrefbuf: regulator@58003C00 {
+	vrefbuf: regulator@58003c00 {
 		compatible = "st,stm32-vrefbuf";
 		reg = <0x58003C00 0x8>;
 		clocks = <&rcc VREF_CK>;
diff --git a/Documentation/devicetree/bindings/serial/lantiq_asc.txt b/Documentation/devicetree/bindings/serial/lantiq_asc.txt
index 5b78591aaa46..3acbd309ab9d 100644
--- a/Documentation/devicetree/bindings/serial/lantiq_asc.txt
+++ b/Documentation/devicetree/bindings/serial/lantiq_asc.txt
@@ -8,7 +8,7 @@ Required properties:
 
 Example:
 
-asc1: serial@E100C00 {
+asc1: serial@e100c00 {
 	compatible = "lantiq,asc";
 	reg = <0xE100C00 0x400>;
 	interrupt-parent = <&icu0>;
diff --git a/Documentation/devicetree/bindings/sound/img,i2s-out.txt b/Documentation/devicetree/bindings/sound/img,i2s-out.txt
index 0159415b3338..6b0ee9b7e11b 100644
--- a/Documentation/devicetree/bindings/sound/img,i2s-out.txt
+++ b/Documentation/devicetree/bindings/sound/img,i2s-out.txt
@@ -35,7 +35,7 @@ Optional Properties:
 
 Example:
 
-i2s_out: i2s-out@18100A00 {
+i2s_out: i2s-out@18100a00 {
 	compatible = "img,i2s-out";
 	reg = <0x18100A00 0x200>;
 	interrupts = <GIC_SHARED 13 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/Documentation/devicetree/bindings/sound/img,parallel-out.txt b/Documentation/devicetree/bindings/sound/img,parallel-out.txt
index a3015d2a06e0..37a3f94cc126 100644
--- a/Documentation/devicetree/bindings/sound/img,parallel-out.txt
+++ b/Documentation/devicetree/bindings/sound/img,parallel-out.txt
@@ -29,7 +29,7 @@ Optional Properties:
 
 Example:
 
-parallel_out: parallel-out@18100C00 {
+parallel_out: parallel-out@18100c00 {
 	compatible = "img,parallel-out";
 	reg = <0x18100C00 0x100>;
 	interrupts = <GIC_SHARED 19 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/Documentation/devicetree/bindings/sound/img,spdif-in.txt b/Documentation/devicetree/bindings/sound/img,spdif-in.txt
index aab9a81f7e13..f7ea8c87bf34 100644
--- a/Documentation/devicetree/bindings/sound/img,spdif-in.txt
+++ b/Documentation/devicetree/bindings/sound/img,spdif-in.txt
@@ -29,7 +29,7 @@ Optional Properties:
 
 Example:
 
-spdif_in: spdif-in@18100E00 {
+spdif_in: spdif-in@18100e00 {
 	compatible = "img,spdif-in";
 	reg = <0x18100E00 0x100>;
 	interrupts = <GIC_SHARED 20 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/Documentation/devicetree/bindings/sound/img,spdif-out.txt b/Documentation/devicetree/bindings/sound/img,spdif-out.txt
index 470a5191e101..413ed8b01870 100644
--- a/Documentation/devicetree/bindings/sound/img,spdif-out.txt
+++ b/Documentation/devicetree/bindings/sound/img,spdif-out.txt
@@ -29,7 +29,7 @@ Optional Properties:
 
 Example:
 
-spdif_out: spdif-out@18100D00 {
+spdif_out: spdif-out@18100d00 {
 	compatible = "img,spdif-out";
 	reg = <0x18100D00 0x100>;
 	interrupts = <GIC_SHARED 21 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt b/Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
index 9c1ee52fed5b..4d51f3f5ea98 100644
--- a/Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
+++ b/Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
@@ -51,7 +51,7 @@ Optional properties:
 
 Example:
 
-	sti_uni_player1: sti-uni-player@8D81000 {
+	sti_uni_player1: sti-uni-player@8d81000 {
 		compatible = "st,stih407-uni-player-hdmi";
 		#sound-dai-cells = <0>;
 		st,syscfg = <&syscfg_core>;
@@ -63,7 +63,7 @@ Example:
 		st,tdm-mode = <1>;
 	};
 
-	sti_uni_player2: sti-uni-player@8D82000 {
+	sti_uni_player2: sti-uni-player@8d82000 {
 		compatible = "st,stih407-uni-player-pcm-out";
 		#sound-dai-cells = <0>;
 		st,syscfg = <&syscfg_core>;
@@ -74,7 +74,7 @@ Example:
 		dma-names = "tx";
 	};
 
-	sti_uni_player3: sti-uni-player@8D85000 {
+	sti_uni_player3: sti-uni-player@8d85000 {
 		compatible = "st,stih407-uni-player-spdif";
 		#sound-dai-cells = <0>;
 		st,syscfg = <&syscfg_core>;
@@ -85,7 +85,7 @@ Example:
 		dma-names = "tx";
 	};
 
-	sti_uni_reader1: sti-uni-reader@8D84000 {
+	sti_uni_reader1: sti-uni-reader@8d84000 {
 		compatible = "st,stih407-uni-reader-hdmi";
 		#sound-dai-cells = <0>;
 		st,syscfg = <&syscfg_core>;
diff --git a/Documentation/devicetree/bindings/spi/spi-davinci.txt b/Documentation/devicetree/bindings/spi/spi-davinci.txt
index 1925277bfc1e..9f5b4c7c0c08 100644
--- a/Documentation/devicetree/bindings/spi/spi-davinci.txt
+++ b/Documentation/devicetree/bindings/spi/spi-davinci.txt
@@ -68,7 +68,7 @@ SPI_SOMI/SIMO+-----------------+                           +-----------
 Example of a NOR flash slave device (n25q032) connected to DaVinci
 SPI controller device over the SPI bus.
 
-spi0:spi@20BF0000 {
+spi0:spi@20bf0000 {
 	#address-cells			= <1>;
 	#size-cells			= <0>;
 	compatible			= "ti,dm6446-spi";
diff --git a/Documentation/devicetree/bindings/spi/spi-lantiq-ssc.txt b/Documentation/devicetree/bindings/spi/spi-lantiq-ssc.txt
index 6069b95a883d..ce3230c8e28d 100644
--- a/Documentation/devicetree/bindings/spi/spi-lantiq-ssc.txt
+++ b/Documentation/devicetree/bindings/spi/spi-lantiq-ssc.txt
@@ -16,7 +16,7 @@ Optional properties:
 Example:
 
 
-spi: spi@E100800 {
+spi: spi@e100800 {
 	compatible = "lantiq,xrx200-spi", "lantiq,xrx100-spi";
 	reg = <0xE100800 0x100>;
 	interrupt-parent = <&icu0>;
diff --git a/Documentation/devicetree/bindings/thermal/exynos-thermal.txt b/Documentation/devicetree/bindings/thermal/exynos-thermal.txt
index 9b4c7b017495..1b596fd38dc4 100644
--- a/Documentation/devicetree/bindings/thermal/exynos-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/exynos-thermal.txt
@@ -70,7 +70,7 @@ Following properties are mandatory (depending on SoC):
 
 Example 1):
 
-	tmu@100C0000 {
+	tmu@100c0000 {
 		compatible = "samsung,exynos4412-tmu";
 		interrupt-parent = <&combiner>;
 		reg = <0x100C0000 0x100>;
diff --git a/Documentation/devicetree/bindings/thermal/thermal.txt b/Documentation/devicetree/bindings/thermal/thermal.txt
index 44d7cb2cb2c0..1719d47a5e2f 100644
--- a/Documentation/devicetree/bindings/thermal/thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/thermal.txt
@@ -252,7 +252,7 @@ ocp {
 	/*
 	 * A simple IC with a single bandgap temperature sensor.
 	 */
-	bandgap0: bandgap@0000ED00 {
+	bandgap0: bandgap@0000ed00 {
 		...
 		#thermal-sensor-cells = <0>;
 	};
@@ -330,7 +330,7 @@ ocp {
 	/*
 	 * A simple IC with several bandgap temperature sensors.
 	 */
-	bandgap0: bandgap@0000ED00 {
+	bandgap0: bandgap@0000ed00 {
 		...
 		#thermal-sensor-cells = <1>;
 	};
@@ -458,7 +458,7 @@ ocp {
 	/*
 	 * A simple IC with a single bandgap temperature sensor.
 	 */
-	bandgap0: bandgap@0000ED00 {
+	bandgap0: bandgap@0000ed00 {
 		...
 		#thermal-sensor-cells = <0>;
 	};
diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.txt b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.txt
index 167d5dab9f64..8f78640ad64c 100644
--- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.txt
+++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.txt
@@ -51,7 +51,7 @@ Example 2: In this example, the timer interrupts are connected to two separate
 	   interrupt controllers. Hence, an interrupt-map is created to map
 	   the interrupts to the respective interrupt controllers.
 
-	mct@101C0000 {
+	mct@101c0000 {
 		compatible = "samsung,exynos4210-mct";
 		reg = <0x101C0000 0x800>;
 		interrupt-parent = <&mct_map>;
diff --git a/Documentation/devicetree/bindings/watchdog/pnx4008-wdt.txt b/Documentation/devicetree/bindings/watchdog/pnx4008-wdt.txt
index 556d06c17c92..4b76bec62af9 100644
--- a/Documentation/devicetree/bindings/watchdog/pnx4008-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/pnx4008-wdt.txt
@@ -10,7 +10,7 @@ Optional properties:
 
 Example:
 
-	watchdog@4003C000 {
+	watchdog@4003c000 {
 		compatible = "nxp,pnx4008-wdt";
 		reg = <0x4003C000 0x1000>;
 		timeout-sec = <10>;
diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
index 1f6e101e299a..46dcb48e75b4 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
@@ -25,7 +25,7 @@ Optional properties:
 
 Example:
 
-watchdog@101D0000 {
+watchdog@101d0000 {
 	compatible = "samsung,exynos5250-wdt";
 	reg = <0x101D0000 0x100>;
 	interrupts = <0 42 0>;
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
