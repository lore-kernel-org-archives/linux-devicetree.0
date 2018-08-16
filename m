From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/7] pinctrl: ingenic: Mark probe function as __init
Date: Thu, 16 Aug 2018 18:35:39 +0200
Message-ID: <20180816163544.9072-2-paul@crapouillou.net>
References: <20180816163544.9072-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180816163544.9072-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

By using platform_driver_probe() instead of platform_driver_register(),
we can mark the ingenic_pinctrl_probe() function as __init.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/pinctrl-ingenic.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 4bceae88d056..1d6d7c6aecfc 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -717,7 +717,7 @@ static const struct of_device_id ingenic_pinctrl_of_match[] = {
 	{},
 };
 
-static int ingenic_pinctrl_probe(struct platform_device *pdev)
+static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct ingenic_pinctrl *jzpc;
@@ -837,14 +837,13 @@ static struct platform_driver ingenic_pinctrl_driver = {
 	.driver = {
 		.name = "pinctrl-ingenic",
 		.of_match_table = of_match_ptr(ingenic_pinctrl_of_match),
-		.suppress_bind_attrs = true,
 	},
-	.probe = ingenic_pinctrl_probe,
 	.id_table = ingenic_pinctrl_ids,
 };
 
 static int __init ingenic_pinctrl_drv_register(void)
 {
-	return platform_driver_register(&ingenic_pinctrl_driver);
+	return platform_driver_probe(&ingenic_pinctrl_driver,
+				     ingenic_pinctrl_probe);
 }
 subsys_initcall(ingenic_pinctrl_drv_register);
-- 
2.11.0
