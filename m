From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 8/8] ARM: dts: sun6i: Add cross pipeline connections between DRCs and TCONs
Date: Fri,  8 Sep 2017 15:50:16 +0800
Message-ID: <20170908075016.18657-9-wens@csie.org>
References: <20170908075016.18657-1-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170908075016.18657-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The TCONs on A31/A31s can select either backend as its input. As there
is no configurable mux in the backend or DRC to redirect their output,
or for the DRC to select an input, the connections are presumably from
the each DRC to each TCON, with the TCON having two input ports, like
the following diagram:

	Backend 0  -------  DRC 0  ------- [0]  TCON 0
				   --   -- [1]
                                     \ /
				      X
				     / \
				   --   -- [0]
	Backend 1  -------  DRC 1  ------- [1]  TCON 1

Add these connection endpoints to the device tree.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun6i-a31.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index 00a4c7614e0a..93209cda28db 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -278,6 +278,11 @@
 						reg = <0>;
 						remote-endpoint = <&drc0_out_tcon0>;
 					};
+
+					tcon0_in_drc1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&drc1_out_tcon0>;
+					};
 				};
 
 				tcon0_out: port@1 {
@@ -311,6 +316,11 @@
 					#size-cells = <0>;
 					reg = <0>;
 
+					tcon1_in_drc0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&drc0_out_tcon1>;
+					};
+
 					tcon1_in_drc1: endpoint@1 {
 						reg = <1>;
 						remote-endpoint = <&drc1_out_tcon1>;
@@ -1079,6 +1089,11 @@
 					#size-cells = <0>;
 					reg = <1>;
 
+					drc1_out_tcon0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon0_in_drc1>;
+					};
+
 					drc1_out_tcon1: endpoint@1 {
 						reg = <1>;
 						remote-endpoint = <&tcon1_in_drc1>;
@@ -1170,6 +1185,11 @@
 						reg = <0>;
 						remote-endpoint = <&tcon0_in_drc0>;
 					};
+
+					drc0_out_tcon1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon1_in_drc0>;
+					};
 				};
 			};
 		};
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
