From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v3 7/7] dt-bindings: drm/bridge: Update bindings for ADV7533
Date: Wed,  9 Mar 2016 16:27:18 +0530
Message-ID: <1457521038-5906-8-git-send-email-architt@codeaurora.org>
References: <1441625800-1858-1-git-send-email-architt@codeaurora.org>
 <1457521038-5906-1-git-send-email-architt@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457521038-5906-1-git-send-email-architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.green-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add description of ADV7533. Add the required and optional properties that
are specific to it.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Signed-off-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 .../bindings/display/bridge/adi,adv7511.txt        | 25 +++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
index 96c25ee..420da5a 100644
--- a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
+++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
@@ -1,13 +1,19 @@
-Analog Device ADV7511(W)/13 HDMI Encoders
+Analog Device ADV7511(W)/13/33 HDMI Encoders
 -----------------------------------------
 
-The ADV7511, ADV7511W and ADV7513 are HDMI audio and video transmitters
+The ADV7511, ADV7511W, ADV7513 and ADV7533 are HDMI audio and video transmitters
 compatible with HDMI 1.4 and DVI 1.0. They support color space conversion,
-S/PDIF, CEC and HDCP.
+S/PDIF, CEC and HDCP. ADV7533 supports the DSI interface for input pixels, while
+the others support RGB interface.
 
 Required properties:
 
-- compatible: Should be one of "adi,adv7511", "adi,adv7511w" or "adi,adv7513"
+- compatible: Should be one of:
+		"adi,adv7511"
+		"adi,adv7511w"
+		"adi,adv7513"
+		"adi,adv7533"
+
 - reg: I2C slave address
 
 The ADV7511 supports a large number of input data formats that differ by their
@@ -32,6 +38,11 @@ The following input format properties are required except in "rgb 1x" and
 - adi,input-justification: The input bit justification ("left", "evenly",
   "right").
 
+The following properties are required for ADV7533:
+
+- adi,dsi-lanes: Number of DSI data lanes connected to the DSI host. It should
+  be one of 1, 2, 3 or 4.
+
 Optional properties:
 
 - interrupts: Specifier for the ADV7511 interrupt
@@ -42,13 +53,17 @@ Optional properties:
 - adi,embedded-sync: The input uses synchronization signals embedded in the
   data stream (similar to BT.656). Defaults to separate H/V synchronization
   signals.
+- adi,disable-timing-generator: Only for ADV7533. Disables the internal timing
+  generator. The chip will rely on the sync signals in the DSI data lanes,
+  rather than generate its own timings for HDMI output.
 
 Required nodes:
 
 The ADV7511 has two video ports. Their connections are modelled using the OF
 graph bindings specified in Documentation/devicetree/bindings/graph.txt.
 
-- Video port 0 for the RGB or YUV input
+- Video port 0 for the RGB, YUV or DSI input. In the case of ADV7533, the
+  remote endpoint phandle should refer to a valid mipi_dsi_host device node.
 - Video port 1 for the HDMI output
 
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
