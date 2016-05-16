From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 06/20] drm/sun4i: allow dclk to modify its parent rate
Date: Mon, 16 May 2016 14:47:06 +0200
Message-ID: <1463402840-17062-7-git-send-email-maxime.ripard@free-electrons.com>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

The pixel clock being only a divider of its parent clock, depending on the
resolution, it's expected to change its parent rate. Add that flag so that
the clock framework knows it.

Fixes: 9026e0d122ac ("drm: Add Allwinner A10 Display Engine support")
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/gpu/drm/sun4i/sun4i_dotclock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_dotclock.c b/drivers/gpu/drm/sun4i/sun4i_dotclock.c
index 1ddf6d7a7107..5b3463197c48 100644
--- a/drivers/gpu/drm/sun4i/sun4i_dotclock.c
+++ b/drivers/gpu/drm/sun4i/sun4i_dotclock.c
@@ -170,6 +170,7 @@ int sun4i_dclk_create(struct device *dev, struct sun4i_tcon *tcon)
 	init.ops = &sun4i_dclk_ops;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
+	init.flags = CLK_SET_RATE_PARENT;
 
 	dclk->regmap = tcon->regs;
 	dclk->hw.init = &init;
-- 
2.8.2

