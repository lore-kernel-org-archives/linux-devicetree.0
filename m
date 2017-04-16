From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v4 03/11] dt-bindings: add bindings for DE2 on
 V3s SoC
Date: Sun, 16 Apr 2017 20:08:41 +0800
Message-ID: <20170416120849.54542-4-icenowy@aosc.io>
References: <20170416120849.54542-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBIF6ZXDQKGQEWVN6P3A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170416120849.54542-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner V3s SoC have a display engine which have a different pipeline
with older SoCs.

Add document for it (new compatibles and the new "mixer" part).

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
Changes in v4:
- Removed the refactor at TCON chapter.

Changes in v3:
- Remove the description of having a BE directly as allwinner,pipeline.

 .../bindings/display/sunxi/sun4i-drm.txt           | 29 ++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index 57a8d0610062..7da80e26d61b 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -31,6 +31,7 @@ Required properties:
    * allwinner,sun6i-a31-tcon
    * allwinner,sun6i-a31s-tcon
    * allwinner,sun8i-a33-tcon
+   * allwinner,sun8i-v3s-tcon
  - reg: base address and size of memory-mapped region
  - interrupts: interrupt associated to this IP
  - clocks: phandles to the clocks feeding the TCON. Three are needed:
@@ -52,7 +53,7 @@ Required properties:
   second the block connected to the TCON channel 1 (usually the TV
   encoder)
 
-On SoCs other than the A33, there is one more clock required:
+On SoCs other than the A33 and V3s, there is one more clock required:
    - 'tcon-ch1': The clock driving the TCON channel 1
 
 DRC
@@ -138,6 +139,26 @@ Required properties:
   Documentation/devicetree/bindings/media/video-interfaces.txt. The
   first port should be the input endpoints, the second one the outputs
 
+Display Engine 2.0 Mixer
+------------------------
+
+The DE2 mixer have many functionalities, currently only layer blending is
+supported.
+
+Required properties:
+  - compatible: value must be one of:
+    * allwinner,sun8i-v3s-de2-mixer
+  - reg: base address and size of the memory-mapped region.
+  - clocks: phandles to the clocks feeding the frontend and backend
+    * bus: the backend interface clock
+    * ram: the backend DRAM clock
+  - clock-names: the clock names mentioned above
+  - resets: phandles to the reset controllers driving the backend
+
+- ports: A ports node with endpoint definitions as defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt. The
+  first port should be the input endpoints, the second one the output
+
 
 Display Engine Pipeline
 -----------------------
@@ -152,9 +173,13 @@ Required properties:
     * allwinner,sun6i-a31-display-engine
     * allwinner,sun6i-a31s-display-engine
     * allwinner,sun8i-a33-display-engine
+    * allwinner,sun8i-v3s-display-engine
 
   - allwinner,pipelines: list of phandle to the display engine
-    frontends available.
+    pipeline entry point. For SoCs with original DE (currently
+    all SoCs supported by display engine except V3s), this
+    phandle should be a display frontend; for SoCs with DE2,
+    this phandle should be a mixer.
 
 Example:
 
-- 
2.12.2
