From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH,RFC] usb: add devicetree helpers for determining dr_mode
 and phy_type
Date: Tue, 29 Jan 2013 16:33:02 +0200
Message-ID: <20130129143302.GF2046@arwen.pp.htv.fi>
References: <1359458548-25071-1-git-send-email-s.hauer@pengutronix.de>
 <5107D253.5030400@ti.com>
 <20130129135336.GA3323@pengutronix.de>
 <5107D84F.80401@ti.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gvF4niNJ+uBMJnEh"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5107D84F.80401-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon <kishon-l0cyMroinI0@public.gmane.org>
Cc: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--gvF4niNJ+uBMJnEh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 29, 2013 at 07:40:23PM +0530, kishon wrote:
> On Tuesday 29 January 2013 07:23 PM, Wolfram Sang wrote:
> >>>+	err =3D of_property_read_string(np, "phy_type", &phy_type);
> >>>+	if (err < 0)
> >>>+		return USBPHY_INTERFACE_MODE_NA;
> >>
> >>Why don't we use a u32 property type for the *phy-type*? IMHO we
> >>should use string property only when the property should be
> >>absolutely unambiguous (e.g., compatible property should be string).
> >
> >If we would use u32-numbers in the compatible entry, this would also be
> >unambiguous, no? 0xd00dfeed would be the at24-driver. Pretty specific.
>=20
> hehe... But we don't have a corresponding *enum* representing the
> drivers :-)
> >
> >I don't mind having readable devicetrees. And we have it for ethernet
> >phys already with strings, so it would be consistent.
>=20
> Ok. Fine with it then :-)

I prefer u32 here, because we have the matching enum. Otherwise we end
up with:

of_property_read_string(...,&type);

if (!strcmp(type, "ulpi"))
	foo();
else if (!strcmp(type, "utmi"))
	bar();
else if (!strcmp(type, "pipe3"))
	baz();
else
	BUG();

and I don't like that, it's ugly and error prone. Also looks awful when
someone needs to change that, the diff looks messy. A u32 followed by a
switch statement looks nicer.

--=20
balbi

--gvF4niNJ+uBMJnEh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRB92eAAoJEIaOsuA1yqREapYP/A+mFVVik+SklC26N5ds2ChZ
YERuNKQDZQqsh3RHd+74Dx+jsjeaNToANIjQ+uVPR71xNHrBLRcun700HPZIs1D1
eMS5ijkrikj8P34jKIXHCu2Jxwb+Etz37eKw0s7feMXe8WgEMXjgvkOm/T7vufaq
fwxc8PDJaXf+vPqm5hLSUaNAjYofhptDbFK9svusvekjy+eotF8o3TosLwutusuP
lojVR4TNUduWS1qg3mIzytL+JdxHtwqw2leEFW+LiSkJHtXWMtFGDwtgX7giLDIO
GvPjdfkwB7A1iUXbZ/LtDYQoJ9+gEZ5J8s2P9h2lz3L1p29nHKlOTJLy1CUg9MkO
hs/ZqgaZtzySA9qjTjIFUNQPbgyAbIAwJy+geBRQB3Q9fXyI12BWhZvdZQzvcJU5
/2zv3PWCDaxTgi98oNu+ONv5X9GUKf1MJyoQFyH3Ypi2+TZL/7CbpaKyHbtHlnP/
7bb6UTIcd971MFd6zISnZHODST8G1taI+o0sbkz871xQORwLu6s6+2+oWGAC/osR
NwBHTNszpYsY5mx/eFItoD987plB32KEqizFqQLJewxkc3To9HsmXiyG/EIfTgRy
qihQklKb8IceLBM88ZH6m92mV4hKIDlT5Mz+Zy9V6GxM5OzIhb+aKcIsiL1pQy2B
wlqlF9hs6YAFrMi4qce2
=/06o
-----END PGP SIGNATURE-----

--gvF4niNJ+uBMJnEh--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
