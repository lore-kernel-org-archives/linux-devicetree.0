From: Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>
Subject: Re: [PATCH v3 1/2] rtc: add rtc-lpc24xx driver
Date: Mon, 13 Jul 2015 12:37:39 -0500
Message-ID: <20150713173739.GF25028@jcartwri.amer.corp.natinst.com>
References: <1436635730-15617-1-git-send-email-manabian@gmail.com>
 <1436635730-15617-2-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sdOeJE8sLwpQaOMV"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436635730-15617-2-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--sdOeJE8sLwpQaOMV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2015 at 07:28:49PM +0200, Joachim Eastwood wrote:
> Add driver for the RTC found on NXP LPC178x/18xx/408x/43xx devices.
> The RTC provides calendar and clock functionality together with
> alarm interrupt support.
>=20
> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
[..]
> +static int lpc24xx_rtc_remove(struct platform_device *pdev)
> +{
> +	struct lpc24xx_rtc *rtc =3D platform_get_drvdata(pdev);
> +
> +	/* Ensure all interrupt sources are masked */
> +	rtc_writel(rtc, LPC24XX_AMR, LPC24XX_ALARM_DISABLE);
> +	rtc_writel(rtc, LPC24XX_CIIR, 0);
> +
> +	rtc_writel(rtc, LPC24XX_CCR, LPC178X_CCALEN);
> +
> +	clk_disable_unprepare(rtc->clk_rtc);
> +	clk_disable_unprepare(rtc->clk_reg);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id lpc24xx_rtc_match[] =3D {
> +	{ .compatible =3D "nxp,lpc1788-rtc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, lpc24xx_rtc_match);
> +
> +static struct platform_driver lpc24xx_rtc_driver =3D {
> +	.probe	=3D lpc24xx_rtc_probe,
> +	.remove	=3D lpc24xx_rtc_remove,
> +	.driver	=3D {
> +		.name =3D "lpc24xx-rtc",
> +		.of_match_table	=3D lpc24xx_rtc_match,
> +	},
> +};
> +module_platform_driver(lpc24xx_rtc_driver);
> +
> +MODULE_AUTHOR("Kevin Wells <wellsk40-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org");

Missing closing '>'.

Otherwise,

Reviewed-by: Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>

  Josh

--sdOeJE8sLwpQaOMV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJVo/dgAAoJEKp7ZBKwQFAr4BkH/jxWe3K1eCx9B1luX1iyiMnL
Nw6HK2BjU4bIxVwXE2fv0fp1Jvd/uzOwttpOyHyuFRsOR9X+saRuGpOImeAjHwMl
5g3I0NxC0zT7Y7f9+iNV9V7X/Vl7slFXoHQSNiPwrRevFsHAK4HXDeXYRBHQKjhT
byLCwDL6OErJcEmhzVXUBRQkKTqKOgaNKPN6HNE1ScNsNED+gj+eay/9Wkob0dj/
NHlAvDeR+cK0T4/1C/iw5ru/sV5qinFQtYVUor7q3AJCLuX0IDf9dC5FIDU1f8yY
yutmb6pVrS8UscIKMZ6rKo83oQIOT5YbPpnTJuzmHg7SWe3zByGwC6bc/AsHwyY=
=SzwP
-----END PGP SIGNATURE-----

--sdOeJE8sLwpQaOMV--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
