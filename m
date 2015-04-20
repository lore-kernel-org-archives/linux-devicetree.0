From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 1/3] regulator: max8973: get rid of extra variable for gpio validity
Date: Mon, 20 Apr 2015 18:24:15 +0530
Message-ID: <1429534457-15515-2-git-send-email-ldewangan@nvidia.com>
References: <1429534457-15515-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429534457-15515-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, lgirdwood@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

To find that dvs-gpio is valid or not, gpio API gpio_is_valid()
can be directly used instead of intermediate variable.

Removing the extra variable and using the gpio_is_valid().

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
This is same as earlier patch. Making this as part of this series.

 drivers/regulator/max8973-regulator.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/max8973-regulator.c b/drivers/regulator/max8973-regulator.c
index c3d55c2..1890808 100644
--- a/drivers/regulator/max8973-regulator.c
+++ b/drivers/regulator/max8973-regulator.c
@@ -100,7 +100,6 @@ struct max8973_chip {
 	int curr_vout_val[MAX8973_MAX_VOUT_REG];
 	int curr_vout_reg;
 	int curr_gpio_val;
-	bool valid_dvs_gpio;
 	struct regulator_ops ops;
 };
 
@@ -174,7 +173,7 @@ static int max8973_dcdc_set_voltage_sel(struct regulator_dev *rdev,
 	 * If gpios are available to select the VOUT register then least
 	 * recently used register for new configuration.
 	 */
-	if (max->valid_dvs_gpio)
+	if (gpio_is_valid(max->dvs_gpio))
 		found = find_voltage_set_register(max, vsel,
 					&vout_reg, &gpio_val);
 
@@ -191,7 +190,7 @@ static int max8973_dcdc_set_voltage_sel(struct regulator_dev *rdev,
 	}
 
 	/* Select proper VOUT register vio gpios */
-	if (max->valid_dvs_gpio) {
+	if (gpio_is_valid(max->dvs_gpio)) {
 		gpio_set_value_cansleep(max->dvs_gpio, gpio_val & 0x1);
 		max->curr_gpio_val = gpio_val;
 	}
@@ -434,7 +433,6 @@ static int max8973_probe(struct i2c_client *client,
 				max->dvs_gpio, ret);
 			return ret;
 		}
-		max->valid_dvs_gpio = true;
 
 		/*
 		 * Initialize the lru index with vout_reg id
@@ -444,8 +442,6 @@ static int max8973_probe(struct i2c_client *client,
 			max->lru_index[i] = i;
 		max->lru_index[0] = max->curr_vout_reg;
 		max->lru_index[max->curr_vout_reg] = 0;
-	} else {
-		max->valid_dvs_gpio = false;
 	}
 
 	if (pdata) {
-- 
1.8.1.5
