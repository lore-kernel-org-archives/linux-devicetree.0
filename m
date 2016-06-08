From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v2 4/6] drm/panel: simple: Add support for Samsung LSN122DL01-C01 2560x1600 panel
Date: Wed,  8 Jun 2016 19:52:42 +0800
Message-ID: <1465386762-27816-1-git-send-email-ykk@rock-chips.com>
References: <1465386727-27647-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465386727-27647-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Yakir Yang <ykk@rock-chips.com>
List-Id: devicetree@vger.kernel.org

The Samsung LSN122DL01-C01 is an 12.2" 2560x1600 (WQXGA) TFT-LCD panel
connected using eDP interfaces.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
Changes in v2: None

 drivers/gpu/drm/panel/panel-simple.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 41020e1..067a5c4 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1246,6 +1246,28 @@ static const struct panel_desc qd43003c0_40 = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static const struct drm_display_mode samsung_lsn122dl01_c01_mode = {
+	.clock = 271560,
+	.hdisplay = 2560,
+	.hsync_start = 2560 + 48,
+	.hsync_end = 2560 + 48 + 32,
+	.htotal = 2560 + 48 + 32 + 80,
+	.vdisplay = 1600,
+	.vsync_start = 1600 + 2,
+	.vsync_end = 1600 + 2 + 5,
+	.vtotal = 1600 + 2 + 5 + 57,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc samsung_lsn122dl01_c01 = {
+	.modes = &samsung_lsn122dl01_c01_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 2560,
+		.height = 1600,
+	},
+};
+
 static const struct drm_display_mode samsung_ltn101nt05_mode = {
 	.clock = 54030,
 	.hdisplay = 1024,
@@ -1506,6 +1528,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "qiaodian,qd43003c0-40",
 		.data = &qd43003c0_40,
 	}, {
+		.compatible = "samsung,lsn122dl01-c01",
+		.data = &samsung_lsn122dl01_c01,
+	}, {
 		.compatible = "samsung,ltn101nt05",
 		.data = &samsung_ltn101nt05,
 	}, {
-- 
1.9.1
