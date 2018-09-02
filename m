From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH 24/27] dt-bindings: display: sun4i-drm: document
 H6 TCON TOP
Date: Sun,  2 Sep 2018 09:26:40 +0200
Message-ID: <20180902072643.4917-25-jernej.skrabec@siol.net>
References: <20180902072643.4917-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBBFCV3OAKGQEWDSRKYI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180902072643.4917-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jernej.skrabec-gGgVlfcn5nU@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

Allwinner H6 SoC has a cut down version of TCON TOP.

Add binding documentation for it.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
[expanded description]
Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 .../bindings/display/sunxi/sun4i-drm.txt           | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index 278410e43940..a14eb9313e70 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -221,24 +221,26 @@ It allows display pipeline to be configured in very different ways:
                  \ [3] TCON-TV1 [1] - TVE1/RGB
 
 Note that both TCON TOP references same physical unit. Both mixers can be
-connected to any TCON.
+connected to any TCON. Not all TCON TOP variants support all features.
 
 Required properties:
   - compatible: value must be one of:
     * allwinner,sun8i-r40-tcon-top
+    * allwinner,sun50i-h6-tcon-top
   - reg: base address and size of the memory-mapped region.
   - clocks: phandle to the clocks feeding the TCON TOP
     * bus: TCON TOP interface clock
     * tcon-tv0: TCON TV0 clock
-    * tve0: TVE0 clock
-    * tcon-tv1: TCON TV1 clock
-    * tve1: TVE0 clock
-    * dsi: MIPI DSI clock
+    * tve0: TVE0 clock (R40 only)
+    * tcon-tv1: TCON TV1 clock (R40 only)
+    * tve1: TVE0 clock (R40 only)
+    * dsi: MIPI DSI clock (R40 only)
   - clock-names: clock name mentioned above
   - resets: phandle to the reset line driving the TCON TOP
   - #clock-cells : must contain 1
   - clock-output-names: Names of clocks created for TCON TV0 channel clock,
-    TCON TV1 channel clock and DSI channel clock, in that order.
+    TCON TV1 channel clock (R40 only) and DSI channel clock (R40 only), in
+    that order.
 
 - ports: A ports node with endpoint definitions as defined in
     Documentation/devicetree/bindings/media/video-interfaces.txt. 6 ports should
-- 
2.18.0
