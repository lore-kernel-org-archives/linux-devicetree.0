From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v5 2/4] ARM: sti: stih410-clocks: Identify critical clocks as always-on
Date: Wed,  1 Apr 2015 13:28:22 +0100
Message-ID: <1427891304-20160-3-git-send-email-lee.jones@linaro.org>
References: <1427891304-20160-1-git-send-email-lee.jones@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427891304-20160-1-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Lots of platforms contain clocks which if turned off would prove fatal.
The only way to recover is to restart the board(s).  This driver takes
references to clocks which are required to be always-on.  The common
clk framework will then take references to them.  This way they will
not be turned off during the clk_disabled_unused() procedure.

In this patch we are identifying clocks, which if gated would render
the STiH410 development board unserviceable.

Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/stih410-clock.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/stih410-clock.dtsi b/arch/arm/boot/dts/stih410-clock.dtsi
index 6b5803a..e1dd9b2 100644
--- a/arch/arm/boot/dts/stih410-clock.dtsi
+++ b/arch/arm/boot/dts/stih410-clock.dtsi
@@ -103,6 +103,7 @@
 				clocks = <&clk_sysin>;
 
 				clock-output-names = "clk-s-a0-pll-ofd-0";
+				clock-always-on = <0>; /* clk-s-a0-pll-ofd-0 */
 			};
 
 			clk_s_a0_flexgen: clk-s-a0-flexgen {
@@ -115,6 +116,8 @@
 
 				clock-output-names = "clk-ic-lmi0",
 						     "clk-ic-lmi1";
+
+				clock-always-on = <CLK_IC_LMI0>;
 			};
 		};
 
@@ -142,6 +145,7 @@
 				clocks = <&clk_sysin>;
 
 				clock-output-names = "clk-s-c0-pll0-odf-0";
+				clock-always-on = <0>; /* clk-s-c0-pll0-odf-0 */
 			};
 
 			clk_s_c0_pll1: clk-s-c0-pll1 {
@@ -204,6 +208,12 @@
 						     "clk-clust-hades",
 						     "clk-hwpe-hades",
 						     "clk-fc-hades";
+
+				clock-always-on = <CLK_ICN_CPU>,
+						  <CLK_TX_ICN_DMU>,
+						  <CLK_EXT2F_A9>,
+						  <CLK_ICN_LMI>,
+						  <CLK_ICN_SBC>;
 			};
 		};
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
