From: <sean.wang@mediatek.com>
Subject: [PATCH v3 9/9] soc: mediatek: pwrap: fixup warnings from coding style
Date: Tue, 15 Aug 2017 17:09:21 +0800
Message-ID: <bced4c32225905f0a3e2a837e2cb98819fd22641.1502779753.git.sean.wang@mediatek.com>
References: <cover.1502779753.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1502779753.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, jamesjj.liao@mediatek.com, henryc.chen@mediatek.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: chen.zhong@mediatek.com, chenglin.xu@mediatek.com, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

fixup those warnings such as lines over 80 words and parenthesis
alignment which would be complained by checkpatch.pl.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 1b1569c..7670c58 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1057,7 +1057,8 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 	/* wait for cipher data ready@PMIC */
 	ret = pwrap_wait_for_state(wrp, pwrap_is_pmic_cipher_ready);
 	if (ret) {
-		dev_err(wrp->dev, "timeout waiting for cipher data ready@PMIC\n");
+		dev_err(wrp->dev,
+			"timeout waiting for cipher data ready@PMIC\n");
 		return ret;
 	}
 
@@ -1458,23 +1459,27 @@ static int pwrap_probe(struct platform_device *pdev)
 		if (IS_ERR(wrp->bridge_base))
 			return PTR_ERR(wrp->bridge_base);
 
-		wrp->rstc_bridge = devm_reset_control_get(wrp->dev, "pwrap-bridge");
+		wrp->rstc_bridge = devm_reset_control_get(wrp->dev,
+							  "pwrap-bridge");
 		if (IS_ERR(wrp->rstc_bridge)) {
 			ret = PTR_ERR(wrp->rstc_bridge);
-			dev_dbg(wrp->dev, "cannot get pwrap-bridge reset: %d\n", ret);
+			dev_dbg(wrp->dev,
+				"cannot get pwrap-bridge reset: %d\n", ret);
 			return ret;
 		}
 	}
 
 	wrp->clk_spi = devm_clk_get(wrp->dev, "spi");
 	if (IS_ERR(wrp->clk_spi)) {
-		dev_dbg(wrp->dev, "failed to get clock: %ld\n", PTR_ERR(wrp->clk_spi));
+		dev_dbg(wrp->dev, "failed to get clock: %ld\n",
+			PTR_ERR(wrp->clk_spi));
 		return PTR_ERR(wrp->clk_spi);
 	}
 
 	wrp->clk_wrap = devm_clk_get(wrp->dev, "wrap");
 	if (IS_ERR(wrp->clk_wrap)) {
-		dev_dbg(wrp->dev, "failed to get clock: %ld\n", PTR_ERR(wrp->clk_wrap));
+		dev_dbg(wrp->dev, "failed to get clock: %ld\n",
+			PTR_ERR(wrp->clk_wrap));
 		return PTR_ERR(wrp->clk_wrap);
 	}
 
@@ -1519,8 +1524,9 @@ static int pwrap_probe(struct platform_device *pdev)
 	pwrap_writel(wrp, wrp->master->int_en_all, PWRAP_INT_EN);
 
 	irq = platform_get_irq(pdev, 0);
-	ret = devm_request_irq(wrp->dev, irq, pwrap_interrupt, IRQF_TRIGGER_HIGH,
-			"mt-pmic-pwrap", wrp);
+	ret = devm_request_irq(wrp->dev, irq, pwrap_interrupt,
+			       IRQF_TRIGGER_HIGH,
+			       "mt-pmic-pwrap", wrp);
 	if (ret)
 		goto err_out2;
 
-- 
2.7.4
