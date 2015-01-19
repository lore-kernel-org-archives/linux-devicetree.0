From: Steve Twiss <stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH V2 1/2] mfd: da9063: Add device tree support
Date: Mon, 19 Jan 2015 16:29:51 +0000
Message-ID: <d765ef11de06a4ac5721ecf3283ba1333a6d0c8c.1421684991.git.stwiss.opensource@diasemi.com>
References: <cover.1421684991.git.stwiss.opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1421684991.git.stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Dajun Chen <david.chen-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Support Opensource <support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Steve Twiss <stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>

Add device tree support for DA9063 regulators; Real-Time Clock
and Watchdog.

This patch is dependent on PATCH V2 2/2 

Signed-off-by: Steve Twiss <stwiss.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>

---
This patch applies against linux-next and v3.19-rc4 

 drivers/mfd/da9063-core.c       |  2 ++
 drivers/mfd/da9063-i2c.c        | 11 +++++++++++
 include/linux/mfd/da9063/core.h |  1 +
 3 files changed, 14 insertions(+)

diff --git a/drivers/mfd/da9063-core.c b/drivers/mfd/da9063-core.c
index f38bc98..facd361 100644
--- a/drivers/mfd/da9063-core.c
+++ b/drivers/mfd/da9063-core.c
@@ -86,6 +86,7 @@ static const struct mfd_cell da9063_devs[] = {
 	},
 	{
 		.name		= DA9063_DRVNAME_WATCHDOG,
+		.of_compatible	= "dlg,da9063-watchdog",
 	},
 	{
 		.name		= DA9063_DRVNAME_HWMON,
@@ -101,6 +102,7 @@ static const struct mfd_cell da9063_devs[] = {
 		.name		= DA9063_DRVNAME_RTC,
 		.num_resources	= ARRAY_SIZE(da9063_rtc_resources),
 		.resources	= da9063_rtc_resources,
+		.of_compatible	= "dlg,da9063-rtc",
 	},
 	{
 		.name		= DA9063_DRVNAME_VIBRATION,
diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
index 21fd8d9..0e94b20 100644
--- a/drivers/mfd/da9063-i2c.c
+++ b/drivers/mfd/da9063-i2c.c
@@ -25,6 +25,9 @@
 #include <linux/mfd/da9063/pdata.h>
 #include <linux/mfd/da9063/registers.h>
 
+#include <linux/of.h>
+#include <linux/regulator/of_regulator.h>
+
 static const struct regmap_range da9063_ad_readable_ranges[] = {
 	{
 		.range_min = DA9063_REG_PAGE_CON,
@@ -203,6 +206,13 @@ static struct regmap_config da9063_regmap_config = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
+static const struct of_device_id da9063_dt_ids[] = {
+	{ .compatible = "dlg,da9063-ad", },
+	{ .compatible = "dlg,da9063-bb", },
+	{ .compatible = "dlg,da9063-ca", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, da9063_dt_ids);
 static int da9063_i2c_probe(struct i2c_client *i2c,
 	const struct i2c_device_id *id)
 {
@@ -257,6 +267,7 @@ static struct i2c_driver da9063_i2c_driver = {
 	.driver = {
 		.name = "da9063",
 		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(da9063_dt_ids),
 	},
 	.probe    = da9063_i2c_probe,
 	.remove   = da9063_i2c_remove,
diff --git a/include/linux/mfd/da9063/core.h b/include/linux/mfd/da9063/core.h
index b92a326..79f4d82 100644
--- a/include/linux/mfd/da9063/core.h
+++ b/include/linux/mfd/da9063/core.h
@@ -36,6 +36,7 @@ enum da9063_models {
 enum da9063_variant_codes {
 	PMIC_DA9063_AD = 0x3,
 	PMIC_DA9063_BB = 0x5,
+	PMIC_DA9063_CA = 0x6,
 };
 
 /* Interrupts */
-- 
end-of-patch for PATCH V2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
