From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/6] rtc: sun6i: Add some locking
Date: Fri, 20 Jan 2017 16:56:39 +0100
Message-ID: <9b5c8ed82f636fd2061a9b7933c0e6b65d868643.1484927680.git-series.maxime.ripard@free-electrons.com>
References: <cover.180d5ae6bc36ead9625d208824f5cbd7114cf92e.1484927680.git-series.maxime.ripard@free-electrons.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDSJBYGBRIMBBPXGRDCAKGQEIGJQA3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.180d5ae6bc36ead9625d208824f5cbd7114cf92e.1484927680.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
In-Reply-To: <cover.180d5ae6bc36ead9625d208824f5cbd7114cf92e.1484927680.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
References: <cover.180d5ae6bc36ead9625d208824f5cbd7114cf92e.1484927680.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some registers have a read-modify-write access pattern that are not atomic.

Add some locking to prevent from concurrent accesses.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/rtc/rtc-sun6i.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 408dd512a6ac..872d18609183 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -125,6 +125,8 @@ struct sun6i_rtc_dev {
 	struct clk_hw hw;
 	struct clk_hw *int_osc;
 	struct clk *losc;
+
+	spinlock_t lock;
 };
 
 static struct sun6i_rtc_dev *sun6i_rtc;
@@ -155,16 +157,19 @@ static u8 sun6i_rtc_osc_get_parent(struct clk_hw *hw)
 static int sun6i_rtc_osc_set_parent(struct clk_hw *hw, u8 index)
 {
 	struct sun6i_rtc_dev *rtc = container_of(hw, struct sun6i_rtc_dev, hw);
+	unsigned long flags;
 	u32 val;
 
 	if (index > 1)
 		return -EINVAL;
 
+	spin_lock_irqsave(&rtc->lock, flags);
 	val = readl(rtc->base + SUN6I_LOSC_CTRL);
 	val &= ~SUN6I_LOSC_CTRL_EXT_OSC;
 	val |= SUN6I_LOSC_CTRL_KEY;
 	val |= index ? SUN6I_LOSC_CTRL_EXT_OSC : 0;
 	writel(val, rtc->base + SUN6I_LOSC_CTRL);
+	spin_unlock_irqrestore(&rtc->lock, flags);
 
 	return 0;
 }
@@ -187,6 +192,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node)
 	rtc = kzalloc(sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
 		pr_crit("Can't allocate RTC structure\n");
+	spin_lock_init(&rtc->lock);
 
 	rtc->base = of_io_request_and_map(node, 0, of_node_full_name(node));
 	if (!rtc->base) {
@@ -246,8 +252,10 @@ CLK_OF_DECLARE_DRIVER(sun6i_rtc_clk, "allwinner,sun6i-a31-rtc",
 static irqreturn_t sun6i_rtc_alarmirq(int irq, void *id)
 {
 	struct sun6i_rtc_dev *chip = (struct sun6i_rtc_dev *) id;
+	irqreturn_t ret = IRQ_NONE;
 	u32 val;
 
+	spin_lock(&chip->lock);
 	val = readl(chip->base + SUN6I_ALRM_IRQ_STA);
 
 	if (val & SUN6I_ALRM_IRQ_STA_CNT_IRQ_PEND) {
@@ -256,10 +264,11 @@ static irqreturn_t sun6i_rtc_alarmirq(int irq, void *id)
 
 		rtc_update_irq(chip->rtc, 1, RTC_AF | RTC_IRQF);
 
-		return IRQ_HANDLED;
+		ret = IRQ_HANDLED;
 	}
+	spin_unlock(&chip->lock);
 
-	return IRQ_NONE;
+	return ret;
 }
 
 static void sun6i_rtc_setaie(int to, struct sun6i_rtc_dev *chip)
@@ -267,6 +276,7 @@ static void sun6i_rtc_setaie(int to, struct sun6i_rtc_dev *chip)
 	u32 alrm_val = 0;
 	u32 alrm_irq_val = 0;
 	u32 alrm_wake_val = 0;
+	unsigned long flags;
 
 	if (to) {
 		alrm_val = SUN6I_ALRM_EN_CNT_EN;
@@ -277,9 +287,11 @@ static void sun6i_rtc_setaie(int to, struct sun6i_rtc_dev *chip)
 		       chip->base + SUN6I_ALRM_IRQ_STA);
 	}
 
+	spin_lock_irqsave(&chip->lock, flags);
 	writel(alrm_val, chip->base + SUN6I_ALRM_EN);
 	writel(alrm_irq_val, chip->base + SUN6I_ALRM_IRQ_EN);
 	writel(alrm_wake_val, chip->base + SUN6I_ALARM_CONFIG);
+	spin_unlock_irqrestore(&chip->lock, flags);
 }
 
 static int sun6i_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
@@ -318,11 +330,15 @@ static int sun6i_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
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
