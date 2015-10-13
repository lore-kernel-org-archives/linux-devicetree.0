From: Michael Opdenacker <michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] ARM: at91/dt: fix "disabled" property on at91rm9200
Date: Tue, 13 Oct 2015 13:24:24 +0200
Message-ID: <1444735464-5447-1-git-send-email-michael.opdenacker@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Opdenacker <michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fix instances of "disable" instead of "disabled"
in the at91rm9200 dtsi.

Signed-off-by: Michael Opdenacker <michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/at91rm9200.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/at91rm9200.dtsi b/arch/arm/boot/dts/at91rm9200.dtsi
index 60edd8baebb8..6587cd59a586 100644
--- a/arch/arm/boot/dts/at91rm9200.dtsi
+++ b/arch/arm/boot/dts/at91rm9200.dtsi
@@ -426,7 +426,7 @@
 				pinctrl-0 = <&pinctrl_ssc0_tx &pinctrl_ssc0_rx>;
 				clocks = <&ssc0_clk>;
 				clock-names = "pclk";
-				status = "disable";
+				status = "disabled";
 			};
 
 			ssc1: ssc@fffd4000 {
@@ -437,7 +437,7 @@
 				pinctrl-0 = <&pinctrl_ssc1_tx &pinctrl_ssc1_rx>;
 				clocks = <&ssc1_clk>;
 				clock-names = "pclk";
-				status = "disable";
+				status = "disabled";
 			};
 
 			ssc2: ssc@fffd8000 {
@@ -448,7 +448,7 @@
 				pinctrl-0 = <&pinctrl_ssc2_tx &pinctrl_ssc2_rx>;
 				clocks = <&ssc2_clk>;
 				clock-names = "pclk";
-				status = "disable";
+				status = "disabled";
 			};
 
 			macb0: ethernet@fffbc000 {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
