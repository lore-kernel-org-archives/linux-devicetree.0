From: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 3/4] iio: dac: stm32: add support for stm32f4
Date: Mon, 10 Jul 2017 15:23:59 +0200
Message-ID: <1499693040-12994-4-git-send-email-fabrice.gasnier@st.com>
References: <1499693040-12994-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1499693040-12994-1-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, fabrice.gasnier-qxv4g6HH51o@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds support for STM32F4 Digital-To-Analog converter.
Add compatible configuration data to handle hfsel (not present
in stm32f4).

Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
---
 drivers/iio/dac/stm32-dac-core.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/dac/stm32-dac-core.c b/drivers/iio/dac/stm32-dac-core.c
index 75e4878..32701be 100644
--- a/drivers/iio/dac/stm32-dac-core.c
+++ b/drivers/iio/dac/stm32-dac-core.c
@@ -42,6 +42,14 @@ struct stm32_dac_priv {
 	struct stm32_dac_common common;
 };
 
+/**
+ * struct stm32_dac_cfg - DAC configuration
+ * @has_hfsel: DAC has high frequency control
+ */
+struct stm32_dac_cfg {
+	bool has_hfsel;
+};
+
 static struct stm32_dac_priv *to_stm32_dac_priv(struct stm32_dac_common *com)
 {
 	return container_of(com, struct stm32_dac_priv, common);
@@ -57,6 +65,7 @@ static struct stm32_dac_priv *to_stm32_dac_priv(struct stm32_dac_common *com)
 static int stm32_dac_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct stm32_dac_cfg *cfg;
 	struct stm32_dac_priv *priv;
 	struct regmap *regmap;
 	struct resource *res;
@@ -69,6 +78,8 @@ static int stm32_dac_probe(struct platform_device *pdev)
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
+	cfg = (const struct stm32_dac_cfg *)
+		of_match_device(dev->driver->of_match_table, dev)->data;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	mmio = devm_ioremap_resource(dev, res);
@@ -121,12 +132,16 @@ static int stm32_dac_probe(struct platform_device *pdev)
 		reset_control_deassert(priv->rst);
 	}
 
-	/* When clock speed is higher than 80MHz, set HFSEL */
-	priv->common.hfsel = (clk_get_rate(priv->pclk) > 80000000UL);
-	ret = regmap_update_bits(regmap, STM32_DAC_CR, STM32H7_DAC_CR_HFSEL,
-				 priv->common.hfsel ? STM32H7_DAC_CR_HFSEL : 0);
-	if (ret)
-		goto err_pclk;
+	if (cfg && cfg->has_hfsel) {
+		/* When clock speed is higher than 80MHz, set HFSEL */
+		priv->common.hfsel = (clk_get_rate(priv->pclk) > 80000000UL);
+		ret = regmap_update_bits(regmap, STM32_DAC_CR,
+					 STM32H7_DAC_CR_HFSEL,
+					 priv->common.hfsel ?
+					 STM32H7_DAC_CR_HFSEL : 0);
+		if (ret)
+			goto err_pclk;
+	}
 
 	platform_set_drvdata(pdev, &priv->common);
 
@@ -158,8 +173,17 @@ static int stm32_dac_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct stm32_dac_cfg stm32h7_dac_cfg = {
+	.has_hfsel = true,
+};
+
 static const struct of_device_id stm32_dac_of_match[] = {
-	{ .compatible = "st,stm32h7-dac-core", },
+	{
+		.compatible = "st,stm32f4-dac-core",
+	}, {
+		.compatible = "st,stm32h7-dac-core",
+		.data = (void *)&stm32h7_dac_cfg,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, stm32_dac_of_match);
-- 
1.9.1
