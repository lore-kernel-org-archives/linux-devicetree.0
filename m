From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH net-next v2 12/15] ARM: dts: sun8i: r40: Add device node and
 RGMII pinmux node for GMAC
Date: Wed,  2 May 2018 00:12:24 +0800
Message-ID: <20180501161227.2110-13-wens@csie.org>
References: <20180501161227.2110-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180501161227.2110-1-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

The R40 SoC has a GMAC (gigabit capable Ethernet controller). Add a
device node for it. The only publicly available board for this SoC
uses an RGMII PHY. Add a pinmux node for it as well.

Since this SoC also has an old 10/100 Mbps EMAC, which also has an
MDIO bus controller, the MDIO bus for the GMAC is labeled "gmac_mdio".

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun8i-r40.dtsi | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index 173dcc1652d2..bd97ca3dc2fa 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -265,6 +265,19 @@
 			#interrupt-cells = <3>;
 			#gpio-cells = <3>;
 
+			gmac_rgmii_pins: gmac-rgmii-pins {
+				pins = "PA0", "PA1", "PA2", "PA3",
+				       "PA4", "PA5", "PA6", "PA7",
+				       "PA8", "PA10", "PA11", "PA12",
+				       "PA13", "PA15", "PA16";
+				function = "gmac";
+				/*
+				 * data lines in RGMII mode use DDR mode
+				 * and need a higher signal drive strength
+				 */
+				drive-strength = <40>;
+			};
+
 			i2c0_pins: i2c0-pins {
 				pins = "PB0", "PB1";
 				function = "i2c0";
@@ -451,6 +464,27 @@
 			#size-cells = <0>;
 		};
 
+		gmac: ethernet@1c50000 {
+			compatible = "allwinner,sun8i-r40-gmac";
+			syscon = <&ccu>;
+			reg = <0x01c50000 0x10000>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			resets = <&ccu RST_BUS_GMAC>;
+			reset-names = "stmmaceth";
+			clocks = <&ccu CLK_BUS_GMAC>;
+			clock-names = "stmmaceth";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			gmac_mdio: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		gic: interrupt-controller@1c81000 {
 			compatible = "arm,gic-400";
 			reg = <0x01c81000 0x1000>,
-- 
2.17.0
