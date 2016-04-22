From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/7] regulator: rk808: Migrate to regulator core's
 simplified DT parsing code
Date: Fri, 22 Apr 2016 10:41:37 +0100
Message-ID: <20160422094137.GB3217@sirena.org.uk>
References: <1461244361-45686-1-git-send-email-w.egorov@phytec.de>
 <1461244361-45686-4-git-send-email-w.egorov@phytec.de>
 <20160421160120.GT3217@sirena.org.uk>
 <5719E8CD.1070304@phytec.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0TJQK8JvXJ+EbTps"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5719E8CD.1070304-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--0TJQK8JvXJ+EbTps
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 22, 2016 at 11:03:09AM +0200, Wadim Egorov wrote:
> On 21.04.2016 18:01, Mark Brown wrote:

> >> +static int rk808_set_suspend_voltage(struct regulator_dev *rdev, int uv)
> >> +{

> > This is fine but is adding a new feature and not part of the refactoring
> > that the changelog talked about so should be in a separate commit.

> This is not really a new feature.
> rk808_set_suspend_voltage() was using regulator_map_voltage_linear_range().
> I have just renamed the function to rk808_set_suspend_voltage_range()
> and added an ops struct for ranges.
> Yes, I have also added rk808_set_suspend_voltage(), but this is just a split
> for the two types of ops that the driver needs now.
> This was needed, because the driver used only linear ranges.
> IMO it should be a part of the refactoring.

If that's the case then split this into multiple refactorings each doing
one change so this can be more easily reviewed.

--0TJQK8JvXJ+EbTps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXGfHQAAoJECTWi3JdVIfQ9PYH/juXorEZfekYWBQuYa0LChNX
KZFbpGU/TXrPqbkGquD536ZzJZTeEKlKta0HlLMz4sMIZX/NyGx60eVHCWzU57rx
Tf2pUhVP7nmOIin//5psLXhgmYp95OUmJTJScNmpSvwaKpcDt9ye4O1xWVr8hjej
CUz88/GaJXKGLTvEg/9F/RMKFoKsiVQQpX2n9UVm2hDqa60dB/BcQah4JPbTOfJ7
G699Bis4ygsbmUDRkCHotb1v0kvjDLpKDEUoPDDiVGksGnPcVV9rQ/1mudv1RSUi
icDvoYg+7HsxTulJPHZJQzEzBzgm5GTqv9YIhvjzNuLiyTjrahVVfVmhrxQrB2A=
=wVTn
-----END PGP SIGNATURE-----

--0TJQK8JvXJ+EbTps--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
