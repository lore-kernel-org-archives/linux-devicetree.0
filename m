From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH] arm64: dts: allwinner: h6: add PIO VCC bank supplies for Pine H64
Date: Wed, 24 Apr 2019 14:25:43 +0800
Message-ID: <20190424062543.61852-1-icenowy@aosc.io>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

The Allwinner H6 SoC features tweakable VCC for PC, PD, PG, PL and PM
banks.

This patch adds supplies for PC and PD banks on Pine H64 board. PG and
PM banks are used for Wi-Fi and should be added when Wi-Fi is added; PL
bank is where PMIC is attached, and currently if a PMIC regulator is
added for it a dependency loop will happen.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index 4802902e128f..d586a51c657d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -127,6 +127,11 @@
 	status = "okay";
 };
 
+&pio {
+	vcc-pc-supply = <&reg_bldo2>;
+	vcc-pd-supply = <&reg_cldo1>;
+};
+
 &r_i2c {
 	status = "okay";
 
-- 
2.18.1
