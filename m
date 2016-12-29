From: Matt Ranostay <matt-sk+viVC6FLCDq+mSdOJa79kegs52MxvZ@public.gmane.org>
Subject: [PATCH v2 2/2] iio: pulsedlight-lidar-lite-v2: add lidar-lite-v3 property
Date: Wed, 28 Dec 2016 21:13:06 -0800
Message-ID: <20161229051306.28547-2-matt@ranostay.consulting>
References: <20161229051306.28547-1-matt@ranostay.consulting>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161229051306.28547-1-matt-sk+viVC6FLCDq+mSdOJa79kegs52MxvZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Matt Ranostay <matt-sk+viVC6FLCDq+mSdOJa79kegs52MxvZ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Matt Ranostay <matt-sk+viVC6FLCDq+mSdOJa79kegs52MxvZ@public.gmane.org>
---
Changes from v1:
* switch to using Garmin stock ticker

 drivers/iio/proximity/pulsedlight-lidar-lite-v2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/proximity/pulsedlight-lidar-lite-v2.c b/drivers/iio/proximity/pulsedlight-lidar-lite-v2.c
index 1fa9eefa0982..20c16a08c9d9 100644
--- a/drivers/iio/proximity/pulsedlight-lidar-lite-v2.c
+++ b/drivers/iio/proximity/pulsedlight-lidar-lite-v2.c
@@ -326,12 +326,14 @@ static int lidar_remove(struct i2c_client *client)
 
 static const struct i2c_device_id lidar_id[] = {
 	{"lidar-lite-v2", 0},
+	{"lidar-lite-v3", 0},
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, lidar_id);
 
 static const struct of_device_id lidar_dt_ids[] = {
 	{ .compatible = "pulsedlight,lidar-lite-v2" },
+	{ .compatible = "grmn,lidar-lite-v3" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lidar_dt_ids);
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
