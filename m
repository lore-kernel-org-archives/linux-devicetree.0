From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCHv2 1/5] mfd: sec-core: Add support for S2MPS13 device
Date: Tue, 18 Nov 2014 17:59:39 +0900
Message-ID: <1416301183-10478-2-git-send-email-cw00.choi@samsung.com>
References: <1416301183-10478-1-git-send-email-cw00.choi@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1416301183-10478-1-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, geunsik.lim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds the support for Samsung S2MPS13 PMIC device to the sec-core MFD
driver. The S2MPS13 is very similar with existing S2MPS14 and includes PMIC/
RTC/CLOCK devices.

Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/mfd/sec-core.c           | 16 ++++++++++++++++
 drivers/mfd/sec-irq.c            | 23 +++++++++++++++++------
 include/linux/mfd/samsung/core.h |  1 +
 3 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 5993608..868f03d 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -73,6 +73,15 @@ static const struct mfd_cell s2mps11_devs[] = {
 	}
 };
 
+static const struct mfd_cell s2mps13_devs[] = {
+	{ .name = "s2mps13-pmic", },
+	{ .name = "s2mps13-rtc", },
+	{
+		.name = "s2mps13-clk",
+		.of_compatible = "samsung,s2mps13-clk",
+	},
+};
+
 static const struct mfd_cell s2mps14_devs[] = {
 	{
 		.name = "s2mps14-pmic",
@@ -107,6 +116,9 @@ static const struct of_device_id sec_dt_match[] = {
 		.compatible = "samsung,s2mps11-pmic",
 		.data = (void *)S2MPS11X,
 	}, {
+		.compatible = "samsung,s2mps13-pmic",
+		.data = (void *)S2MPS13X,
+	}, {
 		.compatible = "samsung,s2mps14-pmic",
 		.data = (void *)S2MPS14X,
 	}, {
@@ -377,6 +389,10 @@ static int sec_pmic_probe(struct i2c_client *i2c,
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
