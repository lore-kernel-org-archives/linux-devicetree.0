From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Applied "regulator: rn5t618: add RC5T619 PMIC support" to the regulator tree
Date: Sun, 27 Aug 2017 15:30:07 +0100 (BST)
Message-ID: <20170827143007.CB0A14400E7@finisterre.ee.mobilebroadband>
References: <20161105161925.14910-3-phh@phh.me>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161105161925.14910-3-phh-8tEavu1zA38@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pierre-Hugues Husson <phh-8tEavu1zA38@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.orgbroonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.orglinux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: rn5t618: add RC5T619 PMIC support

has been applied to the regulator tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 83b2a3c2ab24561cb6de45e6b155e3a7c4c1c91b Mon Sep 17 00:00:00 2001
From: Pierre-Hugues Husson <phh-8tEavu1zA38@public.gmane.org>
Date: Sun, 27 Aug 2017 15:58:31 +0200
Subject: [PATCH] regulator: rn5t618: add RC5T619 PMIC support

Extend the driver to support Ricoh RC5T619.
Support the additional regulators and slightly different voltage ranges.

Signed-off-by: Pierre-Hugues Husson <phh-8tEavu1zA38@public.gmane.org>
Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/regulator/Kconfig             |  4 ++--
 drivers/regulator/rn5t618-regulator.c | 35 +++++++++++++++++++++++++++++++----
 include/linux/mfd/rn5t618.h           |  6 ++++++
 3 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 99b9362331b5..a847f8231337 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -700,8 +700,8 @@ config REGULATOR_RN5T618
 	tristate "Ricoh RN5T567/618 voltage regulators"
 	depends on MFD_RN5T618
 	help
-	  Say y here to support the regulators found on Ricoh RN5T567 or
-	  RN5T618 PMIC.
+	  Say y here to support the regulators found on Ricoh RN5T567,
+	  RN5T618 or RC5T619 PMIC.
 
 config REGULATOR_RT5033
 	tristate "Richtek RT5033 Regulators"
diff --git a/drivers/regulator/rn5t618-regulator.c b/drivers/regulator/rn5t618-regulator.c
index 8d2819e36654..ef2be56460fe 100644
--- a/drivers/regulator/rn5t618-regulator.c
+++ b/drivers/regulator/rn5t618-regulator.c
@@ -79,6 +79,29 @@ static struct regulator_desc rn5t618_regulators[] = {
 	REG(LDORTC2, LDOEN2, BIT(5), LDORTC2DAC, 0x7f, 900000, 3500000, 25000),
 };
 
+static struct regulator_desc rc5t619_regulators[] = {
+	/* DCDC */
+	REG(DCDC1, DC1CTL, BIT(0), DC1DAC, 0xff, 600000, 3500000, 12500),
+	REG(DCDC2, DC2CTL, BIT(0), DC2DAC, 0xff, 600000, 3500000, 12500),
+	REG(DCDC3, DC3CTL, BIT(0), DC3DAC, 0xff, 600000, 3500000, 12500),
+	REG(DCDC4, DC4CTL, BIT(0), DC4DAC, 0xff, 600000, 3500000, 12500),
+	REG(DCDC5, DC5CTL, BIT(0), DC5DAC, 0xff, 600000, 3500000, 12500),
+	/* LDO */
+	REG(LDO1, LDOEN1, BIT(0), LDO1DAC, 0x7f, 900000, 3500000, 25000),
+	REG(LDO2, LDOEN1, BIT(1), LDO2DAC, 0x7f, 900000, 3500000, 25000),
+	REG(LDO3, LDOEN1, BIT(2), LDO3DAC, 0x7f, 900000, 3500000, 25000),
+	REG(LDO4, LDOEN1, BIT(3), LDO4DAC, 0x7f, 900000, 3500000, 25000),
+	REG(LDO5, LDOEN1, BIT(4), LDO5DAC, 0x7f, 600000, 3500000, 25000),
+	REG(LDO6, LDOEN1, BIT(5), LDO6DAC, 0x7f, 600000, 3500000, 25000),
+	REG(LDO7, LDOEN1, BIT(6), LDO7DAC, 0x7f, 900000, 3500000, 25000),
+	REG(LDO8, LDOEN1, BIT(7), LDO8DAC, 0x7f, 900000, 3500000, 25000),
+	REG(LDO9, LDOEN2, BIT(0), LDO9DAC, 0x7f, 900000, 3500000, 25000),
+	REG(LDO10, LDOEN2, BIT(0), LDO10DAC, 0x7f, 900000, 3500000, 25000),
+	/* LDO RTC */
+	REG(LDORTC1, LDOEN2, BIT(4), LDORTCDAC, 0x7f, 1700000, 3500000, 25000),
+	REG(LDORTC2, LDOEN2, BIT(5), LDORTC2DAC, 0x7f, 900000, 3500000, 25000),
+};
+
 static int rn5t618_regulator_probe(struct platform_device *pdev)
 {
 	struct rn5t618 *rn5t618 = dev_get_drvdata(pdev->dev.parent);
@@ -86,13 +109,20 @@ static int rn5t618_regulator_probe(struct platform_device *pdev)
 	struct regulator_dev *rdev;
 	struct regulator_desc *regulators;
 	int i;
+	int num_regulators = 0;
 
 	switch (rn5t618->variant) {
 	case RN5T567:
 		regulators = rn5t567_regulators;
+		num_regulators = ARRAY_SIZE(rn5t567_regulators);
 		break;
 	case RN5T618:
 		regulators = rn5t618_regulators;
+		num_regulators = ARRAY_SIZE(rn5t618_regulators);
+		break;
+	case RC5T619:
+		regulators = rc5t619_regulators;
+		num_regulators = ARRAY_SIZE(rc5t619_regulators);
 		break;
 	default:
 		return -EINVAL;
@@ -101,10 +131,7 @@ static int rn5t618_regulator_probe(struct platform_device *pdev)
 	config.dev = pdev->dev.parent;
 	config.regmap = rn5t618->regmap;
 
-	for (i = 0; i < RN5T618_REG_NUM; i++) {
-		if (!regulators[i].name)
-			continue;
-
+	for (i = 0; i < num_regulators; i++) {
 		rdev = devm_regulator_register(&pdev->dev,
 					       &regulators[i],
 					       &config);
diff --git a/include/linux/mfd/rn5t618.h b/include/linux/mfd/rn5t618.h
index e5a6cdeb77db..d61bc58aba8a 100644
--- a/include/linux/mfd/rn5t618.h
+++ b/include/linux/mfd/rn5t618.h
@@ -226,11 +226,17 @@ enum {
 	RN5T618_DCDC2,
 	RN5T618_DCDC3,
 	RN5T618_DCDC4,
+	RN5T618_DCDC5,
 	RN5T618_LDO1,
 	RN5T618_LDO2,
 	RN5T618_LDO3,
 	RN5T618_LDO4,
 	RN5T618_LDO5,
+	RN5T618_LDO6,
+	RN5T618_LDO7,
+	RN5T618_LDO8,
+	RN5T618_LDO9,
+	RN5T618_LDO10,
 	RN5T618_LDORTC1,
 	RN5T618_LDORTC2,
 	RN5T618_REG_NUM,
-- 
2.13.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
