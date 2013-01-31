From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: [PATCH 02/11] staging/iio: (iio_hwmon) Add support for sysfs name attribute
Date: Thu, 31 Jan 2013 13:42:59 -0800
Message-ID: <1359668588-13678-3-git-send-email-linux@roeck-us.net>
References: <1359668588-13678-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1359668588-13678-1-git-send-email-linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The 'name' attribute is mandatory for hwmon devices.

Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
---
 drivers/staging/iio/iio_hwmon.c |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/iio_hwmon.c b/drivers/staging/iio/iio_hwmon.c
index 5456272..7f260ea 100644
--- a/drivers/staging/iio/iio_hwmon.c
+++ b/drivers/staging/iio/iio_hwmon.c
@@ -55,6 +55,14 @@ static ssize_t iio_hwmon_read_val(struct device *dev,
 	return sprintf(buf, "%d\n", result);
 }
 
+static ssize_t show_name(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	return sprintf(buf, "iio_hwmon\n");
+}
+
+static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
+
 static int iio_hwmon_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -77,7 +85,7 @@ static int iio_hwmon_probe(struct platform_device *pdev)
 		st->num_channels++;
 
 	st->attrs = devm_kzalloc(dev,
-				 sizeof(st->attrs) * (st->num_channels + 1),
+				 sizeof(st->attrs) * (st->num_channels + 2),
 				 GFP_KERNEL);
 	if (st->attrs == NULL) {
 		ret = -ENOMEM;
@@ -125,7 +133,7 @@ static int iio_hwmon_probe(struct platform_device *pdev)
 		a->index = i;
 		st->attrs[i] = &a->dev_attr.attr;
 	}
-
+	st->attrs[st->num_channels] = &dev_attr_name.attr;
 	st->attr_group.attrs = st->attrs;
 	platform_set_drvdata(pdev, st);
 	ret = sysfs_create_group(&dev->kobj, &st->attr_group);
-- 
1.7.9.7
