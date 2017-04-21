From: Anders Darander <anders-7UjN0b3lYz2SbKU13Z4Etw@public.gmane.org>
Subject: [PATCH 1/2] gpio: move tca9554 from pcf857x to pca953x
Date: Fri, 21 Apr 2017 14:46:30 +0200
Message-ID: <20170421124631.19269-1-anders@chargestorm.se>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Anders Darander <anders-7UjN0b3lYz2SbKU13Z4Etw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The TCA9554 doesn't work with the pcf857x driver, trying to change the direction
gives a NAK bailout error.

TCA9554 is similar to the PCA9554, thus change the driver.

Signed-off-by: Anders Darander <anders-7UjN0b3lYz2SbKU13Z4Etw@public.gmane.org>
---
 drivers/gpio/Kconfig        | 2 +-
 drivers/gpio/gpio-pca953x.c | 1 +
 drivers/gpio/gpio-pcf857x.c | 2 --
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 05043071fc98..684f887173e9 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -753,7 +753,7 @@ config GPIO_PCA953X
 	  4 bits:	pca9536, pca9537
 
 	  8 bits:	max7310, max7315, pca6107, pca9534, pca9538, pca9554,
-			pca9556, pca9557, pca9574, tca6408, xra1202
+			pca9556, pca9557, pca9574, tca6408, tca9554, xra1202
 
 	  16 bits:	max7312, max7313, pca9535, pca9539, pca9555, pca9575,
 			tca6416
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index d44232aadb6c..13d895264fc8 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -81,6 +81,7 @@ static const struct i2c_device_id pca953x_id[] = {
 	{ "tca6416", 16 | PCA953X_TYPE | PCA_INT, },
 	{ "tca6424", 24 | PCA953X_TYPE | PCA_INT, },
 	{ "tca9539", 16 | PCA953X_TYPE | PCA_INT, },
+	{ "tca9554", 8  | PCA953X_TYPE | PCA_INT, },
 	{ "xra1202", 8  | PCA953X_TYPE },
 	{ }
 };
diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 895af42a4513..8ddf9302ce3b 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -46,7 +46,6 @@ static const struct i2c_device_id pcf857x_id[] = {
 	{ "pca9675", 16 },
 	{ "max7328", 8 },
 	{ "max7329", 8 },
-	{ "tca9554", 8 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcf857x_id);
@@ -66,7 +65,6 @@ static const struct of_device_id pcf857x_of_table[] = {
 	{ .compatible = "nxp,pca9675" },
 	{ .compatible = "maxim,max7328" },
 	{ .compatible = "maxim,max7329" },
-	{ .compatible = "ti,tca9554" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcf857x_of_table);
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
