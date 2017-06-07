From: Guodong Xu <guodong.xu@linaro.org>
Subject: [PATCH v5 2/8] mfd: hi6421-pmic: cleanup: update dev_err messages
Date: Wed,  7 Jun 2017 15:06:00 +0800
Message-ID: <20170607070606.8889-3-guodong.xu@linaro.org>
References: <20170607070606.8889-1-guodong.xu@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170607070606.8889-1-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, lgirdwood@gmail.com, broonie@kernel.org, khilman@baylibre.com, arnd@arndb.de, gregory.clement@free-electrons.com, horms+renesas@verge.net.au, olof@lixom.net, thomas.petazzoni@free-electrons.com, yamada.masahiro@socionext.com, riku.voipio@linaro.org, treding@nvidia.com, krzk@kernel.org, eric@anholt.net, damm+renesas@opensource.se, ard.biesheuvel@linaro.org, linus.walleij@linaro.org, geert+renesas@glider.be
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Guodong Xu <guodong.xu@linaro.org>
List-Id: devicetree@vger.kernel.org

Update dev_err messages to make them more readable.

Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
---
 drivers/mfd/hi6421-pmic-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/hi6421-pmic-core.c b/drivers/mfd/hi6421-pmic-core.c
index ad9e3d8..b1139d4 100644
--- a/drivers/mfd/hi6421-pmic-core.c
+++ b/drivers/mfd/hi6421-pmic-core.c
@@ -52,8 +52,8 @@ static int hi6421_pmic_probe(struct platform_device *pdev)
 	pmic->regmap = devm_regmap_init_mmio_clk(&pdev->dev, NULL, base,
 						 &hi6421_regmap_config);
 	if (IS_ERR(pmic->regmap)) {
-		dev_err(&pdev->dev,
-			"regmap init failed: %ld\n", PTR_ERR(pmic->regmap));
+		dev_err(&pdev->dev, "Failed to initialise Regmap: %ld\n",
+						PTR_ERR(pmic->regmap));
 		return PTR_ERR(pmic->regmap);
 	}
 
@@ -70,7 +70,7 @@ static int hi6421_pmic_probe(struct platform_device *pdev)
 	ret = devm_mfd_add_devices(&pdev->dev, 0, hi6421_devs,
 				   ARRAY_SIZE(hi6421_devs), NULL, 0, NULL);
 	if (ret) {
-		dev_err(&pdev->dev, "add mfd devices failed: %d\n", ret);
+		dev_err(&pdev->dev, "Failed to add child devices: %d\n", ret);
 		return ret;
 	}
 
-- 
2.10.2
