From: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH V4 3/6] ARM: dts: imx6dl: add common compatible name for reused modules
Date: Mon, 13 Jan 2014 19:53:48 +0800
Message-ID: <1389614031-7253-3-git-send-email-b20788@freescale.com>
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
 arch/arm/boot/dts/imx6dl.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6dl.dtsi b/arch/arm/boot/dts/imx6dl.dtsi
index e2ec0fb..0d264b7 100644
--- a/arch/arm/boot/dts/imx6dl.dtsi
+++ b/arch/arm/boot/dts/imx6dl.dtsi
@@ -62,7 +62,7 @@
 
 		aips1: aips-bus@02000000 {
 			iomuxc: iomuxc@020e0000 {
-				compatible = "fsl,imx6dl-iomuxc";
+				compatible = "fsl,imx6dl-iomuxc", "fsl,iomuxc";
 			};
 
 			pxp: pxp@020f0000 {
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
