From: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Subject: [PATCHv0 1/3] rtc: rtc-isl12057: fix masking of register values
Date: Wed, 05 Nov 2014 22:42:25 +0100
Message-ID: <917b6e5e869fce697dec8a1597dfd2f671bf5c46.1415222752.git.arno@natisbad.org>
References: <cover.1415222752.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1415222752.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Peter Huewe <peter.huewe-d0qZbvYSIPpWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
List-Id: devicetree@vger.kernel.org


When Intersil ISL12057 support was added by commit 70e123373c05 ("rtc:
Add support for Intersil ISL12057 I2C RTC chip"), two masks for time
registers values imported from the device were either wrong or
omitted, leading to additional bits from those registers to impact
read values:

 - mask for hour register value when reading it in AM/PM mode. As
   AM/PM mode is not the usual mode used by the driver, this error
   would only have an impact on an externally configured RTC hour
   later read by the driver.
 - mask for month value. The lack of masking would provide an
   erroneous value if century bit is set.

This patch fixes those two masks.

Fixes: 70e123373c05 ("rtc: Add support for Intersil ISL12057 I2C RTC chip")
Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
---
 drivers/rtc/rtc-isl12057.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-isl12057.c b/drivers/rtc/rtc-isl12057.c
index 455b601d731d..8132fbc7e10a 100644
--- a/drivers/rtc/rtc-isl12057.c
+++ b/drivers/rtc/rtc-isl12057.c
@@ -88,7 +88,7 @@ static void isl12057_rtc_regs_to_tm(struct rtc_time *tm, u8 *regs)
 	tm->tm_min = bcd2bin(regs[ISL12057_REG_RTC_MN]);
 
 	if (regs[ISL12057_REG_RTC_HR] & ISL12057_REG_RTC_HR_MIL) { /* AM/PM */
-		tm->tm_hour = bcd2bin(regs[ISL12057_REG_RTC_HR] & 0x0f);
+		tm->tm_hour = bcd2bin(regs[ISL12057_REG_RTC_HR] & 0x1f);
 		if (regs[ISL12057_REG_RTC_HR] & ISL12057_REG_RTC_HR_PM)
 			tm->tm_hour += 12;
 	} else {					    /* 24 hour mode */
@@ -96,8 +96,8 @@ static void isl12057_rtc_regs_to_tm(struct rtc_time *tm, u8 *regs)
 	}
 
 	tm->tm_mday = bcd2bin(regs[ISL12057_REG_RTC_DT]);
-	tm->tm_wday = bcd2bin(regs[ISL12057_REG_RTC_DW]) - 1; /* starts at 1 */
-	tm->tm_mon  = bcd2bin(regs[ISL12057_REG_RTC_MO]) - 1; /* starts at 1 */
+	tm->tm_wday = bcd2bin(regs[ISL12057_REG_RTC_DW]) - 1;  /* starts at 1 */
+	tm->tm_mon  = bcd2bin(regs[ISL12057_REG_RTC_MO] & 0x1f) - 1; /* ditto */
 	tm->tm_year = bcd2bin(regs[ISL12057_REG_RTC_YR]) + 100;
 }
 
-- 
2.1.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
