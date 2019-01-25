From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 05/11] drm/sun4i: layer: support just backend formats when frontend is unavailable
Date: Fri, 25 Jan 2019 11:23:08 +0800
Message-ID: <20190125032314.20915-6-wens@csie.org>
References: <20190125032314.20915-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125032314.20915-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In some cases, such as running a new kernel with an old device tree that
has the frontend disabled, the backend's matching frontend might be
unavailable.

When this happens, the layers should only declare support for formats
that the backend support. This partially reverts commit 1c29d263f624
("drm/sun4i: Rename sun4i_backend_layer_formats to sun4i_layer_formats")
by bringing back sun4i_backend_layer_formats, and passing it to
drm_universal_plane_init, while also dropping the modifiers list,
in the event no frontend is available.

Fixes: b636d3f97d04 ("drm/sun4i: frontend: Add support for the BGRX8888 input format")
Fixes: 9afe52d54bb0 ("drm/sun4i: frontend: Add support for semi-planar YUV input formats")
Fixes: 8c8152bf4db6 ("drm/sun4i: frontend: Add support for planar YUV input formats")
Fixes: b2ddf277ab5e ("drm/sun4i: layer: Add tiled modifier support and helper")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/gpu/drm/sun4i/sun4i_layer.c | 34 ++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_layer.c b/drivers/gpu/drm/sun4i/sun4i_layer.c
index 95d4aaa51a5c..a514fe88d441 100644
--- a/drivers/gpu/drm/sun4i/sun4i_layer.c
+++ b/drivers/gpu/drm/sun4i/sun4i_layer.c
@@ -117,6 +117,11 @@ static void sun4i_backend_layer_atomic_update(struct drm_plane *plane,
 static bool sun4i_layer_format_mod_supported(struct drm_plane *plane,
 					     uint32_t format, uint64_t modifier)
 {
+	struct sun4i_layer *layer = plane_to_sun4i_layer(plane);
+
+	if (IS_ERR_OR_NULL(layer->backend->frontend))
+		sun4i_backend_format_is_supported(format, modifier);
+
 	return sun4i_backend_format_is_supported(format, modifier) ||
 	       sun4i_frontend_format_is_supported(format, modifier);
 }
@@ -165,6 +170,21 @@ static const uint32_t sun4i_layer_formats[] = {
 	DRM_FORMAT_YVYU,
 };
 
+static const uint32_t sun4i_backend_layer_formats[] = {
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_RGBA5551,
+	DRM_FORMAT_RGBA4444,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_VYUY,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+};
+
 static const uint64_t sun4i_layer_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_ALLWINNER_TILED,
@@ -175,6 +195,9 @@ static struct sun4i_layer *sun4i_layer_init_one(struct drm_device *drm,
 						struct sun4i_backend *backend,
 						enum drm_plane_type type)
 {
+	const uint64_t *modifiers = sun4i_layer_modifiers;
+	const uint32_t *formats = sun4i_layer_formats;
+	unsigned int formats_len = ARRAY_SIZE(sun4i_layer_formats);
 	struct sun4i_layer *layer;
 	int ret;
 
@@ -184,12 +207,17 @@ static struct sun4i_layer *sun4i_layer_init_one(struct drm_device *drm,
 
 	layer->backend = backend;
 
+	if (IS_ERR_OR_NULL(backend->frontend)) {
+		formats = sun4i_backend_layer_formats;
+		formats_len = ARRAY_SIZE(sun4i_backend_layer_formats);
+		modifiers = NULL;
+	}
+
 	/* possible crtcs are set later */
 	ret = drm_universal_plane_init(drm, &layer->plane, 0,
 				       &sun4i_backend_layer_funcs,
-				       sun4i_layer_formats,
-				       ARRAY_SIZE(sun4i_layer_formats),
-				       sun4i_layer_modifiers, type, NULL);
+				       formats, formats_len,
+				       modifiers, type, NULL);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't initialize layer\n");
 		return ERR_PTR(ret);
-- 
2.20.1
