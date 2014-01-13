From: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH V4 5/6] ARM: dts: imx6sl: add common compatible name for reused modules
Date: Mon, 13 Jan 2014 19:53:50 +0800
Message-ID: <1389614031-7253-5-git-send-email-b20788@freescale.com>
References: <1389614031-7253-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389614031-7253-1-git-send-email-b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

As some modules are common for all i.MX6 SOCs, to avoid
checking cpu type for drivers that needs them, just add a
new compatible name for them.

Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6sl.dtsi |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index a5ef3c3..01f65a2 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -564,7 +564,7 @@
 			};
 
 			src: src@020d8000 {
-				compatible = "fsl,imx6sl-src", "fsl,imx51-src";
+				compatible = "fsl,imx6sl-src", "fsl,imx51-src", "fsl,src";
 				reg = <0x020d8000 0x4000>;
 				interrupts = <0 91 IRQ_TYPE_LEVEL_HIGH>,
 					     <0 96 IRQ_TYPE_LEVEL_HIGH>;
@@ -572,7 +572,7 @@
 			};
 
 			gpc: gpc@020dc000 {
-				compatible = "fsl,imx6sl-gpc", "fsl,imx6q-gpc";
+				compatible = "fsl,imx6sl-gpc", "fsl,imx6q-gpc", "fsl,gpc";
 				reg = <0x020dc000 0x4000>;
 				interrupts = <0 89 IRQ_TYPE_LEVEL_HIGH>;
 			};
@@ -584,7 +584,7 @@
 			};
 
 			iomuxc: iomuxc@020e0000 {
-				compatible = "fsl,imx6sl-iomuxc";
+				compatible = "fsl,imx6sl-iomuxc", "fsl,iomuxc";
 				reg = <0x020e0000 0x4000>;
 			};
 
@@ -763,7 +763,7 @@
 			};
 
 			mmdc: mmdc@021b0000 {
-				compatible = "fsl,imx6sl-mmdc", "fsl,imx6q-mmdc";
+				compatible = "fsl,imx6sl-mmdc", "fsl,imx6q-mmdc", "fsl,mmdc";
 				reg = <0x021b0000 0x4000>;
 			};
 
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
