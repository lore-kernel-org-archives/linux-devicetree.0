From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2 RESEND 3/4] regulator: helper: Add helper to configure active-discharge using regmap
Date: Wed, 2 Mar 2016 16:24:47 +0530
Message-ID: <1456916088-25543-4-git-send-email-ldewangan@nvidia.com>
References: <1456916088-25543-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456916088-25543-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, lgirdwood@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Add helper function to set the state of active-discharge of
regulator using regmap. The HW regulator driver can directly
use this by providing the necessary information in the regulator
descriptor.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
Changes from V1:
 None

 drivers/regulator/helpers.c      | 23 +++++++++++++++++++++++
 include/linux/regulator/driver.h | 14 ++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/regulator/helpers.c b/drivers/regulator/helpers.c
index 3bbb326..b1e32e7 100644
--- a/drivers/regulator/helpers.c
+++ b/drivers/regulator/helpers.c
@@ -465,3 +465,26 @@ int regulator_get_bypass_regmap(struct regulator_dev *rdev, bool *enable)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(regulator_get_bypass_regmap);
+
+/**
+ * regulator_set_active_discharge_regmap - Default set_active_discharge()
+ *					   using regmap
+ *
+ * @rdev: device to operate on.
+ * @enable: state to set, 0 to disable and 1 to enable.
+ */
+int regulator_set_active_discharge_regmap(struct regulator_dev *rdev,
+					  bool enable)
+{
+	unsigned int val;
+
+	if (enable)
+		val = rdev->desc->active_discharge_on;
+	else
+		val = rdev->desc->active_discharge_off;
+
+	return regmap_update_bits(rdev->regmap,
+				  rdev->desc->active_discharge_reg,
+				  rdev->desc->active_discharge_mask, val);
+}
+EXPORT_SYMBOL_GPL(regulator_set_active_discharge_regmap);
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 59dbaf7..cd271e8 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -269,6 +269,14 @@ enum regulator_type {
  * @bypass_mask: Mask for control when using regmap set_bypass
  * @bypass_val_on: Enabling value for control when using regmap set_bypass
  * @bypass_val_off: Disabling value for control when using regmap set_bypass
+ * @active_discharge_off: Enabling value for control when using regmap
+ *			  set_active_discharge
+ * @active_discharge_on: Disabling value for control when using regmap
+ *			 set_active_discharge
+ * @active_discharge_mask: Mask for control when using regmap
+ *			   set_active_discharge
+ * @active_discharge_reg: Register for control when using regmap
+ *			  set_active_discharge
  *
  * @enable_time: Time taken for initial enable of regulator (in uS).
  * @off_on_delay: guard time (in uS), before re-enabling a regulator
@@ -318,6 +326,10 @@ struct regulator_desc {
 	unsigned int bypass_mask;
 	unsigned int bypass_val_on;
 	unsigned int bypass_val_off;
+	unsigned int active_discharge_on;
+	unsigned int active_discharge_off;
+	unsigned int active_discharge_mask;
+	unsigned int active_discharge_reg;
 
 	unsigned int enable_time;
 
@@ -450,6 +462,8 @@ int regulator_set_voltage_time_sel(struct regulator_dev *rdev,
 int regulator_set_bypass_regmap(struct regulator_dev *rdev, bool enable);
 int regulator_get_bypass_regmap(struct regulator_dev *rdev, bool *enable);
 
+int regulator_set_active_discharge_regmap(struct regulator_dev *rdev,
+					  bool enable);
 void *regulator_get_init_drvdata(struct regulator_init_data *reg_init_data);
 
 #endif
-- 
2.1.4
