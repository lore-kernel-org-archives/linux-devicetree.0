From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 08/10] arm64: dts: salvator-x: enable usb2_phy
Date: Tue, 2 Feb 2016 19:18:56 +0900
Message-ID: <1454408338-4612-9-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1454408338-4612-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1454408338-4612-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch also adds a regulator node for USB2.0 to handle VBUS on/off
by the generic PHY framework.
This board has a MAX3355 chip. However, we cannot use the extcon/max3355
driver because the ID pin doesn't connect to a gpio pin (in other words,
it connects to the SoC specific pin).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 45 +++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 9af1e3f..3ff6e79 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -33,6 +33,7 @@
 
 /dts-v1/;
 #include "r8a7795.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Renesas Salvator-X board based on r8a7795";
@@ -86,6 +87,15 @@
 			sound-dai = <&ak4613>;
 		};
 	};
+
+	vcc_usb2_phy0: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "USB20_VBUS0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio6 16 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &extal_clk {
@@ -122,8 +132,22 @@
 				 "audio_clkout_a", "audio_clkout3_a";
 		renesas,function = "audio_clk";
 	};
-};
 
+	usb0_pins: usb0 {
+		renesas,groups = "usb0";
+		renesas,function = "usb";
+	};
+
+	usb1_pins: usb1 {
+		renesas,groups = "usb1";
+		renesas,function = "usb";
+	};
+
+	usb2_pins: usb2 {
+		renesas,groups = "usb2";
+		renesas,function = "usb";
+	};
+};
 &scif1 {
 	pinctrl-0 = <&scif1_pins>;
 	pinctrl-names = "default";
@@ -253,3 +277,22 @@
 &xhci0 {
 	status = "okay";
 };
+
+&usb2_phy0 {
+	status = "okay";
+	phy-supply = <&vcc_usb2_phy0>;
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+};
+
+&usb2_phy1 {
+	status = "okay";
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+};
+
+&usb2_phy2 {
+	status = "okay";
+	pinctrl-0 = <&usb2_pins>;
+	pinctrl-names = "default";
+};
-- 
1.9.1
