From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 4/4] ARM: socfpga: dts: fix s2f_* clock name
Date: Wed,  2 Oct 2013 09:35:33 +0200
Message-ID: <1380699333-558-5-git-send-email-s.trumtrar@pengutronix.de>
References: <1380699333-558-1-git-send-email-s.trumtrar@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380699333-558-1-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The s2f_* clocks are called h2f_* in the datasheets.
Rename them accordingly in the socfpga.dtsi.

Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/socfpga.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 587096e..e245924 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -147,7 +147,7 @@
 							reg = <0x58>;
 						};
 
-						cfg_s2f_usr0_clk: cfg_s2f_usr0_clk {
+						cfg_h2f_usr0_clk: cfg_h2f_usr0_clk {
 							#clock-cells = <0>;
 							compatible = "altr,socfpga-perip-clk";
 							clocks = <&main_pll>;
@@ -198,7 +198,7 @@
 							reg = <0x98>;
 						};
 
-						s2f_usr1_clk: s2f_usr1_clk {
+						h2f_usr1_clk: h2f_usr1_clk {
 							#clock-cells = <0>;
 							compatible = "altr,socfpga-perip-clk";
 							clocks = <&periph_pll>;
@@ -235,7 +235,7 @@
 							reg = <0xD0>;
 						};
 
-						s2f_usr2_clk: s2f_usr2_clk {
+						h2f_usr2_clk: h2f_usr2_clk {
 							#clock-cells = <0>;
 							compatible = "altr,socfpga-perip-clk";
 							clocks = <&sdram_pll>;
@@ -335,14 +335,14 @@
 					cfg_clk: cfg_clk {
 						#clock-cells = <0>;
 						compatible = "altr,socfpga-gate-clk";
-						clocks = <&cfg_s2f_usr0_clk>;
+						clocks = <&cfg_h2f_usr0_clk>;
 						clk-gate = <0x60 8>;
 					};
 
-					s2f_user0_clk: s2f_user0_clk {
+					h2f_user0_clk: h2f_user0_clk {
 						#clock-cells = <0>;
 						compatible = "altr,socfpga-gate-clk";
-						clocks = <&cfg_s2f_usr0_clk>;
+						clocks = <&cfg_h2f_usr0_clk>;
 						clk-gate = <0x60 9>;
 					};
 
@@ -400,10 +400,10 @@
 						div-reg = <0xa8 0 24>;
 					};
 
-					s2f_user1_clk: s2f_user1_clk {
+					h2f_user1_clk: h2f_user1_clk {
 						#clock-cells = <0>;
 						compatible = "altr,socfpga-gate-clk";
-						clocks = <&s2f_usr1_clk>;
+						clocks = <&h2f_usr1_clk>;
 						clk-gate = <0xa0 7>;
 					};
 
-- 
1.8.4.rc3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
