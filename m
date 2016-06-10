From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 07/10] dt-bindings: msm/dsi: Use standard data lanes binding
Date: Fri, 10 Jun 2016 16:16:37 +0530
Message-ID: <1465555600-25742-8-git-send-email-architt@codeaurora.org>
References: <1462273081-5814-1-git-send-email-architt@codeaurora.org>
 <1465555600-25742-1-git-send-email-architt@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465555600-25742-1-git-send-email-architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The "qcom,data-lane-map" binding mentioned in the document is changed to
the more generic "data-lanes" property specified in:

Documentation/devicetree/bindings/media/video-interfaces.txt

The previous binding expressed physical to logical data lane mappings,
the standard "data-lanes" binding uses logical to physical data lane
mappings. Update the docs to reflect this change. The example had the
property incorrectly named as "lanes", update this too.

The MSM DSI DT bindings aren't used anywhere at the moment, so
it's okay to update this property.

Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 .../devicetree/bindings/display/msm/dsi.txt        | 37 +++++++++++-----------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
index f5948c4..9d2d2bb 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
@@ -49,29 +49,30 @@ Optional properties:
   DSI Endpoint properties:
   - remote-endpoint: set to phandle of the connected panel's endpoint.
     See Documentation/devicetree/bindings/graph.txt for device graph info.
-  - qcom,data-lane-map: this describes how the logical DSI lanes are mapped
-    to the physical lanes on the given platform. The value contained in
-    index n describes what logical data lane is mapped to the physical data
-    lane n (DATAn, where n lies between 0 and 3).
+  - data-lanes: this describes how the physical DSI data lanes are mapped
+    to the logical lanes on the given platform. The value contained in
+    index n describes what physical lane is mapped to the logical lane n
+    (DATAn, where n lies between 0 and 3). The clock lane position is fixed
+    and can't be changed. Hence, they aren't a part of the DT bindings. For
+    more info, see Documentation/devicetree/bindings/media/video-interfaces.txt
 
     For example:
 
-    qcom,data-lane-map = <3 0 1 2>;
+    data-lanes = <3 0 1 2>;
 
-    The above mapping describes that the logical data lane DATA3 is mapped to
-    the physical data lane DATA0, logical DATA0 to physical DATA1, logic DATA1
-    to phys DATA2 and logic DATA2 to phys DATA3.
+    The above mapping describes that the logical data lane DATA0 is mapped to
+    the physical data lane DATA3, logical DATA1 to physical DATA0, logic DATA2
+    to phys DATA1 and logic DATA3 to phys DATA2.
 
     There are only a limited number of physical to logical mappings possible:
-
-    "0123": Logic 0->Phys 0; Logic 1->Phys 1; Logic 2->Phys 2; Logic 3->Phys 3;
-    "3012": Logic 3->Phys 0; Logic 0->Phys 1; Logic 1->Phys 2; Logic 2->Phys 3;
-    "2301": Logic 2->Phys 0; Logic 3->Phys 1; Logic 0->Phys 2; Logic 1->Phys 3;
-    "1230": Logic 1->Phys 0; Logic 2->Phys 1; Logic 3->Phys 2; Logic 0->Phys 3;
-    "0321": Logic 0->Phys 0; Logic 3->Phys 1; Logic 2->Phys 2; Logic 1->Phys 3;
-    "1032": Logic 1->Phys 0; Logic 0->Phys 1; Logic 3->Phys 2; Logic 2->Phys 3;
-    "2103": Logic 2->Phys 0; Logic 1->Phys 1; Logic 0->Phys 2; Logic 3->Phys 3;
-    "3210": Logic 3->Phys 0; Logic 2->Phys 1; Logic 1->Phys 2; Logic 0->Phys 3;
+    <0 1 2 3>
+    <1 2 3 0>
+    <2 3 0 1>
+    <3 0 1 2>
+    <0 3 2 1>
+    <1 0 3 2>
+    <2 1 0 3>
+    <3 2 1 0>
 
 DSI PHY:
 Required properties:
@@ -156,7 +157,7 @@ Example:
 		port {
 			dsi0_out: endpoint {
 				remote-endpoint = <&panel_in>;
-				lanes = <0 1 2 3>;
+				data-lanes = <0 1 2 3>;
 			};
 		};
 	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
