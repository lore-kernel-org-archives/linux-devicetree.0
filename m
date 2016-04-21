From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/7] regulator: rk808: Migrate to regulator core's
 simplified DT parsing code
Date: Thu, 21 Apr 2016 17:01:20 +0100
Message-ID: <20160421160120.GT3217@sirena.org.uk>
References: <1461244361-45686-1-git-send-email-w.egorov@phytec.de>
 <1461244361-45686-4-git-send-email-w.egorov@phytec.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x735uyZ2C9eR7U1j"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461244361-45686-4-git-send-email-w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--x735uyZ2C9eR7U1j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 21, 2016 at 03:12:37PM +0200, Wadim Egorov wrote:

> +static int rk808_set_suspend_voltage(struct regulator_dev *rdev, int uv)
> +{
> +	unsigned int reg;
> +	int sel = regulator_map_voltage_linear(rdev, uv, uv);
> +
> +	if (sel < 0)
> +		return -EINVAL;
> +
> +	reg = rdev->desc->vsel_reg + RK808_SLP_REG_OFFSET;
> +
> +	return regmap_update_bits(rdev->regmap, reg,
> +				  rdev->desc->vsel_mask,
> +				  sel);
> +}

This is fine but is adding a new feature and not part of the refactoring
that the changelog talked about so should be in a separate commit.

--x735uyZ2C9eR7U1j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXGPlKAAoJECTWi3JdVIfQqxcH/3zHYCsco7Um+vuiC3Tx+h+S
6zDWfQtNVsxmf75m9fTYsY91t1ub/SNY8DGvEeCPRffvVHxLQBaaKyW0HcaBvdS3
h2LOaXlJlTE5o3SnA/RVC7qM5OEGLU94oxa5x+j03MUbqMtm4ngDCe0LzFdGsq4a
2kaUCx35X9Kdy6N2pHPGxF3A0v+gqSnQ35L/JfUqAy0KhjdN/y0G2pZpfuxhM6+U
jniv0nasEatBpB6KZPSDqwjOMsNB9kPpBixRtTHksfPjZgCC8NqNT1eGEyJq8eOZ
QWZr6Is7zpwT388PaDDfwdpd9K758Jv15EnXDb+IF0Zxz0Mp4Ds3hPEUKJBNbFE=
=tDQJ
-----END PGP SIGNATURE-----

--x735uyZ2C9eR7U1j--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
