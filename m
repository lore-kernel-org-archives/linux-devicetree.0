From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH] ARM: dts: imx6qdl: move HDMI controller to right location in DT
Date: Wed,  1 Apr 2015 11:26:54 +0200
Message-ID: <1427880414-18503-1-git-send-email-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently the HDMI controller is a child device of the AIPS bus in the
DT which is clearly wrong. Move it to the right location.
This introduces no functional change it just aligns the DT representation
with reality.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl.dtsi | 56 +++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index f74a8ded515f..0482a665125a 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -119,6 +119,34 @@
 			status = "disabled";
 		};
 
+		hdmi: hdmi@0120000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x00120000 0x9000>;
+			interrupts = <0 115 0x04>;
+			gpr = <&gpr>;
+			clocks = <&clks IMX6QDL_CLK_HDMI_IAHB>,
+				 <&clks IMX6QDL_CLK_HDMI_ISFR>;
+			clock-names = "iahb", "isfr";
+			status = "disabled";
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_mux_0: endpoint {
+					remote-endpoint = <&ipu1_di0_hdmi>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hdmi_mux_1: endpoint {
+					remote-endpoint = <&ipu1_di1_hdmi>;
+				};
+			};
+		};
+
 		timer@00a00600 {
 			compatible = "arm,cortex-a9-twd-timer";
 			reg = <0x00a00600 0x20>;
@@ -778,34 +806,6 @@
 				};
 			};
 
-			hdmi: hdmi@0120000 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				reg = <0x00120000 0x9000>;
-				interrupts = <0 115 0x04>;
-				gpr = <&gpr>;
-				clocks = <&clks IMX6QDL_CLK_HDMI_IAHB>,
-					 <&clks IMX6QDL_CLK_HDMI_ISFR>;
-				clock-names = "iahb", "isfr";
-				status = "disabled";
-
-				port@0 {
-					reg = <0>;
-
-					hdmi_mux_0: endpoint {
-						remote-endpoint = <&ipu1_di0_hdmi>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					hdmi_mux_1: endpoint {
-						remote-endpoint = <&ipu1_di1_hdmi>;
-					};
-				};
-			};
-
 			dcic1: dcic@020e4000 {
 				reg = <0x020e4000 0x4000>;
 				interrupts = <0 124 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
