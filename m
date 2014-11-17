From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 1/5] mfd: sec-core: Add support for S2MPS13 device
Date: Mon, 17 Nov 2014 09:42:56 +0900
Message-ID: <1416184980-532-2-git-send-email-cw00.choi@samsung.com>
References: <1416184980-532-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1416184980-532-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, broonie@kernel.org, mturquette@linaro.org, a.zummo@towertech.it
Cc: lgirdwood@gmail.com, sbkim73@samsung.com, sameo@linux.intel.com, geunsik.lim@samsung.com, inki.dae@samsung.com, kyungmin.park@samsung.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: devicetree@vger.kernel.org

This patch adds the support for Samsung S2MPS13 PMIC device to the sec-core MFD
driver. The S2MPS13 is very similar with existing S2MPS14 and includes PMIC/
RTC/CLOCK devices.

Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/mfd/sec-core.c           | 18 ++++++++++++++++++
 drivers/mfd/sec-irq.c            | 23 +++++++++++++++++------
 include/linux/mfd/samsung/core.h |  1 +
 3 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 5993608..48c0d4a 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -73,6 +73,17 @@ static const struct mfd_cell s2mps11_devs[] = {
 	}
 };
 
+static const struct mfd_cell s2mps13_devs[] = {
+	{
+		.name = "s2mps13-pmic",
+	}, {
+		.name = "s2mps13-rtc",
+	}, {
+		.name = "s2mps13-clk",
+		.of_compatible = "samsung,s2mps13-clk",
+	}
+};
+
 static const struct mfd_cell s2mps14_devs[] = {
 	{
 		.name = "s2mps14-pmic",
@@ -107,6 +118,9 @@ static const struct of_device_id sec_dt_match[] = {
 		.compatible = "samsung,s2mps11-pmic",
 		.data = (void *)S2MPS11X,
 	}, {
+		.compatible = "samsung,s2mps13-pmic",
+		.data = (void *)S2MPS13X,
+	}, {
 		.compatible = "samsung,s2mps14-pmic",
 		.data = (void *)S2MPS14X,
 	}, {
@@ -377,6 +391,10 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 		sec_devs = s2mps11_devs;
 		num_sec_devs = ARRAY_SIZE(s2mps11_devs);
 		break;
+	case S2MPS13X:
+		sec_devs = s2mps13_devs;
+		num_sec_devs = ARRAY_SIZE(s2mps13_devs);
+		break;
 	case S2MPS14X:
 		sec_devs = s2mps14_devs;
 		num_sec_devs = ARRAY_SIZE(s2mps14_devs);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index f9a5786..ba86a91 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -389,14 +389,22 @@ static const struct regmap_irq_chip s2mps11_irq_chip = {
 	.ack_base = S2MPS11_REG_INT1,
 };
 
+#define S2MPS1X_IRQ_CHIP_COMMON_DATA		\
+	.irqs = s2mps14_irqs,			\
+	.num_irqs = ARRAY_SIZE(s2mps14_irqs),	\
+	.num_regs = 3,				\
+	.status_base = S2MPS14_REG_INT1,	\
+	.mask_base = S2MPS14_REG_INT1M,		\
+	.ack_base = S2MPS14_REG_INT1		\
+
+static const struct regmap_irq_chip s2mps13_irq_chip = {
+	.name = "s2mps13",
+	S2MPS1X_IRQ_CHIP_COMMON_DATA,
+};
+
 static const struct regmap_irq_chip s2mps14_irq_chip = {
 	.name = "s2mps14",
-	.irqs = s2mps14_irqs,
-	.num_irqs = ARRAY_SIZE(s2mps14_irqs),
-	.num_regs = 3,
-	.status_base = S2MPS14_REG_INT1,
-	.mask_base = S2MPS14_REG_INT1M,
-	.ack_base = S2MPS14_REG_INT1,
+	S2MPS1X_IRQ_CHIP_COMMON_DATA,
 };
 
 static const struct regmap_irq_chip s2mpu02_irq_chip = {
@@ -452,6 +460,9 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	case S2MPS11X:
 		sec_irq_chip = &s2mps11_irq_chip;
 		break;
+	case S2MPS13X:
+		sec_irq_chip = &s2mps13_irq_chip;
+		break;
 	case S2MPS14X:
 		sec_irq_chip = &s2mps14_irq_chip;
 		break;
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index 1825eda..0c0343e 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -41,6 +41,7 @@ enum sec_device_type {
 	S5M8767X,
 	S2MPA01,
 	S2MPS11X,
+	S2MPS13X,
 	S2MPS14X,
 	S2MPU02,
 };
-- 
1.8.5.5
