From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 04/11] drm/sun4i: layer: Assign backend pointer before calling DRM helpers
Date: Fri, 25 Jan 2019 11:23:07 +0800
Message-ID: <20190125032314.20915-5-wens@csie.org>
References: <20190125032314.20915-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125032314.20915-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We might want to use the backend pointer from DRM callbacks that get
called within drm_universal_plane_init(), such as the
.format_mod_supported callback.

Move the assignment of the layer's backend pointer to right after the
structure is allocated.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/gpu/drm/sun4i/sun4i_layer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/sun4i_layer.c
index c5a999ca1d72..95d4aaa51a5c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_layer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
@@ -182,6 +182,8 @@ static struct sun4i_layer *sun4i_layer_init_one(struct drm_device *drm,
 	if (!layer)
 		return ERR_PTR(-ENOMEM);
 
+	layer->backend = backend;
+
 	/* possible crtcs are set later */
 	ret = drm_universal_plane_init(drm, &layer->plane, 0,
 				       &sun4i_backend_layer_funcs,
@@ -195,7 +197,6 @@ static struct sun4i_layer *sun4i_layer_init_one(struct drm_device *drm,
 
 	drm_plane_helper_add(&layer->plane,
 			     &sun4i_backend_layer_helper_funcs);
-	layer->backend = backend;
 
 	drm_plane_create_alpha_property(&layer->plane);
 	drm_plane_create_zpos_property(&layer->plane, 0, 0,
-- 
2.20.1
