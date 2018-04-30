From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 11/21] bindings: display: Add compatible for A64 Mixer1
Date: Mon, 30 Apr 2018 17:10:48 +0530
Message-ID: <20180430114058.5061-12-jagan@amarulasolutions.com>
References: <20180430114058.5061-1-jagan@amarulasolutions.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180430114058.5061-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Mixer1 on Allwinner A64 has similar behavior like Allwinner A83T.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
index 7dcd1d64dfe4..5d448ef2132f 100644
--- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
@@ -313,6 +313,7 @@ Required properties:
     * allwinner,sun8i-a83t-de2-mixer-1
     * allwinner,sun8i-h3-de2-mixer-0
     * allwinner,sun8i-v3s-de2-mixer
+    * allwinner,sun50i-a64-de2-mixer-1
   - reg: base address and size of the memory-mapped region.
   - clocks: phandles to the clocks feeding the mixer
     * bus: the mixer interface clock
-- 
2.14.3
