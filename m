From: Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>
Subject: Re: [PATCH v2 1/2] rtc: add rtc-lpc24xx driver
Date: Fri, 15 May 2015 10:23:12 -0500
Message-ID: <20150515152312.GG23600@jcartwri.amer.corp.natinst.com>
References: <1431696306-19093-1-git-send-email-manabian@gmail.com>
 <1431696306-19093-2-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1Ow488MNN9B9o/ov"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431696306-19093-2-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, wellsk40-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org


--1Ow488MNN9B9o/ov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello again,

On Fri, May 15, 2015 at 03:25:05PM +0200, Joachim Eastwood wrote:
> Add driver for the RTC found on NXP LPC24xx/178x/18xx/43xx devices.
> The RTC provides calendar and clock functionality together with
> periodic tick and alarm interrupt support.
>=20
> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
[..]
> +++ b/drivers/rtc/Kconfig
> @@ -1427,6 +1427,19 @@ config RTC_DRV_JZ4740
>  	  This driver can also be buillt as a module. If so, the module
>  	  will be called rtc-jz4740.
> =20
> +config RTC_DRV_LPC24XX
> +	depends on ARCH_LPC18XX || COMPILE_TEST
> +	depends on HAS_IOMEM
> +	depends on OF
> +	tristate "NXP LPC24xx RTC"
> +	help
> +	  This enables support for the NXP RTC found which can be found on
> +	  LPC24xx/178x/18xx/43xx devices.

Is this still true?

> +
> +	  If you have one of the devices above enable this driver to use
> +	  the hardware RTC. This driver can also be buillt as a module. If
> +	  so, the module will be called rtc-lpc24xx.
> +
>  config RTC_DRV_LPC32XX
>  	depends on ARCH_LPC32XX
>  	tristate "NXP LPC32XX RTC"
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index c31731c29762..8687a2e13247 100644
> --- a/drivers/rtc/Makefile
[..]
> +static int lpc24xx_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct lpc24xx_rtc *rtc =3D dev_get_drvdata(dev);
> +	u32 ct0, ct1, ct2;
> +
> +	ct0 =3D rtc_readl(rtc, LPC24XX_CTIME0);
> +	ct1 =3D rtc_readl(rtc, LPC24XX_CTIME1);
> +	ct2 =3D rtc_readl(rtc, LPC24XX_CTIME2);
> +
> +	tm->tm_sec  =3D CT0_SECS(ct0);
> +	tm->tm_min  =3D CT0_MINS(ct0);
> +	tm->tm_hour =3D CT0_HOURS(ct0);
> +	tm->tm_wday =3D CT0_DOW(ct0);
> +	tm->tm_mon  =3D CT1_MONTH(ct1);
> +	tm->tm_mday =3D CT1_DOM(ct1);
> +	tm->tm_year =3D CT1_YEAR(ct1);
> +	tm->tm_yday =3D CT2_DOY(ct2);
> +
> +	if (rtc_valid_tm(tm) < 0) {
> +		dev_warn(dev, "retrieved date and time is invalid\n");
> +		rtc_time64_to_tm(0, tm);
> +		lpc24xx_rtc_set_time(dev, tm);
> +	}
> +
> +	return 0;

Forcing the read time to be the epoch on failure seems like a pretty
poor way to handle errors, in my opinion.

Why not trickle an error up to the rtc class driver?

Actually, the class driver is already doing a rtc_valid_tm() check, so
that shouldn't even be necessary.  Just read your time here, and let the
upper layer take care of handling an invalid time (and properly
propagating an error up the stack).

  Josh

--1Ow488MNN9B9o/ov
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJVVg9cAAoJEKp7ZBKwQFArsswH/jjzMTqZ7DfRdkyMmhhuecHb
sVjOA5Ftq1PHsZGb3dCe6dqmIw5PcSdxagKEpS1rmRb+39vCdg/YzzNInBJJGAdV
gojmqBSL1RwHDG7BsDaWnWLYxSu5CHtIz7g+X6fV7iFrdfbsT6HRcG2TPJvMDXZD
xknBII8gcExmSwHfeSMGNHr5oNbOW6DAH1ABHgJiQ3QD1CyrqXNQyIPwaOWgnkdw
sj4XXQeYrlzmRdiR0BK76UWieHBuqqWxo4s+8yId4Y2arz8OyfSAXZI55gpPNujL
IE9ejf9r8Yn5tDrDu/88abeAVxXbyJbamwqcYNeWA0at3TpiuI63hV5n/ekvBho=
=1gqb
-----END PGP SIGNATURE-----

--1Ow488MNN9B9o/ov--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
