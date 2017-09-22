From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH v2 1/2] dt: bindings: media: Document practices for DT bindings, ports, endpoints
Date: Fri, 22 Sep 2017 10:42:13 +0300
Message-ID: <1506066134-25997-2-git-send-email-sakari.ailus@linux.intel.com>
References: <1506066134-25997-1-git-send-email-sakari.ailus@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506066134-25997-1-git-send-email-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Port and endpoint numbering has been omitted in DT binding documentation
for a large number of devices. Also common properties the device uses have
been missed in binding documentation. Make it explicit that these things
need to be documented.

Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 .../devicetree/bindings/media/video-interfaces.txt        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index 852041a..3c5382f 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -55,6 +55,21 @@ divided into two separate ITU-R BT.656 8-bit busses.  In such case bus-width
 and data-shift properties can be used to assign physical data lines to each
 endpoint node (logical bus).
 
+Documenting bindings for devices
+--------------------------------
+
+All required and optional bindings the device supports shall be explicitly
+documented in device DT binding documentation. This also includes port and
+endpoint numbering for the device.
+
+Port and endpoint numbering
+---------------------------
+
+Old binding documentation may have omitted explicitly specifying port and
+endpoint numbers. This often applies to devices that have a single port and a
+single endpoint in that port. In this case, the only valid port number for such
+a device is zero. The same applies for devices for which bindings do not
+document endpoint numbering: only zero is a valid endpoint.
 
 Required properties
 -------------------
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
