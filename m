From: arno@natisbad.org (Arnaud Ebalard)
Subject: Re: [PATCHv0 1/3] rtc: rtc-isl12057: fix masking of register values
Date: Fri, 07 Nov 2014 00:34:41 +0100
Message-ID: <87ioirnbse.fsf@natisbad.org>
References: <cover.1415222752.git.arno@natisbad.org>
	<917b6e5e869fce697dec8a1597dfd2f671bf5c46.1415222752.git.arno@natisbad.org>
	<20141106082946.GN8316@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, rtc-linux@googlegroups.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, linux-doc@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>, linux-arm-kernel@lists.infradead.org, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

Hi,

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

> Hello Arnaud,
>
> On Wed, Nov 05, 2014 at 10:42:25PM +0100, Arnaud Ebalard wrote:
>> When Intersil ISL12057 support was added by commit 70e123373c05 ("rt=
c:
>> Add support for Intersil ISL12057 I2C RTC chip"), two masks for time
>> registers values imported from the device were either wrong or
>> omitted, leading to additional bits from those registers to impact
>> read values:
>>=20
>>  - mask for hour register value when reading it in AM/PM mode. As
>>    AM/PM mode is not the usual mode used by the driver, this error
>>    would only have an impact on an externally configured RTC hour
>>    later read by the driver.
>>  - mask for month value. The lack of masking would provide an
>>    erroneous value if century bit is set.
>>=20
>> This patch fixes those two masks.
>>=20
>> Fixes: 70e123373c05 ("rtc: Add support for Intersil ISL12057 I2C RTC=
 chip")
>> Signed-off-by: Arnaud Ebalard <arno@natisbad.org>
>> ---
>>  drivers/rtc/rtc-isl12057.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/rtc/rtc-isl12057.c b/drivers/rtc/rtc-isl12057.c
>> index 455b601d731d..8132fbc7e10a 100644
>> --- a/drivers/rtc/rtc-isl12057.c
>> +++ b/drivers/rtc/rtc-isl12057.c
>> @@ -88,7 +88,7 @@ static void isl12057_rtc_regs_to_tm(struct rtc_tim=
e *tm, u8 *regs)
>>  	tm->tm_min =3D bcd2bin(regs[ISL12057_REG_RTC_MN]);
>> =20
>>  	if (regs[ISL12057_REG_RTC_HR] & ISL12057_REG_RTC_HR_MIL) { /* AM/P=
M */
>> -		tm->tm_hour =3D bcd2bin(regs[ISL12057_REG_RTC_HR] & 0x0f);
>> +		tm->tm_hour =3D bcd2bin(regs[ISL12057_REG_RTC_HR] & 0x1f);
>>  		if (regs[ISL12057_REG_RTC_HR] & ISL12057_REG_RTC_HR_PM)
>>  			tm->tm_hour +=3D 12;
>>  	} else {					    /* 24 hour mode */
>> @@ -96,8 +96,8 @@ static void isl12057_rtc_regs_to_tm(struct rtc_tim=
e *tm, u8 *regs)
>>  	}
>> =20
>>  	tm->tm_mday =3D bcd2bin(regs[ISL12057_REG_RTC_DT]);
>> -	tm->tm_wday =3D bcd2bin(regs[ISL12057_REG_RTC_DW]) - 1; /* starts =
at 1 */
>> +	tm->tm_wday =3D bcd2bin(regs[ISL12057_REG_RTC_DW]) - 1;  /* starts=
 at 1 */
> unrelated change?

yep, will remove it.


>> -	tm->tm_mon  =3D bcd2bin(regs[ISL12057_REG_RTC_MO]) - 1; /* starts =
at 1 */
>> +	tm->tm_mon  =3D bcd2bin(regs[ISL12057_REG_RTC_MO] & 0x1f) - 1; /* =
ditto */
>>  	tm->tm_year =3D bcd2bin(regs[ISL12057_REG_RTC_YR]) + 100;
>>  }
> This patch definitly improves the driver, still I see room for more
> improvement (all but the first issue are unrelated to this patch):
>
>  - There is a century bit in the RTC_MO driver that is now correctly
>    masked to determine the month. Shouldn't it be used to flag if yea=
r
>    is >=3D 2100? That seems to match the hardware leap year handling.
>    (I.e. it considers RTC_YR=3D0 not to be a leap year iff RTC_MO_CEN=
TURY
>    is set.)
>
>  - I wonder how tm_wday should be handled. It seems to be hardly used=
 by
>    callers of rtc_read_time. Is it better to report the hardware stat=
e
>    here or the weekday matching year/month/day?
>
>  - IMHO the probe function shouldn't clear the OSCILLATOR FAILURE BIT
>    (OSF). It's an indicator that the stored time is wrong. Instead th=
is
>    bit should be evaluated in the read_time callback. (If it's set,
>    return -ENODATA.) And only clear the bit in .set_time when the
>    registers were updated. I think most drivers get that wrong.

Thanks for your feedback. I will take a look at those after alarm
support is ok.

Cheers,

a+



