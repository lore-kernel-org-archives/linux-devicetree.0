From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH v6 5/5] regulator: RK808: remove redundant code
Date: Tue, 26 Aug 2014 22:18:57 +0800
Message-ID: <1409062737-12259-1-git-send-email-zyw@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, a.zummo@towertech.it, mturquette@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, grant.likely@linaro.org, hl@rock-chips.com, huangtao@rock-chips.com, cf@rock-chips.com, zhangqing@rock-chips.com, xxx@rock-chips.com, dianders@chromium.org, heiko@sntech.de, olof@lixom.net, sonnyrao@chromium.org, dtor@chromium.org, javier.martinez@collabora.co.uk, kever.yang@rock-chips.com, Chris Zhong <zyw@rock-chips.com>
List-Id: devicetree@vger.kernel.org

remove the redundant code, since pdata has been removed from stuct rk808

Signed-off-by: Chris Zhong <zyw@rock-chips.com>

---

Changes in v6: 
- remove the redundant code

Changes in v5:
- re-edit base on Mark's branch

Changes in v4:
- use &client->dev replace rk808->dev

Changes in v3: None
Changes in v2:
Adviced by Mark Browm:
- change of_find_node_by_name to find_child_by_name
- use RK808_NUM_REGULATORS as the name of the constant
- create a pdata when missing platform data
- use the rk808_reg name to supply_regulator name
- replace regulator_register with devm_regulator_register
- some other problem with coding styl

 drivers/regulator/rk808-regulator.c |   17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/regulator/rk808-regulator.c b/drivers/regulator/rk808-regulator.c
index f00d6d8..f42952e 100644
--- a/drivers/regulator/rk808-regulator.c
+++ b/drivers/regulator/rk808-regulator.c
@@ -294,11 +294,10 @@ static struct of_regulator_match rk808_reg_matches[] = {
 	[RK808_ID_SWITCH2]	= { .name = "SWITCH_REG2" },
 };
 
-static int rk808_regulator_dts(struct rk808 *rk808)
+static int rk808_regulator_dts(struct i2c_client *client,
+			       struct rk808_board *pdata)
 {
 	struct device_node *np, *reg_np;
-	struct i2c_client *client = rk808->i2c;
-	struct rk808_board *pdata = rk808->pdata;
 	int i, ret;
 
 	np = client->dev.of_node;
@@ -335,7 +334,7 @@ static int rk808_regulator_probe(struct platform_device *pdev)
 {
 	struct rk808 *rk808 = dev_get_drvdata(pdev->dev.parent);
 	struct i2c_client *client = rk808->i2c;
-	struct rk808_board *pdata = rk808->pdata;
+	struct rk808_board *pdata = dev_get_platdata(&client->dev);
 	struct regulator_config config = {};
 	struct regulator_dev *rk808_rdev;
 	struct regulator_init_data *reg_data;
@@ -343,22 +342,15 @@ static int rk808_regulator_probe(struct platform_device *pdev)
 	int ret = 0;
 
 	if (!pdata) {
-		dev_warn(&client->dev, "%s no pdata, create it\n", __func__);
 		pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
 		if (!pdata)
 			return -ENOMEM;
 	}
 
-	ret = rk808_regulator_dts(rk808);
+	ret = rk808_regulator_dts(client, pdata);
 	if (ret)
 		return ret;
 
-	rk808->num_regulators = RK808_NUM_REGULATORS;
-	rk808->rdev = devm_kzalloc(&pdev->dev, RK808_NUM_REGULATORS *
-				   sizeof(struct regulator_dev *), GFP_KERNEL);
-	if (!rk808->rdev)
-		return -ENOMEM;
-
 	/* Instantiate the regulators */
 	for (i = 0; i < RK808_NUM_REGULATORS; i++) {
 		reg_data = pdata->rk808_init_data[i];
@@ -382,7 +374,6 @@ static int rk808_regulator_probe(struct platform_device *pdev)
 				"failed to register %d regulator\n", i);
 			return PTR_ERR(rk808_rdev);
 		}
-		rk808->rdev[i] = rk808_rdev;
 	}
 	return 0;
 }
-- 
1.7.9.5
