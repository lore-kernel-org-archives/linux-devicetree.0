From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v14 27/28] ov13858: Add support for flash and lens devices
Date: Tue, 26 Sep 2017 01:25:39 +0300
Message-ID: <20170925222540.371-29-sakari.ailus@linux.intel.com>
References: <20170925222540.371-1-sakari.ailus@linux.intel.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170925222540.371-1-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: niklas.soderlund@ragnatech.se, maxime.ripard@free-electrons.com, robh@kernel.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org, pavel@ucw.cz, sre@kernel.org
List-Id: devicetree@vger.kernel.org

Parse async sub-devices related to the sensor by switching the async
sub-device registration function.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov13858.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index af7af0d14c69..c86525982e17 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1746,7 +1746,7 @@ static int ov13858_probe(struct i2c_client *client,
 		goto error_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev(&ov13858->sd);
+	ret = v4l2_async_register_subdev_sensor_common(&ov13858->sd);
 	if (ret < 0)
 		goto error_media_entity;
 
-- 
2.11.0
