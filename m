From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 03/11] drm/sun4i: backend: Remove BGRX8888 from list of supported formats
Date: Fri, 25 Jan 2019 11:23:06 +0800
Message-ID: <20190125032314.20915-4-wens@csie.org>
References: <20190125032314.20915-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125032314.20915-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The display backend does not support BGRX8888. There is also no trace
of this in the original list of supported formats before the commit
b636d3f97d04 ("drm/sun4i: frontend: Add support for the BGRX8888 input
format"). Nor do the backend configuration helpers handle this format.

Remove BGRX8888 from list of supported formats by the backend.

Fixes: 3d4265f89d06 ("drm/sun4i: backend: Add a helper and a list for supported formats")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index c17ec850b614..85e64d02fb5f 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -141,7 +141,6 @@ static const uint32_t sun4i_backend_formats[] = {
 	DRM_FORMAT_ARGB1555,
 	DRM_FORMAT_ARGB4444,
 	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_BGRX8888,
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_RGB888,
 	DRM_FORMAT_RGBA4444,
-- 
2.20.1
