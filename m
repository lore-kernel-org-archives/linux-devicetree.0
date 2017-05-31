From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 1/6] dt-bindings: clock: sunxi-ccu: Add pll-periph to PRCM's needed clocks
Date: Wed, 31 May 2017 15:58:19 +0800
Message-ID: <20170531075824.657-2-wens@csie.org>
References: <20170531075824.657-1-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170531075824.657-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The AR100 clock in the PRCM has parents, one of which is pll-periph from
the main CCU.

Add it to the list of required clocks for the PRCM CCU.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
index 095a5807d874..966345972d83 100644
--- a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
@@ -25,7 +25,8 @@ Required properties :
 - #clock-cells : must contain 1
 - #reset-cells : must contain 1
 
-For the PRCM CCUs on A83T/H3/A64, one more clock is needed:
+For the PRCM CCUs on A83T/H3/A64, two more clock is needed:
+- "pll-periph": the SoC's peripheral PLL from the main CCU
 - "iosc": the SoC's internal frequency oscillator
 
 Example for generic CCU:
@@ -42,8 +43,8 @@ Example for PRCM CCU:
 r_ccu: clock@01f01400 {
 	compatible = "allwinner,sun50i-a64-r-ccu";
 	reg = <0x01f01400 0x100>;
-	clocks = <&osc24M>, <&osc32k>, <&iosc>;
-	clock-names = "hosc", "losc", "iosc";
+	clocks = <&osc24M>, <&osc32k>, <&iosc>, <&ccu CLK_PLL_PERIPH0>;
+	clock-names = "hosc", "losc", "iosc", "pll-periph";
 	#clock-cells = <1>;
 	#reset-cells = <1>;
 };
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
