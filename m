From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH] ARM: dts: r7s72100: add power-domains to sdhi
Date: Thu,  9 Feb 2017 08:38:03 -0500
Message-ID: <20170209133803.21539-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Fixes: 66474697923c ("ARM: dts: r7s72100: add sdhi to device tree")
---
 arch/arm/boot/dts/r7s72100.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 614ba79..0b9677f 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -494,6 +494,7 @@
 		clocks = <&mstp12_clks R7S72100_CLK_SDHI00>,
 			 <&mstp12_clks R7S72100_CLK_SDHI01>;
 		clock-names = "core", "cd";
+		power-domains = <&cpg_clocks>;
 		cap-sd-highspeed;
 		cap-sdio-irq;
 		status = "disabled";
@@ -509,6 +510,7 @@
 		clocks = <&mstp12_clks R7S72100_CLK_SDHI10>,
 			 <&mstp12_clks R7S72100_CLK_SDHI11>;
 		clock-names = "core", "cd";
+		power-domains = <&cpg_clocks>;
 		cap-sd-highspeed;
 		cap-sdio-irq;
 		status = "disabled";
-- 
2.10.1
