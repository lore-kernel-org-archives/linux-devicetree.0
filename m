From: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH] iio: stm32 trigger: fix sampling_frequency read
Date: Fri, 7 Apr 2017 13:53:46 +0200
Message-ID: <1491566026-302-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, fabrice.gasnier-qxv4g6HH51o@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

When prescaler (PSC) is 0, it means div factor is 1: counter clock
frequency is equal to input clk / (PSC + 1).
When reload value is 8 for example, counter counts 9 cycles, from 0 to 8.
This is handled in frequency write routine, by writing respectively:
- prescaler - 1 to PSC
- reload value - 1 to ARR
This fix does the opposite when reading the frequency from PSC and ARR:
- prescaler is PSC + 1
- reload value is ARR + 1

Thus, PSC may be 0, depending on requested sampling frequency (div 1).
In this case, reading freq wrongly reports 0, instead of computing and
reporting correct value.
Remove test on !psc and !arr.

Small test on stm32f4 (example on tim1_trgo), before this fix:
$ cd /sys/bus/iio/devices/triggerX
$ echo 10000 > sampling_frequency
$ cat sampling_frequency
0

After this fix:
$ echo 10000 > sampling_frequency
$ cat sampling_frequency
10000

Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
---
 drivers/iio/trigger/stm32-timer-trigger.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
index 994b96d..5ee362b 100644
--- a/drivers/iio/trigger/stm32-timer-trigger.c
+++ b/drivers/iio/trigger/stm32-timer-trigger.c
@@ -152,10 +152,10 @@ static ssize_t stm32_tt_read_frequency(struct device *dev,
 	regmap_read(priv->regmap, TIM_PSC, &psc);
 	regmap_read(priv->regmap, TIM_ARR, &arr);
 
-	if (psc && arr && (cr1 & TIM_CR1_CEN)) {
+	if (cr1 & TIM_CR1_CEN) {
 		freq = (unsigned long long)clk_get_rate(priv->clk);
-		do_div(freq, psc);
-		do_div(freq, arr);
+		do_div(freq, psc + 1);
+		do_div(freq, arr + 1);
 	}
 
 	return sprintf(buf, "%d\n", (unsigned int)freq);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
