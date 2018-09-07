From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 3/5] dt-bindings: sun4i-drm: add compatible for R40 HDMI PHY
Date: Fri,  7 Sep 2018 15:22:32 +0800
Message-ID: <20180907072234.48282-4-icenowy@aosc.io>
References: <20180907072234.48282-1-icenowy@aosc.io>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180907072234.48282-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

The Allwinner R40 HDMI PHY is currently the only one that seems to be
able to select between two PLL inputs.

Add a compatible string for it, and the pll-1 clock input definition.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index 62034039cee1..a750ff0f068d 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -103,6 +103,7 @@ Required properties:
   - compatible: value must be one of:
     * allwinner,sun8i-a83t-hdmi-phy
     * allwinner,sun8i-h3-hdmi-phy
+    * allwinner,sun8i-r40-hdmi-phy
     * allwinner,sun50i-a64-hdmi-phy
   - reg: base address and size of memory-mapped region
   - clocks: phandles to the clocks feeding the HDMI PHY
@@ -112,8 +113,9 @@ Required properties:
   - resets: phandle to the reset controller driving the PHY
   - reset-names: must be "phy"
 
-H3 and A64 HDMI PHY require additional clocks:
+H3, A64 and R40 HDMI PHY require additional clocks:
   - pll-0: parent of phy clock
+  - pll-1: second possible phy clock parent (R40 only)
 
 TV Encoder
 ----------
-- 
2.18.0
