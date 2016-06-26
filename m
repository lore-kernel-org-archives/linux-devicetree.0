From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 4/8] rtc: ac100: Add RTC driver for
 X-Powers AC100
Date: Sun, 26 Jun 2016 02:30:54 +0200
Message-ID: <20160626003054.GW5809@piout.net>
References: <1466391138-12862-1-git-send-email-wens@csie.org>
 <1466391138-12862-5-git-send-email-wens@csie.org>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBCKYNX7Y3IMBBQGEXS5QKGQEL74DOAI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1466391138-12862-5-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

A few comments, mostly about style.

On 20/06/2016 at 10:52:14 +0800, Chen-Yu Tsai wrote :
> +struct ac100_rtc_dev {
> +	struct rtc_device *rtc;
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct mutex mutex;

I don't think that mutex is needed. Instead, you can take rtc->ops_lock
from the interrupt handler.

> +	int irq;
> +	unsigned long alarm;
> +};
> +
> +static int ac100_rtc_get_time(struct device *dev, struct rtc_time *rtc_tm)
> +{
> +	struct ac100_rtc_dev *chip = dev_get_drvdata(dev);
> +	struct regmap *regmap = chip->regmap;
> +	u16 reg[7];
> +	int ret;
> +
> +	ret = regmap_bulk_read(regmap, AC100_RTC_SEC, reg, 7);
> +	if (ret)
> +		return ret;
> +
> +	rtc_tm->tm_sec  = bcd2bin(reg[0] & AC100_RTC_SEC_MASK);
> +	rtc_tm->tm_min  = bcd2bin(reg[1] & AC100_RTC_MIN_MASK);
> +	rtc_tm->tm_hour = bcd2bin(reg[2] & AC100_RTC_HOU_MASK);
> +	rtc_tm->tm_wday = bcd2bin(reg[3] & AC100_RTC_WEE_MASK);
> +	rtc_tm->tm_mday = bcd2bin(reg[4] & AC100_RTC_DAY_MASK);
> +	rtc_tm->tm_mon  = bcd2bin(reg[5] & AC100_RTC_MON_MASK);
> +	rtc_tm->tm_year = bcd2bin(reg[6] & AC100_RTC_YEA_MASK);
> +
> +	rtc_tm->tm_mon  -= 1;

I would put the - 1 inline with the first tm_mon assignment.

> +
> +	/*
> +	 * switch from (data_year->min)-relative offset to
> +	 * a (1900)-relative one
> +	 */
> +	rtc_tm->tm_year += AC100_YEAR_OFF;

Unless you feel the comment is absolutely necessary, I'd also put that
with the first tm_year assignment.

BTW, is that RTC aware that 0 is actually 1970? And so 2000 (30) is not
a leap year but 2016 is? I'd say that this is not the case, seeing
AC100_RTC_YEA_LEAP but it is worth checking.

Is this bit (AC100_RTC_YEA_LEAP) updated by the rtc? IF that is not the
case, the time will have to be set at least once between first of
January and 28th of February of leap years else it will fail...

> +
> +	return rtc_valid_tm(rtc_tm);
> +}
> +
> +static int ac100_rtc_set_time(struct device *dev, struct rtc_time *rtc_tm)
> +{
> +	struct ac100_rtc_dev *chip = dev_get_drvdata(dev);
> +	struct regmap *regmap = chip->regmap;
> +	int year;
> +	u16 reg[8];
> +
> +	/* our RTC has a limited year range... */
> +	year = rtc_tm->tm_year + 1900;
> +	if (year < AC100_YEAR_MIN || year > AC100_YEAR_MAX) {
> +		dev_err(dev, "rtc only supports year in range %d - %d\n",
> +			AC100_YEAR_MIN, AC100_YEAR_MAX);
> +		return -EINVAL;
> +	}
> +

What about:

year = rtc_tm->tm_year - AC100_YEAR_OFF
if (year < 0 || year > (AC100_YEAR_MAX - 1900))

It allows to reuse year for the reg[6] assignment. IT is a simple
suggestion, maybe the compiler is smarter than I am ;).

> +	/* correct offsets */
> +	rtc_tm->tm_year -= AC100_YEAR_OFF;
> +	rtc_tm->tm_mon += 1;
> +

Those could also got inline with their respective reg[] assignment


