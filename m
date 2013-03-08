From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 8/9] rtc: stmp3xxx: Check copy controller state
Date: Fri,  8 Mar 2013 10:01:43 +0100
Message-ID: <1362733304-23037-9-git-send-email-s.trumtrar@pengutronix.de>
References: <1362733304-23037-1-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1362733304-23037-1-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The stmp3xxx has a copy controller that needs some time to copy the
analog side to the digital shadow registers. This has implications for
a correct reset behaviour.

The datasheet states that one should not reset the rtc if NEW_REGS != 0 or
a possible loss of data is to be expected.
Accordingly, one should not access the registers while STALE_REGS != 0.

If an alarm is written to the shadow registers, the copy controller does not
persist the values to the analog in every case. This is no problem in the
running kernel, but leads to lost values in case of a reboot.
Always check if the rtc is in a clean state, before writing or continueing.

Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/rtc/rtc-stmp3xxx.c | 91 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
index 90d0804..3de868d 100644
--- a/drivers/rtc/rtc-stmp3xxx.c
+++ b/drivers/rtc/rtc-stmp3xxx.c
@@ -43,8 +43,18 @@
 
 #define STMP3XXX_RTC_STAT			0x10
 #define STMP3XXX_RTC_STAT_STALE_SHIFT		16
+#define STMP3XXX_RTC_STAT_NEW_SHIFT		8
 #define STMP3XXX_RTC_STAT_RTC_PRESENT		0x80000000
 
+#define STMP3XXX_RTC_STAT_PERS0_MASK		(1 << 0)
+#define STMP3XXX_RTC_STAT_PERS1_MASK		(1 << 1)
+#define STMP3XXX_RTC_STAT_PERS2_MASK		(1 << 2)
+#define STMP3XXX_RTC_STAT_PERS3_MASK		(1 << 3)
+#define STMP3XXX_RTC_STAT_PERS4_MASK		(1 << 4)
+#define STMP3XXX_RTC_STAT_PERS5_MASK		(1 << 5)
+#define STMP3XXX_RTC_STAT_ALARM_MASK		(1 << 6)
+#define STMP3XXX_RTC_STAT_SEC_MASK		(1 << 7)
+
 #define STMP3XXX_RTC_SECONDS			0x30
 
 #define STMP3XXX_RTC_ALARM			0x40
@@ -140,6 +150,35 @@ static void stmp3xxx_wdt_register(struct platform_device *rtc_pdev)
 }
 #endif /* CONFIG_STMP3XXX_RTC_WATCHDOG */
 
+static inline void stmp3xxx_wait_copy_ctrl(const struct stmp3xxx_rtc_data *rtc_data,
+					   const unsigned int shift,
+					   unsigned int mask)
+{
+	/*
+	 * totally random number, as the datasheet is very unclear
+	 * about the timings
+	 */
+	int timeout = 0x8000;
+
+	while ((readl(rtc_data->io + STMP3XXX_RTC_STAT) &
+			(mask << shift)) && --timeout)
+		cpu_relax();
+
+	if (unlikely(!timeout)) {
+		if (&rtc_data->rtc->dev) {
+			dev_warn(&rtc_data->rtc->dev,
+				"possible data loss of shadow registers\n");
+		} else {
+			/*
+			 * When this function is called for the mxs_reset in
+			 * the probe function, rtc->dev is not yet set
+			 * FIXME: find a better/correct way to do this
+			 */
+			pr_warn("possible data loss of rtc shadow registers\n");
+		}
+	}
+}
+
 static void stmp3xxx_wait_time(struct stmp3xxx_rtc_data *rtc_data)
 {
 	/*
@@ -193,6 +232,9 @@ static irqreturn_t stmp3xxx_rtc_interrupt(int irq, void *dev_id)
  */
 static void stmp3xxx_alarm_keep_oscillator(const struct stmp3xxx_rtc_data *rtc_data)
 {
+	stmp3xxx_wait_copy_ctrl(rtc_data, STMP3XXX_RTC_STAT_STALE_SHIFT,
+				STMP3XXX_RTC_STAT_PERS0_MASK);
+
 	switch (rtc_data->clk_src) {
 	case MXS_OSC_24M:
 		/* keep the 24 MHz oscillator running even in power down */
@@ -225,6 +267,9 @@ static void stmp3xxx_alarm_keep_oscillator(const struct stmp3xxx_rtc_data *rtc_d
 	default:
 		break;
 	}
+
+	stmp3xxx_wait_copy_ctrl(rtc_data, STMP3XXX_RTC_STAT_NEW_SHIFT,
+				STMP3XXX_RTC_STAT_PERS0_MASK);
 }
 
 static int stmp3xxx_alarm_irq_enable(struct device *dev, unsigned int enabled)
@@ -233,6 +278,10 @@ static int stmp3xxx_alarm_irq_enable(struct device *dev, unsigned int enabled)
 
 	stmp3xxx_alarm_keep_oscillator(rtc_data);
 
+	stmp3xxx_wait_copy_ctrl(rtc_data, STMP3XXX_RTC_STAT_STALE_SHIFT,
+				STMP3XXX_RTC_STAT_PERS0_MASK |
+				STMP3XXX_RTC_STAT_ALARM_MASK);
+
 	if (enabled) {
 		writel(STMP3XXX_RTC_PERSISTENT0_ALARM_WAKE, /* to be able to sleep */
 			rtc_data->io + STMP3XXX_RTC_PERSISTENT0_CLR);
@@ -249,6 +298,10 @@ static int stmp3xxx_alarm_irq_enable(struct device *dev, unsigned int enabled)
 				rtc_data->io + STMP3XXX_RTC_CTRL_CLR);
 		writel(0, rtc_data->io + STMP3XXX_RTC_ALARM);
 	}
+	stmp3xxx_wait_copy_ctrl(rtc_data, STMP3XXX_RTC_STAT_NEW_SHIFT,
+				STMP3XXX_RTC_STAT_PERS0_MASK |
+				STMP3XXX_RTC_STAT_ALARM_MASK);
+
 	return 0;
 }
 
