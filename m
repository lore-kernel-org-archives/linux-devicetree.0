From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v2 2/2] tps6586x: Add device tree support
Date: Thu, 26 Apr 2012 16:52:21 +0200
Message-ID: <1335451941-26333-2-git-send-email-thierry.reding@avionic-design.de>
References: <1335451941-26333-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1335451941-26333-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit adds device tree support for the TPS6586x regulator.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 .../devicetree/bindings/regulator/tps6586x.txt     |   97 ++++++++++++++++++++
 drivers/mfd/tps6586x.c                             |   86 +++++++++++++++++
 drivers/regulator/tps6586x-regulator.c             |    1 +
 include/linux/mfd/tps6586x.h                       |    1 +
 4 files changed, 185 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/tps6586x.txt

diff --git a/Documentation/devicetree/bindings/regulator/tps6586x.txt b/Documentation/devicetree/bindings/regulator/tps6586x.txt
new file mode 100644
index 0000000..0fcabaa3
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/tps6586x.txt
@@ -0,0 +1,97 @@
+TPS6586x family of regulators
+
+Required properties:
+- compatible: "ti,tps6586x"
+- reg: I2C slave address
+- interrupts: the interrupt outputs of the controller
+- #gpio-cells: number of cells to describe a GPIO
+- gpio-controller: mark the device as a GPIO controller
+- regulators: list of regulators provided by this controller, must be named
+  after their hardware counterparts: sm[0-2], ldo[0-9] and ldo_rtc
+
+Each regulator is defined using the standard binding for regulators.
+
+Example:
+
+	pmu: tps6586x@34 {
+		compatible = "ti,tps6586x";
+		reg = <0x34>;
+		interrupts = <0 88 0x4>;
+
+		#gpio-cells = <2>;
+		gpio-controller;
+
+		regulators {
+			sm0_reg: sm0 {
+				regulator-min-microvolt = < 725000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			sm1_reg: sm1 {
+				regulator-min-microvolt = < 725000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			sm2_reg: sm2 {
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <4550000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo0_reg: ldo0 {
+				regulator-name = "PCIE CLK";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			ldo1_reg: ldo1 {
+				regulator-min-microvolt = < 725000>;
+				regulator-max-microvolt = <1500000>;
+			};
+
+			ldo2_reg: ldo2 {
+				regulator-min-microvolt = < 725000>;
+				regulator-max-microvolt = <1500000>;
+			};
+
+			ldo3_reg: ldo3 {
+				regulator-min-microvolt = <1250000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			ldo4_reg: ldo4 {
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <2475000>;
+			};
+
+			ldo5_reg: ldo5 {
+				regulator-min-microvolt = <1250000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			ldo6_reg: ldo6 {
+				regulator-min-microvolt = <1250000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			ldo7_reg: ldo7 {
+				regulator-min-microvolt = <1250000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			ldo8_reg: ldo8 {
+				regulator-min-microvolt = <1250000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			ldo9_reg: ldo9 {
+				regulator-min-microvolt = <1250000>;
+				regulator-max-microvolt = <3300000>;
+			};
+		};
+	};
diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index a5ddf31..c84b550 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -23,6 +23,7 @@
 #include <linux/slab.h>
 #include <linux/gpio.h>
 #include <linux/i2c.h>
+#include <linux/regulator/of_regulator.h>
 
 #include <linux/mfd/core.h>
 #include <linux/mfd/tps6586x.h>
@@ -460,6 +461,7 @@ static int __devinit tps6586x_add_subdevs(struct tps6586x *tps6586x,
 
 		pdev->dev.parent = tps6586x->dev;
 		pdev->dev.platform_data = subdev->platform_data;
+		pdev->dev.of_node = subdev->of_node;
 
 		ret = platform_device_add(pdev);
 		if (ret) {
@@ -474,6 +476,86 @@ failed:
 	return ret;
 }
 
+#ifdef CONFIG_OF
+static struct of_regulator_match tps6586x_matches[] = {
+	{ .name = "sm0",     .driver_data = (void *)TPS6586X_ID_SM_0    },
+	{ .name = "sm1",     .driver_data = (void *)TPS6586X_ID_SM_1    },
+	{ .name = "sm2",     .driver_data = (void *)TPS6586X_ID_SM_2    },
+	{ .name = "ldo0",    .driver_data = (void *)TPS6586X_ID_LDO_0   },
+	{ .name = "ldo1",    .driver_data = (void *)TPS6586X_ID_LDO_1   },
+	{ .name = "ldo2",    .driver_data = (void *)TPS6586X_ID_LDO_2   },
+	{ .name = "ldo3",    .driver_data = (void *)TPS6586X_ID_LDO_3   },
+	{ .name = "ldo4",    .driver_data = (void *)TPS6586X_ID_LDO_4   },
+	{ .name = "ldo5",    .driver_data = (void *)TPS6586X_ID_LDO_5   },
+	{ .name = "ldo6",    .driver_data = (void *)TPS6586X_ID_LDO_6   },
+	{ .name = "ldo7",    .driver_data = (void *)TPS6586X_ID_LDO_7   },
+	{ .name = "ldo8",    .driver_data = (void *)TPS6586X_ID_LDO_8   },
+	{ .name = "ldo9",    .driver_data = (void *)TPS6586X_ID_LDO_9   },
+	{ .name = "ldo_rtc", .driver_data = (void *)TPS6586X_ID_LDO_RTC },
+};
+
+static struct tps6586x_platform_data *tps6586x_parse_dt(struct i2c_client *client)
+{
+	const unsigned int num = ARRAY_SIZE(tps6586x_matches);
+	struct device_node *np = client->dev.of_node;
+	struct tps6586x_platform_data *pdata;
+	struct tps6586x_subdev_info *devs;
+	struct device_node *regs;
+	unsigned int count;
+	unsigned int i, j;
+	int err;
+
+	regs = of_find_node_by_name(np, "regulators");
+	if (!regs)
+		return NULL;
+
+	err = of_regulator_match(&client->dev, regs, tps6586x_matches, num);
+	if (err < 0) {
+		of_node_put(regs);
+		return NULL;
+	}
+
+	of_node_put(regs);
+	count = err;
+
+	devs = devm_kzalloc(&client->dev, count * sizeof(*devs), GFP_KERNEL);
+	if (!devs)
+		return NULL;
+
+	for (i = 0, j = 0; i < num && j < count; i++) {
+		if (!tps6586x_matches[i].init_data)
+			continue;
+
+		devs[j].name = "tps6586x-regulator";
+		devs[j].platform_data = tps6586x_matches[i].init_data;
+		devs[j].id = (int)tps6586x_matches[i].driver_data;
+		devs[j].of_node = tps6586x_matches[i].of_node;
+		j++;
+	}
+
+	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return NULL;
+
+	pdata->num_subdevs = count;
+	pdata->subdevs = devs;
+	pdata->gpio_base = -1;
+	pdata->irq_base = -1;
+
+	return pdata;
+}
+
+static struct of_device_id tps6586x_of_match[] = {
+	{ .compatible = "ti,tps6586x", },
+	{ },
+};
+#else
+static struct tps6586x_platform_data *tps6586x_parse_dt(struct i2c_client *client)
+{
+	return NULL;
+}
+#endif
+
 static int __devinit tps6586x_i2c_probe(struct i2c_client *client,
 					const struct i2c_device_id *id)
 {
@@ -481,6 +563,9 @@ static int __devinit tps6586x_i2c_probe(struct i2c_client *client,
 	struct tps6586x *tps6586x;
 	int ret;
 
+	if (!pdata && client->dev.of_node)
+		pdata = tps6586x_parse_dt(client);
+
 	if (!pdata) {
 		dev_err(&client->dev, "tps6586x requires platform data\n");
 		return -ENOTSUPP;
@@ -573,6 +658,7 @@ static struct i2c_driver tps6586x_driver = {
 	.driver	= {
 		.name	= "tps6586x",
 		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(tps6586x_of_match),
 	},
 	.probe		= tps6586x_i2c_probe,
 	.remove		= __devexit_p(tps6586x_i2c_remove),
diff --git a/drivers/regulator/tps6586x-regulator.c b/drivers/regulator/tps6586x-regulator.c
index 9a4029a..c0a2145 100644
--- a/drivers/regulator/tps6586x-regulator.c
+++ b/drivers/regulator/tps6586x-regulator.c
@@ -363,6 +363,7 @@ static int __devinit tps6586x_regulator_probe(struct platform_device *pdev)
 		return err;
 
 	config.dev = &pdev->dev;
+	config.of_node = pdev->dev.of_node;
 	config.init_data = pdev->dev.platform_data;
 	config.driver_data = ri;
 
diff --git a/include/linux/mfd/tps6586x.h b/include/linux/mfd/tps6586x.h
index b19176e..f350fd0 100644
--- a/include/linux/mfd/tps6586x.h
+++ b/include/linux/mfd/tps6586x.h
@@ -68,6 +68,7 @@ struct tps6586x_subdev_info {
 	int		id;
 	const char	*name;
 	void		*platform_data;
+	struct device_node *of_node;
 };
 
 struct tps6586x_platform_data {
-- 
1.7.10
