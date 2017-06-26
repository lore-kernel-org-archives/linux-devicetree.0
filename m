From: Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 2/3] iio: adc: mt7622: add support for suspend/resume.
Date: Mon, 26 Jun 2017 14:11:41 +0800
Message-ID: <1498457502-3669-3-git-send-email-zhiyong.tao@mediatek.com>
References: <1498457502-3669-1-git-send-email-zhiyong.tao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498457502-3669-1-git-send-email-zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, liguo.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch supports auxadc suspend/resume flow.
Disable auxadc clk and power in suspend function.
Enable axuadc clk and power in resume function.

Signed-off-by: Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/iio/adc/mt6577_auxadc.c |   38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
index 2d104c8..c174b73 100644
--- a/drivers/iio/adc/mt6577_auxadc.c
+++ b/drivers/iio/adc/mt6577_auxadc.c
@@ -184,6 +184,39 @@ static int mt6577_auxadc_read_raw(struct iio_dev *indio_dev,
 	.read_raw = &mt6577_auxadc_read_raw,
 };
 
+#ifdef CONFIG_PM_SLEEP
+static int __maybe_unused mt6577_auxadc_resume(struct device *dev)
+{
+	struct iio_dev *indio_dev = dev_get_drvdata(dev);
+	struct mt6577_auxadc_device *adc_dev = iio_priv(indio_dev);
+	int ret;
+
+	ret = clk_prepare_enable(adc_dev->adc_clk);
+	if (ret) {
+		pr_err("failed to enable auxadc clock\n");
+		return ret;
+	}
+
+	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
+			      MT6577_AUXADC_PDN_EN, 0);
+	mdelay(MT6577_AUXADC_POWER_READY_MS);
+
+	return 0;
+}
+
+static int __maybe_unused mt6577_auxadc_suspend(struct device *dev)
+{
+	struct iio_dev *indio_dev = dev_get_drvdata(dev);
+	struct mt6577_auxadc_device *adc_dev = iio_priv(indio_dev);
+
+	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
+			      0, MT6577_AUXADC_PDN_EN);
+	clk_disable_unprepare(adc_dev->adc_clk);
+
+	return 0;
+}
+#endif
+
 static int mt6577_auxadc_probe(struct platform_device *pdev)
 {
 	struct mt6577_auxadc_device *adc_dev;
@@ -269,6 +302,10 @@ static int mt6577_auxadc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static SIMPLE_DEV_PM_OPS(mt6577_auxadc_pm_ops,
+			 mt6577_auxadc_suspend,
+			 mt6577_auxadc_resume);
+
 static const struct of_device_id mt6577_auxadc_of_match[] = {
 	{ .compatible = "mediatek,mt2701-auxadc", },
 	{ .compatible = "mediatek,mt8173-auxadc", },
@@ -280,6 +317,7 @@ static int mt6577_auxadc_remove(struct platform_device *pdev)
 	.driver = {
 		.name   = "mt6577-auxadc",
 		.of_match_table = mt6577_auxadc_of_match,
+		.pm = &mt6577_auxadc_pm_ops,
 	},
 	.probe	= mt6577_auxadc_probe,
 	.remove	= mt6577_auxadc_remove,
-- 
1.7.9.5
