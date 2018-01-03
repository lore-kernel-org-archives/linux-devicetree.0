From: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v5 1/5] media: ov5640: switch to gpiod_set_value_cansleep()
Date: Wed, 3 Jan 2018 10:57:28 +0100
Message-ID: <1514973452-10464-2-git-send-email-hugues.fruchet@st.com>
References: <1514973452-10464-1-git-send-email-hugues.fruchet@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1514973452-10464-1-git-send-email-hugues.fruchet-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Switch gpiod_set_value to gpiod_set_value_cansleep to avoid
warnings when powering sensor.

Signed-off-by: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
---
 drivers/media/i2c/ov5640.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index c89ed66..61071f5 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -1524,7 +1524,7 @@ static int ov5640_restore_mode(struct ov5640_dev *sensor)
 
 static void ov5640_power(struct ov5640_dev *sensor, bool enable)
 {
-	gpiod_set_value(sensor->pwdn_gpio, enable ? 0 : 1);
+	gpiod_set_value_cansleep(sensor->pwdn_gpio, enable ? 0 : 1);
 }
 
 static void ov5640_reset(struct ov5640_dev *sensor)
@@ -1532,7 +1532,7 @@ static void ov5640_reset(struct ov5640_dev *sensor)
 	if (!sensor->reset_gpio)
 		return;
 
-	gpiod_set_value(sensor->reset_gpio, 0);
+	gpiod_set_value_cansleep(sensor->reset_gpio, 0);
 
 	/* camera power cycle */
 	ov5640_power(sensor, false);
@@ -1540,10 +1540,10 @@ static void ov5640_reset(struct ov5640_dev *sensor)
 	ov5640_power(sensor, true);
 	usleep_range(5000, 10000);
 
-	gpiod_set_value(sensor->reset_gpio, 1);
+	gpiod_set_value_cansleep(sensor->reset_gpio, 1);
 	usleep_range(1000, 2000);
 
-	gpiod_set_value(sensor->reset_gpio, 0);
+	gpiod_set_value_cansleep(sensor->reset_gpio, 0);
 	usleep_range(5000, 10000);
 }
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
