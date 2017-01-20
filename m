From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 4/6] rtc: sun6i: Force the mux to the external oscillator
Date: Fri, 20 Jan 2017 16:56:41 +0100
Message-ID: <409c56f0ed1c4b0026ad60cb1218c99fe1686408.1484927680.git-series.maxime.ripard@free-electrons.com>
References: <cover.180d5ae6bc36ead9625d208824f5cbd7114cf92e.1484927680.git-series.maxime.ripard@free-electrons.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDSJBYGBRIMBBP7GRDCAKGQEOF2SKRY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

The internal oscillator is way too inaccurate to do something useful with
it. Switch to the external oscillator if it is available.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/rtc/rtc-sun6i.c | 12 ++++++++++++
 1 file changed, 12 insertions(+), 0 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index edd5627da10f..1695fae24cd5 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -493,6 +493,7 @@ static const struct rtc_class_ops sun6i_rtc_ops = {
 static int sun6i_rtc_probe(struct platform_device *pdev)
 {
 	struct sun6i_rtc_dev *chip = sun6i_rtc;
+	struct clk *parent;
 	int ret;
 
 	if (!chip)
@@ -540,6 +541,17 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 	/* disable alarm wakeup */
 	writel(0, chip->base + SUN6I_ALARM_CONFIG);
 
+	parent = clk_get(&pdev->dev, NULL);
+	if (!IS_ERR(parent)) {
+		ret = clk_set_parent(chip->losc, parent);
+		clk_put(parent);
+
+		if (ret) {
+			dev_err(&pdev->dev,
+				"Failed to reparent the RTC to the external oscillator\n");
+			return ret;
+		}
+	}
 	clk_prepare_enable(chip->losc);
 
 	chip->rtc = rtc_device_register("rtc-sun6i", &pdev->dev,
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
