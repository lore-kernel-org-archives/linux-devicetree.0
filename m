From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something
 better?
Date: Mon, 18 Nov 2013 16:29:21 +0100
Message-ID: <20131118152920.GL26046@ulmo.nvidia.com>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131118122644.GA26046@ulmo.nvidia.com>
 <20131118134022.26EE7C409EC@trevor.secretlab.ca>
 <20131118135727.GD14306@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f54savKjS/tSNRaU"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131118135727.GD14306-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--f54savKjS/tSNRaU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2013 at 01:57:27PM +0000, Mark Brown wrote:
> On Mon, Nov 18, 2013 at 01:40:22PM +0000, Grant Likely wrote:
>=20
> > Some hardware does that. That's what OHCI, EHCI, UHCI, XHCI, SDHCI, and
> > similar are all about. It always helps when well understood hardware
> > follows a register interface. It doesn't work for everything, but I
> > agree it would be good to have preferred hw interfaces for SPI & I2C.
>=20
> You'd need something class based like USB, there's such massive
> variation in what the hardware is trying to do and the tradeoffs.  A big
> issue is that especially with I2C many of the devices are primarily
> analogue devices implemnted in larger processes where the cost of adding
> additional digital logic can have a noticeable effect on the area and
> hence cost of the silicon.

My comments were mostly regarding the interface controllers. Those which
generate the same bus transactions but need different drivers on every
SoC. I suspect that the same costs don't apply (or at least not to the
same extent) to SoCs.

Thierry

--f54savKjS/tSNRaU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSijJQAAoJEN0jrNd/PrOh28EP/joNivci+QGrcJqXlT1SkBaQ
Ah1GSk98FjQM+jH/N6iVXzV3ybYdAyUp3mWh2SzrXa5GLah1/VhPz4kvBR4cWb6v
hIMwrqGt+LT+xS19U/fpN7YgXvVKgU4CUE+gLeEx8/p3SPJ+KN0svjV2B4Gs/x9c
olLaS4Zo11Uv5rT2UWcrCe5OyMpq8PR4NBQswFQxssOUeSLCwX8c4gSbh2areJVS
5AImgCyyH06jxk3cAuS1IOnAwflZoZSjOu7XzzFFeL403SBbgvPcf9R4bM4Kz7Vi
Yy79r4+w6MwRZjKke85Zf1tF2OY5NsqSYDi+4SpMRsF3cfmZI5r1yLahdacfQp84
CdTN1UsnnhRocXUDth2CJ9naqatfUf20H7OIWshUFt2gMr8pEXegu1axFDMDPm2i
O8L87lzrZwgmD3bpYRQZanW42V/XqMVdPg9Y55D9scSmLYa7Gf8WX/u6O1e7/A6i
WLKTDmbkFNnnhhqj63a0fPMLT2yx4frIkW50YS8lTiCtgUcKvroVTZyrCv+kwqnW
HL+jo9GeFY8+7qCKOytRx6Y1gMov8wmRDUDgwkmYPPn6TFBENijxN+SKLzJYycB0
2NyOG3Fx87kLno3vpgIx/5CDhSiyCfYPGCNCJjiSQMM4W40/LPlv+NhqXxxR9Srr
QSsC7a8201AeitN89sQe
=f/e6
-----END PGP SIGNATURE-----

--f54savKjS/tSNRaU--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
