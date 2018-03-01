Return-Path: <SRS0=Pbk3=FX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:59006 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965752AbeCAEBZ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 28 Feb 2018 23:01:25 -0500
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 2/3] ARM: dts: omap4-droid4: Configure MDM6600 USB PHY
Date: Wed, 28 Feb 2018 20:01:06 -0800
Message-Id: <20180301040107.39444-2-tony@atomide.com>
In-Reply-To: <20180301040107.39444-1-tony@atomide.com>
References: <20180301040107.39444-1-tony@atomide.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Marcel Partap <mpartap@gmx.net>, Michael Scott <michael.scott@linaro.org>, Sebastian Reichel <sre@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Configure MDM6600 USB PHY.

Cc: Marcel Partap <mpartap@gmx.net>
Cc: Michael Scott <michael.scott@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4-droid4-xt894.dts | 64 ++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/omap4-droid4-xt894.dts
--- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
+++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
@@ -71,6 +71,28 @@
 		regulator-always-on;
 	};
 
+	/* FS USB Host PHY on port 1 for mdm6600 */
+	fsusb1_phy: usb-phy@1 {
+		compatible = "motorola,mapphone-mdm6600";
+		pinctrl-0 = <&usb_mdm6600_pins>;
+		pinctrl-names = "default";
+		enable-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;     /* gpio_95 */
+		power-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;	/* gpio_54 */
+		reset-gpios = <&gpio2 17 GPIO_ACTIVE_HIGH>;	/* gpio_49 */
+		/* mode: gpio_148 gpio_149 */
+		motorola,mode-gpios = <&gpio5 20 GPIO_ACTIVE_HIGH>,
+				      <&gpio5 21 GPIO_ACTIVE_HIGH>;
+		/* cmd: gpio_103 gpio_104 gpio_142 */
+		motorola,cmd-gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>,
+				     <&gpio4 8 GPIO_ACTIVE_HIGH>,
+				     <&gpio5 14 GPIO_ACTIVE_HIGH>;
+		/* status: gpio_52 gpio_53 gpio_55 */
+		motorola,status-gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>,
+					<&gpio2 21 GPIO_ACTIVE_HIGH>,
+					<&gpio2 23 GPIO_ACTIVE_HIGH>;
+		#phy-cells = <0>;
+	};
+
 	/* HS USB host TLL nop-phy on port 2 for w3glte */
 	hsusb2_phy: usb-phy@2 {
 		compatible = "usb-nop-xceiv";
@@ -459,6 +481,43 @@
 		>;
 	};
 
+	usb_mdm6600_pins: pinmux_usb_mdm6600_pins {
+		pinctrl-single,pins = <
+		/* enable 0x4a1000d8 usbb1_ulpitll_dat7.gpio_95 ag16 */
+		OMAP4_IOPAD(0x0d8, PIN_INPUT | MUX_MODE3)
+
+		/* power 0x4a10007c gpmc_nwp.gpio_54 c25 */
+		OMAP4_IOPAD(0x07c, PIN_OUTPUT | MUX_MODE3)
+
+		/* reset 0x4a100072 gpmc_a25.gpio_49 d20 */
+		OMAP4_IOPAD(0x072, PIN_OUTPUT | MUX_MODE3)
+
+		/* mode0/bpwake 0x4a10014e sdmmc5_dat1.gpio_148 af4 */
+		OMAP4_IOPAD(0x14e, PIN_OUTPUT | MUX_MODE3)
+
+		/* mode1/apwake 0x4a100150 sdmmc5_dat2.gpio_149 ag3 */
+		OMAP4_IOPAD(0x150, PIN_OFF_OUTPUT_LOW | PIN_INPUT | MUX_MODE3)
+
+		/* status0 0x4a10007e gpmc_clk.gpio_55 b22 */
+		OMAP4_IOPAD(0x07e, PIN_INPUT | MUX_MODE3)
+
+		/* status1 0x4a10007a gpmc_ncs3.gpio_53 c22 */
+		OMAP4_IOPAD(0x07a, PIN_INPUT | MUX_MODE3)
+
+		/* status2 0x4a100078 gpmc_ncs2.gpio_52 d21 */
+		OMAP4_IOPAD(0x078, PIN_INPUT | MUX_MODE3)
+
+		/* cmd0 0x4a100094 gpmc_ncs6.gpio_103 c24 */
+		OMAP4_IOPAD(0x094, PIN_OUTPUT | MUX_MODE3)
+
+		/* cmd1 0x4a100096 gpmc_ncs7.gpio_104 d24 */
+		OMAP4_IOPAD(0x096, PIN_OUTPUT | MUX_MODE3)
+
+		/* cmd2 0x4a100142 uart3_rts_sd.gpio_142 f28 */
+		OMAP4_IOPAD(0x142, PIN_OUTPUT | MUX_MODE3)
+		>;
+	};
+
 	usb_ulpi_pins: pinmux_usb_ulpi_pins {
 		pinctrl-single,pins = <
 		OMAP4_IOPAD(0x196, MUX_MODE7)
@@ -583,6 +642,11 @@
 	};
 };
 
+&usbhsohci {
+	phys = <&fsusb1_phy>;
+	phy-names = "usb";
+};
+
 &usbhsehci {
 	phys = <&hsusb2_phy>;
 };
-- 
2.16.2
