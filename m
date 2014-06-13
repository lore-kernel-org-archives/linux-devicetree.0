From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 2/4] of: Add new compatibles for CODA bindings
Date: Fri, 13 Jun 2014 19:13:59 +0200
Message-ID: <1402679641-868-2-git-send-email-p.zabel@pengutronix.de>
References: <1402679641-868-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402679641-868-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds new compatibles using the new Chips&Media vendor
prefix "cnm" and CODA model name as well as a Freescale specific
compatible value for i.MX6DL/S.
The latter is because for some reason the i.MX6DL/S firmware
provided by Freescale differs from the i.MX6Q/D version.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 Documentation/devicetree/bindings/media/coda.txt | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/coda.txt b/Documentation/devicetree/bindings/media/coda.txt
index 2865d04..f5e4d4b 100644
--- a/Documentation/devicetree/bindings/media/coda.txt
+++ b/Documentation/devicetree/bindings/media/coda.txt
@@ -5,10 +5,11 @@ Coda codec IPs are present in i.MX SoCs in various versions,
 called VPU (Video Processing Unit).
 
 Required properties:
-- compatible : should be "fsl,<chip>-src" for i.MX SoCs:
-  (a) "fsl,imx27-vpu" for CodaDx6 present in i.MX27
-  (b) "fsl,imx53-vpu" for CODA7541 present in i.MX53
-  (c) "fsl,imx6q-vpu" for CODA960 present in i.MX6q
+- compatible : should be "fsl,<chip>-src", "cnm,coda<model>" for i.MX SoCs:
+  (a) "fsl,imx27-vpu", "cnm,codadx6" for CodaDx6 present in i.MX27
+  (b) "fsl,imx53-vpu", "cnm,coda7541" for CODA7541 present in i.MX53
+  (c) "fsl,imx6q-vpu", "cnm,coda960" for CODA960 present in i.MX6Q/D
+  (d) "fsl,imx6dl-vpu", "cnm,coda960" for CODA960 present in i.MX6DL/S
 - reg: should be register base and length as documented in the
   SoC reference manual
 - interrupts : Should contain the VPU interrupt. For CODA960,
@@ -21,7 +22,7 @@ Required properties:
 Example:
 
 vpu: vpu@63ff4000 {
-	compatible = "fsl,imx53-vpu";
+	compatible = "fsl,imx53-vpu", "cnm,coda7541";
 	reg = <0x63ff4000 0x1000>;
 	interrupts = <9>;
 	clocks = <&clks 63>, <&clks 63>;
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
