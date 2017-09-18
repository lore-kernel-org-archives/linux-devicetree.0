From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH 1/2] dt: bindings: media: Document port and endpoint numbering
Date: Mon, 18 Sep 2017 11:25:04 +0300
Message-ID: <1505723105-16238-2-git-send-email-sakari.ailus@linux.intel.com>
References: <1505723105-16238-1-git-send-email-sakari.ailus@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1505723105-16238-1-git-send-email-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

A lot of devices do not need and do not document port or endpoint
numbering at all, e.g. in case where there's just a single port and a
single endpoint. Whereas this is just common sense, document it to make it
explicit.

Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 Documentation/devicetree/bindings/media/video-interfaces.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index 852041a..4e0527d 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -55,6 +55,18 @@ divided into two separate ITU-R BT.656 8-bit busses.  In such case bus-width
 and data-shift properties can be used to assign physical data lines to each
 endpoint node (logical bus).
 
+Port and endpoint numbering
+---------------------------
+
+While the port and endpoint numbers are ultimately specific to a device,
+most devices have more limited scope than what the interface allows. They
+may, for instance, only support a single endpoint on a port. Or there may
+be only a single port on a device.
+
+Therefore, if ports are not explicitly documented for a device, only port
+number zero shall be used. The same applies to endpoints: if endpoint
+numbers are not explicitly documented, only endpoint number zero shall be
+used.
 
 Required properties
 -------------------
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