> +	/* convert to BCD */
> +	reg[0] = bin2bcd(rtc_tm->tm_sec)  & AC100_RTC_SEC_MASK;
> +	reg[1] = bin2bcd(rtc_tm->tm_min)  & AC100_RTC_MIN_MASK;
> +	reg[2] = bin2bcd(rtc_tm->tm_hour) & AC100_RTC_HOU_MASK;
> +	reg[3] = bin2bcd(rtc_tm->tm_wday) & AC100_RTC_WEE_MASK;
> +	reg[4] = bin2bcd(rtc_tm->tm_mday) & AC100_RTC_DAY_MASK;
> +	reg[5] = bin2bcd(rtc_tm->tm_mon)  & AC100_RTC_MON_MASK;
> +	reg[6] = bin2bcd(rtc_tm->tm_year) & AC100_RTC_YEA_MASK;
> +	/* trigger write */
> +	reg[7] = AC100_RTC_UPD_TRIGGER;
> +
> +	/* Is it a leap year? */
> +	if (is_leap_year(year))
> +		reg[6] |= AC100_RTC_YEA_LEAP;
> +
> +	return regmap_bulk_write(regmap, AC100_RTC_SEC, reg, 8);
> +}
> +
> +

[...]

> +	alrm_tm->tm_sec  = bcd2bin(reg[0] & AC100_ALM_SEC_MASK);
> +	alrm_tm->tm_min  = bcd2bin(reg[1] & AC100_ALM_MIN_MASK);
> +	alrm_tm->tm_hour = bcd2bin(reg[2] & AC100_ALM_HOU_MASK);
> +	alrm_tm->tm_wday = bcd2bin(reg[3] & AC100_ALM_WEE_MASK);
> +	alrm_tm->tm_mday = bcd2bin(reg[4] & AC100_ALM_DAY_MASK);
> +	alrm_tm->tm_mon  = bcd2bin(reg[5] & AC100_ALM_MON_MASK);
> +	alrm_tm->tm_year = bcd2bin(reg[6] & AC100_ALM_YEA_MASK);
> +
> +	alrm_tm->tm_mon  -= 1;
> +
> +	/*
> +	 * switch from (data_year->min)-relative offset to
> +	 * a (1900)-relative one
> +	 */
> +	alrm_tm->tm_year += AC100_YEAR_OFF;
> +

Well, same comments as in ac100_rtc_get_time()


> +out:
> +	mutex_unlock(&chip->mutex);
> +	return ret;
> +}
> +
> +static int ac100_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	struct ac100_rtc_dev *chip = dev_get_drvdata(dev);
> +	struct regmap *regmap = chip->regmap;
> +	struct rtc_time *alrm_tm = &alrm->time;
> +	u16 reg[8];
> +	int year;
> +	int ret;
> +
> +	/* our alarm has a limited year range... */
> +	year = alrm_tm->tm_year + 1900;
> +	if (year < AC100_YEAR_MIN || year > AC100_YEAR_MAX) {
> +		dev_err(dev, "alarm only supports year in range %d - %d\n",
> +			AC100_YEAR_MIN, AC100_YEAR_MAX);
> +		return -EINVAL;
> +	}
> +
> +	/* correct offsets */
> +	alrm_tm->tm_year -= AC100_YEAR_OFF;
> +	alrm_tm->tm_mon += 1;
> +

Same comment as ac100_rtc_set_time()

> +	/* convert to BCD */
> +	reg[0] = (bin2bcd(alrm_tm->tm_sec)  & AC100_ALM_SEC_MASK) |
> +			AC100_ALM_ENABLE_FLAG;
> +	reg[1] = (bin2bcd(alrm_tm->tm_min)  & AC100_ALM_MIN_MASK) |
> +			AC100_ALM_ENABLE_FLAG;
> +	reg[2] = (bin2bcd(alrm_tm->tm_hour) & AC100_ALM_HOU_MASK) |
> +			AC100_ALM_ENABLE_FLAG;
> +	/* Do not enable weekday alarm */
> +	reg[3] = bin2bcd(alrm_tm->tm_wday) & AC100_ALM_WEE_MASK;
> +	reg[4] = (bin2bcd(alrm_tm->tm_mday) & AC100_ALM_DAY_MASK) |
> +			AC100_ALM_ENABLE_FLAG;
> +	reg[5] = (bin2bcd(alrm_tm->tm_mon)  & AC100_ALM_MON_MASK) |
> +			AC100_ALM_ENABLE_FLAG;
> +	reg[6] = (bin2bcd(alrm_tm->tm_year) & AC100_ALM_YEA_MASK) |
> +			AC100_ALM_ENABLE_FLAG;
> +	/* trigger write */
> +	reg[7] = AC100_ALM_UPD_TRIGGER;
> +
> +	mutex_lock(&chip->mutex);
> +
> +	ret = regmap_bulk_write(regmap, AC100_ALM_SEC, reg, 8);
> +	if (ret)
> +		goto out;
> +
> +	ret = _ac100_rtc_alarm_irq_enable(chip, alrm->enabled);
> +
> +out:
> +	mutex_unlock(&chip->mutex);
> +	return ret;
> +}
> +

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
