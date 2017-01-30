From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: [PATCHv2 11/16] ov2640: allow use inside em28xx
Date: Mon, 30 Jan 2017 15:06:23 +0100
Message-ID: <20170130140628.18088-12-hverkuil@xs4all.nl>
References: <20170130140628.18088-1-hverkuil@xs4all.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170130140628.18088-1-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Guennadi Liakhovetski <guennadi.liakhovetski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
---
 drivers/media/i2c/Kconfig  |  2 +-
 drivers/media/i2c/ov2640.c | 14 +++++---------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 159ef64..1859783 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -522,7 +522,7 @@ config VIDEO_SMIAPP_PLL
 
 config VIDEO_OV2640
 	tristate "OmniVision OV2640 sensor support"
-	depends on VIDEO_V4L2 && I2C
+	depends on GPIOLIB && VIDEO_V4L2 && I2C
 	depends on MEDIA_CAMERA_SUPPORT
 	help
 	  This is a Video4Linux2 sensor-level driver for the OmniVision
diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
index 565742b..bd96889 100644
--- a/drivers/media/i2c/ov2640.c
+++ b/drivers/media/i2c/ov2640.c
@@ -1031,15 +1031,11 @@ static int ov2640_probe(struct i2c_client *client,
 		return -ENOMEM;
 	}
 
-	priv->clk = clk_get(&client->dev, "xvclk");
-	if (IS_ERR(priv->clk))
-		return -EPROBE_DEFER;
-	clk_prepare_enable(priv->clk);
-
-	if (!client->dev.of_node) {
-		dev_err(&client->dev, "Missing platform_data for driver\n");
-		ret = -EINVAL;
-		goto err_clk;
+	if (client->dev.of_node) {
+		priv->clk = clk_get(&client->dev, "xvclk");
+		if (IS_ERR(priv->clk))
+			return -EPROBE_DEFER;
+		clk_prepare_enable(priv->clk);
 	}
 
 	ret = ov2640_init_gpio(client, priv);
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
