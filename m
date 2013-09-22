From: Daniel Mack <zonque@gmail.com>
Subject: [PATCH 2/4] drivers: misc: ti_dac7512: drop DAC7512_DRV_NAME
Date: Sun, 22 Sep 2013 21:51:47 +0200
Message-ID: <1379879509-3608-3-git-send-email-zonque@gmail.com>
References: <1379879509-3608-1-git-send-email-zonque@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1379879509-3608-1-git-send-email-zonque@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: broonie@kernel.org, devicetree@vger.kernel.org, Daniel Mack <zonque@gmail.com>
List-Id: devicetree@vger.kernel.org

The driver's name can be provided directly, so drop the #define.

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 drivers/misc/ti_dac7512.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/misc/ti_dac7512.c b/drivers/misc/ti_dac7512.c
index db47333..46dfbf3 100644
--- a/drivers/misc/ti_dac7512.c
+++ b/drivers/misc/ti_dac7512.c
@@ -23,8 +23,6 @@
 #include <linux/init.h>
 #include <linux/spi/spi.h>
 
-#define DAC7512_DRV_NAME	"dac7512"
-
 static ssize_t dac7512_store_val(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -76,7 +74,7 @@ static int dac7512_remove(struct spi_device *spi)
 
 static struct spi_driver dac7512_driver = {
 	.driver = {
-		.name	= DAC7512_DRV_NAME,
+		.name	= "dac7512",
 		.owner	= THIS_MODULE,
 	},
 	.probe	= dac7512_probe,
-- 
1.8.3.1
