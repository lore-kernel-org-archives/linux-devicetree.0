From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: initial clock driver for TWL6030
Date: Fri, 1 Aug 2014 11:38:24 +0100
Message-ID: <20140801103824.GC17528@sirena.org.uk>
References: <1406728949-7560-1-git-send-email-sassmann@kpanic.de>
 <1406728949-7560-3-git-send-email-sassmann@kpanic.de>
 <53DA3613.9010305@ti.com>
 <53DA3C68.3020406@kpanic.de>
 <53DA3D66.1030407@ti.com>
 <53DA4D37.4030408@kpanic.de>
 <20140731192053.4463.27499@quantum>
 <53DB6633.3020005@kpanic.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MN9D2+RfCIChtc82"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53DB6633.3020005-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, t-kristo-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org


--MN9D2+RfCIChtc82
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 01, 2014 at 12:04:35PM +0200, Stefan Assmann wrote:

> probe function doesn't even get called without the clock being
> powered/enabled. I've instrumented do_one_initcall() to verify this.
> With the clock being enabled I see:
> [   19.693511] init/main.c do_one_initcall:792 initcall wl1271_init+0x0/0x38 [wlcore_sdio]
> [   20.993347] init/main.c do_one_initcall:792 initcall wl12xx_driver_init+0x0/0x14 [wl12xx]
> If the clock is kept disabled none of the calls is made and we never get
> to wl12xx_probe().
> The device might not be discoverable without the clock.

> Maybe we should rethink the idea of doing that single register write to
> enable the device in twl-core code, if the TWL6030 is present.

> Alternatively this could be done by u-boot. Seems like something that
> should have been done by firmware upfront.

If this is a SDIO device please search the lists for discussion on how
to handle enabling required resources for them - Ulf was working on
something generic for that.

--MN9D2+RfCIChtc82
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT224VAAoJELSic+t+oim9U5cP/iWGt46RyFrxLqOAwQ1FEGsM
vdESM5DFx+7EsNS70eyHMwoDGCZuSvJwiLChVS9dfV1pmV3sF7CpXh3mV7xYrbgB
q/84eaygLt8VqQcsiwOcC1oqkCRiR3fL27y1V+e8A6tYq5ccTrviBc7+UVVJ7hfN
qLg36+XjFHGWAUvOZmL9oB692UAi7i2tpjlHSxOwI44M/KBHJ2GrHspMajQkjixt
plS4JKFb0QNO99zErN18IlqrjWq+paQOZoQ9gj/wK94SExQAn2gkDST9jrxD1sCg
tYTSk3pXWmFG2gzR0ZJn0nqT6G6Q0/+euGVvqddsU8CzKhRSF5zo5vJ90KF2Dewk
YIg0mLr0US7MJCvMmrLk3edB/0m72+sa/5Ytc1zE+pFS2EwLJFFIdcAxGElORbbM
fxRPqkxhkSjjO3vzyXig/1ZPD4wCzdaU4UbOd88JJx7cVhZdTgCxtwS+xJq0b9PO
mZ23zfNFHadjDHX8FFARcP0dyMAxAJma3G8+TJ9Z3l8wFVPEuAr3+SO2x1WGqelQ
9lCUpwKYr5j0UcaeldYBdWILoou0KfND0GeDrRk2pc698jjC6ZjyvvLHFeN1fz4o
BKRHLYWI89mn9L1TnIzhASw5eTopMo0gcixoEWLV9pY9xGA3yUSHXAqJrL23UfiR
6SOgklKrUHHNiKQpk0n6
=jHRG
-----END PGP SIGNATURE-----

--MN9D2+RfCIChtc82--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
