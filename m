From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 1/9] drm/panel: simple: add a macro for defining display modes in a simpler and less error prone way
Date: Wed, 11 Oct 2017 13:23:33 +0200
Message-ID: <1507721021-28174-2-git-send-email-LW@KARO-electronics.de>
References: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

Create a macro that eases the definition of display mode parameters by
accecpting the parameters:
freq, hactive, hfront-porch, hsynclen, hback-porch,
vactive, vfront-porch, vsynclen, vback-porch, vrefresh
that can be usually directly taken from an LCD datasheet.

Put the calculations that are now open coded repeating the same
parameters multiple times into the macro expansion.

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 474fa75..dec639d 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -411,6 +411,20 @@ static const struct panel_desc ampire_am_480272h3tmqw_t01h = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+#define SP_DISPLAY_MODE(freq, ha, hfp, hs, hbp, va, vfp, vs, vbp, vr, flgs) { \
+	.clock = freq,							\
+	.hdisplay = ha,							\
+	.hsync_start = (ha) + (hfp),					\
+	.hsync_end = (ha) + (hfp) + (hs),				\
+	.htotal = (ha) + (hfp) + (hs) + (hbp),				\
+	.vdisplay = (va),						\
+	.vsync_start = (va) + (vfp),					\
+	.vsync_end = (va) + (vfp) + (vs),				\
+	.vtotal = (va) + (vfp) + (vs) + (vbp),				\
+	.vrefresh = vr,							\
+	.flags = flgs,							\
+	}
+
 static const struct drm_display_mode ampire_am800480r3tmqwa1h_mode = {
 	.clock = 33333,
 	.hdisplay = 800,
-- 
2.1.4
