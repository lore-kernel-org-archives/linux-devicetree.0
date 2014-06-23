From: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] ARM: dts: imx6sx: iomux-gpr syscon is compatible to imx6q
Date: Mon, 23 Jun 2014 14:04:01 +0800
Message-ID: <1403503442-2273-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The imx6sx iomuxc-gpr syscon is compatible to imx6q, so let's add
compatible string 'fsl,imx6q-iomuxc-gpr' for imx6sx iomuxc-gpr syscon node.

This is necessary to enable SW workaround for ERR007265,
please refer to imx6_pm_common_init of arch/arm/mach-imx/pm-imx6.c
for detail.

Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6sx.dtsi |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index 78ccf61..7b41194 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -697,7 +697,8 @@
 			};
 
 			gpr: iomuxc-gpr@020e4000 {
-				compatible = "fsl,imx6sx-iomuxc-gpr", "syscon";
+				compatible = "fsl,imx6sx-iomuxc-gpr",
+					     "fsl,imx6q-iomuxc-gpr", "syscon";
 				reg = <0x020e4000 0x4000>;
 			};
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
