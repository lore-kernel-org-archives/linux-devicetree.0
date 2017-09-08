From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 1/8] ARM: dts: sun6i: Fix endpoint IDs in second display pipeline
Date: Fri,  8 Sep 2017 15:50:09 +0800
Message-ID: <20170908075016.18657-2-wens@csie.org>
References: <20170908075016.18657-1-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170908075016.18657-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

When the second display pipeline device nodes for the A31/A31s were
added, it was not known that the TCONs could (through either DRCs)
select either backend as their input. Thus in the endpoints connecting
these components together, the endpoint IDs were set to 0, while in
fact they should have been set to 1.

Fixes: 9a26882a7378 ("ARM: dts: sun6i: Add second display pipeline device
		      nodes")
Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun6i-a31.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index f3d74dc5b292..00a4c7614e0a 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -311,8 +311,8 @@
 					#size-cells = <0>;
 					reg = <0>;
 
-					tcon1_in_drc1: endpoint@0 {
-						reg = <0>;
+					tcon1_in_drc1: endpoint@1 {
+						reg = <1>;
 						remote-endpoint = <&drc1_out_tcon1>;
 					};
 				};
@@ -1038,8 +1038,8 @@
 					#size-cells = <0>;
 					reg = <1>;
 
-					be1_out_drc1: endpoint@0 {
-						reg = <0>;
+					be1_out_drc1: endpoint@1 {
+						reg = <1>;
 						remote-endpoint = <&drc1_in_be1>;
 					};
 				};
@@ -1068,8 +1068,8 @@
 					#size-cells = <0>;
 					reg = <0>;
 
-					drc1_in_be1: endpoint@0 {
-						reg = <0>;
+					drc1_in_be1: endpoint@1 {
+						reg = <1>;
 						remote-endpoint = <&be1_out_drc1>;
 					};
 				};
@@ -1079,8 +1079,8 @@
 					#size-cells = <0>;
 					reg = <1>;
 
-					drc1_out_tcon1: endpoint@0 {
-						reg = <0>;
+					drc1_out_tcon1: endpoint@1 {
+						reg = <1>;
 						remote-endpoint = <&tcon1_in_drc1>;
 					};
 				};
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
