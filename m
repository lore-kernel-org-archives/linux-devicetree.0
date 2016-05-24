From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/4] arm64: dts: salvator-x: enable usb2_phy of channel 0
Date: Tue, 24 May 2016 13:57:38 +0900
Message-ID: <1464065860-3948-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1464065860-3948-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1464065860-3948-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch also adds a regulator node for USB2.0 to handle VBUS on/off
by the phy-rcar-gen3-usb2 driver.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index c09ead3..21e7e09 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -112,6 +112,17 @@
 			  1800000 0>;
 	};
 
+	vbus0_usb2_phy0: regulator@5 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "USB20_VBUS0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&gpio6 16 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	audio_clkout: audio_clkout {
 		/*
 		 * This is same as <&rcar_sound 0>
@@ -349,6 +360,11 @@
 		function = "audio_clk";
 	};
 
+	usb0_pins: usb0 {
+		groups = "usb0";
+		function = "usb0";
+	};
+
 	usb1_pins: usb1 {
 		groups = "usb1";
 		function = "usb1";
@@ -541,6 +557,14 @@
 	status = "okay";
 };
 
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+
+	vbus-supply = <&vbus0_usb2_phy0>;
+	status = "okay";
+};
+
 &usb2_phy1 {
 	pinctrl-0 = <&usb1_pins>;
 	pinctrl-names = "default";
-- 
1.9.1
