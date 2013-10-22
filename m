From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Tue, 22 Oct 2013 10:19:59 +0100
Message-ID: <20131022091959.GC20821@sirena.org.uk>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131020231134.GR25034@n2100.arm.linux.org.uk>
 <20131021083242.GB30088@pengutronix.de>
 <20131021084854.GV25034@n2100.arm.linux.org.uk>
 <20131021092730.GF30088@pengutronix.de>
 <20131021095757.GY25034@n2100.arm.linux.org.uk>
 <20131021102448.GD21518@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131021102448.GD21518-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 21, 2013 at 12:24:49PM +0200, Thierry Reding wrote:

> Multi-driver with DRM has worked pretty well for Tegra. Essentially what
> I created was a sort of abstraction layer between DRM and the individual
> drivers so that each driver can register itself with that layer. Once it
> has been determined that all drivers have been probed, that glue layer
> can load the DRM driver and call back into the sub-drivers to register
> their respective components with DRM.

This is pretty much what ASoC always did, it's been working out
reasonably well.

We do still don't really handle what happens if someone tries to unbind
one of the supporting devices while things are in use sensibly.  Since
generally this would involve someone manually removing the driver for
pracical purposes we're OK now but it's an issue and we probably will
have to deal with systems that trigger this for sensible reasons at some
point.

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSZkM7AAoJELSic+t+oim9ZX0P/3ojFWMjpO97xtwNuF5z1pW3
rElEb25oLb30GpHm47JLQghhF8ZWfL6glF5Fh3x7qSywfMCJgVWKq3fGYI/QpOhJ
W9aiQI52YuXyHVyqPLncCZZaPplQuodWd0yzJJqjf4G4E+1SgxXO46GS6pRyKqQf
HgyQz436RqtQBjLHUF0PulUxdn1Ow5GlVO6FTckAWYuifHQO8/s6kgtjqnDeuIqR
dwrSfZmtE3//y9i2mufOsXukBNysjfPFM9MCmCt094ORS3bl6TzvGTGOQY3CiejH
RUJ3JRQOCOpKEHoHgdUKcqrY6tvCgS22izTF2ruVSkHy8bN51/ywsl1G4YCb2i+3
bleCItwkDNN5YUisCY4Nm1JabQgPvXiGwBkccogUS9hB9MalGaP5QrWM6VlC33t2
FdP2I6D12CcgWI5V4e/xzC/IPvBplEomfhiFDt+N1Vyp5Mr1INNe5wO71xZPlWUM
/Yf/Xj4nsU+nqO4En8PNQkJDaiRiM8Mnyja0Kl095EGvixpLWOLx3IT3AxRGxEsG
lJkElQlVxcK4k1Ae9cuFBar+CsztxJIIJxSqzHpPuFkV9EE5mUQCmv/bfBkaBBLX
Z1/vgoF0ex3meieh2TP8FqktmHwezG0Z1etqu0z7d8J1+U/O+MkHQ0aL/HCYsPIB
5KrToMxQV4Fq6MIT+kTS
=PtBM
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
