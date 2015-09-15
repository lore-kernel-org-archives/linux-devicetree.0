From: Thomas Elste <thomas.elste-cSCHQGRfioA@public.gmane.org>
Subject: [PATCH] regulator: tps65023: add device tree support
Date: Tue, 15 Sep 2015 15:33:55 +0200
Message-ID: <1442324035-16414-2-git-send-email-thomas.elste@imms.de>
References: <1442324035-16414-1-git-send-email-thomas.elste@imms.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442324035-16414-1-git-send-email-thomas.elste-cSCHQGRfioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree based initialization support for tps65023 regulators.
Add device tree binding document for tps65023 regulators.

Signed-off-by: Thomas Elste <thomas.elste-cSCHQGRfioA@public.gmane.org>
---
 .../devicetree/bindings/regulator/tps65023.txt     | 58 +++++++++++++++
 drivers/regulator/tps65023-regulator.c             | 83 +++++++++++++++++++++-
 2 files changed, 139 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/tps65023.txt

diff --git a/Documentation/devicetree/bindings/regulator/tps65023.txt b/Documentation/devicetree/bindings/regulator/tps65023.txt
new file mode 100644
index 0000000..bdd0d96
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/tps65023.txt
@@ -0,0 +1,58 @@
+TPS65023 family of regulators
+
+Required properties:
+- compatible: Must be one of the following.
+	"ti,tps65020",
+	"ti,tps65021",
+	"ti,tps65023",
+- reg: I2C slave address
+- regulators: list of regulators provided by this controller, must be named
+  after their hardware counterparts: VDCDC[1-3] and LDO[1-2]
+- regulators: This is the list of child nodes that specify the regulator
+  initialization data for defined regulators. The definition for each of
+  these nodes is defined using the standard binding for regulators found at
+  Documentation/devicetree/bindings/regulator/regulator.txt.
+
+Example:
+
+	tps65023@48 {
+		compatible = "ti,tps65023";
+		reg = <0x48>;
+
+		regulators {
+			VDCDC1 {
+				regulator-name = "vdd_mpu";
+				regulator-always-on;
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			VDCDC2 {
+				regulator-name = "vdd_core";
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			VDCDC3 {
+				regulator-name = "vdd_io";
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			LDO1 {
+				regulator-name = "vdd_usb18";
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			LDO2 {
+				regulator-name = "vdd_usb33";
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+			};
+		};
+	};
diff --git a/drivers/regulator/tps65023-regulator.c b/drivers/regulator/tps65023-regulator.c
index 5cc19b4..5247d23 100644
--- a/drivers/regulator/tps65023-regulator.c
+++ b/drivers/regulator/tps65023-regulator.c
@@ -19,9 +19,12 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/err.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/regmap.h>
@@ -199,6 +202,63 @@ static const struct regmap_config tps65023_regmap_config = {
 	.val_bits = 8,
 };
 
+static const struct of_device_id tps65023_of_match[] = {
+	{ .compatible = "ti,tps65020"},
+	{ .compatible = "ti,tps65021"},
+	{ .compatible = "ti,tps65023"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, tps65023_of_match);
+
+static struct of_regulator_match tps65023_matches[] = {
+	{ .name = "VDCDC1"},
+	{ .name = "VDCDC2"},
+	{ .name = "VDCDC3"},
+	{ .name = "LDO1"},
+	{ .name = "LDO2"},
+};
+
+static struct regulator_init_data*
+	of_get_tps65023_platform_data(struct device *dev)
+{
+	struct regulator_init_data *reg_data;
+	struct device_node *np = dev->of_node;
+	struct device_node *regulators;
+	struct of_regulator_match *matches;
+	int idx, count, ret;
+
+	regulators = of_get_child_by_name(np, "regulators");
+	if (!regulators) {
+		dev_err(dev, "Regulator node not found\n");
+		return NULL;
+	}
+
+	count = ARRAY_SIZE(tps65023_matches);
+	matches = tps65023_matches;
+
+	ret = of_regulator_match(dev, regulators, matches, count);
+	of_node_put(regulators);
+	if (ret < 0) {
+		dev_err(dev, "Error parsing regulator init data: %d\n", ret);
+		return NULL;
+	}
+
+	reg_data = devm_kzalloc(dev, sizeof(*reg_data) *
+			TPS65023_NUM_REGULATOR, GFP_KERNEL);
+	if (!reg_data)
+		return NULL;
+
+	for (idx = 0; idx < count; idx++) {
+		if (!matches[idx].init_data || !matches[idx].of_node)
+			continue;
+
+		memcpy(&reg_data[idx], matches[idx].init_data,
+				sizeof(struct regulator_init_data));
+	}
+
+	return reg_data;
+}
+
 static int tps_65023_probe(struct i2c_client *client,
 				     const struct i2c_device_id *id)
 {
@@ -211,13 +271,31 @@ static int tps_65023_probe(struct i2c_client *client,
 	int i;
 	int error;
 
+	if (client->dev.of_node) {
+		const struct of_device_id *match;
+
+		match = of_match_device(of_match_ptr(tps65023_of_match),
+				&client->dev);
+		if (!match) {
+			dev_err(&client->dev, "No device match found\n");
+			return -ENODEV;
+		}
+	}
+
 	/**
 	 * init_data points to array of regulator_init structures
 	 * coming from the board-evm file.
 	 */
 	init_data = dev_get_platdata(&client->dev);
-	if (!init_data)
-		return -EIO;
+
+	/* if not provided by board file, check for OF entry */
+	if (IS_ENABLED(CONFIG_OF) && !init_data && client->dev.of_node)
+		init_data = of_get_tps65023_platform_data(&client->dev);
+
+	if (!init_data) {
+		dev_err(&client->dev, "No platform data\n");
+		return -EINVAL;
+	}
 
 	tps = devm_kzalloc(&client->dev, sizeof(*tps), GFP_KERNEL);
 	if (!tps)
@@ -410,6 +488,7 @@ MODULE_DEVICE_TABLE(i2c, tps_65023_id);
 static struct i2c_driver tps_65023_i2c_driver = {
 	.driver = {
 		.name = "tps65023",
+		.of_match_table = of_match_ptr(tps65023_of_match),
 	},
 	.probe = tps_65023_probe,
 	.id_table = tps_65023_id,
-- 
2.3.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
