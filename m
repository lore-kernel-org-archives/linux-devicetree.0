From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 08/10] Doc: usb: ci-hdrc-usb2: add tx(rx)-burst-config-dword for binding doc
Date: Wed, 29 Jul 2015 10:42:12 +0800
Message-ID: <1438137734-27311-9-git-send-email-peter.chen@freescale.com>
References: <1438137734-27311-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438137734-27311-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It is used to override the default setting for burst size, changing
burst size takes effect only when the SBUSCFG.AHBBRST = 0.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index 3c377a3..0f0929c 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -34,6 +34,10 @@ Optional properties:
   should be aligned with ITC bits at register USBCMD.
 - ahb-burst-config: it is vendor dependent, the required value should be
   aligned with AHBBRST at SBUSCFG, the range is from 0x0 to 0x7.
+- tx-burst-size-dword: it is vendor dependent, the tx burst size in dword
+  (4 bytes).
+- rx-burst-size-dword: it is vendor dependent, the rx burst size in dword
+  (4 bytes).
 
 Example:
 
@@ -48,4 +52,6 @@ Example:
 		gadget-itc-setting = <0x4>; /* 4 micro-frames */
 		 /* Incremental burst of unspecified length */
 		ahb-burst-config = <0x0>;
+		tx-burst-size-dword = <0x10>; /* 64 bytes */
+		rx-burst-size-dword = <0x10>;
 	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
