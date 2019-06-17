From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: qcom_spmi: Refactor get_mode/set_mode" to the regulator tree
Date: Mon, 17 Jun 2019 16:24:45 +0100 (BST)
Message-ID: <20190617152445.34116440046@finisterre.sirena.org.uk>
References: <20190613212531.10452-2-jeffrey.l.hugo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613212531.10452-2-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: agross@kernel.org, bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.orgMark Brown <broonie@kernel.org>, mark.rutland@arm.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: qcom_spmi: Refactor get_mode/set_mode

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.3

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

>From ba576a6232dc06605f4edfaeea9b526ba7724f84 Mon Sep 17 00:00:00 2001
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Thu, 13 Jun 2019 14:25:31 -0700
Subject: [PATCH] regulator: qcom_spmi: Refactor get_mode/set_mode

spmi_regulator_common_get_mode and spmi_regulator_common_set_mode use
multi-level ifs which mirror a switch statement.  Refactor to use a switch
statement to make the code flow more clear.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/qcom_spmi-regulator.c | 26 +++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 42c429d50743..1b3383a24c9d 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -911,13 +911,16 @@ static unsigned int spmi_regulator_common_get_mode(struct regulator_dev *rdev)
 
 	spmi_vreg_read(vreg, SPMI_COMMON_REG_MODE, &reg, 1);
 
-	if (reg & SPMI_COMMON_MODE_HPM_MASK)
-		return REGULATOR_MODE_NORMAL;
+	reg &= SPMI_COMMON_MODE_HPM_MASK | SPMI_COMMON_MODE_AUTO_MASK;
 
-	if (reg & SPMI_COMMON_MODE_AUTO_MASK)
+	switch (reg) {
+	case SPMI_COMMON_MODE_HPM_MASK:
+		return REGULATOR_MODE_NORMAL;
+	case SPMI_COMMON_MODE_AUTO_MASK:
 		return REGULATOR_MODE_FAST;
-
-	return REGULATOR_MODE_IDLE;
+	default:
+		return REGULATOR_MODE_IDLE;
+	}
 }
 
 static int
@@ -925,12 +928,19 @@ spmi_regulator_common_set_mode(struct regulator_dev *rdev, unsigned int mode)
 {
 	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
 	u8 mask = SPMI_COMMON_MODE_HPM_MASK | SPMI_COMMON_MODE_AUTO_MASK;
-	u8 val = 0;
+	u8 val;
 
-	if (mode == REGULATOR_MODE_NORMAL)
+	switch (mode) {
+	case REGULATOR_MODE_NORMAL:
 		val = SPMI_COMMON_MODE_HPM_MASK;
-	else if (mode == REGULATOR_MODE_FAST)
+		break;
+	case REGULATOR_MODE_FAST:
 		val = SPMI_COMMON_MODE_AUTO_MASK;
+		break;
+	default:
+		val = 0;
+		break;
+	}
 
 	return spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_MODE, val, mask);
 }
-- 
2.20.1
