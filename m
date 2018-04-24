From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [RFC 09/13] arm64: dts: allwinner: a64: Add HDMI support
Date: Tue, 24 Apr 2018 19:04:21 +0530
Message-ID: <20180424133425.24291-10-jagan@amarulasolutions.com>
References: <20180424133425.24291-1-jagan@amarulasolutions.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180424133425.24291-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

HDMI on Allwinner A64 has similar behavior like H3/H5, so
reuse the same dts node details for A64.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 28 +++++++++++++++++++++++++++
 include/dt-bindings/clock/sun50i-a64-ccu.h    |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index b8734319dc77..aa73f1ce1ab2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -705,6 +705,34 @@
 			#interrupt-cells = <3>;
 		};
 
+		hdmi: hdmi@1ee0000 {
+			compatible = "allwinner,sun50i-a64-dw-hdmi",
+				     "allwinner,sun8i-a83t-dw-hdmi";
+			reg = <0x01ee0000 0x10000>;
+			reg-io-width = <1>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_DDC>,
+				 <&ccu CLK_HDMI>;
+			clock-names = "iahb", "isfr", "tmds";
+			resets = <&ccu RST_BUS_HDMI1>;
+			reset-names = "ctrl";
+			phys = <&hdmi_phy>;
+			phy-names = "hdmi-phy";
+			status = "disabled";
+		};
+
+		hdmi_phy: hdmi-phy@1ef0000 {
+			compatible = "allwinner,sun50i-a64-hdmi-phy",
+				     "allwinner,sun8i-h3-hdmi-phy";
+			reg = <0x01ef0000 0x10000>;
+			clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_DDC>,
+				 <&ccu CLK_PLL_VIDEO0>;
+			clock-names = "bus", "mod", "pll-0";
+			resets = <&ccu RST_BUS_HDMI0>;
+			reset-names = "phy";
+			#phy-cells = <0>;
+		};
+
 		rtc: rtc@1f00000 {
 			compatible = "allwinner,sun6i-a31-rtc";
 			reg = <0x01f00000 0x54>;
diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h b/include/dt-bindings/clock/sun50i-a64-ccu.h
index d66432c6e675..a054ff665d6e 100644
--- a/include/dt-bindings/clock/sun50i-a64-ccu.h
+++ b/include/dt-bindings/clock/sun50i-a64-ccu.h
@@ -43,6 +43,8 @@
 #ifndef _DT_BINDINGS_CLK_SUN50I_A64_H_
 #define _DT_BINDINGS_CLK_SUN50I_A64_H_
 
+#define CLK_PLL_VIDEO0		7
+
 #define CLK_PLL_PERIPH0		11
 
 #define CLK_BUS_MIPI_DSI	28
-- 
2.14.3
