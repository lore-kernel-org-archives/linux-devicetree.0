From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v4 04/11] drm/sun4i: Add support for A64 mixers
Date: Tue,  4 Sep 2018 12:40:46 +0800
Message-ID: <20180904044053.15425-5-icenowy@aosc.io>
References: <20180904044053.15425-1-icenowy@aosc.io>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180904044053.15425-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Jagan Teki <jagan@amarulasolutions.com>, Jernej Skrabec <jernej.skrabec@siol.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

From: Jagan Teki <jagan@amarulasolutions.com>

Mixers in Allwinner have similar capabilities as others SoCs with DE2.

Add support for them.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
[Icenowy: Add mixer1]
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
Changes for v4:
- none
Changes for v3.1:
- Add mixer0
Changes for v3:
- none 
Changes for v2:
- New patch

 drivers/gpu/drm/sun4i/sun8i_mixer.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index cb65b0ed53fd..091f6cf40353 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -553,6 +553,22 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 	.mod_rate = 150000000,
 };
 
+static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
+	.ccsc		= 0,
+	.mod_rate	= 297000000,
+	.scaler_mask	= 0xf,
+	.ui_num		= 3,
+	.vi_num		= 1,
+};
+
+static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
+	.ccsc		= 1,
+	.mod_rate	= 297000000,
+	.scaler_mask	= 0x3,
+	.ui_num		= 1,
+	.vi_num		= 1,
+};
+
 static const struct of_device_id sun8i_mixer_of_table[] = {
 	{
 		.compatible = "allwinner,sun8i-a83t-de2-mixer-0",
@@ -570,6 +586,14 @@ static const struct of_device_id sun8i_mixer_of_table[] = {
 		.compatible = "allwinner,sun8i-v3s-de2-mixer",
 		.data = &sun8i_v3s_mixer_cfg,
 	},
+	{
+		.compatible = "allwinner,sun50i-a64-de2-mixer-0",
+		.data = &sun50i_a64_mixer0_cfg,
+	},
+	{
+		.compatible = "allwinner,sun50i-a64-de2-mixer-1",
+		.data = &sun50i_a64_mixer1_cfg,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_mixer_of_table);
-- 
2.18.0
