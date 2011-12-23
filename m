From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] staging:iio: isl29018: add of_match table for device-tree probing
Date: Thu, 22 Dec 2011 18:44:43 -0800
Message-ID: <1324608283-3128-1-git-send-email-olof@lixom.net>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As simple as can be right now; just one ID and no custom properties to parse.

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 drivers/staging/iio/light/isl29018.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/iio/light/isl29018.c b/drivers/staging/iio/light/isl29018.c
index 849d6a5..38ec52b 100644
--- a/drivers/staging/iio/light/isl29018.c
+++ b/drivers/staging/iio/light/isl29018.c
@@ -592,11 +592,18 @@ static const struct i2c_device_id isl29018_id[] = {
 
 MODULE_DEVICE_TABLE(i2c, isl29018_id);
 
+static const struct of_device_id isl29018_of_match[] = {
+	{ .compatible = "invn,isl29018", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, isl29018_of_match);
+
 static struct i2c_driver isl29018_driver = {
 	.class	= I2C_CLASS_HWMON,
 	.driver	 = {
 			.name = "isl29018",
 			.owner = THIS_MODULE,
+			.of_match_table = isl29018_of_match,
 		    },
 	.probe	 = isl29018_probe,
 	.remove	 = __devexit_p(isl29018_remove),
-- 
1.7.8.GIT
