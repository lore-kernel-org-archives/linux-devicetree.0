Return-Path: <SRS0=ZUED=VJ=pengutronix.de=l.stach@kernel.org>
From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH] Input: atmel_mxt_ts - allow specification of config name
Date: Fri, 12 Jul 2019 15:53:38 +0200
Message-Id: <20190712135338.6211-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Nick Dyer <nick@shmanahar.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, patchwork-lst@pengutronix.de, Chris Healy <cphealy@gmail.com>
List-ID: <devicetree@vger.kernel.org>

From: Nick Dyer <nick@shmanahar.org>

Some systems require different touchscreen configurations depending on the
populated touchscreen. To allow different configs to co-exist in the file
system we need a way to tell the driver, which config should be loaded.

Signed-off-by: Nick Dyer <nick@shmanahar.org>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
lst:
- switch to property name to not use underscore
- Add more elaborate commit message
---
 Documentation/devicetree/bindings/input/atmel,maxtouch.txt | 3 +++
 drivers/input/touchscreen/atmel_mxt_ts.c                   | 6 +++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
index c88919480d37..dd2c278824b8 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
@@ -31,6 +31,9 @@ Optional properties for main touchpad device:
 
 - reset-gpios: GPIO specifier for the touchscreen's reset pin (active low)
 
+- atmel,cfg-name: Provide name of configuration file in OBP_RAW format. This
+    will be downloaded from the firmware loader on probe to the device.
+
 Example:
 
 	touch@4b {
diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 19378f200c63..c37c5ab8d847 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -318,6 +318,7 @@ struct mxt_data {
 	struct t7_config t7_cfg;
 	struct mxt_dbg dbg;
 	struct gpio_desc *reset_gpio;
+	const char *cfg_name;
 
 	/* Cached parameters from object table */
 	u16 T5_address;
@@ -2151,7 +2152,8 @@ static int mxt_initialize(struct mxt_data *data)
 	if (error)
 		return error;
 
-	error = request_firmware_nowait(THIS_MODULE, true, MXT_CFG_NAME,
+	error = request_firmware_nowait(THIS_MODULE, true,
+					data->cfg_name ? : MXT_CFG_NAME,
 					&client->dev, GFP_KERNEL, data,
 					mxt_config_cb);
 	if (error) {
@@ -3015,6 +3017,8 @@ static int mxt_parse_device_properties(struct mxt_data *data)
 		data->t19_num_keys = n_keys;
 	}
 
+	device_property_read_string(dev, "atmel,cfg-name", &data->cfg_name);
+
 	return 0;
 }
 
-- 
2.20.1
