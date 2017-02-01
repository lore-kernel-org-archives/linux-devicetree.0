From: Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
Subject: [PATCH v2] ARM: dts: i.MX25: add AIPS control registers
Date: Wed,  1 Feb 2017 23:16:18 +0100
Message-ID: <1485987378-27784-1-git-send-email-martin@kaiser.cx>
References: <1485890402-22974-1-git-send-email-martin@kaiser.cx>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485890402-22974-1-git-send-email-martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The i.MX25 contains two AHB to IP bridges (AIPS), each of which has a set of
control registers. Add the memory regions for the control registers to
the Device Tree.

Signed-off-by: Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
---
v2:
   removed the "fsl,imx53-aipstz" property as per Sascha's request

 arch/arm/boot/dts/imx25.dtsi |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/imx25.dtsi b/arch/arm/boot/dts/imx25.dtsi
index e0ba550..1914858 100644
--- a/arch/arm/boot/dts/imx25.dtsi
+++ b/arch/arm/boot/dts/imx25.dtsi
@@ -93,6 +93,11 @@
 			reg = <0x43f00000 0x100000>;
 			ranges;
 
+			aips1: bridge@43f00000 {
+				compatible = "fsl,imx25-aips";
+				reg = <0x43f00000 0x60>;
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
+				reg = <0x53f00000 0x60>;
+			};
+
 			clks: ccm@53f80000 {
 				compatible = "fsl,imx25-ccm";
 				reg = <0x53f80000 0x4000>;
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
