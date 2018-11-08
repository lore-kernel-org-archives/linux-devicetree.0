From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 2/6] regulator: lochnagar: Move driver to binding from DT
Date: Thu, 8 Nov 2018 10:14:01 +0000
Message-ID: <20181108101405.14062-3-ckeepax@opensource.cirrus.com>
References: <20181108101405.14062-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108101405.14062-1-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, broonie@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Based on review comments on the MFD driver, move the child drivers for
the Lochnagar MFD over to binding through device tree.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Mark, I would maybe hold on merging this one until discussions
on this version of the patch chain are done, just incase we
decide to go back to the single DT entry.

Thanks,
Charles

 drivers/regulator/lochnagar-regulator.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/lochnagar-regulator.c b/drivers/regulator/lochnagar-regulator.c
index 182198246479f..d08fe830b39c1 100644
--- a/drivers/regulator/lochnagar-regulator.c
+++ b/drivers/regulator/lochnagar-regulator.c
@@ -222,7 +222,7 @@ static int lochnagar_regulator_probe(struct platform_device *pdev)
 	struct regulator_dev *rdev;
 	int ret, i;
 
-	config.dev = lochnagar->dev;
+	config.dev = dev;
 	config.regmap = lochnagar->regmap;
 	config.driver_data = lochnagar;
 
@@ -241,9 +241,15 @@ static int lochnagar_regulator_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id lochnagar_of_match[] = {
+	{ .compatible = "cirrus,lochnagar-regulator" },
+	{},
+};
+
 static struct platform_driver lochnagar_regulator_driver = {
 	.driver = {
 		.name = "lochnagar-regulator",
+		.of_match_table = of_match_ptr(lochnagar_of_match),
 	},
 
 	.probe = lochnagar_regulator_probe,
-- 
2.11.0
