From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH] ARM: dts: sun[47]i: Fix display backend 1 output to TCON0 remote endpoint
Date: Thu,  4 Jan 2018 00:31:55 +0800
Message-ID: <20180103163155.13975-1-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

There is a copy-paste error in the display pipeline device tree graph.
The remote endpoint of the display backend 1's output to TCON0 points
to the wrong endpoint. This will result in the driver incorrectly
parsing the relationship of the components.

Reported-by: Andrea Venturi <ennesimamail.av-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Fixes: 0df4cf33a594 ("ARM: dts: sun4i: Add device nodes for display
		      pipelines")
Fixes: 5b92b29bed45 ("ARM: dts: sun7i: Add device nodes for display
		      pipelines")
Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---

This is a late fix for 4.15 that corrects an error in the newly
added display pipeline graph for the A10 and A20.

---
 arch/arm/boot/dts/sun4i-a10.dtsi | 2 +-
 arch/arm/boot/dts/sun7i-a20.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index 5840f5c75c3b..4f2f2eea0755 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -1104,7 +1104,7 @@
 
 					be1_out_tcon0: endpoint@0 {
 						reg = <0>;
-						remote-endpoint = <&tcon1_in_be0>;
+						remote-endpoint = <&tcon0_in_be1>;
 					};
 
 					be1_out_tcon1: endpoint@1 {
diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 59655e42e4b0..bd0cd3204273 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -1354,7 +1354,7 @@
 
 					be1_out_tcon0: endpoint@0 {
 						reg = <0>;
-						remote-endpoint = <&tcon1_in_be0>;
+						remote-endpoint = <&tcon0_in_be1>;
 					};
 
 					be1_out_tcon1: endpoint@1 {
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
