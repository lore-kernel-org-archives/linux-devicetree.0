Return-Path: <SRS0=SDjf=NF=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 4/7] ARM: dts: iwg23s-sbc: Enable USB Phy[01]
Date: Thu, 25 Oct 2018 14:56:56 +0100
Message-Id: <1540475819-47950-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540475819-47950-1-git-send-email-biju.das@bp.renesas.com>
References: <1540475819-47950-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Enable USB phy[01] on iWave iwg23s sbc based on RZ/G1C SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
This patch is tested against renesas devel.
---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index e5cfb50..157af7c 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -100,6 +100,16 @@
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
 
 &scif1 {
@@ -134,3 +144,17 @@
 	sd-uhs-sdr50;
 	status = "okay";
 };
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
