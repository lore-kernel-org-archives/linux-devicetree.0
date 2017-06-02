From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 06/19] dt-bindings: display: sun4i: Add binding for A31 HDMI controller
Date: Fri,  2 Jun 2017 18:10:11 +0800
Message-ID: <20170602101024.18940-7-wens@csie.org>
References: <20170602101024.18940-1-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170602101024.18940-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The HDMI controller in the A31 SoC is slightly different from the
earlier version. In addition to the TMDS clock and DDC controls,
this version now takes a second DDC clock input.

Add a compatible string for it, and add the DDC clock input to the
list of clocks required.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index b83e6018041d..d23e7cad19d0 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -23,14 +23,17 @@ CEC. It is one end of the pipeline.
 Required properties:
   - compatible: value must be one of:
     * allwinner,sun5i-a10s-hdmi
+    * allwinner,sun6i-a31-hdmi
   - reg: base address and size of memory-mapped region
   - interrupts: interrupt associated to this IP
   - clocks: phandles to the clocks feeding the HDMI encoder
     * ahb: the HDMI interface clock
     * mod: the HDMI module clock
+    * ddc: the HDMI ddc clock (A31 only)
     * pll-0: the first video PLL
     * pll-1: the second video PLL
   - clock-names: the clock names mentioned above
+  - resets: phandle to the reset control for the HDMI encoder (A31 only)
   - dmas: phandles to the DMA channels used by the HDMI encoder
     * ddc-tx: The channel for DDC transmission
     * ddc-rx: The channel for DDC reception
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
