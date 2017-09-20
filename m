From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH] dt-bindings: mfd: mc13xxx: Remove obsolete property
Date: Wed, 20 Sep 2017 12:51:51 -0300
Message-ID: <1505922711-22070-1-git-send-email-fabio.estevam@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The 'fsl,spi-num-chipselects' property is obsolete according to 
Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt, so remove
it from the example.

Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/mc13xxx.txt | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/mc13xxx.txt b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
index 39ba414..ac235fe 100644
--- a/Documentation/devicetree/bindings/mfd/mc13xxx.txt
+++ b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
@@ -113,7 +113,6 @@ MC13892 regulators:
 Examples:
 
 ecspi@70010000 { /* ECSPI1 */
-	fsl,spi-num-chipselects = <2>;
 	cs-gpios = <&gpio4 24 0>, /* GPIO4_24 */
 		   <&gpio4 25 0>; /* GPIO4_25 */
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
