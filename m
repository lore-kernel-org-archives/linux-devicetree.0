From: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v2 1/3] doc: usb: usbmisc-imx: add imx7d compatible string
Date: Wed, 20 Jul 2016 16:02:40 +0800
Message-ID: <1469001762-15015-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peter.chen-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add compatible string for imx7d-usbmisc.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/usbmisc-imx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/usbmisc-imx.txt b/Documentation/devicetree/bindings/usb/usbmisc-imx.txt
index 3539d4e..f1e27fa 100644
--- a/Documentation/devicetree/bindings/usb/usbmisc-imx.txt
+++ b/Documentation/devicetree/bindings/usb/usbmisc-imx.txt
@@ -6,6 +6,7 @@ Required properties:
 	"fsl,imx6q-usbmisc" for imx6q
 	"fsl,vf610-usbmisc" for Vybrid vf610
 	"fsl,imx6sx-usbmisc" for imx6sx
+	"fsl,imx7d-usbmisc" for imx7d
 - reg: Should contain registers location and length
 
 Examples:
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
