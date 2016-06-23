From: megous@megous.com
Subject: [PATCH 05/14] ARM: dts: sun8i: Add THS node to the sun8i-h3.dtsi
Date: Thu, 23 Jun 2016 21:20:55 +0200
Message-ID: <20160623192104.18720-6-megous@megous.com>
References: <20160623192104.18720-1-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160623192104.18720-1-megous@megous.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dev@linux-sunxi.org
Cc: Ondrej Jirman <megous@megous.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

This patch adds nodes for the THS driver and the THS clock to
the Allwinner sun8i-h3.dtsi file.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 172576d..9938972 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -77,6 +77,14 @@
 		};
 	};
 
+	thermal-zones {
+		cpu_thermal: cpu_thermal {
+			polling-delay-passive = <330>;
+			polling-delay = <1000>;
+			thermal-sensors = <&ths 0>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
@@ -239,6 +247,14 @@
 					     "bus_scr", "bus_ephy", "bus_dbg";
 		};
 
+		ths_clk: clk@01c20074 {
+			#clock-cells = <0>;
+			compatible = "allwinner,sun8i-h3-ths-clk";
+			reg = <0x01c20074 0x4>;
+			clocks = <&osc24M>;
+			clock-output-names = "ths";
+		};
+
 		mmc0_clk: clk@01c20088 {
 			#clock-cells = <1>;
 			compatible = "allwinner,sun4i-a10-mmc-clk";
@@ -394,6 +410,10 @@
 			reg = <0x01c14000 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			ths_calibration: calib@234 {
+				reg = <0x234 0x4>;
+			};
 		};
 
 		usbphy: phy@01c19400 {
@@ -581,6 +601,19 @@
 			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		ths: ths@01c25000 {
+			#thermal-sensor-cells = <0>;
+			compatible = "allwinner,sun8i-h3-ths";
+			reg = <0x01c25000 0x400>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&apb1_rst 8>;
+			reset-names = "ahb";
+			clocks = <&bus_gates 72>, <&ths_clk>;
+			clock-names = "ahb", "ths";
+			nvmem-cells = <&ths_calibration>;
+			nvmem-cell-names = "calibration";
+		};
+
 		uart0: serial@01c28000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28000 0x400>;
-- 
2.9.0
