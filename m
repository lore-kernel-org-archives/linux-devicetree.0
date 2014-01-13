From: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH V4 1/6] ARM: dts: imx6q: add common compatible name for reused modules
Date: Mon, 13 Jan 2014 19:53:46 +0800
Message-ID: <1389614031-7253-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

As some modules are common for all i.MX6 SOCs, to avoid
checking cpu type for drivers that needs them, just add a
new compatible name for them.

Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6q.dtsi   |    2 +-
 arch/arm/boot/dts/imx6qdl.dtsi |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index 021e0cb..5bc79c7 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -91,7 +91,7 @@
 			};
 
 			iomuxc: iomuxc@020e0000 {
-				compatible = "fsl,imx6q-iomuxc";
+				compatible = "fsl,imx6q-iomuxc", "fsl,iomuxc";
 
 				ipu2 {
 					pinctrl_ipu2_1: ipu2grp-1 {
diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 8a86502..cb9129b 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -622,7 +622,7 @@
 			};
 
 			src: src@020d8000 {
-				compatible = "fsl,imx6q-src", "fsl,imx51-src";
+				compatible = "fsl,imx6q-src", "fsl,imx51-src", "fsl,src";
 				reg = <0x020d8000 0x4000>;
 				interrupts = <0 91 IRQ_TYPE_LEVEL_HIGH>,
 					     <0 96 IRQ_TYPE_LEVEL_HIGH>;
@@ -630,7 +630,7 @@
 			};
 
 			gpc: gpc@020dc000 {
-				compatible = "fsl,imx6q-gpc";
+				compatible = "fsl,imx6q-gpc", "fsl,gpc";
 				reg = <0x020dc000 0x4000>;
 				interrupts = <0 89 IRQ_TYPE_LEVEL_HIGH>,
 					     <0 90 IRQ_TYPE_LEVEL_HIGH>;
@@ -840,7 +840,7 @@
 			};
 
 			mmdc0: mmdc@021b0000 { /* MMDC0 */
-				compatible = "fsl,imx6q-mmdc";
+				compatible = "fsl,imx6q-mmdc", "fsl,mmdc";
 				reg = <0x021b0000 0x4000>;
 			};
 
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
