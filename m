From: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v2 2/5] iio: adc: stm32: add dt option to set default trigger polarity
Date: Mon, 30 Jan 2017 15:33:57 +0100
Message-ID: <1485786840-4557-3-git-send-email-fabrice.gasnier@st.com>
References: <1485786840-4557-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485786840-4557-1-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, fabrice.gasnier-qxv4g6HH51o@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

STM32 ADC trigger polarity can be set to either rising, falling
or both edges. Add dt option to configure it.
Note: default value may be overridden later via trigger_polarity
sysfs attribute.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
---
 drivers/iio/adc/stm32-adc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 9b49a6ad..be0e457 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -997,6 +997,13 @@ static int stm32_adc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	of_property_read_u32(pdev->dev.of_node, "st,trigger-polarity",
+			     &adc->trigger_polarity);
+	if (adc->trigger_polarity >= ARRAY_SIZE(stm32_trig_pol_items)) {
+		dev_err(&pdev->dev, "Invalid st,trigger-polarity property\n");
+		return -EINVAL;
+	}
+
 	adc->irq = platform_get_irq(pdev, 0);
 	if (adc->irq < 0) {
 		dev_err(&pdev->dev, "failed to get irq\n");
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
