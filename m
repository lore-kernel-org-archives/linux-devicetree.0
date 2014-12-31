From: Nicholas Mc Guire <der.herr-kA1LtwSENNE@public.gmane.org>
Subject: [PATCH RFC] iio: iadc: wait_for_completion_timeout time in jiffies
Date: Wed, 31 Dec 2014 03:59:46 -0500
Message-ID: <1420016386-19638-1-git-send-email-der.herr@hofr.at>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicholas Mc Guire <der.herr-kA1LtwSENNE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The timeout value to wait_for_completion_timeout is in jiffies but
the value being passed seems like it was intended to by microseconds
Note that the timeout was extremely long thus it might be too short
now. In any case it probably should be passed through usecs_to_jiffies()
or msecs_to_jiffies()

patch is against linux-next 3.19.0-rc1 -next-20141226

patch was only compile-tested x86_64_defcofnig + CONFIG_SPMI=m
CONFIG_IIO=m, CONFIG_QCOM_SPMI_IADC=m

Signed-off-by: Nicholas Mc Guire <der.herr-kA1LtwSENNE@public.gmane.org>
---
 drivers/iio/adc/qcom-spmi-iadc.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/qcom-spmi-iadc.c b/drivers/iio/adc/qcom-spmi-iadc.c
index b9666f2..3080562 100644
--- a/drivers/iio/adc/qcom-spmi-iadc.c
+++ b/drivers/iio/adc/qcom-spmi-iadc.c
@@ -296,7 +296,8 @@ static int iadc_do_conversion(struct iadc_chip *iadc, int chan, u16 *data)
 	if (iadc->poll_eoc) {
 		ret = iadc_poll_wait_eoc(iadc, wait);
 	} else {
-		ret = wait_for_completion_timeout(&iadc->complete, wait);
+		ret = wait_for_completion_timeout(&iadc->complete,
+			usecs_to_jiffies(wait));
 		if (!ret)
 			ret = -ETIMEDOUT;
 		else
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
