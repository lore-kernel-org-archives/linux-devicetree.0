From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [rtc-linux] [PATCH] rtc: Fix suspend/resume for APM X-Gene SoC
 RTC driver
Date: Mon, 14 Apr 2014 18:21:34 +0100
Message-ID: <20140414172134.GB25182@sirena.org.uk>
References: <1397259218-20494-1-git-send-email-lho@apm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1397259218-20494-1-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org


--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2014 at 05:33:38PM -0600, Loc Ho wrote:

> -	clk_prepare_enable(pdata->clk);
> +	ret =3D clk_prepare_enable(pdata->clk);
> +	if (ret)
> +		return ret;
> =20
>  	/* Turn on the clock and the crystal */
>  	writel(RTC_CCR_EN, pdata->csr_base + RTC_CCR);
> =20
> -	device_init_wakeup(&pdev->dev, 1);
> +	ret =3D device_init_wakeup(&pdev->dev, 1);
> +	if (ret)
> +		return ret;
> =20
If the init fails you should unprepare (though I suspect the same issue
applies to other things in the probe function anyway).  If you fix that
then feel free to add:

Reviewed-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

or anyway I guess.

--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTTBkaAAoJELSic+t+oim9vlAP/R9x0zeJYAMQ0Z7oCW4DDYQq
NvTGgK0copOBRefKiQbK7m5p8TNZ8PD9p0MLYzFLfRTsyuvNzdSkfMMhOjqefg88
taBz1ltgm7zhYok61DmJrLTV6S2Igr5/6LgThjY8kLcbWnhQkI/g6P+iKTyBn+DF
XK/qs3+XrvatNC2txw1Eo3iHgP8NQI7U2tWj8gjxqH/iqyTj/A8w7mNQG7k6DMrh
Ynk55B6dM46MjIg5sTNGGUJSghIr8u1W3K3PXA61Q4GNP3QVRLNmdMWk3j00u/Z+
jXyT/ws8HYnic7dfzzdVMpaO4rkXZgFlM/y2ylvJhLRNav3FqD8XXg+FdJDOvY3a
R9uI8eMaB1q5CmyzPGPdWhcj2oFuNxOrZyPDgnkMYFLYAnTYbJ+QF5bx1fqArlI5
2gQcugVKJh7R52oSRqkNIYVCxKhBJ/zOSf1wHeYSUbGynrjszvKg5BbWjLVXi6mN
Rb1hZ0z9Tf9t6YGYNveoWPgVoncglgC1CPAaNze3LZtwMXg4TooOaSsJNvlBuDzi
IeCNC4tUrAVGYOPNBTjflI/TDLPy0/if/9buKRSs8QbbfVBI7KHKOTJU9k+AnnRq
amr8TxM31isn8BztDS65dOn1novS0fT1SJVWmS6NbSUsThL7tk0OfCdosNfiVZrM
UvRVWxbSlXt5/T8CIR78
=GUCq
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
