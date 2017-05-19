From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 2/5] iio: adc: stm32: make core adc clock optional by default
Date: Fri, 19 May 2017 14:45:25 +0200
Message-ID: <1495197928-1439-3-git-send-email-fabrice.gasnier@st.com>
References: <1495197928-1439-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1495197928-1439-1-git-send-email-fabrice.gasnier@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jic23@kernel.org, linux@armlinux.org.uk, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, benjamin.gaignard@linaro.org, lars@metafoo.de, alexandre.torgue@st.com, linux-iio@vger.kernel.org, pmeerw@pmeerw.net, mcoquelin.stm32@gmail.com, knaack.h@gmx.de, fabrice.gasnier@st.com, benjamin.gaignard@st.com
List-Id: devicetree@vger.kernel.org

Analog clock input is mandatory on stm32f4. But newer version of
ADC hardware block allow to select either bus clock or asynchronous
clock, for analog circuitry.

So, make it optional by default, but enforce clk presence on stm32f4.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/iio/adc/stm32-adc-core.c | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index 22b7c93..597ab7a 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -85,13 +85,21 @@ static int stm32f4_adc_clk_sel(struct platform_device *pdev,
 	u32 val;
 	int i;
 
+	/* stm32f4 has one clk input for analog (mandatory), enforce it here */
+	if (!priv->aclk) {
+		dev_err(&pdev->dev, "No 'adc' clock found\n");
+		return -ENOENT;
+	}
+
 	rate = clk_get_rate(priv->aclk);
 	for (i = 0; i < ARRAY_SIZE(stm32f4_pclk_div); i++) {
 		if ((rate / stm32f4_pclk_div[i]) <= STM32F4_ADC_MAX_CLK_RATE)
 			break;
 	}
-	if (i >= ARRAY_SIZE(stm32f4_pclk_div))
+	if (i >= ARRAY_SIZE(stm32f4_pclk_div)) {
+		dev_err(&pdev->dev, "adc clk selection failed\n");
 		return -EINVAL;
+	}
 
 	val = readl_relaxed(priv->common.base + STM32F4_ADC_CCR);
 	val &= ~STM32F4_ADC_ADCPRE_MASK;
@@ -227,21 +235,25 @@ static int stm32_adc_probe(struct platform_device *pdev)
 	priv->aclk = devm_clk_get(&pdev->dev, "adc");
 	if (IS_ERR(priv->aclk)) {
 		ret = PTR_ERR(priv->aclk);
-		dev_err(&pdev->dev, "Can't get 'adc' clock\n");
-		goto err_regulator_disable;
+		if (ret == -ENOENT) {
+			priv->aclk = NULL;
+		} else {
+			dev_err(&pdev->dev, "Can't get 'adc' clock\n");
+			goto err_regulator_disable;
+		}
 	}
 
-	ret = clk_prepare_enable(priv->aclk);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "adc clk enable failed\n");
-		goto err_regulator_disable;
+	if (priv->aclk) {
+		ret = clk_prepare_enable(priv->aclk);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "adc clk enable failed\n");
+			goto err_regulator_disable;
+		}
 	}
 
 	ret = stm32f4_adc_clk_sel(pdev, priv);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "adc clk selection failed\n");
+	if (ret < 0)
 		goto err_clk_disable;
-	}
 
 	ret = stm32_adc_irq_probe(pdev, priv);
 	if (ret < 0)
@@ -261,7 +273,8 @@ static int stm32_adc_probe(struct platform_device *pdev)
 	stm32_adc_irq_remove(pdev, priv);
 
 err_clk_disable:
-	clk_disable_unprepare(priv->aclk);
+	if (priv->aclk)
+		clk_disable_unprepare(priv->aclk);
 
 err_regulator_disable:
 	regulator_disable(priv->vref);
@@ -276,7 +289,8 @@ static int stm32_adc_remove(struct platform_device *pdev)
 
 	of_platform_depopulate(&pdev->dev);
 	stm32_adc_irq_remove(pdev, priv);
-	clk_disable_unprepare(priv->aclk);
+	if (priv->aclk)
+		clk_disable_unprepare(priv->aclk);
 	regulator_disable(priv->vref);
 
 	return 0;
-- 
1.9.1
