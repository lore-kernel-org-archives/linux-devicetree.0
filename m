From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH 2/2] gpio: sprd: Change to use SoC compatible string
Date: Wed, 13 Feb 2019 20:48:14 +0800
Message-ID: <0438b78c7f9f9bc3f0e7bcbcef3873fd2dd7e259.1550061925.git.baolin.wang@linaro.org>
References: <b8101fd6d303c1993ee294eeee8bce4d24b9547f.1550061925.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b8101fd6d303c1993ee294eeee8bce4d24b9547f.1550061925.git.baolin.wang@linaro.org>
In-Reply-To: <b8101fd6d303c1993ee294eeee8bce4d24b9547f.1550061925.git.baolin.wang@linaro.org>
References: <b8101fd6d303c1993ee294eeee8bce4d24b9547f.1550061925.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc: orsonzhai@gmail.com, zhang.lyra@gmail.com, baolin.wang@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Change to use SoC compatible string instead of wildcard string.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/gpio/gpio-pmic-eic-sprd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pmic-eic-sprd.c b/drivers/gpio/gpio-pmic-eic-sprd.c
index ac573da..24228cf 100644
--- a/drivers/gpio/gpio-pmic-eic-sprd.c
+++ b/drivers/gpio/gpio-pmic-eic-sprd.c
@@ -364,7 +364,7 @@ static int sprd_pmic_eic_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id sprd_pmic_eic_of_match[] = {
-	{ .compatible = "sprd,sc27xx-eic", },
+	{ .compatible = "sprd,sc2731-eic", },
 	{ /* end of list */ }
 };
 MODULE_DEVICE_TABLE(of, sprd_pmic_eic_of_match);
-- 
1.7.9.5
