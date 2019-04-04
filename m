From: Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v3 2/2] drm/panel: simple: Add KOE tx14d24vm1bpa display support (320x240)
Date: Thu,  4 Apr 2019 13:22:43 +0200
Message-ID: <20190404112243.9473-2-lukma@denx.de>
References: <20180412143715.6828-1-lukma@denx.de>
 <20190404112243.9473-1-lukma@denx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404112243.9473-1-lukma@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lukasz Majewski <lukma@denx.de>
List-Id: devicetree@vger.kernel.org

This commit adds support for KOE's 5.7" display.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
Reviewed-by: Rob Herring <robh@kernel.org>

---
Previous discussion (and Rob's Reviewed-by) about this patch
https://patchwork.kernel.org/patch/10339595/

It must have been lost during the development process, so
I do resend it now.

Changes for v3 :
- Rebase this patch on top of newest kernel (5.1-rc3):
  SHA1: 145f47c7381d43c789cbad55d4dbfd28fc6c46a4
- Split this patch to have separate Documentation entry
---
 drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9e8218f6a3f2..196c6adf8168 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1549,6 +1549,29 @@ static const struct panel_desc innolux_zj070na_01p = {
 	},
 };
 
+static const struct display_timing koe_tx14d24vm1bpa_timing = {
+	.pixelclock = { 5580000, 5850000, 6200000 },
+	.hactive = { 320, 320, 320 },
+	.hfront_porch = { 30, 30, 30 },
+	.hback_porch = { 30, 30, 30 },
+	.hsync_len = { 1, 5, 17 },
+	.vactive = { 240, 240, 240 },
+	.vfront_porch = { 6, 6, 6 },
+	.vback_porch = { 5, 5, 5 },
+	.vsync_len = { 1, 2, 11 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc koe_tx14d24vm1bpa = {
+	.timings = &koe_tx14d24vm1bpa_timing,
+	.num_timings = 1,
+	.bpc = 6,
+	.size = {
+		.width = 115,
+		.height = 86,
+	},
+};
+
 static const struct display_timing koe_tx31d200vm0baa_timing = {
 	.pixelclock = { 39600000, 43200000, 48000000 },
 	.hactive = { 1280, 1280, 1280 },
@@ -2680,6 +2703,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "innolux,zj070na-01p",
 		.data = &innolux_zj070na_01p,
 	}, {
+		.compatible = "koe,tx14d24vm1bpa",
+		.data = &koe_tx14d24vm1bpa,
+	}, {
 		.compatible = "koe,tx31d200vm0baa",
 		.data = &koe_tx31d200vm0baa,
 	}, {
-- 
2.11.0
