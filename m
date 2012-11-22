From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH V3 3/3] mfd: stmpe: Update DT support in stmpe driver
Date: Fri, 23 Nov 2012 00:26:20 +0530
Message-ID: <7a48ae364663ab3a336251fada9aee07ccd728b8.1353610437.git.viresh.kumar@linaro.org>
References: <57384ebc52c7d39d1bae31ba3baa6f820b4ac696.1353610436.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <57384ebc52c7d39d1bae31ba3baa6f820b4ac696.1353610436.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
In-Reply-To: <57384ebc52c7d39d1bae31ba3baa6f820b4ac696.1353610436.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
References: <57384ebc52c7d39d1bae31ba3baa6f820b4ac696.1353610436.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Vipul Kumar Samar <vipulkumar.samar-qxv4g6HH51o@public.gmane.org>

This patch extends existing DT support for stmpe devices. This updates:
- DT support from stmpe SPI and I2C drivers
- missing header files in stmpe.c
- stmpe_of_probe() with pwm, rotator and new bindings.
- Bindings are updated in binding document.

Signed-off-by: Vipul Kumar Samar <vipulkumar.samar-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
V2->V3:
------
- Removed sub-modules DT bindings from this patch
- Retain original work done by Lee Jones

 Documentation/devicetree/bindings/mfd/stmpe.txt | 12 ++++++++----
 drivers/mfd/stmpe-i2c.c                         | 15 +++++++++++++++
 drivers/mfd/stmpe-spi.c                         | 15 +++++++++++++++
 drivers/mfd/stmpe.c                             | 21 +++++++++++++++------
 4 files changed, 53 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/stmpe.txt b/Documentation/devicetree/bindings/mfd/stmpe.txt
index 8f0aeda..8f65c8d 100644
--- a/Documentation/devicetree/bindings/mfd/stmpe.txt
+++ b/Documentation/devicetree/bindings/mfd/stmpe.txt
@@ -1,13 +1,17 @@
-* STMPE Multi-Functional Device
+* ST Microelectronics STMPE Multi-Functional Device
+
+STMPE is an MFD device which may expose following inbuilt devices: gpio, keypad,
+touchscreen, adc, pwm, rotator.
 
 Required properties:
- - compatible                   : "st,stmpe[811|1601|2401|2403]"
- - reg                          : I2C address of the device
+ - compatible                   : "st,stmpe[610|801|811|1601|2401|2403]"
+ - reg                          : I2C/SPI address of the device
 
 Optional properties:
  - interrupts                   : The interrupt outputs from the controller
- - interrupt-controller         : Marks the device node as an interrupt controller
  - interrupt-parent             : Specifies which IRQ controller we're connected to
+ - irq-trigger			: IRQ trigger to use for the interrupt to the host
+ - irq-invert-polarity		: bool, IRQ line is connected with reversed polarity
  - i2c-client-wake              : Marks the input device as wakable
  - st,autosleep-timeout         : Valid entries (ms); 4, 16, 32, 64, 128, 256, 512 and 1024
 
diff --git a/drivers/mfd/stmpe-i2c.c b/drivers/mfd/stmpe-i2c.c
index c734dc3..003c49b 100644
--- a/drivers/mfd/stmpe-i2c.c
+++ b/drivers/mfd/stmpe-i2c.c
@@ -13,6 +13,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/types.h>
 #include "stmpe.h"
 
@@ -81,6 +82,19 @@ static const struct i2c_device_id stmpe_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, stmpe_id);
 
