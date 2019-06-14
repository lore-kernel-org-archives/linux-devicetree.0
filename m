Return-Path: <SRS0=9gxl=UN=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: hihope-common: Add LEDs support
Date: Fri, 14 Jun 2019 14:14:35 +0100
Message-Id: <1560518075-2254-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
List-ID: <devicetree@vger.kernel.org>

This patch adds LEDs support to the HiHope RZ/G2[MN] Main Board
common device tree.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
This patch depends on:
https://patchwork.kernel.org/patch/10986913/

Thanks,
Fab

 arch/arm64/boot/dts/renesas/hihope-common.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 18763ca..b0bf510 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -17,6 +17,30 @@
 		stdout-path = "serial0:115200n8";
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led0 {
+			gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
+			label = "LED0";
+		};
+
+		led1 {
+			gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
+			label = "LED1";
+		};
+
+		led2 {
+			gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
+			label = "LED2";
+		};
+
+		led3 {
+			gpios = <&gpio0  0 GPIO_ACTIVE_HIGH>;
+			label = "LED3";
+		};
+	};
+
 	reg_1p8v: regulator0 {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
-- 
2.7.4
