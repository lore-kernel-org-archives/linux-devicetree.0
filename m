From: Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
Subject: [PATCH v2 9/9] Documentation: DT: add entries for I2SE boards
Date: Sun, 22 Jan 2017 23:22:44 +0100
Message-ID: <1485123764-14754-10-git-send-email-mhei@heimpold.de>
References: <1485123764-14754-1-git-send-email-mhei@heimpold.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485123764-14754-1-git-send-email-mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan.wahren-eS4NqCHxEME@public.gmane.org, Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds the missing devicetree binding documentation for I2SE's
Duckbill and Duckbill 2 series boards.

Signed-off-by: Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/i2se.txt | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/i2se.txt

diff --git a/Documentation/devicetree/bindings/arm/i2se.txt b/Documentation/devicetree/bindings/arm/i2se.txt
new file mode 100644
index 0000000..9f30382
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/i2se.txt
@@ -0,0 +1,22 @@
+I2SE Device Tree Bindings
+-------------------------
+
+Duckbill Board
+Required root node properties:
+    - compatible = "i2se,duckbill", "fsl.imx28";
+
+Duckbill 2 Board
+Required root node properties:
+    - compatible = "i2se,duckbill", "fsl.imx28";
+
+Duckbill 2 485 Board
+Required root node properties:
+    - compatible = "i2se,duckbill", "fsl.imx28";
+
+Duckbill 2 EnOcean Board
+Required root node properties:
+    - compatible = "i2se,duckbill", "fsl.imx28";
+
+Duckbill 2 SPI Board
+Required root node properties:
+    - compatible = "i2se,duckbill", "fsl.imx28";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
