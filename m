From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v4 2/7] regulator: core: Refactor regulator_list_voltage()
Date: Mon, 22 Jan 2018 15:30:07 +0100
Message-ID: <1516631412-17542-3-git-send-email-m.purski@samsung.com>
References: <1516631412-17542-1-git-send-email-m.purski@samsung.com>
        <CGME20180122143030eucas1p2eb1054dd14902eb0be83e5c9efb11d98@eucas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1516631412-17542-1-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Maciej Purski <m.purski@samsung.com>
List-Id: devicetree@vger.kernel.org

Change _regulator_list_voltage() argument from regulator to
regulator_dev in order to provide better separation of core layers.
Allow calling _regulator_list_voltage() from functions, with
regulator_dev argument. This refactoring is needed in order to
implement setting voltage of coupled regulators.

Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 drivers/regulator/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index ab6652e..1118527 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2448,10 +2448,9 @@ static int _regulator_is_enabled(struct regulator_dev *rdev)
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
 
@@ -2467,7 +2466,8 @@ static int _regulator_list_voltage(struct regulator *regulator,
 		if (lock)
 			mutex_unlock(&rdev->mutex);
 	} else if (rdev->is_switch && rdev->supply) {
-		ret = _regulator_list_voltage(rdev->supply, selector, lock);
+		ret = _regulator_list_voltage(rdev->supply->rdev,
+					      selector, lock);
 	} else {
 		return -EINVAL;
 	}
@@ -2543,7 +2543,7 @@ EXPORT_SYMBOL_GPL(regulator_count_voltages);
  */
 int regulator_list_voltage(struct regulator *regulator, unsigned selector)
 {
-	return _regulator_list_voltage(regulator, selector, 1);
+	return _regulator_list_voltage(regulator->rdev, selector, 1);
 }
 EXPORT_SYMBOL_GPL(regulator_list_voltage);
 
-- 
2.7.4
