From: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Subject: [PATCH v2 08/14] ARM: dts: sun8i: Add thermal sensor
 node to the sun8i-h3.dtsi
Date: Sat, 25 Jun 2016 05:45:05 +0200
Message-ID: <20160625034511.7966-9-megous@megous.com>
References: <20160625034511.7966-1-megous@megous.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDXLF6FR5INBBU74W65QKGQE4T3RNWY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160625034511.7966-1-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>

This patch adds nodes for the thermal sensor driver and
the THS clock to the Allwinner sun8i-h3.dtsi file.

Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index b3247f4..d3c29cc 100644
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
@@ -574,6 +590,18 @@
 			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		ths: ths@01c25000 {
+			#thermal-sensor-cells = <0>;
+			compatible = "allwinner,sun8i-h3-ths";
+			reg = <0x01c25000 0x400>,
+			      <0x01c14234 0x4>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&apb1_rst 8>;
+			reset-names = "ahb";
+			clocks = <&bus_gates 72>, <&ths_clk>;
+			clock-names = "ahb", "ths";
+		};
+
 		uart0: serial@01c28000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28000 0x400>;
-- 
2.9.0
