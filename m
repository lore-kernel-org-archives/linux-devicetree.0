From: megous@megous.com
Subject: [PATCH v2 3/3] ARM: dts: sun8i: a83t: Add device node for CSI (Camera Sensor Interface)
Date: Mon, 20 May 2019 17:06:37 +0200
Message-ID: <20190520150637.23557-4-megous@megous.com>
References: <20190520150637.23557-1-megous@megous.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520150637.23557-1-megous@megous.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, Ondrej Jirman <megous@megous.com>
List-Id: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

The A83T SoC has a camera sensor interface (known as CSI in Allwinner
lingo), which is similar to the one found on the A64 and H3. The only
difference seems to be that support of MIPI CSI through a connected
MIPI CSI-2 bridge.

Add a device node for it, and pinctrl nodes for the commonly used MCLK
and 8-bit parallel interface. The property /omit-if-no-ref/ is added to
the pinctrl nodes to keep the device tree blob size down if they are
unused.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 392b0cabbf0d..ada6d08bc540 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -679,6 +679,20 @@
 			#interrupt-cells = <3>;
 			#gpio-cells = <3>;
 
+			/omit-if-no-ref/
+			csi_8bit_parallel_pins: csi-8bit-parallel-pins {
+				pins = "PE0", "PE2", "PE3", "PE6", "PE7",
+				       "PE8", "PE9", "PE10", "PE11",
+				       "PE12", "PE13";
+				function = "csi";
+			};
+
+			/omit-if-no-ref/
+			csi_mclk_pin: csi-mclk-pin {
+				pins = "PE1";
+				function = "csi";
+			};
+
 			emac_rgmii_pins: emac-rgmii-pins {
 				pins = "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
 				       "PD11", "PD12", "PD13", "PD14", "PD18",
@@ -997,6 +1011,21 @@
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		csi: camera@1cb0000 {
+			compatible = "allwinner,sun8i-a83t-csi";
+			reg = <0x01cb0000 0x1000>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CSI>,
+				 <&ccu CLK_CSI_SCLK>,
+				 <&ccu CLK_DRAM_CSI>;
+			clock-names = "bus", "mod", "ram";
+			resets = <&ccu RST_BUS_CSI>;
+			status = "disabled";
+
+			csi_in: port {
+			};
+		};
+
 		hdmi: hdmi@1ee0000 {
 			compatible = "allwinner,sun8i-a83t-dw-hdmi";
 			reg = <0x01ee0000 0x10000>;
-- 
2.21.0
