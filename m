From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 1/9] dt-bindings: display: sun4i: Add component endpoint ID numbering scheme
Date: Fri, 21 Apr 2017 16:38:49 +0800
Message-ID: <20170421083857.29636-2-wens@csie.org>
References: <20170421083857.29636-1-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170421083857.29636-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Allwinner display pipeline contains many hardware components, some
of which can consume data from one of multiple upstream components.
The numbering scheme of these components must be encoded into the device
tree so the driver can figure out which component out of two or more of
the same type it is supposed to use or program.

This patch adds the constraint that local endpoint IDs must be the index
or number of the remote endpoint's hardware block, for all components
in the display pipeline up to the TCONs.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index 57a8d0610062..7acdbf14ae1c 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -4,6 +4,16 @@ Allwinner A10 Display Pipeline
 The Allwinner A10 Display pipeline is composed of several components
 that are going to be documented below:
 
+For the input port of all components up to the TCON in the display
+pipeline, if there are multiple components, the local endpoint IDs
+must correspond to the index of the upstream block. For example, if
+the remote endpoint is Frontend 1, then the local endpoint ID must
+be 1.
+
+Conversely, for the output ports of the same group, the remote endpoint
+ID must be the index of the local hardware block. If the local backend
+is backend 1, then the remote endpoint ID must be 1.
+
 TV Encoder
 ----------
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
