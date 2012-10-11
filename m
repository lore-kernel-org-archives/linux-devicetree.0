From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 05/15] pinctrl: samsung: Distinguish between pin group and bank
 nodes
Date: Thu, 11 Oct 2012 10:11:11 +0200
Message-ID: <1349943081-27939-6-git-send-email-t.figa@samsung.com>
References: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, linus.walleij@linaro.org, swarren@wwwdotorg.org, tony@atomide.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com
List-Id: devicetree@vger.kernel.org

This patch modifies the loop iterating over all child nodes and parsing
pin groups to check whether the node is really a pin group node by
checking for existence of samsung,pins property.

This is a prerequisite for further patches adding additional subnodes to
the pinctrl node, required for per bank GPIO and interrupt specifiers.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 drivers/pinctrl/pinctrl-samsung.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index f219bb6..94e1378 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -609,7 +609,7 @@ static int __init samsung_pinctrl_parse_dt(struct platform_device *pdev,
 	 */
 	for_each_child_of_node(dev_np, cfg_np) {
 		u32 function;
-		if (of_find_property(cfg_np, "interrupt-controller", NULL))
+		if (!of_find_property(cfg_np, "samsung,pins", NULL))
 			continue;
 
 		ret = samsung_pinctrl_parse_dt_pins(pdev, cfg_np,
-- 
1.7.12
