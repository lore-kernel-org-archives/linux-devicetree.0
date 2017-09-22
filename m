From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH v2 2/2] dt: bindings: media: Document data lane numbering without lane reordering
Date: Fri, 22 Sep 2017 10:42:14 +0300
Message-ID: <1506066134-25997-3-git-send-email-sakari.ailus@linux.intel.com>
References: <1506066134-25997-1-git-send-email-sakari.ailus@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506066134-25997-1-git-send-email-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Most devices do not support lane reordering and in many cases the
documentation of the data-lanes property is incomplete for such devices.
Document that in case the lane reordering isn't supported, monotonically
incremented values from 0 or 1 shall be used.

Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/media/video-interfaces.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index 3c5382f..4b09a34 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -114,7 +114,10 @@ Optional endpoint properties
   determines the logical lane number, while the value of an entry indicates
   physical lane, e.g. for 2-lane MIPI CSI-2 bus we could have
   "data-lanes = <1 2>;", assuming the clock lane is on hardware lane 0.
-  This property is valid for serial busses only (e.g. MIPI CSI-2).
+  If the hardware does not support lane reordering, monotonically
+  incremented values shall be used from 0 or 1 onwards, depending on
+  whether or not there is also a clock lane. This property is valid for
+  serial busses only (e.g. MIPI CSI-2).
 - clock-lanes: an array of physical clock lane indexes. Position of an entry
   determines the logical lane number, while the value of an entry indicates
   physical lane, e.g. for a MIPI CSI-2 bus we could have "clock-lanes = <0>;",
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
