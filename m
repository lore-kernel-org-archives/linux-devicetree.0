From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/1 v2] imx6q-wandboard-revb1.dts: use unique machine name
Date: Sat,  6 Feb 2016 13:06:59 +0100
Message-ID: <1454760419-4822-1-git-send-email-xypron.glpk@gmx.de>
References: <1454758226-4561-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454758226-4561-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: George Joseph <george.joseph-H+B1fhQ+CpcEVd8bySq3Wg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Downstream packages like Debian flash-kernel use
/proc/device-tree/model
to determine which dtb file to install.

Hence each dts in the Linux kernel should provide a unique model identifier.

https://lkml.org/lkml/2014/7/8/579 created the new file
imx6q-wandboard-revb1.dts but used the same model identifier
as in imx6q-wandboard.dts.

This patch provides a unique model identifier for revision B1 of
the Wandboard Quad.

v2:
	correct name of referenced Debian package

Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-wandboard-revb1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6q-wandboard-revb1.dts b/arch/arm/boot/dts/imx6q-wandboard-revb1.dts
index 20bf3c2..9207d80 100644
--- a/arch/arm/boot/dts/imx6q-wandboard-revb1.dts
+++ b/arch/arm/boot/dts/imx6q-wandboard-revb1.dts
@@ -13,7 +13,7 @@
 #include "imx6qdl-wandboard-revb1.dtsi"
 
 / {
-	model = "Wandboard i.MX6 Quad Board";
+	model = "Wandboard i.MX6 Quad Board rev B1";
 	compatible = "wand,imx6q-wandboard", "fsl,imx6q";
 
 	memory {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
