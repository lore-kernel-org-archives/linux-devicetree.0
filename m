From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCHv0 1/3] rtc: rtc-isl12057: fix masking of register values
Date: Thu, 6 Nov 2014 09:29:46 +0100
Message-ID: <20141106082946.GN8316@pengutronix.de>
References: <cover.1415222752.git.arno@natisbad.org>
 <917b6e5e869fce697dec8a1597dfd2f671bf5c46.1415222752.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <917b6e5e869fce697dec8a1597dfd2f671bf5c46.1415222752.git.arno@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: Arnaud Ebalard <arno@natisbad.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, rtc-linux@googlegroups.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, linux-doc@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>, linux-arm-kernel@lists.infradead.org, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

Hello Arnaud,

On Wed, Nov 05, 2014 at 10:42:25PM +0100, Arnaud Ebalard wrote:
> When Intersil ISL12057 support was added by commit 70e123373c05 ("rtc=
:
> Add support for Intersil ISL12057 I2C RTC chip"), two masks for time
> registers values imported from the device were either wrong or
> omitted, leading to additional bits from those registers to impact
> read values:
>=20
>  - mask for hour register value when reading it in AM/PM mode. As
>    AM/PM mode is not the usual mode used by the driver, this error
>    would only have an impact on an externally configured RTC hour
>    later read by the driver.
>  - mask for month value. The lack of masking would provide an
>    erroneous value if century bit is set.
>=20
> This patch fixes those two masks.
>=20
> Fixes: 70e123373c05 ("rtc: Add support for Intersil ISL12057 I2C RTC =
chip")
> Signed-off-by: Arnaud Ebalard <arno@natisbad.org>
> ---
>  drivers/rtc/rtc-isl12057.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-isl12057.c b/drivers/rtc/rtc-isl12057.c
> index 455b601d731d..8132fbc7e10a 100644
> --- a/drivers/rtc/rtc-isl12057.c
> +++ b/drivers/rtc/rtc-isl12057.c
> @@ -88,7 +88,7 @@ static void isl12057_rtc_regs_to_tm(struct rtc_time=
 *tm, u8 *regs)
>  	tm->tm_min =3D bcd2bin(regs[ISL12057_REG_RTC_MN]);
> =20
>  	if (regs[ISL12057_REG_RTC_HR] & ISL12057_REG_RTC_HR_MIL) { /* AM/PM=
 */
> -		tm->tm_hour =3D bcd2bin(regs[ISL12057_REG_RTC_HR] & 0x0f);
> +		tm->tm_hour =3D bcd2bin(regs[ISL12057_REG_RTC_HR] & 0x1f);
>  		if (regs[ISL12057_REG_RTC_HR] & ISL12057_REG_RTC_HR_PM)
>  			tm->tm_hour +=3D 12;
>  	} else {					    /* 24 hour mode */
> @@ -96,8 +96,8 @@ static void isl12057_rtc_regs_to_tm(struct rtc_time=
 *tm, u8 *regs)
>  	}
> =20
>  	tm->tm_mday =3D bcd2bin(regs[ISL12057_REG_RTC_DT]);
> -	tm->tm_wday =3D bcd2bin(regs[ISL12057_REG_RTC_DW]) - 1; /* starts a=
t 1 */
> +	tm->tm_wday =3D bcd2bin(regs[ISL12057_REG_RTC_DW]) - 1;  /* starts =
at 1 */
unrelated change?

> -	tm->tm_mon  =3D bcd2bin(regs[ISL12057_REG_RTC_MO]) - 1; /* starts a=
t 1 */
> +	tm->tm_mon  =3D bcd2bin(regs[ISL12057_REG_RTC_MO] & 0x1f) - 1; /* d=
itto */
>  	tm->tm_year =3D bcd2bin(regs[ISL12057_REG_RTC_YR]) + 100;
>  }
This patch definitly improves the driver, still I see room for more
improvement (all but the first issue are unrelated to this patch):

 - There is a century bit in the RTC_MO driver that is now correctly
   masked to determine the month. Shouldn't it be used to flag if year
   is >=3D 2100? That seems to match the hardware leap year handling.
   (I.e. it considers RTC_YR=3D0 not to be a leap year iff RTC_MO_CENTU=
RY
   is set.)

 - I wonder how tm_wday should be handled. It seems to be hardly used b=
y
   callers of rtc_read_time. Is it better to report the hardware state
   here or the weekday matching year/month/day?

 - IMHO the probe function shouldn't clear the OSCILLATOR FAILURE BIT
   (OSF). It's an indicator that the stored time is wrong. Instead this
   bit should be evaluated in the read_time callback. (If it's set,
   return -ENODATA.) And only clear the bit in .set_time when the
   registers were updated. I think most drivers get that wrong.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
