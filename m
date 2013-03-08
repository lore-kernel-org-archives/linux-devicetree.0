From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 4/9] rtc: stmp3xxx: allow different oscillators
Date: Fri,  8 Mar 2013 10:01:39 +0100
Message-ID: <1362733304-23037-5-git-send-email-s.trumtrar@pengutronix.de>
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
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Juergen Beisert <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The RTC can have different input clockrates.
Configure the RTC accordingly and leave only the one used running.

Signed-off-by: Juergen Beisert <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/rtc/rtc-stmp3xxx.c | 89 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
index 98f0d3c..d2283c5 100644
--- a/drivers/rtc/rtc-stmp3xxx.c
+++ b/drivers/rtc/rtc-stmp3xxx.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/io.h>
 #include <linux/init.h>
+#include <linux/clk.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/rtc.h>
@@ -53,18 +54,31 @@
 #define STMP3XXX_RTC_PERSISTENT0		0x60
 #define STMP3XXX_RTC_PERSISTENT0_SET		0x64
 #define STMP3XXX_RTC_PERSISTENT0_CLR		0x68
+#define STMP3XXX_RTC_PERSISTENT0_CLOCKSOURCE	(1 << 0)
 #define STMP3XXX_RTC_PERSISTENT0_ALARM_WAKE_EN	0x00000002
 #define STMP3XXX_RTC_PERSISTENT0_ALARM_EN	0x00000004
+#define STMP3XXX_RTC_PERSISTENT0_XTAL24MHZ_PWRUP (1 << 4)
+#define STMP3XXX_RTC_PERSISTENT0_XTAL32KHZ_PWRUP (1 << 5)
+#define STMP3XXX_RTC_PERSISTENT0_XTAL32_FREQ	(1 << 6)
+
 #define STMP3XXX_RTC_PERSISTENT0_ALARM_WAKE	0x00000080
 
 #define STMP3XXX_RTC_PERSISTENT1		0x70
 /* missing bitmask in headers */
 #define STMP3XXX_RTC_PERSISTENT1_FORCE_UPDATER	0x80000000
 
+enum clock_source {
+	MXS_UNKNOWN,
+	MXS_OSC_24M,
+	MXS_OSC_32K,
+	MXS_OSC_32K768
+};
+
 struct stmp3xxx_rtc_data {
 	struct rtc_device *rtc;
 	void __iomem *io;
 	int irq_alarm;
+	enum clock_source clk_src;
 };
 
 #if IS_ENABLED(CONFIG_STMP3XXX_RTC_WATCHDOG)
