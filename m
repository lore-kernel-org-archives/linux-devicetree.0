From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 1/4] mfd: tps65090: add DT support for tps65090
Date: Tue, 29 Jan 2013 14:35:15 +0530
Message-ID: <1359450318-24912-2-git-send-email-ldewangan@nvidia.com>
References: <1359450318-24912-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1359450318-24912-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree support for the TI PMIC TPS65090.
The device can be registered through platform or DT.

Add device tree binding document for this device.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes from V1: 
- Remove non-required code from the change for checking the match.
- Remove pdata allocation on mfd driver.
- renames some of the property as suggested by Stephen.
- Rebased the changes on 20130128.

 .../devicetree/bindings/regulator/tps65090.txt     |  122 ++++++++++++++++++++
 drivers/mfd/tps65090.c                             |   22 +++-
 2 files changed, 141 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/tps65090.txt

diff --git a/Documentation/devicetree/bindings/regulator/tps65090.txt b/Documentation/devicetree/bindings/regulator/tps65090.txt
new file mode 100644
index 0000000..313a60b
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/tps65090.txt
@@ -0,0 +1,122 @@
+TPS65090 regulators
+
+Required properties:
+- compatible: "ti,tps65090"
+- reg: I2C slave address
+- interrupts: the interrupt outputs of the controller
+- regulators: A node that houses a sub-node for each regulator within the
+  device. Each sub-node is identified using the node's name, with valid
+  values listed below. The content of each sub-node is defined by the
+  standard binding for regulators; see regulator.txt.
+  dcdc[1-3], fet[1-7] and ldo[1-2] respectively.
+- vsys[1-3]-supply: The input supply for DCDC[1-3] respectively.
+- infet[1-7]-supply: The input supply for FET[1-7] respectively.
+- vsys-l[1-2]-supply: The input supply for LDO[1-2] respectively.
+
+Optional properties:
+- ti,enable-ext-control: This is applicable for DCDC1, DCDC2 and DCDC3.
+  If DCDCs are externally controlled then this property should be there.
+- "dcdc-ext-control-gpios: This is applicable for DCDC1, DCDC2 and DCDC3.
+  If DCDCs are externally controlled and if it is from GPIO then GPIO
+  number should be provided. If it is externally controlled and no GPIO
+  entry then driver will just configure this rails as external control
+  and will not provide any enable/disable APIs.
+
+Each regulator is defined using the standard binding for regulators.
+
+Example:
+
+	tps65090@48 {
+		compatible = "ti,tps65090";
+		reg = <0x48>;
+		interrupts = <0 88 0x4>;
+
+		vsys1-supply = <&some_reg>;
+		vsys2-supply = <&some_reg>;
+		vsys3-supply = <&some_reg>;
+		infet1-supply = <&some_reg>;
+		infet2-supply = <&some_reg>;
+		infet3-supply = <&some_reg>;
+		infet4-supply = <&some_reg>;
+		infet5-supply = <&some_reg>;
+		infet6-supply = <&some_reg>;
+		infet7-supply = <&some_reg>;
+		vsys_l1-supply = <&some_reg>;
+		vsys_l2-supply = <&some_reg>;
+
+		regulators {
+			dcdc1 {
+				regulator-name = "dcdc1";
+				regulator-boot-on;
+				regulator-always-on;
+				ti,enable-ext-control;
+				dcdc-ext-control-gpios = <&gpio 10 0>;
+			};
+
+			dcdc2 {
+				regulator-name = "dcdc2";
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			dcdc3 {
+				regulator-name = "dcdc3";
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			fet1 {
+				regulator-name = "fet1";
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			fet2 {
+				regulator-name = "fet2";
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			fet3 {
+				regulator-name = "fet3";
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			fet4 {
+				regulator-name = "fet4";
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			fet5 {
+				regulator-name = "fet5";
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			fet6 {
+				regulator-name = "fet6";
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			fet7 {
+				regulator-name = "fet7";
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1 {
+				regulator-name = "ldo1";
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2 {
+				regulator-name = "ldo2";
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
index 8d12a8e..b496545 100644
--- a/drivers/mfd/tps65090.c
+++ b/drivers/mfd/tps65090.c
@@ -25,6 +25,8 @@
 #include <linux/i2c.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/tps65090.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/err.h>
 
 #define NUM_INT_REG 2
@@ -148,18 +150,31 @@ static const struct regmap_config tps65090_regmap_config = {
 	.volatile_reg = is_volatile_reg,
 };
 
+#ifdef CONFIG_OF
+static const struct of_device_id tps65090_of_match[] = {
+	{ .compatible = "ti,tps65090",},
+	{},
+};
+MODULE_DEVICE_TABLE(of, tps65090_of_match);
+#endif
+
 static int tps65090_i2c_probe(struct i2c_client *client,
 					const struct i2c_device_id *id)
 {
 	struct tps65090_platform_data *pdata = client->dev.platform_data;
+	int irq_base = 0;
 	struct tps65090 *tps65090;
 	int ret;
 
-	if (!pdata) {
-		dev_err(&client->dev, "tps65090 requires platform data\n");
+	if (!pdata && !client->dev.of_node) {
+		dev_err(&client->dev,
+			"tps65090 requires platform data or of_node\n");
 		return -EINVAL;
 	}
 
+	if (pdata)
+		irq_base = pdata->irq_base;
+
 	tps65090 = devm_kzalloc(&client->dev, sizeof(*tps65090), GFP_KERNEL);
 	if (!tps65090) {
 		dev_err(&client->dev, "mem alloc for tps65090 failed\n");
@@ -178,7 +193,7 @@ static int tps65090_i2c_probe(struct i2c_client *client,
 
 	if (client->irq) {
 		ret = regmap_add_irq_chip(tps65090->rmap, client->irq,
-			IRQF_ONESHOT | IRQF_TRIGGER_LOW, pdata->irq_base,
+			IRQF_ONESHOT | IRQF_TRIGGER_LOW, irq_base,
 			&tps65090_irq_chip, &tps65090->irq_data);
 			if (ret) {
 				dev_err(&client->dev,
@@ -247,6 +262,7 @@ static struct i2c_driver tps65090_driver = {
 	.driver	= {
 		.name	= "tps65090",
 		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(tps65090_of_match),
 		.pm	= &tps65090_pm_ops,
 	},
 	.probe		= tps65090_i2c_probe,
-- 
1.7.1.1
