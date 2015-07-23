From: Zidan Wang <zidan.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] ARM: dts: imx6sx: fix sdma peripheral type for SAI
Date: Thu, 23 Jul 2015 11:38:14 +0800
Message-ID: <9e7fea0435f92f7c3301544591806b348c495a32.1437622392.git.zidan.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zidan Wang <zidan.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SAI sdma peripheral type is IMX_DMATYPE_SAI, which represent for 24.

Signed-off-by: Zidan Wang <zidan.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6sx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index 708175d..8ef8fd2 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -924,7 +924,7 @@
 					 <&clks 0>, <&clks 0>;
 				clock-names = "bus", "mclk1", "mclk2", "mclk3";
 				dma-names = "rx", "tx";
-				dmas = <&sdma 31 23 0>, <&sdma 32 23 0>;
+				dmas = <&sdma 31 24 0>, <&sdma 32 24 0>;
 				dma-source = <&gpr 0 15 0 16>;
 				status = "disabled";
 			};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
