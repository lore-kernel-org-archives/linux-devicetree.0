From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 7/9] rtc: stmp3xxx: Re-enable active alarm
Date: Fri,  8 Mar 2013 10:01:42 +0100
Message-ID: <1362733304-23037-8-git-send-email-s.trumtrar@pengutronix.de>
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

If an alarm is set and the system rebooted, the alarm does not get re-enabled,
although it may still be valid (i.e. in the future).

The sysfs representation of wakealarms prevents overwriting active alarms. One
needs to instead write a 0 first and then the new value. Therefore an alarm is
considered active if
	wakealarm != 0 && wakealarm > now

To preserve this information over a reboot, the alarm needs to be re-written
on startup, if it is still valid. This leads to all flags being reactivated
and interrupts reenabled.

Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/rtc/rtc-stmp3xxx.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
index 3ca26ac..90d0804 100644
--- a/drivers/rtc/rtc-stmp3xxx.c
+++ b/drivers/rtc/rtc-stmp3xxx.c
@@ -247,27 +247,39 @@ static int stmp3xxx_alarm_irq_enable(struct device *dev, unsigned int enabled)
 				rtc_data->io + STMP3XXX_RTC_PERSISTENT0_CLR);
 		writel(STMP3XXX_RTC_CTRL_ALARM_IRQ_EN,
 				rtc_data->io + STMP3XXX_RTC_CTRL_CLR);
+		writel(0, rtc_data->io + STMP3XXX_RTC_ALARM);
 	}
 	return 0;
 }
 
-static int stmp3xxx_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
+static int stmp3xxx_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 {
+	unsigned long t;
 	struct stmp3xxx_rtc_data *rtc_data = dev_get_drvdata(dev);
 
-	rtc_time_to_tm(readl(rtc_data->io + STMP3XXX_RTC_ALARM), &alm->time);
+	rtc_tm_to_time(&alm->time, &t);
+	writel(t, rtc_data->io + STMP3XXX_RTC_ALARM);
+
+	stmp3xxx_alarm_irq_enable(dev, alm->enabled);
+
 	return 0;
 }
 
-static int stmp3xxx_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
+static int stmp3xxx_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 {
-	unsigned long t;
 	struct stmp3xxx_rtc_data *rtc_data = dev_get_drvdata(dev);
+	struct rtc_time now;
+	u32 alarm = readl(rtc_data->io + STMP3XXX_RTC_ALARM);
 
-	rtc_tm_to_time(&alm->time, &t);
-	writel(t, rtc_data->io + STMP3XXX_RTC_ALARM);
+	rtc_time_to_tm(alarm, &alm->time);
 
-	stmp3xxx_alarm_irq_enable(dev, alm->enabled);
+	stmp3xxx_rtc_gettime(dev, &now);
+	if (rtc_tm_to_ktime(now).tv64 < rtc_tm_to_ktime(alm->time).tv64) {
+		alm->enabled = 1;
+		stmp3xxx_rtc_set_alarm(dev, alm);
+	} else {
+		alm->enabled = 0;
+	}
 
 	return 0;
 }
-- 
1.8.2.rc2
