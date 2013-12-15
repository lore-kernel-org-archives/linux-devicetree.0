From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH 3/4] pinctrl-msm: Remove separate allocation of bitmaps
Date: Sat, 14 Dec 2013 23:01:53 -0800
Message-ID: <1387090914-4755-4-git-send-email-bjorn.andersson@sonymobile.com>
References: <1387090914-4755-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1387090914-4755-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Make the bitmaps part of the msm_pinctrl allocation instead of
separately allocating them.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 drivers/pinctrl/pinctrl-msm.c |   32 +++++---------------------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-msm.c b/drivers/pinctrl/pinctrl-msm.c
index c1a3053..011e263 100644
--- a/drivers/pinctrl/pinctrl-msm.c
+++ b/drivers/pinctrl/pinctrl-msm.c
@@ -36,6 +36,8 @@
 #include "pinctrl-msm.h"
 #include "pinctrl-utils.h"
 
+#define MAX_NR_GPIO 300
+
 /**
  * struct msm_pinctrl - state for a pinctrl-msm device
  * @dev:            device handle.
@@ -61,9 +63,9 @@ struct msm_pinctrl {
 
 	spinlock_t lock;
 
-	unsigned long *enabled_irqs;
-	unsigned long *dual_edge_irqs;
-	unsigned long *wake_irqs;
+	DECLARE_BITMAP(dual_edge_irqs, MAX_NR_GPIO);
+	DECLARE_BITMAP(enabled_irqs, MAX_NR_GPIO);
+	DECLARE_BITMAP(wake_irqs, MAX_NR_GPIO);
 
 	const struct msm_pinctrl_soc_data *soc;
 	void __iomem *regs;
@@ -875,30 +877,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	chip->owner = THIS_MODULE;
 	chip->of_node = pctrl->dev->of_node;
 
-	pctrl->enabled_irqs = devm_kzalloc(pctrl->dev,
-					   sizeof(unsigned long) * BITS_TO_LONGS(chip->ngpio),
-					   GFP_KERNEL);
-	if (!pctrl->enabled_irqs) {
-		dev_err(pctrl->dev, "Failed to allocate enabled_irqs bitmap\n");
-		return -ENOMEM;
-	}
-
-	pctrl->dual_edge_irqs = devm_kzalloc(pctrl->dev,
-					     sizeof(unsigned long) * BITS_TO_LONGS(chip->ngpio),
-					     GFP_KERNEL);
-	if (!pctrl->dual_edge_irqs) {
-		dev_err(pctrl->dev, "Failed to allocate dual_edge_irqs bitmap\n");
-		return -ENOMEM;
-	}
-
-	pctrl->wake_irqs = devm_kzalloc(pctrl->dev,
-					sizeof(unsigned long) * BITS_TO_LONGS(chip->ngpio),
-					GFP_KERNEL);
-	if (!pctrl->wake_irqs) {
-		dev_err(pctrl->dev, "Failed to allocate wake_irqs bitmap\n");
-		return -ENOMEM;
-	}
-
 	ret = gpiochip_add(&pctrl->chip);
 	if (ret) {
 		dev_err(pctrl->dev, "Failed register gpiochip\n");
-- 
1.7.9.5

