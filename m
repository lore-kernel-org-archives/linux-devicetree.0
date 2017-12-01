From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 07/12] ARM: dts: imx6qdl-aristainetos: Move display node out of 'soc'
Date: Fri,  1 Dec 2017 17:24:40 -0200
Message-ID: <1512156285-18451-7-git-send-email-festevam@gmail.com>
References: <1512156285-18451-1-git-send-email-festevam@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512156285-18451-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

Move disp0 node from soc node to root node.

disp0 node does not have any register properties and thus
shouldn't be placed on the bus.

This fixes the following build warnings with W=1:

arch/arm/boot/dts/imx6dl-aristainetos_4.dtb: Warning (simple_bus_reg): Node /soc/disp0 missing or empty reg/ranges property

Cc: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm/boot/dts/imx6dl-aristainetos_4.dts | 50 ++++++++++++++---------------
 arch/arm/boot/dts/imx6dl-aristainetos_7.dts | 48 +++++++++++++--------------
 2 files changed, 47 insertions(+), 51 deletions(-)

diff --git a/arch/arm/boot/dts/imx6dl-aristainetos_4.dts b/arch/arm/boot/dts/imx6dl-aristainetos_4.dts
index cc418ce..3c9f4af 100644
--- a/arch/arm/boot/dts/imx6dl-aristainetos_4.dts
+++ b/arch/arm/boot/dts/imx6dl-aristainetos_4.dts
@@ -31,35 +31,33 @@
 		reg = <0x10000000 0x40000000>;
 	};
 
-	soc {
-		display0: disp0 {
-			compatible = "fsl,imx-parallel-display";
-			interface-pix-fmt = "rgb24";
-			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_ipu_disp>;
-			status = "okay";
+	display0: disp0 {
+		compatible = "fsl,imx-parallel-display";
+		interface-pix-fmt = "rgb24";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ipu_disp>;
+		status = "okay";
 
-			display-timings {
-				480x800p60 {
-					native-mode;
-					clock-frequency = <30000000>;
-					hactive = <480>;
-					vactive = <800>;
-					hfront-porch = <59>;
-					hback-porch = <10>;
-					hsync-len = <10>;
-					vback-porch = <15>;
-					vfront-porch = <15>;
-					vsync-len = <15>;
-					hsync-active = <1>;
-					vsync-active = <1>;
-				};
+		display-timings {
+			480x800p60 {
+				native-mode;
+				clock-frequency = <30000000>;
+				hactive = <480>;
+				vactive = <800>;
+				hfront-porch = <59>;
+				hback-porch = <10>;
+				hsync-len = <10>;
+				vback-porch = <15>;
+				vfront-porch = <15>;
+				vsync-len = <15>;
+				hsync-active = <1>;
+				vsync-active = <1>;
 			};
+		};
 
-			port {
-				display0_in: endpoint {
-					remote-endpoint = <&ipu1_di0_disp0>;
-				};
+		port {
+			display0_in: endpoint {
+				remote-endpoint = <&ipu1_di0_disp0>;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/imx6dl-aristainetos_7.dts b/arch/arm/boot/dts/imx6dl-aristainetos_7.dts
index 126ff96..96cd835 100644
--- a/arch/arm/boot/dts/imx6dl-aristainetos_7.dts
+++ b/arch/arm/boot/dts/imx6dl-aristainetos_7.dts
@@ -20,34 +20,32 @@
 		reg = <0x10000000 0x40000000>;
 	};
 
-	soc {
-		display0: disp0 {
-			compatible = "fsl,imx-parallel-display";
-			interface-pix-fmt = "rgb24";
-			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_ipu_disp>;
-			status = "okay";
+	display0: disp0 {
+		compatible = "fsl,imx-parallel-display";
+		interface-pix-fmt = "rgb24";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ipu_disp>;
+		status = "okay";
 
-			display-timings {
-				800x480p60 {
-					native-mode;
-					clock-frequency = <33246000>;
-					hactive = <800>;
-					vactive = <480>;
-					hfront-porch = <88>;
-					hback-porch = <88>;
-					hsync-len = <80>;
-					vback-porch = <10>;
-					vfront-porch = <10>;
-					vsync-len = <25>;
-					vsync-active = <1>;
-				};
+		display-timings {
+			800x480p60 {
+				native-mode;
+				clock-frequency = <33246000>;
+				hactive = <800>;
+				vactive = <480>;
+				hfront-porch = <88>;
+				hback-porch = <88>;
+				hsync-len = <80>;
+				vback-porch = <10>;
+				vfront-porch = <10>;
+				vsync-len = <25>;
+				vsync-active = <1>;
 			};
+		};
 
-			port {
-				display0_in: endpoint {
-					remote-endpoint = <&ipu1_di0_disp0>;
-				};
+		port {
+			display0_in: endpoint {
+				remote-endpoint = <&ipu1_di0_disp0>;
 			};
 		};
 	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
