From: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 4/4] mfd: 88pm800: allocate pdata->rtc if not allocated earlier
Date: Sat, 30 May 2015 03:49:22 +0530
Message-ID: <1432937962-4537-5-git-send-email-vaibhav.hiremath@linaro.org>
References: <1432937962-4537-1-git-send-email-vaibhav.hiremath@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432937962-4537-1-git-send-email-vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chao Xie <chao.xie-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

RTC in pmic 88PM800 can run even the core is powered off, and user
can set alarm in RTC. When the alarm is timed out, the PMIC will power up
the core, and the whole system will boot up. And during PMIC driver probe,
it will read some register to find out whether this boot is caused by RTC
timeout or not, and pass on this information to the RTC driver.

So we need rtc platform data to be existed in PMIC driver to pass this
information.

Signed-off-by: Chao Xie <chao.xie-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/mfd/88pm800.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
index 8ea4467..34546a1 100644
--- a/drivers/mfd/88pm800.c
+++ b/drivers/mfd/88pm800.c
@@ -586,6 +586,25 @@ static int pm800_probe(struct i2c_client *client,
 			return ret;
 	}
 
+	/*
+	 * RTC in pmic can run even the core is powered off, and user can set
+	 * alarm in RTC. When the alarm is time out, the PMIC will power up
+	 * the core, and the whole system will boot up. When PMIC driver is
+	 * probed, it will read out some register to find out whether this
+	 * boot is caused by RTC timeout or not, and it need pass this
+	 * information to RTC driver.
+	 * So we need rtc platform data to be existed to pass this information.
+	 */
+	if (!pdata->rtc) {
+		pdata->rtc = devm_kzalloc(&client->dev,
+					  sizeof(*(pdata->rtc)), GFP_KERNEL);
+		if (!pdata->rtc) {
+			dev_err(&client->dev,
+					"failed to allocate memory for rtc\n");
+			return -ENOMEM;
+		}
+	}
+
 	ret = pm80x_init(client);
 	if (ret) {
 		dev_err(&client->dev, "pm800_init fail\n");
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
