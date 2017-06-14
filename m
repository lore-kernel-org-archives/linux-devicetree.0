From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH] dt-bindings: display: sunxi: Improve endpoint ID scheme readability
Date: Wed, 14 Jun 2017 14:30:16 +0800
Message-ID: <20170614063016.22069-1-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The explanation for the endpoint ID numbering scheme is convoluted
and hard to understand.

This patch aims to improve the readability of it by combining the
existing two paragraphs, while also providing a diagram example,
and how endpoints should be numbered based on that example.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---

Hope this helps. I'm not sure I can improve this even more without
spelling out all cases.

---
 .../bindings/display/sunxi/sun4i-drm.txt           | 36 ++++++++++++++++------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index b83e6018041d..70885041553a 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -4,15 +4,33 @@ Allwinner A10 Display Pipeline
 The Allwinner A10 Display pipeline is composed of several components
 that are going to be documented below:
 
-For the input port of all components up to the TCON in the display
-pipeline, if there are multiple components, the local endpoint IDs
-must correspond to the index of the upstream block. For example, if
-the remote endpoint is Frontend 1, then the local endpoint ID must
-be 1.
-
-Conversely, for the output ports of the same group, the remote endpoint
-ID must be the index of the local hardware block. If the local backend
-is backend 1, then the remote endpoint ID must be 1.
+For all connections between components up to the TCONs in the display
+pipeline, when there are multiple components of the same type at the
+same depth, the local endpoint ID must be the same as the remote
+component's index. For example, if the remote endpoint is Frontend 1,
+then the local endpoint ID must be 1.
+
+    Frontend 0  [0] ----------- [0]  Backend 0  [0] ----- [0]  TCON 0
+		[1] ----   ---- [1]
+			\ /
+			 X
+			/ \
+		[0] ----   ---- [0]
+    Frontend 1  [1] ----------- [1]  Backend 1  [0] ----- [0]  TCON 1
+
+For a two pipeline system such as the one depicted above, the lines
+represent the connections between the components, while the numbers
+within the square brackets corresponds to the ID of the local endpoint.
+
+The same rule also applies to DE 2.0 mixer-TCON connections:
+
+    Mixer 0  [0] ----------- [0]  TCON 0
+	     [1] ----   ---- [1]
+		     \ /
+		      X
+		     / \
+	     [0] ----   ---- [0]
+    Mixer 1  [1] ----------- [1]  TCON 1
 
 HDMI Encoder
 ------------
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
