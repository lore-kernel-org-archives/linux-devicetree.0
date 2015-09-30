From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [RESEND PATCH v3 1/5] doc: dt-binding: ci-hdrc-usb2: split vendor specific properties
Date: Wed, 30 Sep 2015 10:25:21 +0800
Message-ID: <1443579925-1330-2-git-send-email-peter.chen@freescale.com>
References: <1443579925-1330-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443579925-1330-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Each vendor may have its specific properties, they are not belonged
to common optional properties, split them from common's.

Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index 77946f5..27dc705 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -27,10 +27,6 @@ Optional properties:
 - vbus-supply: reference to the VBUS regulator
 - maximum-speed: limit the maximum connection speed to "full-speed".
 - tpl-support: TPL (Targeted Peripheral List) feature for targeted hosts
-- fsl,usbmisc: (FSL only) phandler of non-core register device, with one
-  argument that indicate usb controller index
-- disable-over-current: (FSL only) disable over current detect
-- external-vbus-divider: (FSL only) enables off-chip resistor divider for Vbus
 - itc-setting: interrupt threshold control register control, the setting
   should be aligned with ITC bits at register USBCMD.
 - ahb-burst-config: it is vendor dependent, the required value should be
@@ -54,6 +50,12 @@ Optional properties:
 - phy-clkgate-delay-us: the delay time (us) between putting the PHY into
   low power mode and gating the PHY clock.
 
+i.mx specific properties
+- fsl,usbmisc: phandler of non-core register device, with one
+  argument that indicate usb controller index
+- disable-over-current: disable over current detect
+- external-vbus-divider: enables off-chip resistor divider for Vbus
+
 Example:
 
 	usb@f7ed0000 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
