From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: core: Refactor regulator_list_voltage()" to the regulator tree
Date: Fri, 26 Jan 2018 17:35:44 +0000
Message-ID: <E1ef7ui-0002cM-Mz@debutante>
References: <1516631412-17542-3-git-send-email-m.purski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516631412-17542-3-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.orgMark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   regulator: core: Refactor regulator_list_voltage()

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

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

>From 3d67fe950707a930664c5673ecc026f1bb497136 Mon Sep 17 00:00:00 2001
From: Maciej Purski <m.purski@samsung.com>
Date: Mon, 22 Jan 2018 15:30:07 +0100
Subject: [PATCH] regulator: core: Refactor regulator_list_voltage()

Change _regulator_list_voltage() argument from regulator to
regulator_dev in order to provide better separation of core layers.
Allow calling _regulator_list_voltage() from functions, with
regulator_dev argument. This refactoring is needed in order to
implement setting voltage of coupled regulators.

Signed-off-by: Maciej Purski <m.purski@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 5f7678292cef..fd8eacfea422 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2447,10 +2447,9 @@ static int _regulator_is_enabled(struct regulator_dev *rdev)
 	return rdev->desc->ops->is_enabled(rdev);
 }
 
-static int _regulator_list_voltage(struct regulator *regulator,
-				    unsigned selector, int lock)
+static int _regulator_list_voltage(struct regulator_dev *rdev,
+				   unsigned selector, int lock)
 {
-	struct regulator_dev *rdev = regulator->rdev;
 	const struct regulator_ops *ops = rdev->desc->ops;
 	int ret;
 
@@ -2466,7 +2465,8 @@ static int _regulator_list_voltage(struct regulator *regulator,
 		if (lock)
 			mutex_unlock(&rdev->mutex);
 	} else if (rdev->is_switch && rdev->supply) {
-		ret = _regulator_list_voltage(rdev->supply, selector, lock);
+		ret = _regulator_list_voltage(rdev->supply->rdev,
+					      selector, lock);
 	} else {
 		return -EINVAL;
 	}
@@ -2542,7 +2542,7 @@ EXPORT_SYMBOL_GPL(regulator_count_voltages);
  */
 int regulator_list_voltage(struct regulator *regulator, unsigned selector)
 {
-	return _regulator_list_voltage(regulator, selector, 1);
+	return _regulator_list_voltage(regulator->rdev, selector, 1);
 }
 EXPORT_SYMBOL_GPL(regulator_list_voltage);
 
-- 
2.15.1
