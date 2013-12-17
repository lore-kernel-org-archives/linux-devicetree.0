From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 3/5] mfd: sec: Remove sec_reg* regmap helpers
Date: Tue, 17 Dec 2013 14:23:19 +0100
Message-ID: <1387286601-21646-4-git-send-email-k.kozlowski@samsung.com>
References: <1387286601-21646-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1387286601-21646-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

Remove sec_reg* helpers as they are not used anymore. These helpers were
error-prone as they mixed u8 with unsigned int and they changed order of
some of parameters (val and mask in sec_reg_update()).

Also the helpers didn't give any way of useful abstraction as they just
called corresponding regmap function.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/mfd/sec-core.c           |   30 ------------------------------
 include/linux/mfd/samsung/core.h |    6 ------
 2 files changed, 36 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 83f31e2e5754..ab4c77b01f9f 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -79,36 +79,6 @@ static struct of_device_id sec_dt_match[] = {
 };
 #endif
 
-int sec_reg_read(struct sec_pmic_dev *sec_pmic, u8 reg, void *dest)
-{
-	return regmap_read(sec_pmic->regmap_pmic, reg, dest);
-}
-EXPORT_SYMBOL_GPL(sec_reg_read);
-
-int sec_bulk_read(struct sec_pmic_dev *sec_pmic, u8 reg, int count, u8 *buf)
-{
-	return regmap_bulk_read(sec_pmic->regmap_pmic, reg, buf, count);
-}
-EXPORT_SYMBOL_GPL(sec_bulk_read);
-
-int sec_reg_write(struct sec_pmic_dev *sec_pmic, u8 reg, u8 value)
-{
-	return regmap_write(sec_pmic->regmap_pmic, reg, value);
-}
-EXPORT_SYMBOL_GPL(sec_reg_write);
-
-int sec_bulk_write(struct sec_pmic_dev *sec_pmic, u8 reg, int count, u8 *buf)
-{
-	return regmap_raw_write(sec_pmic->regmap_pmic, reg, buf, count);
-}
-EXPORT_SYMBOL_GPL(sec_bulk_write);
-
-int sec_reg_update(struct sec_pmic_dev *sec_pmic, u8 reg, u8 val, u8 mask)
-{
-	return regmap_update_bits(sec_pmic->regmap_pmic, reg, mask, val);
-}
-EXPORT_SYMBOL_GPL(sec_reg_update);
-
 static bool s2mps11_volatile(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index cab2dd279076..41c9bde410c5 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -59,12 +59,6 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic);
 void sec_irq_exit(struct sec_pmic_dev *sec_pmic);
 int sec_irq_resume(struct sec_pmic_dev *sec_pmic);
 
-extern int sec_reg_read(struct sec_pmic_dev *sec_pmic, u8 reg, void *dest);
-extern int sec_bulk_read(struct sec_pmic_dev *sec_pmic, u8 reg, int count, u8 *buf);
-extern int sec_reg_write(struct sec_pmic_dev *sec_pmic, u8 reg, u8 value);
-extern int sec_bulk_write(struct sec_pmic_dev *sec_pmic, u8 reg, int count, u8 *buf);
-extern int sec_reg_update(struct sec_pmic_dev *sec_pmic, u8 reg, u8 val, u8 mask);
-
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;
 	struct sec_opmode_data		*opmode;
-- 
1.7.9.5
