From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 1/6] regulator: core: Allow simultaneous use of enable op and GPIO
Date: Wed, 22 Jun 2016 17:25:53 +0900
Message-ID: <20160622082558.20935-2-acourbot@nvidia.com>
References: <20160622082558.20935-1-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160622082558.20935-1-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

The current regulator enable/disable mechanism does not call the driver
enable/disable op if an enable GPIO is set. It may be desirable to use
both mechanisms though, e.g. in the case of a PWM regulator that also
has an enable GPIO.

_regulator_is_enabled() is also updated in order to take both enable
conditions into account.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/regulator/core.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index db320e8fa865..995706070906 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2111,6 +2111,9 @@ static int _regulator_do_enable(struct regulator_dev *rdev)
 		}
 	}
 
+	if (!rdev->ena_pin && !rdev->desc->ops->enable)
+		return -EINVAL;
+
 	if (rdev->ena_pin) {
 		if (!rdev->ena_gpio_state) {
 			ret = regulator_ena_gpio_ctrl(rdev, true);
@@ -2118,12 +2121,12 @@ static int _regulator_do_enable(struct regulator_dev *rdev)
 				return ret;
 			rdev->ena_gpio_state = 1;
 		}
-	} else if (rdev->desc->ops->enable) {
+	}
+
+	if (rdev->desc->ops->enable) {
 		ret = rdev->desc->ops->enable(rdev);
 		if (ret < 0)
 			return ret;
-	} else {
-		return -EINVAL;
 	}
 
 	/* Allow the regulator to ramp; it would be useful to extend
@@ -2215,6 +2218,12 @@ static int _regulator_do_disable(struct regulator_dev *rdev)
 
 	trace_regulator_disable(rdev_get_name(rdev));
 
+	if (rdev->desc->ops->disable) {
+		ret = rdev->desc->ops->disable(rdev);
+		if (ret != 0)
+			return ret;
+	}
+
 	if (rdev->ena_pin) {
 		if (rdev->ena_gpio_state) {
 			ret = regulator_ena_gpio_ctrl(rdev, false);
@@ -2222,11 +2231,6 @@ static int _regulator_do_disable(struct regulator_dev *rdev)
 				return ret;
 			rdev->ena_gpio_state = 0;
 		}
-
-	} else if (rdev->desc->ops->disable) {
-		ret = rdev->desc->ops->disable(rdev);
-		if (ret != 0)
-			return ret;
 	}
 
 	/* cares about last_off_jiffy only if off_on_delay is required by
@@ -2436,15 +2440,17 @@ EXPORT_SYMBOL_GPL(regulator_disable_deferred);
 
 static int _regulator_is_enabled(struct regulator_dev *rdev)
 {
-	/* A GPIO control always takes precedence */
+	/* If we don't know then assume that the regulator is always on */
+	bool pin_enb = true;
+	bool ops_enb = true;
+
 	if (rdev->ena_pin)
-		return rdev->ena_gpio_state;
+		pin_enb = rdev->ena_gpio_state;
 
-	/* If we don't know then assume that the regulator is always on */
-	if (!rdev->desc->ops->is_enabled)
-		return 1;
+	if (rdev->desc->ops->is_enabled)
+		ops_enb = rdev->desc->ops->is_enabled(rdev);
 
-	return rdev->desc->ops->is_enabled(rdev);
+	return pin_enb && ops_enb;
 }
 
 static int _regulator_list_voltage(struct regulator *regulator,
-- 
2.8.3
