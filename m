From: Steve Twiss <stwiss.opensource@diasemi.com>
Subject: [PATCH V2] regulator: da9210: addition of device tree support
Date: Fri, 15 Jul 2016 10:29:41 +0100
Message-ID: <20160715093617.498003FBD7@swsrvapps-01.diasemi.com>
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

Updates for the regulator source file include an .of_match_table entry and
node match checking in the probe() function for a compatible da9210 string.

Minor binding documentation changes have been made to the title and the
example.

Tested-by: Steve Twiss <stwiss.opensource@diasemi.com>
Signed-off-by: Steve Twiss <stwiss.opensource@diasemi.com>

---
Checks performed with linux-next/v4.7-rc7/scripts/checkpatch.pl
 da9210-regulator.c        total: 0 errors, 0 warnings, 293 lines checked
 da9210.txt                total: 0 errors, 0 warnings, 29 lines checked

This patch applies against linux-next and v4.7-rc7

Change history from PATCH V1 to V2:
 - Removed .regulators_node and .of_match device tree entries from
   the driver regulator_desc;
 - Reverted the device tree properties back to the top level node;
 - Removed the need to extensively alter the binding document;

Hi All,

After Mark Brown's review I have reverted most of the device tree
changes and therefore most of the binding document updates.

An itemised list of the changes in this patch V2 are:

@ Mark/Liam,

Changes for regulator code: da9210-regulator.c
- Include header file clean-up.
- Addition of MODULE_DEVICE_TABLE() list and .of_match_table entry into
  struct i2c_driver, device tree match checking inside the probe() function 

@ Rob/Mark,

Changes for binding document: da9210.txt
- Title change to more accurately describe the Dialog part
- More verbose example 

Regards,
Steve


 .../devicetree/bindings/regulator/da9210.txt        | 12 ++++++++----
 drivers/regulator/da9210-regulator.c                | 21 +++++++++++++++++++--
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/da9210.txt b/Documentation/devicetree/bindings/regulator/da9210.txt
index 7aa9b1f..58065ca 100644
--- a/Documentation/devicetree/bindings/regulator/da9210.txt
+++ b/Documentation/devicetree/bindings/regulator/da9210.txt
@@ -1,4 +1,4 @@
-* Dialog Semiconductor DA9210 Voltage Regulator
+* Dialog Semiconductor DA9210 Multi-phase 12A DCDC BUCK Converter
 
 Required properties:
 
@@ -18,8 +18,12 @@ Example:
 		compatible = "dlg,da9210";
 		reg = <0x68>;
 
-		regulator-min-microvolt = <900000>;
-		regulator-max-microvolt = <1000000>;
+		interrupt-parent = <...>;
+		interrupts = <...>;
+
+		regulator-min-microvolt = <300000>;
+		regulator-max-microvolt = <1570000>;
+		regulator-min-microamp = <1600000>;
+		regulator-max-microamp = <4600000>;
 		regulator-boot-on;
-		regulator-always-on;
 	};
diff --git a/drivers/regulator/da9210-regulator.c b/drivers/regulator/da9210-regulator.c
index 01c0e37..d0496d6 100644
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
 
@@ -179,6 +178,13 @@ error_i2c:
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
@@ -188,6 +194,16 @@ static int da9210_i2c_probe(struct i2c_client *i2c,
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
@@ -264,6 +280,7 @@ MODULE_DEVICE_TABLE(i2c, da9210_i2c_id);
 static struct i2c_driver da9210_regulator_driver = {
 	.driver = {
 		.name = "da9210",
+		.of_match_table = of_match_ptr(da9210_dt_ids),
 	},
 	.probe = da9210_i2c_probe,
 	.id_table = da9210_i2c_id,
-- 
end-of-patch for PATCH V2