@@ -168,11 +182,55 @@ static irqreturn_t stmp3xxx_rtc_interrupt(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
+/*
+ * To keep the energy consumption low, keep only
+ * the really used oscillator running when the power is down
+ */
+static void stmp3xxx_alarm_keep_oscillator(const struct stmp3xxx_rtc_data *rtc_data)
+{
+	switch (rtc_data->clk_src) {
+	case MXS_OSC_24M:
+		/* keep the 24 MHz oscillator running even in power down */
+		writel(STMP3XXX_RTC_PERSISTENT0_XTAL32_FREQ | /* 24 MHz / 750 */
+			STMP3XXX_RTC_PERSISTENT0_XTAL24MHZ_PWRUP,
+			rtc_data->io + STMP3XXX_RTC_PERSISTENT0_SET);
+		writel(STMP3XXX_RTC_PERSISTENT0_XTAL32KHZ_PWRUP |
+			STMP3XXX_RTC_PERSISTENT0_CLOCKSOURCE,
+			rtc_data->io + STMP3XXX_RTC_PERSISTENT0_CLR);
+		break;
+	case MXS_OSC_32K:
+		/* keep the 32 kHz oscillator running even in power down */
+		writel(STMP3XXX_RTC_PERSISTENT0_XTAL32_FREQ | /* 32 kHz */
+			STMP3XXX_RTC_PERSISTENT0_XTAL32KHZ_PWRUP |
+			STMP3XXX_RTC_PERSISTENT0_CLOCKSOURCE,
+			rtc_data->io + STMP3XXX_RTC_PERSISTENT0_SET);
+		writel(STMP3XXX_RTC_PERSISTENT0_XTAL24MHZ_PWRUP,
+			rtc_data->io + STMP3XXX_RTC_PERSISTENT0_CLR);
+		break;
+	case MXS_OSC_32K768:
+		/* keep the 32 kHz oscillator running even in power down */
+		writel(STMP3XXX_RTC_PERSISTENT0_XTAL32KHZ_PWRUP |
+			STMP3XXX_RTC_PERSISTENT0_CLOCKSOURCE,
+			rtc_data->io + STMP3XXX_RTC_PERSISTENT0_SET);
+		writel(STMP3XXX_RTC_PERSISTENT0_XTAL32_FREQ | /* 32.768 kHz */
+			STMP3XXX_RTC_PERSISTENT0_XTAL24MHZ_PWRUP,
+			rtc_data->io + STMP3XXX_RTC_PERSISTENT0_CLR);
+		break;
+	case MXS_UNKNOWN:
+	default:
+		break;
+	}
+}
+
 static int stmp3xxx_alarm_irq_enable(struct device *dev, unsigned int enabled)
 {
 	struct stmp3xxx_rtc_data *rtc_data = dev_get_drvdata(dev);
 
+	stmp3xxx_alarm_keep_oscillator(rtc_data);
+
 	if (enabled) {
+		writel(STMP3XXX_RTC_PERSISTENT0_ALARM_WAKE, /* to be able to sleep */
+			rtc_data->io + STMP3XXX_RTC_PERSISTENT0_CLR);
 		writel(STMP3XXX_RTC_PERSISTENT0_ALARM_EN |
 				STMP3XXX_RTC_PERSISTENT0_ALARM_WAKE_EN,
 				rtc_data->io + STMP3XXX_RTC_PERSISTENT0_SET);
@@ -240,6 +298,8 @@ static int stmp3xxx_rtc_probe(struct platform_device *pdev)
 {
 	struct stmp3xxx_rtc_data *rtc_data;
 	struct resource *r;
+	struct clk *clk;
+	unsigned long rate;
 	int err;
 
 	rtc_data = kzalloc(sizeof *rtc_data, GFP_KERNEL);
@@ -272,6 +332,35 @@ static int stmp3xxx_rtc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, rtc_data);
 
 	mxs_reset_block(rtc_data->io);
+
+	/*
+	 * configure the RTC to provide the correct time
+	 */
+	clk = devm_clk_get(&pdev->dev, "32k");
+	if (IS_ERR(clk)) {
+		/* just a fall back */
+		dev_warn(&pdev->dev, "RTC's input clock undefined\n");
+		rtc_data->clk_src = MXS_OSC_24M;
+	} else {
+		rate = clk_get_rate(clk);
+		if (rate == 0) {
+			/* no dedicated external crystal */
+			rtc_data->clk_src = MXS_OSC_24M;
+			dev_info(&pdev->dev, "Using 24 MHz as RTC's clock\n");
+		} else if (rate == 32000) {
+			rtc_data->clk_src = MXS_OSC_32K;
+			dev_info(&pdev->dev, "Using 32.0 kHz as RTC's clock\n");
+		} else if (rate == 32768) {
+			rtc_data->clk_src = MXS_OSC_32K768;
+			dev_info(&pdev->dev, "Using 32.768 kHz as RTC's clock\n");
+		} else
+			dev_warn(&pdev->dev,
+				"Cannot init the RTC's clock source\n");
+	}
+
+	/* basically configure the RTC's input clock */
+	stmp3xxx_alarm_keep_oscillator(rtc_data);
+
 	writel(STMP3XXX_RTC_PERSISTENT0_ALARM_EN |
 			STMP3XXX_RTC_PERSISTENT0_ALARM_WAKE_EN |
 			STMP3XXX_RTC_PERSISTENT0_ALARM_WAKE,
-- 
1.8.2.rc2
