Return-Path: <SRS0=Ks1j=SF=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH V3 09/13] ARM: dts: iwg23s-sbc: Enable USB Phy[01]
Date: Wed,  3 Apr 2019 11:28:40 +0100
Message-Id: <1554287324-22312-10-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Enable USB phy[01] on iWave iwg23s sbc based on RZ/G1C SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V2-->V3
 * Added gen3 usb2 phy nodes
V1-->V2
 * No change
---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index 9f9eb15..7ae7ee1 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -214,6 +214,16 @@
 		function = "sdhi2";
 		power-source = <1800>;
 	};
+
+	usb0_pins: usb0 {
+		groups = "usb0";
+		function = "usb0";
+	};
+
+	usb1_pins: usb1 {
+		groups = "usb1";
+		function = "usb1";
+	};
 };
 
 &qspi0 {
@@ -274,3 +284,25 @@
 	sd-uhs-sdr50;
 	status = "okay";
 };
+
+&usb2_phy0 {
+	status = "okay";
+};
+
+&usb2_phy1 {
+	status = "okay";
+};
+
+&usbphy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&usbphy1 {
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
-- 
2.7.4
