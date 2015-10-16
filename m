From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH v6 1/7] pinctrl: berlin: introduce
 berlin_pinctrl_probe_regmap()
Date: Fri, 16 Oct 2015 15:37:06 +0800
Message-ID: <1444981032-4401-2-git-send-email-jszhang@marvell.com>
References: <1444981032-4401-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1444981032-4401-1-git-send-email-jszhang@marvell.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org, antoine.tenart@free-electrons.com, catalin.marinas@arm.com, will.deacon@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: Jisheng Zhang <jszhang@marvell.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This is to prepare for the next berlin4ct support, where we won't use
simple-mfd any more.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Acked-by: Antoine Tenart <antoine.tenart@free-electrons.com>
---
 drivers/pinctrl/berlin/berlin.c | 26 +++++++++++++++++---------
 drivers/pinctrl/berlin/berlin.h |  4 ++++
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
index f495806..898afa4 100644
--- a/drivers/pinctrl/berlin/berlin.c
+++ b/drivers/pinctrl/berlin/berlin.c
@@ -292,20 +292,14 @@ static struct pinctrl_desc berlin_pctrl_desc = {
 	.owner		= THIS_MODULE,
 };
 
-int berlin_pinctrl_probe(struct platform_device *pdev,
-			 const struct berlin_pinctrl_desc *desc)
+int berlin_pinctrl_probe_regmap(struct platform_device *pdev,
+				const struct berlin_pinctrl_desc *desc,
+				struct regmap *regmap)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *parent_np = of_get_parent(dev->of_node);
 	struct berlin_pinctrl *pctrl;
-	struct regmap *regmap;
 	int ret;
 
-	regmap = syscon_node_to_regmap(parent_np);
-	of_node_put(parent_np);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
 	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
 	if (!pctrl)
 		return -ENOMEM;
@@ -330,3 +324,17 @@ int berlin_pinctrl_probe(struct platform_device *pdev,
 
 	return 0;
 }
+
+int berlin_pinctrl_probe(struct platform_device *pdev,
+			 const struct berlin_pinctrl_desc *desc)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *parent_np = of_get_parent(dev->of_node);
+	struct regmap *regmap = syscon_node_to_regmap(parent_np);
+
+	of_node_put(parent_np);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return berlin_pinctrl_probe_regmap(pdev, desc, regmap);
+}
diff --git a/drivers/pinctrl/berlin/berlin.h b/drivers/pinctrl/berlin/berlin.h
index e1aa841..dabbd2a 100644
--- a/drivers/pinctrl/berlin/berlin.h
+++ b/drivers/pinctrl/berlin/berlin.h
@@ -58,4 +58,8 @@ struct berlin_pinctrl_function {
 int berlin_pinctrl_probe(struct platform_device *pdev,
 			 const struct berlin_pinctrl_desc *desc);
 
+int berlin_pinctrl_probe_regmap(struct platform_device *pdev,
+				const struct berlin_pinctrl_desc *desc,
+				struct regmap *regmap);
+
 #endif /* __PINCTRL_BERLIN_H */
-- 
2.6.1
