From: Robert Chiras <robert.chiras@nxp.com>
Subject: [PATCH v3 15/15] drm/mxsfb: Add support for live pixel format change
Date: Wed, 21 Aug 2019 13:15:55 +0300
Message-ID: <1566382555-12102-16-git-send-email-robert.chiras@nxp.com>
References: <1566382555-12102-1-git-send-email-robert.chiras@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566382555-12102-1-git-send-email-robert.chiras@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This IP requires full stop and re-start when changing display timings,
but we can change the pixel format while running.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_crtc.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
index 317575e..5607fc0 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
@@ -494,6 +494,7 @@ void mxsfb_plane_atomic_update(struct mxsfb_drm_private *mxsfb,
 	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_plane_state *new_state = pipe->plane.state;
 	struct drm_framebuffer *fb = pipe->plane.state->fb;
+	struct drm_framebuffer *old_fb = state->fb;
 	struct drm_pending_vblank_event *event;
 	u32 fb_addr, src_off, src_w, stride, cpp = 0;
 
@@ -510,7 +511,7 @@ void mxsfb_plane_atomic_update(struct mxsfb_drm_private *mxsfb,
 	}
 	spin_unlock_irq(&crtc->dev->event_lock);
 
-	if (!fb)
+	if (!fb || !old_fb)
 		return;
 
 	fb_addr = mxsfb_get_fb_paddr(mxsfb);
@@ -533,4 +534,17 @@ void mxsfb_plane_atomic_update(struct mxsfb_drm_private *mxsfb,
 		src_w = new_state->src_w >> 16;
 		mxsfb_set_fb_hcrop(mxsfb, src_w, stride);
 	}
+
+	if (old_fb->format->format != fb->format->format) {
+		struct drm_format_name_buf old_fmt_buf;
+		struct drm_format_name_buf new_fmt_buf;
+
+		DRM_DEV_DEBUG_DRIVER(crtc->dev->dev,
+				"Switching pixel format: %s -> %s\n",
+				drm_get_format_name(old_fb->format->format,
+						    &old_fmt_buf),
+				drm_get_format_name(fb->format->format,
+						    &new_fmt_buf));
+		mxsfb_set_pixel_fmt(mxsfb, true);
+	}
 }
-- 
2.7.4
