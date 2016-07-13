From: Steve Twiss <stwiss.opensource@diasemi.com>
Subject: [PATCH V1] regulator: da9210: addition of device tree support
Date: Wed, 13 Jul 2016 16:41:19 +0100
Message-ID: <20160713154433.496843FAD9@swsrvapps-01.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: DEVICETREE <devicetree@vger.kernel.org>, LINUXKERNEL <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Support Opensource <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

From: Steve Twiss <stwiss.opensource@diasemi.com>

Addition of device tree support for DA9210.

Two files are modified, the driver source file and the binding document.
Updates for the regulator source file include an .of_match_table entry, node
match checking in the probe() function for a compatible da9210 string, and
a new "BUCK" regulator entry. The binding documentation changes have been
made to reflect these updates.

Signed-off-by: Steve Twiss <stwiss.opensource@diasemi.com>
Tested-by: Steve Twiss <stwiss.opensource@diasemi.com>

---
Checks performed with linux-next/v4.7-rc7/scripts/checkpatch.pl
 da9210-regulator.c        total: 0 errors, 0 warnings, 295 lines checked
 da9210.txt                total: 0 errors, 0 warnings, 40 lines checked

This patch applies against linux-next and v4.7-rc7

Hi All,

Looking at previous similar submissions, it seems to be okay to put
both regulator and documentation changes in the same patch.

An itemised list of the changes in this patch V1 are:

@ Mark/Liam,

Changes for regulator code: da9210-regulator.c
- Include header file clean-up.
- New .of_match "BUCK" and .regulators_node entries in the regulator_desc
- Addition of MODULE_DEVICE_TABLE() list and .of_match_table entry into
  struct i2c_driver, device tree match checking inside the probe() function 

@ Rob/Mark,

Changes for binding document: da9210.txt
- Title change to more accurately describe the part
- Addition of a regulators description
- More verbose example for new regulator node "BUCK"

Regards,
Steve


 .../devicetree/bindings/regulator/da9210.txt       | 27 +++++++++++++++++-----
 drivers/regulator/da9210-regulator.c               | 23 ++++++++++++++++--
 2 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/da9210.txt b/Documentation/devicetree/bindings/regulator/da9210.txt
index 7aa9b1f..fe9dc7e 100644
--- a/Documentation/devicetree/bindings/regulator/da9210.txt
+++ b/Documentation/devicetree/bindings/regulator/da9210.txt
@@ -1,9 +1,15 @@
-* Dialog Semiconductor DA9210 Voltage Regulator
+* Dialog Semiconductor DA9210 Multi-phase 12A DCDC BUCK Converter
 
 Required properties:
 
 - compatible:	must be "dlg,da9210"
 - reg:		the i2c slave address of the regulator. It should be 0x68.
+- regulators:	a sub-node identified using the node's name, with valid values
+		listed below. The content of the sub-node is defined by the
+		standard binding for regulators, see regulator.txt.
+
+The valid name for regulator is:
+	BUCK
 
 Optional properties:
 
@@ -14,12 +20,21 @@ DCDC.
 
 Example:
 
-	da9210@68 {
+	pmic0 da9210@68 {
 		compatible = "dlg,da9210";
 		reg = <0x68>;
 
-		regulator-min-microvolt = <900000>;
-		regulator-max-microvolt = <1000000>;
-		regulator-boot-on;
-		regulator-always-on;
+		interrupt-parent = <...>;
+		interrupts = <...>;
+
+		regulators {
+			da9210_buck: BUCK {
+				regulator-name = "BUCK";
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1570000>;
+				regulator-min-microamp = <1600000>;
+				regulator-max-microamp = <4600000>;
+				regulator-boot-on;
+			};
+		};
 	};
diff --git a/drivers/regulator/da9210-regulator.c b/drivers/regulator/da9210-regulator.c
index 01c0e37..41a4d96 100644
--- a/drivers/regulator/da9210-regulator.c
+++ b/drivers/regulator/da9210-regulator.c
@@ -21,12 +21,11 @@
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
-#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/slab.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
+#include <linux/of_device.h>
 #include <linux/regulator/of_regulator.h>
 #include <linux/regmap.h>
 
@@ -72,6 +71,8 @@ static const struct regulator_desc da9210_reg = {
 	.name = "DA9210",
 	.id = 0,
 	.ops = &da9210_buck_ops,
+	.of_match = of_match_ptr("BUCK"),
+	.regulators_node = of_match_ptr("regulators"),
 	.type = REGULATOR_VOLTAGE,
 	.n_voltages = ((DA9210_MAX_MV - DA9210_MIN_MV) / DA9210_STEP_MV) + 1,
 	.min_uV = (DA9210_MIN_MV * 1000),
@@ -179,6 +180,13 @@ error_i2c:
 /*
  * I2C driver interface functions
  */
+
+static const struct of_device_id da9210_dt_ids[] = {
+	{ .compatible = "dlg,da9210", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, da9210_dt_ids);
+
 static int da9210_i2c_probe(struct i2c_client *i2c,
 			    const struct i2c_device_id *id)
 {
@@ -188,6 +196,16 @@ static int da9210_i2c_probe(struct i2c_client *i2c,
 	struct regulator_dev *rdev = NULL;
 	struct regulator_config config = { };
 	int error;
+	const struct of_device_id *match;
+
+	if (i2c->dev.of_node && !pdata) {
+		match = of_match_device(of_match_ptr(da9210_dt_ids),
+						&i2c->dev);
+		if (!match) {
+			dev_err(&i2c->dev, "Error: No device match found\n");
+			return -ENODEV;
+		}
+	}
 
 	chip = devm_kzalloc(&i2c->dev, sizeof(struct da9210), GFP_KERNEL);
 	if (!chip)
@@ -264,6 +282,7 @@ MODULE_DEVICE_TABLE(i2c, da9210_i2c_id);
 static struct i2c_driver da9210_regulator_driver = {
 	.driver = {
 		.name = "da9210",
+		.of_match_table = of_match_ptr(da9210_dt_ids),
 	},
 	.probe = da9210_i2c_probe,
 	.id_table = da9210_i2c_id,
-- 
end-of-patch for PATCH V1
