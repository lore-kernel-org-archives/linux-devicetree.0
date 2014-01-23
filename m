From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 7/7] ARM: brcmstb: dts: add a reference DTS for
 Broadcom 7445
Date: Thu, 23 Jan 2014 12:25:19 +0000
Message-ID: <20140123122519.GI17314@sirena.org.uk>
References: <1389743333-16741-1-git-send-email-marc.ceeeee@gmail.com>
 <201401161219.01038.arnd@arndb.de>
 <20140116134732.GB17314@sirena.org.uk>
 <201401171804.30572.arnd@arndb.de>
 <52E0D9AD.1040409@monstr.eu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nKzfxXxTXZ/rSi7L"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52E0D9AD.1040409-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc C <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--nKzfxXxTXZ/rSi7L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 23, 2014 at 09:58:21AM +0100, Michal Simek wrote:
> On 01/17/2014 06:04 PM, Arnd Bergmann wrote:

> >> I thought the solution with deferring registration of the resource for
> >> dev_get_regmap() until a proper device materialised seemed simple and
> >> enough, did you folks run into any problems with that?  I had assumed a
> >> patch was likely to materialise so wasn't worrying about it myself.

> > I'm still hoping that Michal will do that patch.

> And what was the resolution/recommendation how to do it?

Split the regmap creation so the managed resource registration could be
done later on with an already allocated regmap instead of requiring it
to be done at creation time.

--nKzfxXxTXZ/rSi7L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS4QosAAoJELSic+t+oim9IRcP/RcjGAsMw6AO4bwnobfriOfK
xb5wIBfEqOzluTw30In/ZnbAeC3K5Ul0nempH/U+RxD7xyVnNlZO+UUINEWN5ItE
JsSGEmn7e0JG//41R1AzgxbsbNGNYfpRpb2xlYhWLS6OatMg8w8kUV2c55r36Siz
evsaTwVLtthtKqAe+dB/67gtMzAZ2ZmzTShifIRankVekdS47bRDIkeYDzM51rKG
vYRub5hVHZpCPAvAQdtJLXRTZYAr1QCLklSt8UI4ljoU6UrsKaUBBhdJ+LdKOLEO
zPSYgtJv+r6uyO6SRIj4qCCYy9mhkYkNzWRjII1Spsajec+aauFTPu8vaB6xo6Sm
RkgkxzbR27lwNH9vXIj6KuFlFfcEX8kgby+RqbIL9vEFOEy8wuOPGYUtSRJskTSq
gdMigTu28aMrfFt+xQkwQiuy8AD7/I/sVo4JtWj4w2bYce5D+hfaSLJZ2oevQgRV
geAVvBbka1B7+zM6yMTrEP4VO+vQHi1nEzy71XnyYyeL8mVcR/RauotNP9j2dcyt
spIn4+xOaCCOPi4MQgMZM12Tmb+R6XUppqzpYJ3D0eMk1bhU+CrBLc4NhJoyMW7p
ESmev1tmVjQL20iICF7PZ7fwOlYZUNzvhbKl6ad18HrFUnQoLTZHlo8fB02Z15MD
2LDhhY+BvIZ6aR8FVUD2
=Xx7b
-----END PGP SIGNATURE-----

--nKzfxXxTXZ/rSi7L--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
