From: Daniel Mack <zonque@gmail.com>
Subject: [PATCH 1/4] drivers: misc: ti_dac7512: drop module version
Date: Sun, 22 Sep 2013 21:51:46 +0200
Message-ID: <1379879509-3608-2-git-send-email-zonque@gmail.com>
References: <1379879509-3608-1-git-send-email-zonque@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1379879509-3608-1-git-send-email-zonque@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: broonie@kernel.org, devicetree@vger.kernel.org, Daniel Mack <zonque@gmail.com>
List-Id: devicetree@vger.kernel.org

Providing a module version doesn't add any value, so drop it.

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 drivers/misc/ti_dac7512.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/misc/ti_dac7512.c b/drivers/misc/ti_dac7512.c
index 9b23722..db47333 100644
--- a/drivers/misc/ti_dac7512.c
+++ b/drivers/misc/ti_dac7512.c
@@ -24,7 +24,6 @@
 #include <linux/spi/spi.h>
 
 #define DAC7512_DRV_NAME	"dac7512"
-#define DRIVER_VERSION		"1.0"
 
 static ssize_t dac7512_store_val(struct device *dev,
 				 struct device_attribute *attr,
@@ -89,4 +88,3 @@ module_spi_driver(dac7512_driver);
 MODULE_AUTHOR("Daniel Mack <daniel@caiaq.de>");
 MODULE_DESCRIPTION("DAC7512 16-bit DAC");
 MODULE_LICENSE("GPL v2");
-MODULE_VERSION(DRIVER_VERSION);
-- 
1.8.3.1
