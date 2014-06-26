From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: [PATCH] pinctrl: pinctrl-imx1-core.c:  Cleaning up if unsigned is less than zero
Date: Thu, 26 Jun 2014 13:29:49 +0200
Message-ID: <1403782189-10027-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>
Cc: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Remove checking if a unsigned is less than zero

This was found using a static code analysis program called cppcheck.

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
---
 drivers/pinctrl/pinctrl-imx1-core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-imx1-core.c b/drivers/pinctrl/pinctrl-imx1-core.c
index 815384b..4834207 100644
--- a/drivers/pinctrl/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/pinctrl-imx1-core.c
@@ -526,7 +526,7 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
 	/* Initialise function */
 	func->name = np->name;
 	func->num_groups = of_get_child_count(np);
-	if (func->num_groups <= 0)
+	if (func->num_groups == 0)
 		return -EINVAL;
 
 	func->groups = devm_kzalloc(info->dev,
-- 
1.7.10.4
