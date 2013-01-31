From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: [PATCH 03/11] staging/iio: (iio_hwmon) Basic devicetree support
Date: Thu, 31 Jan 2013 13:43:00 -0800
Message-ID: <1359668588-13678-4-git-send-email-linux@roeck-us.net>
References: <1359668588-13678-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1359668588-13678-1-git-send-email-linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add 'iio-hwmon' OF compatibility table entry to enable OF matches.

Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
---
 drivers/staging/iio/iio_hwmon.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/iio/iio_hwmon.c b/drivers/staging/iio/iio_hwmon.c
index 7f260ea..6a5bc5f 100644
--- a/drivers/staging/iio/iio_hwmon.c
+++ b/drivers/staging/iio/iio_hwmon.c
@@ -165,10 +165,16 @@ static int iio_hwmon_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static struct of_device_id iio_hwmon_of_match[] = {
+	{ .compatible = "iio-hwmon", },
+	{ }
+};
+
 static struct platform_driver __refdata iio_hwmon_driver = {
 	.driver = {
 		.name = "iio_hwmon",
 		.owner = THIS_MODULE,
+		.of_match_table = iio_hwmon_of_match,
 	},
 	.probe = iio_hwmon_probe,
 	.remove = iio_hwmon_remove,
-- 
1.7.9.7
