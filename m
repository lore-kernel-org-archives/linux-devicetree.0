From: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH v6 1/2] mfd/axp20x: extend axp20x to support axp288 pmic
Date: Thu, 25 Sep 2014 04:20:45 -0700
Message-ID: <1411644045-21281-1-git-send-email-jacob.jun.pan@linux.intel.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: IIO <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DEVICE TREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Aaron Lu <aaron.lu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Zubair Lutfullah <zubair.lutfullah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ramakrishna Pallala <ramakrishna.pallala-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>Pete
List-Id: devicetree@vger.kernel.org

X-Powers AXP288 is a customized PMIC for Intel Baytrail-CR platforms. Similar
to AXP202/209, AXP288 comes with USB charger, more LDO and BUCK channels, and
AD converters. It also provides extended status and interrupt reporting
capabilities than the devices currently supported in axp20x.c.

In addition to feature extension, this patch also adds ACPI binding for
enumeration.

This consolidated driver should support more X-Powers' PMICs in both device
tree and ACPI enumerated platforms.

Signed-off-by: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Reviewed-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/mfd/Kconfig        |   3 +-
 drivers/mfd/axp20x.c       | 361 ++++++++++++++++++++++++++++++++++++++-------
 include/linux/mfd/axp20x.h |  59 ++++++++
 3 files changed, 367 insertions(+), 56 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index de5abf2..c183edb 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -74,7 +74,8 @@ config MFD_AXP20X
 	select REGMAP_IRQ
 	depends on I2C=y
 	help
-	  If you say Y here you get support for the X-Powers AXP202 and AXP209.
+	  If you say Y here you get support for the X-Powers AXP202, AXP209 and
+	  AXP288 power management IC (PMIC).
 	  This driver include only the core APIs. You have to select individual
 	  components like regulators or the PEK (Power Enable Key) under the
 	  corresponding menus.
diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index dee6539..69fd231 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1,9 +1,9 @@
 /*
- * axp20x.c - MFD core driver for the X-Powers AXP202 and AXP209
+ * axp20x.c - MFD core driver for the X-Powers' Power Management ICs
  *
- * AXP20x comprises an adaptive USB-Compatible PWM charger, 2 BUCK DC-DC
- * converters, 5 LDOs, multiple 12-bit ADCs of voltage, current and temperature
- * as well as 4 configurable GPIOs.
+ * AXP20x typically comprises an adaptive USB-Compatible PWM charger, BUCK DC-DC
+ * converters, LDOs, multiple 12-bit ADCs of voltage, current and temperature
+ * as well as configurable GPIOs.
  *
  * Author: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
  *
@@ -25,9 +25,16 @@
 #include <linux/mfd/core.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
+#include <linux/acpi.h>
 
 #define AXP20X_OFF	0x80
 
+static const char const *axp20x_model_names[] = {
+	"AXP202",
+	"AXP209",
+	"AXP288",
+};
+
 static const struct regmap_range axp20x_writeable_ranges[] = {
 	regmap_reg_range(AXP20X_DATACACHE(0), AXP20X_IRQ5_STATE),
 	regmap_reg_range(AXP20X_DCDC_MODE, AXP20X_FG_RES),
@@ -47,6 +54,25 @@ static const struct regmap_access_table axp20x_volatile_table = {
 	.n_yes_ranges	= ARRAY_SIZE(axp20x_volatile_ranges),
 };
 
+static const struct regmap_range axp288_writeable_ranges[] = {
+	regmap_reg_range(AXP20X_DATACACHE(0), AXP20X_IRQ6_STATE),
+	regmap_reg_range(AXP20X_DCDC_MODE, AXP288_FG_TUNE5),
+};
+
+static const struct regmap_range axp288_volatile_ranges[] = {
+	regmap_reg_range(AXP20X_IRQ1_EN,  AXP20X_IPSOUT_V_HIGH_L),
+};
+
+static const struct regmap_access_table axp288_writeable_table = {
+	.yes_ranges	= axp288_writeable_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(axp288_writeable_ranges),
+};
+
+static const struct regmap_access_table axp288_volatile_table = {
+	.yes_ranges	= axp288_volatile_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(axp288_volatile_ranges),
+};
+
 static struct resource axp20x_pek_resources[] = {
 	{
 		.name	= "PEK_DBR",
@@ -61,6 +87,39 @@ static struct resource axp20x_pek_resources[] = {
 	},
 };
 
+static struct resource axp288_battery_resources[] = {
+	{
+		.start = AXP288_IRQ_QWBTU,
+		.end   = AXP288_IRQ_QWBTU,
+		.flags = IORESOURCE_IRQ,
+	},
+	{
+		.start = AXP288_IRQ_WBTU,
+		.end   = AXP288_IRQ_WBTU,
+		.flags = IORESOURCE_IRQ,
+	},
+	{
+		.start = AXP288_IRQ_QWBTO,
+		.end   = AXP288_IRQ_QWBTO,
+		.flags = IORESOURCE_IRQ,
+	},
+	{
+		.start = AXP288_IRQ_WBTO,
+		.end   = AXP288_IRQ_WBTO,
+		.flags = IORESOURCE_IRQ,
+	},
+	{
+		.start = AXP288_IRQ_WL2,
+		.end   = AXP288_IRQ_WL2,
+		.flags = IORESOURCE_IRQ,
+	},
+	{
+		.start = AXP288_IRQ_WL1,
+		.end   = AXP288_IRQ_WL1,
+		.flags = IORESOURCE_IRQ,
+	},
+};
+
 static const struct regmap_config axp20x_regmap_config = {
 	.reg_bits	= 8,
 	.val_bits	= 8,
@@ -70,47 +129,96 @@ static const struct regmap_config axp20x_regmap_config = {
 	.cache_type	= REGCACHE_RBTREE,
 };
 
-#define AXP20X_IRQ(_irq, _off, _mask) \
-	[AXP20X_IRQ_##_irq] = { .reg_offset = (_off), .mask = BIT(_mask) }
+static const struct regmap_config axp288_regmap_config = {
+	.reg_bits	= 8,
+	.val_bits	= 8,
+	.wr_table	= &axp288_writeable_table,
+	.volatile_table	= &axp288_volatile_table,
+	.max_register	= AXP288_FG_TUNE5,
+	.cache_type	= REGCACHE_RBTREE,
+};
+
+#define INIT_REGMAP_IRQ(_variant, _irq, _off, _mask)			\
+	[_variant##_IRQ_##_irq] = { .reg_offset = (_off), .mask = BIT(_mask) }
 
 static const struct regmap_irq axp20x_regmap_irqs[] = {
-	AXP20X_IRQ(ACIN_OVER_V,		0, 7),
-	AXP20X_IRQ(ACIN_PLUGIN,		0, 6),
-	AXP20X_IRQ(ACIN_REMOVAL,	0, 5),
-	AXP20X_IRQ(VBUS_OVER_V,		0, 4),
-	AXP20X_IRQ(VBUS_PLUGIN,		0, 3),
-	AXP20X_IRQ(VBUS_REMOVAL,	0, 2),
-	AXP20X_IRQ(VBUS_V_LOW,		0, 1),
-	AXP20X_IRQ(BATT_PLUGIN,		1, 7),
-	AXP20X_IRQ(BATT_REMOVAL,	1, 6),
-	AXP20X_IRQ(BATT_ENT_ACT_MODE,	1, 5),
-	AXP20X_IRQ(BATT_EXIT_ACT_MODE,	1, 4),
-	AXP20X_IRQ(CHARG,		1, 3),
-	AXP20X_IRQ(CHARG_DONE,		1, 2),
-	AXP20X_IRQ(BATT_TEMP_HIGH,	1, 1),
-	AXP20X_IRQ(BATT_TEMP_LOW,	1, 0),
-	AXP20X_IRQ(DIE_TEMP_HIGH,	2, 7),
-	AXP20X_IRQ(CHARG_I_LOW,		2, 6),
-	AXP20X_IRQ(DCDC1_V_LONG,	2, 5),
-	AXP20X_IRQ(DCDC2_V_LONG,	2, 4),
-	AXP20X_IRQ(DCDC3_V_LONG,	2, 3),
-	AXP20X_IRQ(PEK_SHORT,		2, 1),
-	AXP20X_IRQ(PEK_LONG,		2, 0),
-	AXP20X_IRQ(N_OE_PWR_ON,		3, 7),
-	AXP20X_IRQ(N_OE_PWR_OFF,	3, 6),
-	AXP20X_IRQ(VBUS_VALID,		3, 5),
-	AXP20X_IRQ(VBUS_NOT_VALID,	3, 4),
-	AXP20X_IRQ(VBUS_SESS_VALID,	3, 3),
-	AXP20X_IRQ(VBUS_SESS_END,	3, 2),
-	AXP20X_IRQ(LOW_PWR_LVL1,	3, 1),
-	AXP20X_IRQ(LOW_PWR_LVL2,	3, 0),
-	AXP20X_IRQ(TIMER,		4, 7),
-	AXP20X_IRQ(PEK_RIS_EDGE,	4, 6),
-	AXP20X_IRQ(PEK_FAL_EDGE,	4, 5),
-	AXP20X_IRQ(GPIO3_INPUT,		4, 3),
-	AXP20X_IRQ(GPIO2_INPUT,		4, 2),
-	AXP20X_IRQ(GPIO1_INPUT,		4, 1),
-	AXP20X_IRQ(GPIO0_INPUT,		4, 0),
+	INIT_REGMAP_IRQ(AXP20X, ACIN_OVER_V,		0, 7),
+	INIT_REGMAP_IRQ(AXP20X, ACIN_PLUGIN,		0, 6),
+	INIT_REGMAP_IRQ(AXP20X, ACIN_REMOVAL,	        0, 5),
+	INIT_REGMAP_IRQ(AXP20X, VBUS_OVER_V,		0, 4),
+	INIT_REGMAP_IRQ(AXP20X, VBUS_PLUGIN,		0, 3),
+	INIT_REGMAP_IRQ(AXP20X, VBUS_REMOVAL,	        0, 2),
+	INIT_REGMAP_IRQ(AXP20X, VBUS_V_LOW,		0, 1),
+	INIT_REGMAP_IRQ(AXP20X, BATT_PLUGIN,		1, 7),
+	INIT_REGMAP_IRQ(AXP20X, BATT_REMOVAL,	        1, 6),
+	INIT_REGMAP_IRQ(AXP20X, BATT_ENT_ACT_MODE,	1, 5),
+	INIT_REGMAP_IRQ(AXP20X, BATT_EXIT_ACT_MODE,	1, 4),
+	INIT_REGMAP_IRQ(AXP20X, CHARG,		        1, 3),
+	INIT_REGMAP_IRQ(AXP20X, CHARG_DONE,		1, 2),
+	INIT_REGMAP_IRQ(AXP20X, BATT_TEMP_HIGH,	        1, 1),
+	INIT_REGMAP_IRQ(AXP20X, BATT_TEMP_LOW,	        1, 0),
+	INIT_REGMAP_IRQ(AXP20X, DIE_TEMP_HIGH,	        2, 7),
+	INIT_REGMAP_IRQ(AXP20X, CHARG_I_LOW,		2, 6),
+	INIT_REGMAP_IRQ(AXP20X, DCDC1_V_LONG,	        2, 5),
+	INIT_REGMAP_IRQ(AXP20X, DCDC2_V_LONG,	        2, 4),
+	INIT_REGMAP_IRQ(AXP20X, DCDC3_V_LONG,	        2, 3),
+	INIT_REGMAP_IRQ(AXP20X, PEK_SHORT,		2, 1),
+	INIT_REGMAP_IRQ(AXP20X, PEK_LONG,		2, 0),
+	INIT_REGMAP_IRQ(AXP20X, N_OE_PWR_ON,		3, 7),
+	INIT_REGMAP_IRQ(AXP20X, N_OE_PWR_OFF,	        3, 6),
+	INIT_REGMAP_IRQ(AXP20X, VBUS_VALID,		3, 5),
+	INIT_REGMAP_IRQ(AXP20X, VBUS_NOT_VALID,	        3, 4),
+	INIT_REGMAP_IRQ(AXP20X, VBUS_SESS_VALID,	3, 3),
+	INIT_REGMAP_IRQ(AXP20X, VBUS_SESS_END,	        3, 2),
+	INIT_REGMAP_IRQ(AXP20X, LOW_PWR_LVL1,	        3, 1),
+	INIT_REGMAP_IRQ(AXP20X, LOW_PWR_LVL2,	        3, 0),
+	INIT_REGMAP_IRQ(AXP20X, TIMER,		        4, 7),
+	INIT_REGMAP_IRQ(AXP20X, PEK_RIS_EDGE,	        4, 6),
+	INIT_REGMAP_IRQ(AXP20X, PEK_FAL_EDGE,	        4, 5),
+	INIT_REGMAP_IRQ(AXP20X, GPIO3_INPUT,		4, 3),
+	INIT_REGMAP_IRQ(AXP20X, GPIO2_INPUT,		4, 2),
+	INIT_REGMAP_IRQ(AXP20X, GPIO1_INPUT,		4, 1),
+	INIT_REGMAP_IRQ(AXP20X, GPIO0_INPUT,		4, 0),
+};
+
+/* some IRQs are compatible with axp20x models */
+static const struct regmap_irq axp288_regmap_irqs[] = {
+	INIT_REGMAP_IRQ(AXP20X, VBUS_REMOVAL,           0, 2),
+	INIT_REGMAP_IRQ(AXP20X, VBUS_PLUGIN,            0, 3),
+	INIT_REGMAP_IRQ(AXP20X, VBUS_OVER_V,            0, 4),
+
+	INIT_REGMAP_IRQ(AXP20X, CHARG_DONE,             1, 2),
+	INIT_REGMAP_IRQ(AXP20X, CHARG,                  1, 3),
+	INIT_REGMAP_IRQ(AXP288, SAFE_QUIT,              1, 4),
+	INIT_REGMAP_IRQ(AXP288, SAFE_ENTER,             1, 5),
+	INIT_REGMAP_IRQ(AXP20X, BATT_REMOVAL,           1, 6),
+	INIT_REGMAP_IRQ(AXP20X, BATT_PLUGIN,            1, 7),
+
+	INIT_REGMAP_IRQ(AXP288, QWBTU,                  2, 0),
+	INIT_REGMAP_IRQ(AXP288, WBTU,                   2, 1),
+	INIT_REGMAP_IRQ(AXP288, QWBTO,                  2, 2),
+	INIT_REGMAP_IRQ(AXP288, WBTU,                   2, 3),
+	INIT_REGMAP_IRQ(AXP288, QCBTU,                  2, 4),
+	INIT_REGMAP_IRQ(AXP288, CBTU,                   2, 5),
+	INIT_REGMAP_IRQ(AXP288, QCBTO,                  2, 6),
+	INIT_REGMAP_IRQ(AXP288, CBTO,                   2, 7),
+
+	INIT_REGMAP_IRQ(AXP288, WL2,                    3, 0),
+	INIT_REGMAP_IRQ(AXP288, WL1,                    3, 1),
+	INIT_REGMAP_IRQ(AXP288, GPADC,                  3, 2),
+	INIT_REGMAP_IRQ(AXP288, OT,                     3, 7),
+
+	INIT_REGMAP_IRQ(AXP288, GPIO0,                  4, 0),
+	INIT_REGMAP_IRQ(AXP288, GPIO1,                  4, 1),
+	INIT_REGMAP_IRQ(AXP288, POKO,                   4, 2),
+	INIT_REGMAP_IRQ(AXP288, POKL,                   4, 3),
+	INIT_REGMAP_IRQ(AXP288, POKS,                   4, 4),
+	INIT_REGMAP_IRQ(AXP288, POKN,                   4, 5),
+	INIT_REGMAP_IRQ(AXP288, POKP,                   4, 6),
+	INIT_REGMAP_IRQ(AXP20X, TIMER,                  4, 7),
+
+	INIT_REGMAP_IRQ(AXP288, MV_CHNG,                5, 0),
+	INIT_REGMAP_IRQ(AXP288, BC_USB_CHNG,            5, 1),
 };
 
 static const struct of_device_id axp20x_of_match[] = {
@@ -128,16 +236,39 @@ static const struct i2c_device_id axp20x_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
 
+static struct acpi_device_id axp20x_acpi_match[] = {
+	{
+		.id = "INT33F4",
+		.driver_data = AXP288_ID,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, axp20x_acpi_match);
+
 static const struct regmap_irq_chip axp20x_regmap_irq_chip = {
 	.name			= "axp20x_irq_chip",
 	.status_base		= AXP20X_IRQ1_STATE,
 	.ack_base		= AXP20X_IRQ1_STATE,
 	.mask_base		= AXP20X_IRQ1_EN,
-	.num_regs		= 5,
+	.mask_invert		= true,
+	.init_ack_masked	= true,
 	.irqs			= axp20x_regmap_irqs,
 	.num_irqs		= ARRAY_SIZE(axp20x_regmap_irqs),
+	.num_regs		= 5,
+
+};
+
+static const struct regmap_irq_chip axp288_regmap_irq_chip = {
+	.name			= "axp288_irq_chip",
+	.status_base		= AXP20X_IRQ1_STATE,
+	.ack_base		= AXP20X_IRQ1_STATE,
+	.mask_base		= AXP20X_IRQ1_EN,
 	.mask_invert		= true,
 	.init_ack_masked	= true,
+	.irqs			= axp288_regmap_irqs,
+	.num_irqs		= ARRAY_SIZE(axp288_regmap_irqs),
+	.num_regs		= 6,
+
 };
 
 static const char * const axp20x_supplies[] = {
@@ -161,36 +292,155 @@ static struct mfd_cell axp20x_cells[] = {
 	},
 };
 
+static struct resource axp288_adc_resources[] = {
+	{
+		.name	= "GPADC",
+		.start = AXP288_IRQ_GPADC,
+		.end   = AXP288_IRQ_GPADC,
+		.flags = IORESOURCE_IRQ,
+	},
+};
+
+static struct resource axp288_charger_resources[] = {
+	{
+		.start = AXP288_IRQ_OV,
+		.end   = AXP288_IRQ_OV,
+		.flags = IORESOURCE_IRQ,
+	},
+	{
+		.start = AXP288_IRQ_DONE,
+		.end   = AXP288_IRQ_DONE,
+		.flags = IORESOURCE_IRQ,
+	},
+	{
+		.start = AXP288_IRQ_CHARGING,
+		.end   = AXP288_IRQ_CHARGING,
+		.flags = IORESOURCE_IRQ,
+	},
+	{
+		.start = AXP288_IRQ_SAFE_QUIT,
+		.end   = AXP288_IRQ_SAFE_QUIT,
+		.flags = IORESOURCE_IRQ,
+	},
+	{
+		.start = AXP288_IRQ_SAFE_ENTER,
+		.end   = AXP288_IRQ_SAFE_ENTER,
+		.flags = IORESOURCE_IRQ,
+	},
+	{
+		.start = AXP288_IRQ_QCBTU,
+		.end   = AXP288_IRQ_QCBTU,
+		.flags = IORESOURCE_IRQ,
+	},
+	{
+		.start = AXP288_IRQ_CBTU,
+		.end   = AXP288_IRQ_CBTU,
+		.flags = IORESOURCE_IRQ,
+	},
+	{
+		.start = AXP288_IRQ_QCBTO,
+		.end   = AXP288_IRQ_QCBTO,
+		.flags = IORESOURCE_IRQ,
+	},
+	{
+		.start = AXP288_IRQ_CBTO,
+		.end   = AXP288_IRQ_CBTO,
+		.flags = IORESOURCE_IRQ,
+	},
+};
+
+static struct mfd_cell axp288_cells[] = {
+	{
+		.name = "axp288_adc",
+		.num_resources = ARRAY_SIZE(axp288_adc_resources),
+		.resources = axp288_adc_resources,
+	},
+	{
+		.name = "axp288_charger",
+		.num_resources = ARRAY_SIZE(axp288_charger_resources),
+		.resources = axp288_charger_resources,
+	},
+	{
+		.name = "axp288_battery",
+		.num_resources = ARRAY_SIZE(axp288_battery_resources),
+		.resources = axp288_battery_resources,
+	},
+};
+
 static struct axp20x_dev *axp20x_pm_power_off;
 static void axp20x_power_off(void)
 {
+	if (axp20x_pm_power_off->variant == AXP288_ID)
+		return;
+
 	regmap_write(axp20x_pm_power_off->regmap, AXP20X_OFF_CTRL,
 		     AXP20X_OFF);
 }
 
+static int axp20x_match_device(struct axp20x_dev *axp20x, struct device *dev)
+{
+	const struct acpi_device_id *acpi_id;
+	const struct of_device_id *of_id;
+
+	if (dev->of_node) {
+		of_id = of_match_device(axp20x_of_match, dev);
+		if (!of_id) {
+			dev_err(dev, "Unable to match OF ID\n");
+			return -ENODEV;
+		}
+		axp20x->variant = (long) of_id->data;
+	} else {
+		acpi_id = acpi_match_device(dev->driver->acpi_match_table, dev);
+		if (!acpi_id || !acpi_id->driver_data) {
+			dev_err(dev, "Unable to match ACPI ID and data\n");
+			return -ENODEV;
+		}
+		axp20x->variant = (long) acpi_id->driver_data;
+	}
+
+	switch (axp20x->variant) {
+	case AXP202_ID:
+	case AXP209_ID:
+		axp20x->nr_cells = ARRAY_SIZE(axp20x_cells);
+		axp20x->cells = axp20x_cells;
+		axp20x->regmap_cfg = &axp20x_regmap_config;
+		axp20x->regmap_irq_chip = &axp20x_regmap_irq_chip;
+		break;
+	case AXP288_ID:
+		axp20x->cells = axp288_cells;
+		axp20x->nr_cells = ARRAY_SIZE(axp288_cells);
+		axp20x->regmap_cfg = &axp288_regmap_config;
+		axp20x->regmap_irq_chip = &axp288_regmap_irq_chip;
+		break;
+	default:
+		dev_err(dev, "unsupported AXP20X ID %lu\n", axp20x->variant);
+		return -EINVAL;
+	}
+	dev_info(dev, "AXP20x variant %s found\n",
+		axp20x_model_names[axp20x->variant]);
+
+	return 0;
+}
+
 static int axp20x_i2c_probe(struct i2c_client *i2c,
 			 const struct i2c_device_id *id)
 {
 	struct axp20x_dev *axp20x;
-	const struct of_device_id *of_id;
 	int ret;
 
 	axp20x = devm_kzalloc(&i2c->dev, sizeof(*axp20x), GFP_KERNEL);
 	if (!axp20x)
 		return -ENOMEM;
 
-	of_id = of_match_device(axp20x_of_match, &i2c->dev);
-	if (!of_id) {
-		dev_err(&i2c->dev, "Unable to setup AXP20X data\n");
-		return -ENODEV;
-	}
-	axp20x->variant = (long) of_id->data;
+	ret = axp20x_match_device(axp20x, &i2c->dev);
+	if (ret)
+		return ret;
 
 	axp20x->i2c_client = i2c;
 	axp20x->dev = &i2c->dev;
 	dev_set_drvdata(axp20x->dev, axp20x);
 
-	axp20x->regmap = devm_regmap_init_i2c(i2c, &axp20x_regmap_config);
+	axp20x->regmap = devm_regmap_init_i2c(i2c, axp20x->regmap_cfg);
 	if (IS_ERR(axp20x->regmap)) {
 		ret = PTR_ERR(axp20x->regmap);
 		dev_err(&i2c->dev, "regmap init failed: %d\n", ret);
@@ -199,15 +449,15 @@ static int axp20x_i2c_probe(struct i2c_client *i2c,
 
 	ret = regmap_add_irq_chip(axp20x->regmap, i2c->irq,
 				  IRQF_ONESHOT | IRQF_SHARED, -1,
-				  &axp20x_regmap_irq_chip,
+				  axp20x->regmap_irq_chip,
 				  &axp20x->regmap_irqc);
 	if (ret) {
 		dev_err(&i2c->dev, "failed to add irq chip: %d\n", ret);
 		return ret;
 	}
 
-	ret = mfd_add_devices(axp20x->dev, -1, axp20x_cells,
-			      ARRAY_SIZE(axp20x_cells), NULL, 0, NULL);
+	ret = mfd_add_devices(axp20x->dev, -1, axp20x->cells,
+			axp20x->nr_cells, NULL, 0, NULL);
 
 	if (ret) {
 		dev_err(&i2c->dev, "failed to add MFD devices: %d\n", ret);
@@ -245,6 +495,7 @@ static struct i2c_driver axp20x_i2c_driver = {
 		.name	= "axp20x",
 		.owner	= THIS_MODULE,
 		.of_match_table	= of_match_ptr(axp20x_of_match),
+		.acpi_match_table = ACPI_PTR(axp20x_acpi_match),
 	},
 	.probe		= axp20x_i2c_probe,
 	.remove		= axp20x_i2c_remove,
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index d0e31a2..81589d1 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -14,6 +14,8 @@
 enum {
 	AXP202_ID = 0,
 	AXP209_ID,
+	AXP288_ID,
+	NR_AXP20X_VARIANTS,
 };
 
 #define AXP20X_DATACACHE(m)		(0x04 + (m))
@@ -49,11 +51,13 @@ enum {
 #define AXP20X_IRQ3_EN			0x42
 #define AXP20X_IRQ4_EN			0x43
 #define AXP20X_IRQ5_EN			0x44
+#define AXP20X_IRQ6_EN			0x45
 #define AXP20X_IRQ1_STATE		0x48
 #define AXP20X_IRQ2_STATE		0x49
 #define AXP20X_IRQ3_STATE		0x4a
 #define AXP20X_IRQ4_STATE		0x4b
 #define AXP20X_IRQ5_STATE		0x4c
+#define AXP20X_IRQ6_STATE		0x4d
 
 /* ADC */
 #define AXP20X_ACIN_V_ADC_H		0x56
@@ -116,6 +120,15 @@ enum {
 #define AXP20X_CC_CTRL			0xb8
 #define AXP20X_FG_RES			0xb9
 
+/* AXP288 specific registers */
+#define AXP288_PMIC_ADC_H               0x56
+#define AXP288_PMIC_ADC_L               0x57
+#define AXP288_ADC_TS_PIN_CTRL          0x84
+
+#define AXP288_PMIC_ADC_EN              0x84
+#define AXP288_FG_TUNE5			0xed
+
+
 /* Regulators IDs */
 enum {
 	AXP20X_LDO1 = 0,
@@ -169,12 +182,58 @@ enum {
 	AXP20X_IRQ_GPIO0_INPUT,
 };
 
+enum axp288_irqs {
+	AXP288_IRQ_VBUS_FALL     = 2,
+	AXP288_IRQ_VBUS_RISE,
+	AXP288_IRQ_OV,
+	AXP288_IRQ_FALLING_ALT,
+	AXP288_IRQ_RISING_ALT,
+	AXP288_IRQ_OV_ALT,
+	AXP288_IRQ_DONE          = 10,
+	AXP288_IRQ_CHARGING,
+	AXP288_IRQ_SAFE_QUIT,
+	AXP288_IRQ_SAFE_ENTER,
+	AXP288_IRQ_ABSENT,
+	AXP288_IRQ_APPEND,
+	AXP288_IRQ_QWBTU,
+	AXP288_IRQ_WBTU,
+	AXP288_IRQ_QWBTO,
+	AXP288_IRQ_WBTO,
+	AXP288_IRQ_QCBTU,
+	AXP288_IRQ_CBTU,
+	AXP288_IRQ_QCBTO,
+	AXP288_IRQ_CBTO,
+	AXP288_IRQ_WL2,
+	AXP288_IRQ_WL1,
+	AXP288_IRQ_GPADC,
+	AXP288_IRQ_OT            = 31,
+	AXP288_IRQ_GPIO0,
+	AXP288_IRQ_GPIO1,
+	AXP288_IRQ_POKO,
+	AXP288_IRQ_POKL,
+	AXP288_IRQ_POKS,
+	AXP288_IRQ_POKN,
+	AXP288_IRQ_POKP,
+	AXP288_IRQ_TIMER,
+	AXP288_IRQ_MV_CHNG,
+	AXP288_IRQ_BC_USB_CHNG,
+};
+
+#define AXP288_TS_ADC_H		0x58
+#define AXP288_TS_ADC_L		0x59
+#define AXP288_GP_ADC_H		0x5a
+#define AXP288_GP_ADC_L		0x5b
+
 struct axp20x_dev {
 	struct device			*dev;
 	struct i2c_client		*i2c_client;
 	struct regmap			*regmap;
 	struct regmap_irq_chip_data	*regmap_irqc;
 	long				variant;
+	int                             nr_cells;
+	struct mfd_cell                 *cells;
+	const struct regmap_config	*regmap_cfg;
+	const struct regmap_irq_chip	*regmap_irq_chip;
 };
 
 #endif /* __LINUX_MFD_AXP20X_H */
-- 
1.9.1
