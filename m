From: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v2 2/3] doc: usb: ci-hdrc-usb2: add property over-current-active-high
Date: Wed, 20 Jul 2016 16:02:41 +0800
Message-ID: <1469001762-15015-2-git-send-email-jun.li@nxp.com>
References: <1469001762-15015-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469001762-15015-1-git-send-email-jun.li-3arQi8VN3Tc@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peter.chen-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adding over-current-active-high to indicate the over current flag
is high active as typically we use active low for over current
polarity.

Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index 341dc67..0e03344 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -81,6 +81,8 @@ i.mx specific properties
 - fsl,usbmisc: phandler of non-core register device, with one
   argument that indicate usb controller index
 - disable-over-current: disable over current detect
+- over-current-active-high: over current signal polarity is high active,
+  typically over current signal polarity is low active.
 - external-vbus-divider: enables off-chip resistor divider for Vbus
 
 Example:
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
