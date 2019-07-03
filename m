From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v2 3/7] rtc: mt6397: improvements of rtc driver
Date: Wed,  3 Jul 2019 18:48:18 +0200
Message-ID: <20190703164822.17924-4-frank-w@public-files.de>
References: <20190703164822.17924-1-frank-w@public-files.de>
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703164822.17924-1-frank-w@public-files.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Sebastian Reichel <sre@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, Eddie Huang <eddie.huang@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>, Richard Fontana <rfontana@redhat.com>, Allison Randal <allison@lohutok.net>, "David S . Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gr>
Cc: Josef Friedl <josef.friedl@speed.at>, Frank Wunderlich <frank-w@public-files.de>
List-Id: devicetree@vger.kernel.org

From: Josef Friedl <josef.friedl@speed.at>

- use regmap_read_poll_timeout to drop while-loop
- use devm-api to drop remove-callback
- add new compatible for mt6323

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
=2D--
 drivers/rtc/rtc-mt6397.c | 55 ++++++++++++++++------------------------
 1 file changed, 22 insertions(+), 33 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index c08ee5edf865..e5ddf0d0b6f1 100644
=2D-- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -4,16 +4,19 @@
 * Author: Tianping.Fang <tianping.fang@mediatek.com>
 */

-#include <linux/delay.h>
-#include <linux/init.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/mt6397/core.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/rtc.h>
 #include <linux/mfd/mt6397/rtc.h>
+#include <linux/mod_devicetable.h>

 static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
 {
-	unsigned long timeout =3D jiffies + HZ;
 	int ret;
 	u32 data;

@@ -21,19 +24,13 @@ static int mtk_rtc_write_trigger(struct mt6397_rtc *rt=
c)
 	if (ret < 0)
 		return ret;

-	while (1) {
-		ret =3D regmap_read(rtc->regmap, rtc->addr_base + RTC_BBPU,
-				  &data);
-		if (ret < 0)
-			break;
-		if (!(data & RTC_BBPU_CBUSY))
-			break;
-		if (time_after(jiffies, timeout)) {
-			ret =3D -ETIMEDOUT;
-			break;
-		}
-		cpu_relax();
-	}
+	ret =3D regmap_read_poll_timeout(rtc->regmap,
+					rtc->addr_base + RTC_BBPU, data,
+					!(data & RTC_BBPU_CBUSY),
+					MTK_RTC_POLL_DELAY_US,
+					MTK_RTC_POLL_TIMEOUT);
+	if (ret < 0)
+		dev_err(rtc->dev, "failed to write WRTGE: %d\n", ret);

 	return ret;
 }
@@ -271,14 +268,11 @@ static int mtk_rtc_probe(struct platform_device *pde=
v)

 	platform_set_drvdata(pdev, rtc);

-	rtc->rtc_dev =3D devm_rtc_allocate_device(rtc->dev);
-	if (IS_ERR(rtc->rtc_dev))
-		return PTR_ERR(rtc->rtc_dev);
+	ret =3D devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
+					mtk_rtc_irq_handler_thread,
+					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
+					"mt6397-rtc", rtc);

-	ret =3D request_threaded_irq(rtc->irq, NULL,
-				   mtk_rtc_irq_handler_thread,
-				   IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
-				   "mt6397-rtc", rtc);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
 			rtc->irq, ret);
@@ -287,6 +281,10 @@ static int mtk_rtc_probe(struct platform_device *pdev=
)

 	device_init_wakeup(&pdev->dev, 1);

+	rtc->rtc_dev =3D devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc->rtc_dev))
+		return PTR_ERR(rtc->rtc_dev);
+
 	rtc->rtc_dev->ops =3D &mtk_rtc_ops;

 	ret =3D rtc_register_device(rtc->rtc_dev);
@@ -302,15 +300,6 @@ static int mtk_rtc_probe(struct platform_device *pdev=
)
 	return ret;
 }

-static int mtk_rtc_remove(struct platform_device *pdev)
-{
-	struct mt6397_rtc *rtc =3D platform_get_drvdata(pdev);
-
-	free_irq(rtc->irq, rtc);
-
-	return 0;
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int mt6397_rtc_suspend(struct device *dev)
 {
@@ -337,6 +326,7 @@ static SIMPLE_DEV_PM_OPS(mt6397_pm_ops, mt6397_rtc_sus=
pend,
 			mt6397_rtc_resume);

 static const struct of_device_id mt6397_rtc_of_match[] =3D {
+	{ .compatible =3D "mediatek,mt6323-rtc", },
 	{ .compatible =3D "mediatek,mt6397-rtc", },
 	{ }
 };
@@ -349,7 +339,6 @@ static struct platform_driver mtk_rtc_driver =3D {
 		.pm =3D &mt6397_pm_ops,
 	},
 	.probe	=3D mtk_rtc_probe,
-	.remove =3D mtk_rtc_remove,
 };

 module_platform_driver(mtk_rtc_driver);
=2D-
2.17.1
