From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH] ARM: dts: r7s72100: fix ethernet clock parent
Date: Thu, 30 Mar 2017 14:16:09 -0700
Message-ID: <20170330211609.598-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Technically, the Ethernet block is run off the 133MHz Bus (B) clock, not
the 33MHz Peripheral 0 (P0) clock.

Fixes: 969244f9c720 ("ARM: dts: r7s72100: add ethernet clock to device tree")
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s72100.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 34994afa9d15..c199c4eea73e 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -121,7 +121,7 @@
 			#clock-cells = <1>;
 			compatible = "renesas,r7s72100-mstp-clocks", "renesas,cpg-mstp-clocks";
 			reg = <0xfcfe0430 4>;
-			clocks = <&p0_clk>;
+			clocks = <&b_clk>;
 			clock-indices = <R7S72100_CLK_ETHER>;
 			clock-output-names = "ether";
 		};
-- 
2.11.0
