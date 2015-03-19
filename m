From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 01/12] Doc: usb: ci-hdrc-imx: add gadget-itc-setting for binding doc
Date: Thu, 19 Mar 2015 09:19:12 +0800
Message-ID: <1426727963-32280-2-git-send-email-peter.chen@freescale.com>
References: <1426727963-32280-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426727963-32280-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It is used to configure the ITC (in register USBCMD) value
for gadget mode.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt
index 38a5480..c21171e 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt
@@ -20,6 +20,8 @@ Optional properties:
 - external-vbus-divider: enables off-chip resistor divider for Vbus
 - maximum-speed: limit the maximum connection speed to "full-speed".
 - tpl-support: TPL (Targeted Peripheral List) feature for targeted hosts
+- gadget-itc-setting: the ITC setting for gadget, the required value
+  should be aligned with ITC bits at register USBCMD.
 
 Examples:
 usb@02184000 { /* USB OTG */
@@ -32,4 +34,5 @@ usb@02184000 { /* USB OTG */
 	external-vbus-divider;
 	maximum-speed = "full-speed";
 	tpl-support;
+	gadget-itc-setting = <0x4>; /* 4 micro-frames */
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
