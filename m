From: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [RFC v2 PATCH 08/14] iio: iio_magn: Add event ops
Date: Fri, 27 Sep 2013 18:32:12 +0200
Message-ID: <1380299538-22047-9-git-send-email-l.czerwinski@samsung.com>
References: <1380299538-22047-1-git-send-email-l.czerwinski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1380299538-22047-1-git-send-email-l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org
Cc: denis.ciocca-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/iio/magnetometer/st_magn_core.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iio/magnetometer/st_magn_core.c b/drivers/iio/magnetometer/st_magn_core.c
index 4460075..1e212ad 100644
--- a/drivers/iio/magnetometer/st_magn_core.c
+++ b/drivers/iio/magnetometer/st_magn_core.c
@@ -343,6 +343,10 @@ static const struct iio_info magn_info = {
 	.attrs = &st_magn_attribute_group,
 	.read_raw = &st_magn_read_raw,
 	.write_raw = &st_magn_write_raw,
+	.read_event_value = &st_sensors_read_event_value,
+	.write_event_value = &st_sensors_write_event_value,
+	.read_event_config = &st_sensors_read_event_config,
+	.write_event_config = &st_sensors_write_event_config,
 };
 
 int st_magn_common_probe(struct iio_dev *indio_dev)
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
