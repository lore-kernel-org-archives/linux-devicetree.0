From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 08/20] drm/sun4i: rgb: panel is an error pointer
Date: Mon, 16 May 2016 14:47:08 +0200
Message-ID: <1463402840-17062-9-git-send-email-maxime.ripard@free-electrons.com>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

In case of an error, our pointer to the drm_panel structure attached to our
encoder will hold an error pointer, not a NULL pointer.

Make sure we check the right thing.

Fixes: 29e57fab97fc ("drm: sun4i: Add RGB output")
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/gpu/drm/sun4i/sun4i_rgb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index 923f55039cb1..b46d2c15dc95 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -217,7 +217,7 @@ int sun4i_rgb_init(struct drm_device *drm)
 	int ret;
 
 	/* If we don't have a panel, there's no point in going on */
-	if (!tcon->panel)
+	if (IS_ERR(tcon->panel))
 		return -ENODEV;
 
 	rgb = devm_kzalloc(drm->dev, sizeof(*rgb), GFP_KERNEL);
-- 
2.8.2

