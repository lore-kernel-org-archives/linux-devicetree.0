From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 1/2] drm/omap: panel-tpo-td028ttec1: add backlight support
Date: Sat, 19 Jan 2019 19:21:30 +0100
Message-ID: <20190119182131.9341-2-andreas@kemnade.info>
References: <20190119182131.9341-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190119182131.9341-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: tomi.valkeinen@ti.com, airlied@linux.ie, daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, sre@kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

This panel has a backlight, so fetch it from devicetree using the
as documented in panel-common.txt. It is implemented the same way as in
panel-dpi.c
This ensures the backlight is also disabled when the display is
turned off like when doing xset dpms force off.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c    | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c b/drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c
index 7ddc8c574a61..f326ba9dcf62 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c
@@ -35,6 +35,8 @@ struct panel_drv_data {
 
 	struct videomode vm;
 
+	struct backlight_device *backlight;
+
 	struct spi_device *spi_dev;
 };
 
@@ -268,6 +270,8 @@ static int td028ttec1_panel_enable(struct omap_dss_device *dssdev)
 
 	r |= jbt_ret_write_0(ddata, JBT_REG_DISPLAY_ON);
 
+	backlight_enable(ddata->backlight);
+
 	dssdev->state = OMAP_DSS_DISPLAY_ACTIVE;
 
 transfer_err:
@@ -283,6 +287,8 @@ static void td028ttec1_panel_disable(struct omap_dss_device *dssdev)
 	if (!omapdss_device_is_enabled(dssdev))
 		return;
 
+	backlight_disable(ddata->backlight);
+
 	dev_dbg(dssdev->dev, "td028ttec1_panel_disable()\n");
 
 	jbt_ret_write_0(ddata, JBT_REG_DISPLAY_OFF);
@@ -321,6 +327,15 @@ static int td028ttec1_panel_probe(struct spi_device *spi)
 
 	dev_dbg(&spi->dev, "%s\n", __func__);
 
+	ddata = devm_kzalloc(&spi->dev, sizeof(*ddata), GFP_KERNEL);
+	if (ddata == NULL)
+		return -ENOMEM;
+
+	ddata->backlight = devm_of_find_backlight(&spi->dev);
+
+	if (IS_ERR(ddata->backlight))
+		return PTR_ERR(ddata->backlight);
+
 	spi->bits_per_word = 9;
 	spi->mode = SPI_MODE_3;
 
@@ -330,9 +345,6 @@ static int td028ttec1_panel_probe(struct spi_device *spi)
 		return r;
 	}
 
-	ddata = devm_kzalloc(&spi->dev, sizeof(*ddata), GFP_KERNEL);
-	if (ddata == NULL)
-		return -ENOMEM;
 
 	dev_set_drvdata(&spi->dev, ddata);
 
-- 
2.11.0
