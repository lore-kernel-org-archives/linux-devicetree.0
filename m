From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 2/2] ARM: dts: r7s72100: add usb clocks to device tree
Date: Fri, 28 Apr 2017 12:01:34 -0700
Message-ID: <20170428190134.63895-2-chris.brandt@renesas.com>
References: <20170428190134.63895-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170428190134.63895-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

This adds the USB0 and USB1 clocks to the device tree.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
* moved bit defines to a separate patch
* added Reviewed-by
---
 arch/arm/boot/dts/r7s72100.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index fb54cb5d3fad..4ed12a4d9d51 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -144,9 +144,9 @@
 			#clock-cells = <1>;
 			compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
 			reg = <0xfcfe0430 4>;
-			clocks = <&b_clk>;
-			clock-indices = <R7S72100_CLK_ETHER>;
-			clock-output-names = "ether";
+			clocks = <&b_clk>, <&p1_clk>, <&p1_clk>;
+			clock-indices = <R7S72100_CLK_ETHER R7S72100_CLK_USB0 R7S72100_CLK_USB1>;
+			clock-output-names = "ether", "usb0", "usb1";
 		};
 
 		mstp8_clks: mstp8_clks@fcfe0434 {
-- 
2.11.0