@@ -258,10 +311,16 @@ static int stmp3xxx_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	struct stmp3xxx_rtc_data *rtc_data = dev_get_drvdata(dev);
 
 	rtc_tm_to_time(&alm->time, &t);
+
+	stmp3xxx_wait_copy_ctrl(rtc_data, STMP3XXX_RTC_STAT_STALE_SHIFT,
+				STMP3XXX_RTC_STAT_ALARM_MASK);
+
 	writel(t, rtc_data->io + STMP3XXX_RTC_ALARM);
 
-	stmp3xxx_alarm_irq_enable(dev, alm->enabled);
+	stmp3xxx_wait_copy_ctrl(rtc_data, STMP3XXX_RTC_STAT_NEW_SHIFT,
+				STMP3XXX_RTC_STAT_ALARM_MASK);
 
+	stmp3xxx_alarm_irq_enable(dev, alm->enabled);
 	return 0;
 }
 
@@ -296,6 +355,13 @@ static ssize_t stmp3xxx_rtc_persist_read(struct file *filep,
 	struct stmp3xxx_rtc_data *rtc_data = dev_get_drvdata(dev);
 	ssize_t count;
 
+	stmp3xxx_wait_copy_ctrl(rtc_data, STMP3XXX_RTC_STAT_STALE_SHIFT,
+				STMP3XXX_RTC_STAT_PERS1_MASK |
+				STMP3XXX_RTC_STAT_PERS2_MASK |
+				STMP3XXX_RTC_STAT_PERS3_MASK |
+				STMP3XXX_RTC_STAT_PERS4_MASK |
+				STMP3XXX_RTC_STAT_PERS5_MASK);
+
 	for (count = 0; size; size--, off++, count++)
 		*buf++ = readl(rtc_data->io + STMP3XXX_RTC_PERSISTENT1 + off);
 
@@ -316,6 +382,13 @@ static ssize_t stmp3xxx_rtc_persist_write(struct file *filep,
 	for (count = 0; size; size--, off++, count++)
 		writel(*buf++, rtc_data->io + STMP3XXX_RTC_PERSISTENT1 + off);
 
+	stmp3xxx_wait_copy_ctrl(rtc_data, STMP3XXX_RTC_STAT_NEW_SHIFT,
+				STMP3XXX_RTC_STAT_PERS1_MASK |
+				STMP3XXX_RTC_STAT_PERS2_MASK |
+				STMP3XXX_RTC_STAT_PERS3_MASK |
+				STMP3XXX_RTC_STAT_PERS4_MASK |
+				STMP3XXX_RTC_STAT_PERS5_MASK);
+
 	return count;
 }
 #endif
@@ -389,7 +462,23 @@ static int stmp3xxx_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rtc_data);
 
+	stmp3xxx_wait_copy_ctrl(rtc_data, STMP3XXX_RTC_STAT_NEW_SHIFT,
+				STMP3XXX_RTC_STAT_PERS1_MASK |
+				STMP3XXX_RTC_STAT_PERS2_MASK |
+				STMP3XXX_RTC_STAT_PERS3_MASK |
+				STMP3XXX_RTC_STAT_PERS4_MASK |
+				STMP3XXX_RTC_STAT_PERS5_MASK |
+				STMP3XXX_RTC_STAT_ALARM_MASK |
+				STMP3XXX_RTC_STAT_SEC_MASK);
 	mxs_reset_block(rtc_data->io);
+	stmp3xxx_wait_copy_ctrl(rtc_data, STMP3XXX_RTC_STAT_STALE_SHIFT,
+				STMP3XXX_RTC_STAT_PERS1_MASK |
+				STMP3XXX_RTC_STAT_PERS2_MASK |
+				STMP3XXX_RTC_STAT_PERS3_MASK |
+				STMP3XXX_RTC_STAT_PERS4_MASK |
+				STMP3XXX_RTC_STAT_PERS5_MASK |
+				STMP3XXX_RTC_STAT_ALARM_MASK |
+				STMP3XXX_RTC_STAT_SEC_MASK);
 
 	/*
 	 * configure the RTC to provide the correct time
-- 
1.8.2.rc2
