From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: qcom-rpmh: Fix pmic5_bob voltage count" to the regulator tree
Date: Fri,  9 Aug 2019 13:31:58 +0100 (BST)
Message-ID: <20190809123158.1A7A02743057@ypsilon.sirena.org.uk>
References: <20190809073616.1235-3-vkoul@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190809073616.1235-3-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

The patch

   regulator: qcom-rpmh: Fix pmic5_bob voltage count

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

>From 553c452d6093d66e7617ed6c68cc93547d07075f Mon Sep 17 00:00:00 2001
From: Vinod Koul <vkoul@kernel.org>
Date: Fri, 9 Aug 2019 13:06:15 +0530
Subject: [PATCH] regulator: qcom-rpmh: Fix pmic5_bob voltage count

pmic5_bob voltages count is 136 [0,135] so update it

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Link: https://lore.kernel.org/r/20190809073616.1235-3-vkoul@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/qcom-rpmh-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 0ef2716da3bd..391ed844a251 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -698,7 +698,7 @@ static const struct rpmh_vreg_hw_data pmic5_bob = {
 	.regulator_type = VRM,
 	.ops = &rpmh_regulator_vrm_bypass_ops,
 	.voltage_range = REGULATOR_LINEAR_RANGE(300000, 0, 135, 32000),
-	.n_voltages = 135,
+	.n_voltages = 136,
 	.pmic_mode_map = pmic_mode_map_pmic4_bob,
 	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
 };
-- 
2.20.1
