From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] touchscreen: sun4i-ts: Do not report
 -EAGAIN from tempzone callback
Date: Sun,  8 Mar 2015 21:53:41 +0100
Message-ID: <1425848022-18001-3-git-send-email-hdegoede@redhat.com>
References: <1425848022-18001-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBZPN6KTQKGQEUINFMBY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1425848022-18001-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Returning -EAGAIN while waiting for the first temperature ready interrupt,
causes the tempzone core to log the following errors:

[    1.219353] thermal thermal_zone0: failed to read out thermal zone 0
[    2.015433] thermal thermal_zone0: failed to read out thermal zone 0
[    2.416737] thermal thermal_zone0: failed to read out thermal zone 0

So instead of returning -EAGAIN, return an intial temperature estimate of
40 degrees, and a success status.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/input/touchscreen/sun4i-ts.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/sun4i-ts.c b/drivers/input/touchscreen/sun4i-ts.c
index 66ccd5a..d641b12 100644
--- a/drivers/input/touchscreen/sun4i-ts.c
+++ b/drivers/input/touchscreen/sun4i-ts.c
@@ -189,12 +189,7 @@ static void sun4i_ts_close(struct input_dev *dev)
 
 static int sun4i_get_temp(const struct sun4i_ts_data *ts, long *temp)
 {
-	/* No temp_data until the first irq */
-	if (ts->temp_data == -1)
-		return -EAGAIN;
-
 	*temp = (ts->temp_data - ts->temp_offset) * ts->temp_step;
-
 	return 0;
 }
 
@@ -212,11 +207,8 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
 {
 	struct sun4i_ts_data *ts = dev_get_drvdata(dev);
 	long temp;
-	int error;
 
-	error = sun4i_get_temp(ts, &temp);
-	if (error)
-		return error;
+	sun4i_get_temp(ts, &temp);
 
 	return sprintf(buf, "%ld\n", temp);
 }
@@ -253,7 +245,7 @@ static int sun4i_ts_probe(struct platform_device *pdev)
 
 	ts->dev = dev;
 	ts->ignore_fifo_data = true;
-	ts->temp_data = -1;
+
 	if (of_device_is_compatible(np, "allwinner,sun6i-a31-ts")) {
 		/* Allwinner SDK has temperature = -271 + (value / 6) (C) */
 		ts->temp_offset = 1626;
@@ -283,6 +275,13 @@ static int sun4i_ts_probe(struct platform_device *pdev)
 		ts->temp_step = 100;
 	}
 
+	/*
+	 * Start by reporting 40 degrees as temperature, this avoids
+	 * "thermal_zone: failed to read out thermal zone" errors while
+	 * waiting for the first temp ready irq.
+	 */
+	ts->temp_data = ts->temp_offset + 40000 / ts->temp_step;
+
 	ts_attached = of_property_read_bool(np, "allwinner,ts-attached");
 	if (ts_attached) {
 		ts->input = devm_input_allocate_device(dev);
-- 
2.3.1
