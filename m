From: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [RFC v2 PATCH 09/14] iio: st_gyro: Add event ops
Date: Fri, 27 Sep 2013 18:32:13 +0200
Message-ID: <1380299538-22047-10-git-send-email-l.czerwinski@samsung.com>
References: <1380299538-22047-1-git-send-email-l.czerwinski@samsung.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1380299538-22047-1-git-send-email-l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org
Cc: denis.ciocca-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/iio/gyro/st_gyro_core.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iio/gyro/st_gyro_core.c b/drivers/iio/gyro/st_gyro_core.c
index 42f45af..6a41836 100644
--- a/drivers/iio/gyro/st_gyro_core.c
+++ b/drivers/iio/gyro/st_gyro_core.c
@@ -290,6 +290,10 @@ static const struct iio_info gyro_info = {
 	.attrs = &st_gyro_attribute_group,
 	.read_raw = &st_gyro_read_raw,
 	.write_raw = &st_gyro_write_raw,
+	.read_event_value = &st_sensors_read_event_value,
+	.write_event_value = &st_sensors_write_event_value,
+	.read_event_config = &st_sensors_read_event_config,
+	.write_event_config = &st_sensors_write_event_config,
 };
 
 #ifdef CONFIG_IIO_TRIGGER
-- 
1.7.9.5
