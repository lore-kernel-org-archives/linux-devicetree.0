From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 5/7] ARM: dts: r7s72100: add rtc to device tree
Date: Wed, 29 Mar 2017 10:30:33 -0700
Message-ID: <20170329173035.67477-6-chris.brandt@renesas.com>
References: <20170329173035.67477-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170329173035.67477-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: rtc-linux@googlegroups.com, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Add the realtime clock device node.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
* added interrupt-names
* added clock counting sources
* added clock-names "fck", "rtc_x1", "rtc_x3", "extal"
---
 arch/arm/boot/dts/r7s72100.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 632a6a481be8..f74a8ec385b6 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -652,4 +652,18 @@
 		power-domains = <&cpg_clocks>;
 		status = "disabled";
 	};
+
+	rtc: rtc@fcff1000 {
+		compatible = "renesas,r7s72100-rtc", "renesas,sh-rtc";
+		reg = <0xfcff1000 0x2e>;
+		interrupts = <GIC_SPI 276 IRQ_TYPE_EDGE_RISING
+			      GIC_SPI 277 IRQ_TYPE_EDGE_RISING
+			      GIC_SPI 278 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "alarm", "period", "carry";
+		clocks = <&mstp6_clks R7S72100_CLK_RTC>, <&rtc_x1_clk>,
+			 <&rtc_x3_clk>, <&extal_clk>;
+		clock-names = "fck", "rtc_x1", "rtc_x3", "extal";
+		power-domains = <&cpg_clocks>;
+		status = "disabled";
+	};
 };
-- 
2.11.0