+#ifdef CONFIG_OF
+static const struct of_device_id stmpe_dt_ids[] = {
+	{ .compatible = "st,stmpe610", .data = &stmpe_i2c_id[0], },
+	{ .compatible = "st,stmpe801", .data = &stmpe_i2c_id[1], },
+	{ .compatible = "st,stmpe811", .data = &stmpe_i2c_id[2], },
+	{ .compatible = "st,stmpe1601", .data = &stmpe_i2c_id[3], },
+	{ .compatible = "st,stmpe2401", .data = &stmpe_i2c_id[4], },
+	{ .compatible = "st,stmpe2403", .data = &stmpe_i2c_id[5], },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, stmpe_dt_ids);
+#endif
+
 static struct i2c_driver stmpe_i2c_driver = {
 	.driver = {
 		.name = "stmpe-i2c",
@@ -88,6 +102,7 @@ static struct i2c_driver stmpe_i2c_driver = {
 #ifdef CONFIG_PM
 		.pm = &stmpe_dev_pm_ops,
 #endif
+		.of_match_table = of_match_ptr(stmpe_dt_ids),
 	},
 	.probe		= stmpe_i2c_probe,
 	.remove		= __devexit_p(stmpe_i2c_remove),
diff --git a/drivers/mfd/stmpe-spi.c b/drivers/mfd/stmpe-spi.c
index f86e3fc..e482f5f 100644
--- a/drivers/mfd/stmpe-spi.c
+++ b/drivers/mfd/stmpe-spi.c
@@ -10,6 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/spi/spi.h>
 #include <linux/types.h>
 #include "stmpe.h"
@@ -119,6 +120,19 @@ static const struct spi_device_id stmpe_spi_id[] = {
 };
 MODULE_DEVICE_TABLE(spi, stmpe_id);
 
+#ifdef CONFIG_OF
+static const struct of_device_id stmpe_dt_ids[] = {
+	{ .compatible = "st,stmpe610", .data = (void *)STMPE610, },
+	{ .compatible = "st,stmpe801", .data = (void *)STMPE801, },
+	{ .compatible = "st,stmpe811", .data = (void *)STMPE811, },
+	{ .compatible = "st,stmpe1601", .data = (void *)STMPE1601, },
+	{ .compatible = "st,stmpe2401", .data = (void *)STMPE2401, },
+	{ .compatible = "st,stmpe2403", .data = (void *)STMPE2403, },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, stmpe_dt_ids);
+#endif
+
 static struct spi_driver stmpe_spi_driver = {
 	.driver = {
 		.name	= "stmpe-spi",
@@ -126,6 +140,7 @@ static struct spi_driver stmpe_spi_driver = {
 #ifdef CONFIG_PM
 		.pm	= &stmpe_dev_pm_ops,
 #endif
+		.of_match_table = of_match_ptr(stmpe_dt_ids),
 	},
 	.probe		= stmpe_spi_probe,
 	.remove		= __devexit_p(stmpe_spi_remove),
diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 6086481..e2c0dda 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -7,6 +7,7 @@
  * Author: Rabin Vincent <rabin.vincent-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org> for ST-Ericsson
  */
 
+#include <linux/err.h>
 #include <linux/export.h>
 #include <linux/gpio.h>
 #include <linux/interrupt.h>
@@ -14,6 +15,8 @@
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/mfd/core.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
 #include "stmpe.h"
@@ -1028,18 +1031,24 @@ void __devinit stmpe_of_probe(struct stmpe_platform_data *pdata,
 
 	pdata->autosleep = (pdata->autosleep_timeout) ? true : false;
 
+	of_property_read_u32(np, "irq-trigger", &pdata->irq_trigger);
+
+	if (of_property_read_bool(np, "irq-invert-polarity"))
+		pdata->irq_invert_polarity = true;
+
 	for_each_child_of_node(np, child) {
 		if (!strcmp(child->name, "stmpe_gpio")) {
 			pdata->blocks |= STMPE_BLOCK_GPIO;
-		}
-		if (!strcmp(child->name, "stmpe_keypad")) {
+		} else if (!strcmp(child->name, "stmpe_keypad")) {
 			pdata->blocks |= STMPE_BLOCK_KEYPAD;
-		}
-		if (!strcmp(child->name, "stmpe_touchscreen")) {
+		} else if (!strcmp(child->name, "stmpe_touchscreen")) {
 			pdata->blocks |= STMPE_BLOCK_TOUCHSCREEN;
-		}
-		if (!strcmp(child->name, "stmpe_adc")) {
+		} else if (!strcmp(child->name, "stmpe_adc")) {
 			pdata->blocks |= STMPE_BLOCK_ADC;
+		} else if (!strcmp(child->name, "stmpe_pwm")) {
+			pdata->blocks |= STMPE_BLOCK_PWM;
+		} else if (!strcmp(child->name, "stmpe_rotator")) {
+			pdata->blocks |= STMPE_BLOCK_ROTATOR;
 		}
 	}
 }
-- 
1.7.12.rc2.18.g61b472e
