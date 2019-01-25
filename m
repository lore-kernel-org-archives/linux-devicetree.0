From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 02/11] dt-bindings: display: sun4i-drm: Add compatible strings for A23 display
Date: Fri, 25 Jan 2019 11:23:05 +0800
Message-ID: <20190125032314.20915-3-wens@csie.org>
References: <20190125032314.20915-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125032314.20915-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The A23's display pipeline is similar to the A33. Differences include:

  - Display backend supports larger layers, 8192x8192 instead of 2048x2048

  - TCON has DMA input

  - There is no SAT module packed in the display backend

Add compatible strings for the display pipeline and its components.

As the MIPI DSI output device is not officially documented, and there
are no A23 reference devices to test it, it is not covered by this
patch.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../devicetree/bindings/display/sunxi/sun4i-drm.txt          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index f426bdb42f18..31ab72cba3d4 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -156,6 +156,7 @@ Required properties:
    * allwinner,sun6i-a31-tcon
    * allwinner,sun6i-a31s-tcon
    * allwinner,sun7i-a20-tcon
+   * allwinner,sun8i-a23-tcon
    * allwinner,sun8i-a33-tcon
    * allwinner,sun8i-a83t-tcon-lcd
    * allwinner,sun8i-a83t-tcon-tv
@@ -276,6 +277,7 @@ Required properties:
   - compatible: value must be one of:
     * allwinner,sun6i-a31-drc
     * allwinner,sun6i-a31s-drc
+    * allwinner,sun8i-a23-drc
     * allwinner,sun8i-a33-drc
     * allwinner,sun9i-a80-drc
   - reg: base address and size of the memory-mapped region.
@@ -303,6 +305,7 @@ Required properties:
     * allwinner,sun5i-a13-display-backend
     * allwinner,sun6i-a31-display-backend
     * allwinner,sun7i-a20-display-backend
+    * allwinner,sun8i-a23-display-backend
     * allwinner,sun8i-a33-display-backend
     * allwinner,sun9i-a80-display-backend
   - reg: base address and size of the memory-mapped region.
@@ -360,6 +363,7 @@ Required properties:
     * allwinner,sun5i-a13-display-frontend
     * allwinner,sun6i-a31-display-frontend
     * allwinner,sun7i-a20-display-frontend
+    * allwinner,sun8i-a23-display-frontend
     * allwinner,sun8i-a33-display-frontend
     * allwinner,sun9i-a80-display-frontend
   - reg: base address and size of the memory-mapped region.
@@ -419,6 +423,7 @@ Required properties:
     * allwinner,sun6i-a31-display-engine
     * allwinner,sun6i-a31s-display-engine
     * allwinner,sun7i-a20-display-engine
+    * allwinner,sun8i-a23-display-engine
     * allwinner,sun8i-a33-display-engine
     * allwinner,sun8i-a83t-display-engine
     * allwinner,sun8i-h3-display-engine
-- 
2.20.1
