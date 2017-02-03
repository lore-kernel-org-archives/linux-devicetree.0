From: Ken Lin <yungching0725-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dts: imx6q-bx50v3/imx6q-b450v3/imx6q-b650v3: change pca953x GPIO default settings
Date: Fri,  3 Feb 2017 09:21:14 +0800
Message-ID: <20170203012114.20411-1-ken.lin@advantech.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ken.lin-ELdSlb/RfAS1Z/+hSey0Gg@public.gmane.org, akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org, peter.stretz-ELdSlb/RfAS1Z/+hSey0Gg@public.gmane.org, peter.chiang-ELdSlb/RfAS1Z/+hSey0Gg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Leave pca953x P06,P07 pins on b850v3 platform and P06 pin on b450v3/b650v3 unconfigured
in the kernel space since they could be configured as DP1_RST and DP2_RST by the applications
for the DP FW update support

Signed-off-by: Ken Lin <ken.lin-ELdSlb/RfAS1Z/+hSey0Gg@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-b450v3.dts  |  7 +++++++
 arch/arm/boot/dts/imx6q-b650v3.dts  |  7 +++++++
 arch/arm/boot/dts/imx6q-bx50v3.dtsi | 14 --------------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q-b450v3.dts b/arch/arm/boot/dts/imx6q-b450v3.dts
index 78bfc1a307d6..04779816d3d1 100644
--- a/arch/arm/boot/dts/imx6q-b450v3.dts
+++ b/arch/arm/boot/dts/imx6q-b450v3.dts
@@ -104,4 +104,11 @@
 		output-low;
 		line-name = "PCA9539-P05";
 	};
+
+        P07 {
+                gpio-hog;
+                gpios = <7 0>;
+                output-low;
+                line-name = "PCA9539-P07";
+        };
 };
diff --git a/arch/arm/boot/dts/imx6q-b650v3.dts b/arch/arm/boot/dts/imx6q-b650v3.dts
index 1dcaee23ed9c..9ee8c81c2b80 100644
--- a/arch/arm/boot/dts/imx6q-b650v3.dts
+++ b/arch/arm/boot/dts/imx6q-b650v3.dts
@@ -97,6 +97,13 @@
 		output-low;
 		line-name = "PCA9539-P05";
 	};
+
+        P07 {
+                gpio-hog;
+                gpios = <7 0>;
+                output-low;
+                line-name = "PCA9539-P07";
+        };
 };
 
 &usbphy1 {
diff --git a/arch/arm/boot/dts/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
index e4a415fd899b..f99e6efda3e2 100644
--- a/arch/arm/boot/dts/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
@@ -184,20 +184,6 @@
 				interrupt-parent = <&gpio2>;
 				interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 
-				P06 {
-					gpio-hog;
-					gpios = <6 0>;
-					output-low;
-					line-name = "PCA9539-P06";
-				};
-
-				P07 {
-					gpio-hog;
-					gpios = <7 0>;
-					output-low;
-					line-name = "PCA9539-P07";
-				};
-
 				P10 {
 					gpio-hog;
 					gpios = <8 0>;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
