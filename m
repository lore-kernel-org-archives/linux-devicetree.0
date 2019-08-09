From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: qcom-rpmh: Sort the compatibles" to the regulator tree
Date: Fri,  9 Aug 2019 13:31:58 +0100 (BST)
Message-ID: <20190809123158.55A8B27430B7@ypsilon.sirena.org.uk>
References: <20190809073616.1235-2-vkoul@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190809073616.1235-2-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

The patch

   regulator: qcom-rpmh: Sort the compatibles

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.4

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

>From 7172fb7f3abea4787ca01dda7297241c4b0f0af5 Mon Sep 17 00:00:00 2001
From: Vinod Koul <vkoul@kernel.org>
Date: Fri, 9 Aug 2019 13:06:14 +0530
Subject: [PATCH] regulator: qcom-rpmh: Sort the compatibles

It helps to keep sorted order for compatibles, so sort them

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Link: https://lore.kernel.org/r/20190809073616.1235-2-vkoul@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/qcom-rpmh-regulator.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 693ffec62f3e..0ef2716da3bd 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -878,18 +878,14 @@ static int rpmh_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rpmh_regulator_match_table[] = {
-	{
-		.compatible = "qcom,pm8998-rpmh-regulators",
-		.data = pm8998_vreg_data,
-	},
-	{
-		.compatible = "qcom,pmi8998-rpmh-regulators",
-		.data = pmi8998_vreg_data,
-	},
 	{
 		.compatible = "qcom,pm8005-rpmh-regulators",
 		.data = pm8005_vreg_data,
 	},
+	{
+		.compatible = "qcom,pm8009-rpmh-regulators",
+		.data = pm8009_vreg_data,
+	},
 	{
 		.compatible = "qcom,pm8150-rpmh-regulators",
 		.data = pm8150_vreg_data,
@@ -899,8 +895,12 @@ static const struct of_device_id rpmh_regulator_match_table[] = {
 		.data = pm8150l_vreg_data,
 	},
 	{
-		.compatible = "qcom,pm8009-rpmh-regulators",
-		.data = pm8009_vreg_data,
+		.compatible = "qcom,pm8998-rpmh-regulators",
+		.data = pm8998_vreg_data,
+	},
+	{
+		.compatible = "qcom,pmi8998-rpmh-regulators",
+		.data = pmi8998_vreg_data,
 	},
 	{}
 };
-- 
2.20.1
