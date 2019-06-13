From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 5/9] ARM: dts: sun8i: r40: Add TCON TOP LCD clocking
Date: Fri, 14 Jun 2019 00:22:37 +0530
Message-ID: <20190613185241.22800-6-jagan@amarulasolutions.com>
References: <20190613185241.22800-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613185241.22800-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

According to Fig 7-2. TCON Top Block Diagram in User manual.

TCON TOP can have an hierarchy for TCON_LCD0, LCD1 like
TCON_TV0, TV1 so, the tcon top would handle the clocks of
TCON_LCD0, LCD1 similar like TV0, TV1.

But, the current tcon_top node is using dsi clock name with
CLK_DSI_DPHY which is ideally handle via dphy which indeed
a separate interface block.

So, use tcon-lcd0 instead of dsi which would refer the
CLK_TCON_LCD0 similar like CLK_TCON_TV0 with tcon-tv0.

This way we can refer CLK_TCON_LCD0 from tcon_top clock in
tcon_lcd0 node and the actual DSI_DPHY clock node would
refer in dphy node.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm/boot/dts/sun8i-r40.dtsi           | 6 +++---
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c     | 6 +++---
 include/dt-bindings/clock/sun8i-tcon-top.h | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index 219d2dca16b3..12576536df4a 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -591,16 +591,16 @@
 				 <&ccu CLK_TVE0>,
 				 <&ccu CLK_TCON_TV1>,
 				 <&ccu CLK_TVE1>,
-				 <&ccu CLK_DSI_DPHY>;
+				 <&ccu CLK_TCON_LCD0>;
 			clock-names = "bus",
 				      "tcon-tv0",
 				      "tve0",
 				      "tcon-tv1",
 				      "tve1",
-				      "dsi";
+				      "tcon-lcd0";
 			clock-output-names = "tcon-top-tv0",
 					     "tcon-top-tv1",
-					     "tcon-top-dsi";
+					     "tcon-top-lcd0";
 			resets = <&ccu RST_BUS_TCON_TOP>;
 			#clock-cells = <1>;
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index 465e9b0cdfee..e23c19f18986 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -205,11 +205,11 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 						     CLK_TCON_TOP_TV1);
 
 	if (quirks->has_dsi)
-		clk_data->hws[CLK_TCON_TOP_DSI] =
-			sun8i_tcon_top_register_gate(dev, "dsi", regs,
+		clk_data->hws[CLK_TCON_TOP_LCD0] =
+			sun8i_tcon_top_register_gate(dev, "tcon-lcd0", regs,
 						     &tcon_top->reg_lock,
 						     TCON_TOP_TCON_DSI_GATE,
-						     CLK_TCON_TOP_DSI);
+						     CLK_TCON_TOP_LCD0);
 
 	for (i = 0; i < CLK_NUM; i++)
 		if (IS_ERR(clk_data->hws[i])) {
diff --git a/include/dt-bindings/clock/sun8i-tcon-top.h b/include/dt-bindings/clock/sun8i-tcon-top.h
index 25164d767835..88de3f2ba335 100644
--- a/include/dt-bindings/clock/sun8i-tcon-top.h
+++ b/include/dt-bindings/clock/sun8i-tcon-top.h
@@ -6,6 +6,6 @@
 
 #define CLK_TCON_TOP_TV0	0
 #define CLK_TCON_TOP_TV1	1
-#define CLK_TCON_TOP_DSI	2
+#define CLK_TCON_TOP_LCD0	2
 
 #endif /* _DT_BINDINGS_CLOCK_SUN8I_TCON_TOP_H_ */
-- 
2.18.0.321.gffc6fa0e3
