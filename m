From: Ian Lartey <ian@slimlogic.co.uk>
Subject: [PATCH v10 12/12] regulator: palmas remove palmas-charger option from DT bindings
Date: Fri, 22 Mar 2013 14:55:22 +0000
Message-ID: <1363964122-19201-13-git-send-email-ian@slimlogic.co.uk>
References: <1363964122-19201-1-git-send-email-ian@slimlogic.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363964122-19201-1-git-send-email-ian@slimlogic.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, swarren@wwwdotorg.org, grant.likely@secretlab.ca, broonie@opensource.wolfsonmicro.com, rob.herring@calxeda.com, rob@landley.net, mturquette@linaro.org, linus.walleij@linaro.org, cooloney@gmail.com, sfr@canb.auug.org.au, rpurdie@rpsys.net, akpm@linux-foundation.org, sameo@linux.intel.com, wim@iguana.be, lgirdwood@gmail.com, gg@slimlogic.co.uk, j-keerthy@ti.com, ldewangan@nvidia.com, t-kristo@ti.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Ian Lartey <ian@slimlogic.co.uk>
---
 drivers/regulator/palmas-regulator.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/regulator/palmas-regulator.c b/drivers/regulator/palmas-regulator.c
index a9b558e..6b2d829 100644
--- a/drivers/regulator/palmas-regulator.c
+++ b/drivers/regulator/palmas-regulator.c
@@ -803,7 +803,6 @@ static int palmas_remove(struct platform_device *pdev)
 
 static struct of_device_id of_palmas_match_tbl[] = {
 	{ .compatible = "ti,palmas-pmic", },
-	{ .compatible = "ti,palmas-charger-pmic", },
 	{ .compatible = "ti,twl6035-pmic", },
 	{ .compatible = "ti,twl6036-pmic", },
 	{ .compatible = "ti,twl6037-pmic", },
-- 
1.7.0.4
