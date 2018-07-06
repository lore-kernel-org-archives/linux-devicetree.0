From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH 14/17] ARM: dts: sun8i: r40: Add missing
 TCON-TOP - TCON connections
Date: Fri,  6 Jul 2018 19:51:10 +0200
Message-ID: <20180706175113.26698-15-jernej.skrabec@siol.net>
References: <20180706175113.26698-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBJ6Z73MQKGQENCRHQDA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180706175113.26698-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Current R40 is missing some graph connections between TCON TOP and
TCONs.

Add them.

Fixes: 05a43a262d03 ("ARM: dts: sun8i: r40: Add HDMI pipeline")

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 .../boot/dts/sun8i-r40-bananapi-m2-ultra.dts  | 20 ---------
 arch/arm/boot/dts/sun8i-r40.dtsi              | 44 +++++++++++++++++++
 2 files changed, 44 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
index 4f3d583183dc..737cf01b1acd 100644
--- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
+++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
@@ -251,26 +251,6 @@
 	regulator-name = "vcc-wifi";
 };
 
-&tcon_top_hdmi_in_tcon_tv0 {
-	remote-endpoint = <&tcon_tv0_out_tcon_top>;
-};
-
-&tcon_top_mixer0_out_tcon_tv0 {
-	remote-endpoint = <&tcon_tv0_in_tcon_top>;
-};
-
-&tcon_tv0_in {
-	tcon_tv0_in_tcon_top: endpoint {
-		remote-endpoint = <&tcon_top_mixer0_out_tcon_tv0>;
-	};
-};
-
-&tcon_tv0_out {
-	tcon_tv0_out_tcon_top: endpoint {
-		remote-endpoint = <&tcon_top_hdmi_in_tcon_tv0>;
-	};
-};
-
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index 6b4fe8eeee99..e5c7e4804384 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -601,10 +601,12 @@
 
 					tcon_top_mixer0_out_tcon_tv0: endpoint@2 {
 						reg = <2>;
+						remote-endpoint = <&tcon_tv0_in_tcon_top_mixer0>;
 					};
 
 					tcon_top_mixer0_out_tcon_tv1: endpoint@3 {
 						reg = <3>;
+						remote-endpoint = <&tcon_tv1_in_tcon_top_mixer0>;
 					};
 				};
 
@@ -634,10 +636,12 @@
 
 					tcon_top_mixer1_out_tcon_tv0: endpoint@2 {
 						reg = <2>;
+						remote-endpoint = <&tcon_tv0_in_tcon_top_mixer1>;
 					};
 
 					tcon_top_mixer1_out_tcon_tv1: endpoint@3 {
 						reg = <3>;
+						remote-endpoint = <&tcon_tv1_in_tcon_top_mixer1>;
 					};
 				};
 
@@ -648,10 +652,12 @@
 
 					tcon_top_hdmi_in_tcon_tv0: endpoint@0 {
 						reg = <0>;
+						remote-endpoint = <&tcon_tv0_out_tcon_top>;
 					};
 
 					tcon_top_hdmi_in_tcon_tv1: endpoint@1 {
 						reg = <1>;
+						remote-endpoint = <&tcon_tv1_out_tcon_top>;
 					};
 				};
 
@@ -679,11 +685,30 @@
 				#size-cells = <0>;
 
 				tcon_tv0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <0>;
+
+					tcon_tv0_in_tcon_top_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_tv0>;
+					};
+
+					tcon_tv0_in_tcon_top_mixer1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_mixer1_out_tcon_tv0>;
+					};
 				};
 
 				tcon_tv0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <1>;
+
+					tcon_tv0_out_tcon_top: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_hdmi_in_tcon_tv0>;
+					};
 				};
 			};
 		};
@@ -702,11 +727,30 @@
 				#size-cells = <0>;
 
 				tcon_tv1_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <0>;
+
+					tcon_tv1_in_tcon_top_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_tv1>;
+					};
+
+					tcon_tv1_in_tcon_top_mixer1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_mixer1_out_tcon_tv1>;
+					};
 				};
 
 				tcon_tv1_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
 					reg = <1>;
+
+					tcon_tv1_out_tcon_top: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_hdmi_in_tcon_tv1>;
+					};
 				};
 			};
 		};
-- 
2.18.0
