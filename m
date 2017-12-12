From: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: usb-xhci: add usb3-resume-missing-cas property
Date: Tue, 12 Dec 2017 11:57:17 +0800
Message-ID: <1513051038-20311-1-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adding 'usb3-resume-missing-cas' property to enable XHCI_MISSING_CAS
quirk flag in case there is CAS missing if device plugged in S3.

Signed-off-by: Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/usb-xhci.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index e2ea59b..c413e188 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -32,6 +32,8 @@ Optional properties:
   - usb3-lpm-capable: determines if platform is USB3 LPM capable
   - quirk-broken-port-ped: set if the controller has broken port disable mechanism
   - imod-interval-ns: default interrupt moderation interval is 5000ns
+  - usb3-resume-missing-cas: set if the CAS(Cold Attach Status) may lose in case
+    usb3 device plugged in while system sleep.
 
 Example:
 	usb@f0931000 {
-- 
2.6.6

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
