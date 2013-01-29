From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH,RFC] usb: add devicetree helpers for determining
 dr_mode and phy_type
Date: Tue, 29 Jan 2013 15:55:00 +0100
Message-ID: <20130129145500.GB3323@pengutronix.de>
References: <1359458548-25071-1-git-send-email-s.hauer@pengutronix.de>
 <5107D253.5030400@ti.com>
 <20130129135336.GA3323@pengutronix.de>
 <5107D84F.80401@ti.com>
 <20130129143302.GF2046@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130129143302.GF2046-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: kishon <kishon-l0cyMroinI0@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I prefer u32 here, because we have the matching enum. Otherwise we end
> up with:
>=20
> of_property_read_string(...,&type);
>=20
> if (!strcmp(type, "ulpi"))
> 	foo();
> else if (!strcmp(type, "utmi"))
> 	bar();
> else if (!strcmp(type, "pipe3"))
> 	baz();
> else
> 	BUG();
>=20
> and I don't like that, it's ugly and error prone.

Error prone? I guess my mileage varies. Especially compared to the
probability devicetree creators pick the wrong number.

It also removes the (probably implicit) rule that the enum mustn't be
modified since it is exported to users.

Also, you could map the strings to the enum first and then switch-case
over it to make the code nicer.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlEH4sQACgkQD27XaX1/VRt4AQCgl4jbHrXb+ToUI9KfgyP3LsUe
qKQAoKpjFgIgsEuV4UdYC0dXE1d1PDhO
=HVND
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
