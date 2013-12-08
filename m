From: Ben Gamari <bgamari.foss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/1] hwmon/adt7411: Add devicetree bindings
Date: Sun,  8 Dec 2013 14:58:38 -0500
Message-ID: <1386532718-13586-2-git-send-email-bgamari.foss@gmail.com>
References: <1386532718-13586-1-git-send-email-bgamari.foss@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386532718-13586-1-git-send-email-bgamari.foss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org
Cc: Ben Gamari <bgamari.foss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There isn't reallly any configuration necessary so the bindings are
consequently quite simple.

Signed-off-by: Ben Gamari <bgamari.foss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/hwmon/adt7411.txt | 11 +++++++++++
 drivers/hwmon/adt7411.c                             |  8 ++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adt7411.txt

diff --git a/Documentation/devicetree/bindings/hwmon/adt7411.txt b/Documentation/devicetree/bindings/hwmon/adt7411.txt
new file mode 100644
index 0000000..04ec1bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adt7411.txt
@@ -0,0 +1,11 @@
+ADT7411 (I2C)
+
+This device is a dual interface (I2C and SPI) 8-channel 10-bit ADC &
+temperature sensor. This driver currently only supports the I2C interface.
+
+Required properties:
+
+  - compatible : must be "analog,adt7411"
+  - reg : I2C bus address of the device
+  - #address-cells : must be <1>
+  - #size-cells : must be <0>
diff --git a/drivers/hwmon/adt7411.c b/drivers/hwmon/adt7411.c
index d9299de..ece2308 100644
--- a/drivers/hwmon/adt7411.c
+++ b/drivers/hwmon/adt7411.c
@@ -334,9 +334,17 @@ static const struct i2c_device_id adt7411_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, adt7411_id);
 
+static const struct of_device_id adt7411_dt_ids[] = {
+	{ .compatible = "analog,adt7411", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, adt7411_dt_ids);
+
 static struct i2c_driver adt7411_driver = {
 	.driver		= {
 		.name		= "adt7411",
+		.owner		= THIS_MODULE,
+		.of_match_table = adt7411_dt_ids,
 	},
 	.probe  = adt7411_probe,
 	.remove	= adt7411_remove,
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
