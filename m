From: Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH] arm64: dts: allwinner: a64: Add lradc node
Date: Sat, 18 May 2019 19:09:30 +0200
Message-ID: <20190518170929.24789-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Luca Weiss <luca@z3ntu.xyz>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/Allwinner
        sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add a node describing the KEYADC on the A64.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 7734f70e1057..dc1bf8c1afb5 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -704,6 +704,13 @@
 			status = "disabled";
 		};
 
+		lradc: lradc@1c21800 {
+			compatible = "allwinner,sun4i-a10-lradc-keys";
+			reg = <0x01c21800 0x100>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		i2s0: i2s@1c22000 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun50i-a64-i2s",
-- 
2.21.0
