From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v3 2/2] gpio: sprd: Change to use SoC compatible string
Date: Tue, 19 Feb 2019 10:29:58 +0800
Message-ID: <d0f8377078efc1af13fa81c5d6837f3f26ddc1fb.1550543288.git.baolin.wang@linaro.org>
References: <70f5476004b2f4e4b444bf8425f21a3c993edf47.1550543288.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <70f5476004b2f4e4b444bf8425f21a3c993edf47.1550543288.git.baolin.wang@linaro.org>
In-Reply-To: <70f5476004b2f4e4b444bf8425f21a3c993edf47.1550543288.git.baolin.wang@linaro.org>
References: <70f5476004b2f4e4b444bf8425f21a3c993edf47.1550543288.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc: orsonzhai@gmail.com, zhang.lyra@gmail.com, baolin.wang@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Change to use SoC compatible string instead of wildcard string.

The Spreadtrum SC9860 platform device trees and drivers' development
are still in progress, and now we will always recompile and ship
device trees at the same time as we will compile and ship the kernel,
so we do not need care about the backwards compatibility.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
Changes from v2:
 - Add some comments to explain why we do not care backwards compatibility.

Changes from v1:
 - None.
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
