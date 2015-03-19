From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 06/12] Doc: usb: ci-hdrc-imx: add ahb-burst-config for binding doc
Date: Thu, 19 Mar 2015 09:19:17 +0800
Message-ID: <1426727963-32280-7-git-send-email-peter.chen@freescale.com>
References: <1426727963-32280-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426727963-32280-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It is used to change ahb burst configuration for platforms.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt
index c21171e..a548502 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-imx.txt
@@ -22,6 +22,8 @@ Optional properties:
 - tpl-support: TPL (Targeted Peripheral List) feature for targeted hosts
 - gadget-itc-setting: the ITC setting for gadget, the required value
   should be aligned with ITC bits at register USBCMD.
+- ahb-burst-config: it is vendor dependent, the required value should be
+  aligned with AHBBRST at SBUSCFG, the range is from 0x0 to 0x7.
 
 Examples:
 usb@02184000 { /* USB OTG */
@@ -35,4 +37,5 @@ usb@02184000 { /* USB OTG */
 	maximum-speed = "full-speed";
 	tpl-support;
 	gadget-itc-setting = <0x4>; /* 4 micro-frames */
+	ahb-burst-config = <0x0>; /* Incremental burst of unspecified length */
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
