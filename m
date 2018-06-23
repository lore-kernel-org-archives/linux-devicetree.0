Return-Path: <SRS0=78dS=JJ=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 2/4] input: touchscreen: eeti: add device tree matching table
Date: Sat, 23 Jun 2018 17:45:31 +0200
Message-Id: <20180623154533.26901-3-daniel@zonque.org>
In-Reply-To: <20180623154533.26901-1-daniel@zonque.org>
References: <20180623154533.26901-1-daniel@zonque.org>
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

Provide a match table so that the driver can be used in devicetree setups.
More properties are added in a later patch.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/input/touchscreen/eeti_ts.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/input/touchscreen/eeti_ts.c b/drivers/input/touchscreen/eeti_ts.c
index 2facad75eb6d..cc4fd33f9d6d 100644
--- a/drivers/input/touchscreen/eeti_ts.c
+++ b/drivers/input/touchscreen/eeti_ts.c
@@ -32,6 +32,7 @@
 #include <linux/i2c.h>
 #include <linux/timer.h>
 #include <linux/gpio/consumer.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <asm/unaligned.h>
 
@@ -262,10 +263,18 @@ static const struct i2c_device_id eeti_ts_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, eeti_ts_id);
 
+#ifdef CONFIG_OF
+static const struct of_device_id of_eeti_ts_match[] = {
+	{ .compatible = "eeti,exc3000-i2c", },
+	{ }
+};
+#endif
+
 static struct i2c_driver eeti_ts_driver = {
 	.driver = {
 		.name = "eeti_ts",
 		.pm = &eeti_ts_pm,
+		.of_match_table = of_match_ptr(of_eeti_ts_match),
 	},
 	.probe = eeti_ts_probe,
 	.id_table = eeti_ts_id,
-- 
2.17.1
