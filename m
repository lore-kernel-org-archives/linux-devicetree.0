From: Andre Przywara <andre.przywara@arm.com>
Subject: [RFC PATCH 4/4] DT: Allwinner H3: fix PLL8 clock
Date: Fri, 12 Feb 2016 18:00:00 +0000
Message-ID: <1455300000-18723-5-git-send-email-andre.przywara@arm.com>
References: <1455300000-18723-1-git-send-email-andre.przywara@arm.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1455300000-18723-1-git-send-email-andre.przywara@arm.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>, Michael Turquette <mturquette@baylibre.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org, Rob Herring <rob.herring@linaro.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

With the new generic a31-pll clock driver in place, we can use it to
properly describe the PLL8 clock.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 1524130e..1b2eb20 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -137,11 +137,11 @@
 			clock-output-names = "pll6d2";
 		};
 
-		/* dummy clock until pll6 can be reused */
-		pll8: pll8_clk {
+		pll8: clk@01c20044 {
 			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <1>;
+			compatible = "allwinner,sun6i-a31-pll-clk";
+			reg = <0x01c20044 0x4>;
+			clocks = <&osc24M>;
 			clock-output-names = "pll8";
 		};
 
-- 
2.6.4

