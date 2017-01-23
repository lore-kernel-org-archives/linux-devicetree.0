From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 2/7] rtc: sun6i: Add some locking
Date: Mon, 23 Jan 2017 11:41:47 +0100
Message-ID: <a8798639a0c79c7b2b8e4deb412573f5a68e6d0a.1485168100.git-series.maxime.ripard@free-electrons.com>
References: <cover.6bd4d4760c24d09845ad09c212fcd487d78da5ad.1485168100.git-series.maxime.ripard@free-electrons.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDSJBYGBRIMBB7N3S7CAKGQEXQ4HXNY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.6bd4d4760c24d09845ad09c212fcd487d78da5ad.1485168100.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
In-Reply-To: <cover.6bd4d4760c24d09845ad09c212fcd487d78da5ad.1485168100.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
References: <cover.6bd4d4760c24d09845ad09c212fcd487d78da5ad.1485168100.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some registers have a read-modify-write access pattern that are not atomic.

Add some locking to prevent from concurrent accesses.

Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/rtc/rtc-sun6i.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index a6136cb99851..5527f5eb597b 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -114,13 +114,17 @@ struct sun6i_rtc_dev {
 	void __iomem *base;
 	int irq;
 	unsigned long alarm;
+
+	spinlock_t lock;
 };
 
 static irqreturn_t sun6i_rtc_alarmirq(int irq, void *id)
 {
 	struct sun6i_rtc_dev *chip = (struct sun6i_rtc_dev *) id;
+	irqreturn_t ret = IRQ_NONE;
 	u32 val;
 
+	spin_lock(&chip->lock);
 	val = readl(chip->base + SUN6I_ALRM_IRQ_STA);
 
 	if (val & SUN6I_ALRM_IRQ_STA_CNT_IRQ_PEND) {
@@ -129,10 +133,11 @@ static irqreturn_t sun6i_rtc_alarmirq(int irq, void *id)
 
 		rtc_update_irq(chip->rtc, 1, RTC_AF | RTC_IRQF);
 
-		return IRQ_HANDLED;
+		ret = IRQ_HANDLED;
 	}
+	spin_unlock(&chip->lock);
 
-	return IRQ_NONE;
+	return ret;
 }
 
 static void sun6i_rtc_setaie(int to, struct sun6i_rtc_dev *chip)
@@ -140,6 +145,7 @@ static void sun6i_rtc_setaie(int to, struct sun6i_rtc_dev *chip)
 	u32 alrm_val = 0;
 	u32 alrm_irq_val = 0;
 	u32 alrm_wake_val = 0;
+	unsigned long flags;
 
 	if (to) {
 		alrm_val = SUN6I_ALRM_EN_CNT_EN;
@@ -150,9 +156,11 @@ static void sun6i_rtc_setaie(int to, struct sun6i_rtc_dev *chip)
 		       chip->base + SUN6I_ALRM_IRQ_STA);
 	}
 
+	spin_lock_irqsave(&chip->lock, flags);
 	writel(alrm_val, chip->base + SUN6I_ALRM_EN);
 	writel(alrm_irq_val, chip->base + SUN6I_ALRM_IRQ_EN);
 	writel(alrm_wake_val, chip->base + SUN6I_ALARM_CONFIG);
+	spin_unlock_irqrestore(&chip->lock, flags);
 }
 
 static int sun6i_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
@@ -191,11 +199,15 @@ static int sun6i_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
 static int sun6i_rtc_getalarm(struct device *dev, struct rtc_wkalrm *wkalrm)
 {
 	struct sun6i_rtc_dev *chip = dev_get_drvdata(dev);
+	unsigned long flags;
 	u32 alrm_st;
 	u32 alrm_en;
 
+	spin_lock_irqsave(&chip->lock, flags);
 	alrm_en = readl(chip->base + SUN6I_ALRM_IRQ_EN);
 	alrm_st = readl(chip->base + SUN6I_ALRM_IRQ_STA);
+	spin_unlock_irqrestore(&chip->lock, flags);
+
 	wkalrm->enabled = !!(alrm_en & SUN6I_ALRM_EN_CNT_EN);
 	wkalrm->pending = !!(alrm_st & SUN6I_ALRM_EN_CNT_EN);
 	rtc_time_to_tm(chip->alarm, &wkalrm->time);
@@ -356,6 +368,7 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
+	spin_lock_init(&rtc->lock);
 
 	platform_set_drvdata(pdev, chip);
 	chip->dev = &pdev->dev;
-- 
git-series 0.8.11

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
