From: Priit Laes <plaes@plaes.org>
Subject: [PATCH] ARM: dts: sun7i: olimex-lime2: Add regulators for GPIO banks
Date: Tue, 26 Feb 2019 16:15:25 +0200
Message-ID: <20190226141525.1039-1-plaes@plaes.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linux-sunxi@googlegroups.com, Priit Laes <priit.laes@paf.com>
List-Id: devicetree@vger.kernel.org

From: Priit Laes <priit.laes@paf.com>

Make sure that A20 Olimex Lime2 pin bank regulators are
properly represented.

While pin banks A, B and F are connected to 3.3V static
regulator, pin banks E and G tied with LDO3 and LDO4 regulators
with 2.8V reference.

Signed-off-by: Priit Laes <priit.laes@paf.com>
---
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
index 4e1c590eb098..3de479bfa4cf 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
@@ -174,6 +174,12 @@
 };
 
 &pio {
+	vcc-pa-supply = <&reg_vcc3v3>;
+	vcc-pc-supply = <&reg_vcc3v3>;
+	vcc-pe-supply = <&reg_ldo3>;
+	vcc-pf-supply = <&reg_vcc3v3>;
+	vcc-pg-supply = <&reg_ldo4>;
+
 	led_pins_olinuxinolime: led-pins {
 		pins = "PH2";
 		function = "gpio_out";
-- 
2.11.0
