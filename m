From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2 04/10] Doc: usb: ci-hdrc-usb2: add ahb-burst-config for binding doc
Date: Mon, 3 Aug 2015 12:47:12 +0800
Message-ID: <1438577238-10153-5-git-send-email-peter.chen@freescale.com>
References: <1438577238-10153-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438577238-10153-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It is used to change ahb burst configuration for platforms, it is
vendor specific.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index 4159c8c..3c377a3 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -32,6 +32,8 @@ Optional properties:
 - external-vbus-divider: (FSL only) enables off-chip resistor divider for Vbus
 - itc-setting: interrupt threshold control register control, the setting
   should be aligned with ITC bits at register USBCMD.
+- ahb-burst-config: it is vendor dependent, the required value should be
+  aligned with AHBBRST at SBUSCFG, the range is from 0x0 to 0x7.
 
 Example:
 
@@ -44,4 +46,6 @@ Example:
 		phy-names = "usb-phy";
 		vbus-supply = <&reg_usb0_vbus>;
 		gadget-itc-setting = <0x4>; /* 4 micro-frames */
+		 /* Incremental burst of unspecified length */
+		ahb-burst-config = <0x0>;
 	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
