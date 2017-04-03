From: Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
Subject: [PATCH 1/2 v4] ARM: dts: i.MX25: add AIPS control registers
Date: Mon,  3 Apr 2017 21:47:04 +0200
Message-ID: <1491248825-23041-1-git-send-email-martin@kaiser.cx>
References: <1485890402-22974-1-git-send-email-martin@kaiser.cx>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485890402-22974-1-git-send-email-martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The i.MX25 contains two AHB to IP bridges (AIPS), each of which has a set of
control registers. Add the memory regions for the control registers to
the Device Tree.

Signed-off-by: Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
Reviewed-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
v4:
   rebased against latest linux-next
   re-sending both patches, it seems they got lost along the way

v3:
   fixed the size of the memory regions, both are 16KBytes long

v2:
   removed the "fsl,imx53-aipstz" property as per Sascha's request

 arch/arm/boot/dts/imx25.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/imx25.dtsi b/arch/arm/boot/dts/imx25.dtsi
index 89c8f8f..0cdf333 100644
--- a/arch/arm/boot/dts/imx25.dtsi
+++ b/arch/arm/boot/dts/imx25.dtsi
@@ -93,6 +93,11 @@
 			reg = <0x43f00000 0x100000>;
 			ranges;
 
+			aips1: bridge@43f00000 {
+				compatible = "fsl,imx25-aips";
+				reg = <0x43f00000 0x4000>;
+			};
+
 			i2c1: i2c@43f80000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -342,6 +347,11 @@
 			reg = <0x53f00000 0x100000>;
 			ranges;
 
+			aips2: bridge@53f00000 {
+				compatible = "fsl,imx25-aips";
+				reg = <0x53f00000 0x4000>;
+			};
+
 			clks: ccm@53f80000 {
 				compatible = "fsl,imx25-ccm";
 				reg = <0x53f80000 0x4000>;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
