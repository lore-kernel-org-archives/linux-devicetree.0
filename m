From: Arnaud Ebalard <arno@natisbad.org>
Subject: [PATCHv1 1/6] rtc: rtc-isl12057: fix masking of register values
Date: Sat, 15 Nov 2014 00:06:29 +0100
Message-ID: <960977a0c9d25666bd932acb952658a184cb7567.1416006090.git.arno@natisbad.org>
References: <cover.1416006090.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <cover.1416006090.git.arno@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
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
Signed-off-by: Arnaud Ebalard <arno@natisbad.org>
---
 drivers/rtc/rtc-isl12057.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-isl12057.c b/drivers/rtc/rtc-isl12057.c
index 455b601d731d..8c3f60737df8 100644
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
@@ -97,7 +97,7 @@ static void isl12057_rtc_regs_to_tm(struct rtc_time *tm, u8 *regs)
 
 	tm->tm_mday = bcd2bin(regs[ISL12057_REG_RTC_DT]);
 	tm->tm_wday = bcd2bin(regs[ISL12057_REG_RTC_DW]) - 1; /* starts at 1 */
-	tm->tm_mon  = bcd2bin(regs[ISL12057_REG_RTC_MO]) - 1; /* starts at 1 */
+	tm->tm_mon  = bcd2bin(regs[ISL12057_REG_RTC_MO] & 0x1f) - 1; /* ditto */
 	tm->tm_year = bcd2bin(regs[ISL12057_REG_RTC_YR]) + 100;
 }
 
-- 
2.1.1


