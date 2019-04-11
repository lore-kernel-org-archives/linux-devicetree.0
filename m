From: Spyridon Papageorgiou <spapageorgiou@de.adit-jv.com>
Subject: [PATCH] arm64: dts: ulcb-kf: Add support for TI WL1837
Date: Thu, 11 Apr 2019 14:41:03 +0200
Message-ID: <20190411124102.22442-1-spapageorgiou@de.adit-jv.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: horms@verge.net.au
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, erosca@de.adit-jv.com, tfranzen@de.adit-jv.com
List-Id: devicetree@vger.kernel.org

This patch adds description of TI WL1837 and links interfaces
to communicate with the IC, namely the SDIO interface to WLAN.

Signed-off-by: Spyridon Papageorgiou <spapageorgiou@de.adit-jv.com>
---
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 49 ++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 7a09576..27851a7 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -38,6 +38,18 @@
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 	};
+
+	wlan_en: regulator-wlan_en {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan-en-regulator";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&gpio_exp_74 4 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <70000>;
+		enable-active-high;
+	};
 };
 
 &can0 {
@@ -88,6 +100,13 @@
 			line-name = "Audio_Out_OFF";
 		};
 
+		sd-wifi-mux {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_HIGH>;
+			output-low;	/* Connect WL1837 */
+			line-name = "SD WiFi mux";
+		};
+
 		hub_pwen {
 			gpio-hog;
 			gpios = <6 GPIO_ACTIVE_HIGH>;
@@ -254,6 +273,12 @@
 		function = "scif1";
 	};
 
+	sdhi3_pins: sdhi3 {
+		groups = "sdhi3_data4", "sdhi3_ctrl";
+		function = "sdhi3";
+		power-source = <3300>;
+	};
+
 	usb0_pins: usb0 {
 		groups = "usb0";
 		function = "usb0";
@@ -273,6 +298,30 @@
 	status = "okay";
 };
 
+&sdhi3 {
+	pinctrl-0 = <&sdhi3_pins>;
+	pinctrl-names = "default";
+
+	vmmc-supply = <&wlan_en>;
+	vqmmc-supply = <&wlan_en>;
+	bus-width = <4>;
+	no-1-8-v;
+	non-removable;
+	cap-power-off-card;
+	keep-power-in-suspend;
+	max-frequency = <26000000>;
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+	wlcore: wlcore@2 {
+		compatible = "ti,wl1837";
+		reg = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
 &usb2_phy0 {
 	pinctrl-0 = <&usb0_pins>;
 	pinctrl-names = "default";
-- 
2.7.4
