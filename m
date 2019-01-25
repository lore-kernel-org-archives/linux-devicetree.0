From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 10/11] ARM: dts: sun8i-q8-common: Enable display pipeline with RGB LCD panel
Date: Fri, 25 Jan 2019 11:23:13 +0800
Message-ID: <20190125032314.20915-11-wens@csie.org>
References: <20190125032314.20915-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125032314.20915-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Q8 design for A23/A33 tablets have an 18-bit RGB LCD panel connected
to the LCD interface on the SoC, the DC1SW output on the PMIC providing
power for the LCD, and PH7 toggling the reset pin for the panel.

This patch adds a device node for the panel, describing the above, and
enables the display pipeline.

The actual model or compatible string for the panel should be added in
the tablet device tree file.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun8i-q8-common.dtsi | 37 ++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-q8-common.dtsi b/arch/arm/boot/dts/sun8i-q8-common.dtsi
index 719ad769b837..53104f4ccacc 100644
--- a/arch/arm/boot/dts/sun8i-q8-common.dtsi
+++ b/arch/arm/boot/dts/sun8i-q8-common.dtsi
@@ -49,6 +49,26 @@
 		ethernet0 = &sdio_wifi;
 	};
 
+	panel: panel {
+		/* Tablet dts should provide panel compatible */
+		backlight = <&backlight>;
+		enable-gpios = <&pio 7 7 GPIO_ACTIVE_HIGH>; /* PH7 */
+		power-supply = <&reg_dc1sw>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			panel_input: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&tcon0_out_lcd>;
+			};
+		};
+	};
+
 	wifi_pwrseq: wifi_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		/*
@@ -64,6 +84,10 @@
 	};
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status  = "okay";
 };
@@ -90,6 +114,19 @@
 	};
 };
 
+&tcon0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&lcd_rgb666_pins>;
+	status = "okay";
+};
+
+&tcon0_out {
+	tcon0_out_lcd: endpoint@0 {
+		reg = <0>;
+		remote-endpoint = <&panel_input>;
+	};
+};
+
 &usbphy {
 	usb1_vbus-supply = <&reg_dldo1>;
 };
-- 
2.20.1
