From: Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>
Subject: Re: [PATCH 1/2] rtc: add rtc-lpc24xx driver
Date: Thu, 14 May 2015 13:19:53 -0500
Message-ID: <20150514181953.GC23600@jcartwri.amer.corp.natinst.com>
References: <1431624875-20990-1-git-send-email-manabian@gmail.com>
 <1431624875-20990-2-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jousvV0MzM2p6OtC"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431624875-20990-2-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wellsk40-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org


--jousvV0MzM2p6OtC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Joachim,

Just a quick comment/question below.

On Thu, May 14, 2015 at 07:34:34PM +0200, Joachim Eastwood wrote:
> Add driver for the RTC found on NXP LPC24xx/178x/18xx/43xx devices.
> The RTC provides calendar and clock functionality together with
> periodic tick and alarm interrupt support.
>=20
> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
[..]
> +
> +static const struct of_device_id lpc24xx_rtc_match[] =3D {
> +	{ .compatible =3D "nxp,lpc1788-rtc", .data =3D (void *)HAVE_CALIBRATION=
},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, lpc24xx_rtc_match);
> +
> +static int lpc24xx_rtc_probe(struct platform_device *pdev)
> +{
> +	const struct of_device_id *match;
> +	struct lpc24xx_rtc *rtc;
> +	struct resource *res;
> +	u32 rtc_ccr =3D 0;
> +	int irq, ret;
> +
[..]
> +
> +	/* Clear the counter increment state */
> +	rtc_writel(rtc, LPC24XX_ILR, LPC24XX_RTCCIF);
> +
> +	if (rtc->features & HAVE_PRESCALER) {
> +		/* Clock source is 32k oscillator */
> +		rtc_ccr =3D LPC24XX_CLKSRC;
> +		rtc_writel(rtc, LPC24XX_CCR, rtc_ccr);
> +
> +		/* Set prescaler to divide by 1 */
> +		rtc_writel(rtc, LPC24XX_PREINT, 0);
> +		rtc_writel(rtc, LPC24XX_PREFRAC, 0);
> +	}
> +
> +	if (rtc->features & HAVE_SUBSECOND) {
> +		/* Disable sub-second interrupt */
> +		rtc_writel(rtc, LPC24XX_CISS, 0);
> +	}

Neither HAVE_PRESCALER, nor HAVE_SUBSECOND are used for the claimed
supported RTC, so this is effectively dead code.  Was this something you
intended to add later?  Some remnant of the rework?

  Josh

--jousvV0MzM2p6OtC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJVVOdFAAoJEKp7ZBKwQFAreFoH/jEMVQAGY8PFXDOX1/TanMBo
+mTUBJueULKs1jbFi7TBvHzJOnOOYDIWU4DyFBOXt2yAZWGkEXj/+cnpUd0Xr0P2
pVaeVkmDr6EtDFMr1CrmgKs3nqQD8xqTj6osG3Q47GTYvB0jhgYig60NiEOcAiW6
YId1wgCVoACwRC2yBjd1IKikK2Fsgy7A/PJYySkGB2AWAW8YJXlNnWFkNLuib2K9
LDprDqBpX+xt8K9tB2ZKUFN7ZqihiIclGIAUwG34Dyo6kCR/DFjkhkhzw/uWFlJo
u+3idreaWNXMCdGS02KeaqkgwEYWY2+mwBIJcQ+VI98Lov9S6slepV9arwipdvM=
=D+hp
-----END PGP SIGNATURE-----

--jousvV0MzM2p6OtC--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
