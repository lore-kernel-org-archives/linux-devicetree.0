From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Formal license ambiguity in arch/arm/boot/dts/sun?i-a*.dts
Date: Sun, 3 Aug 2014 15:04:30 +0200
Message-ID: <20140803130430.GY3952@lukather>
References: <20140731192016.GA6869@excalibur.cnev.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o+N5O4bNGxsQWEyZ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140731192016.GA6869-Hlt6eto4P0pdWf7zwHaZWbNAH6kLmebB@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


--o+N5O4bNGxsQWEyZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 31, 2014 at 09:20:16PM +0200, Karsten Merker wrote:
> Hello,
>=20
> I have today read the patch by Hans de Goede to add a dts file
> for the "Banana Pi" development board (see
> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/276339.ht=
ml)
> and have stumbled over the license declaration at the beginning:
>=20
> > +/*
> > + * Copyright 2014 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > + *
> > + * The code contained herein is licensed under the GNU General Public
> > + * License. You may obtain a copy of the GNU General Public License
> > + * Version 2 or later at the following locations:
> > + *
> > + * http://www.opensource.org/licenses/gpl-license.html
> > + * http://www.gnu.org/copyleft/gpl.html
> > + */
>=20
> The phrase "The code contained herein is licensed under the GNU
> General Public License" does not make explicitly clear under
> which version(s) of the GPL the code can be used.  From the
> following "You may obtain a copy of the GNU General Public
> License Version 2 or later at the following locations [...]" one
> can deduce that the intention is most probably to license the
> code unter GPL2+, but from a legal point of view this information
> should be an explicit part of the license statement itself, as
> strictly formally speaking the latter statement does only inform
> the reader where he can find the text of GPL2 and later GPL
> versions, but does not expressly apply them to the code.  This is
> of course a rather formalistic view and may well be seen as
> beancounting, but I have seen too many cases where formal license
> ambiguities have led to problems years later, so I proposed to
> Hans to change the wording in his patch to something more
> explicit, similar to the dts files for other arm platforms.
>=20
> A phrasing like used in the GPL appendix ("This program is
> free software; you can redistribute it and/or modify it under the
> terms of the GNU General Public License as published by the Free
> Software Foundation; either version 2 of the License, or (at your
> option) any later version") would avoid any ambiguity.
>=20
> Hans agreed that the current phrasing is not ideal and should
> probably be changed to something unabiguous but pointed out that a
> similar wording is used in all the other dts files for Allwinner
> SOCs (arch/arm/boot/dts/sun?i-a*.dts) and proposed to refer the
> issue to you as the Allwinner platform maintainer (with the
> linux-arm-kernel and devicetree lists in CC).

Thanks for reporting this.

=46rom a quick grep, the issue is actually broader than just
Allwinner. At least the following platforms seem to do the same:
  - mvebu
  - axm5516
  - bcm
  - berlin
  - ea3250
  - ecx-2000
  - highbank
  - imx / mxs
  - lpc32xx
  - phy3250
  - picoxcell
  - shmobile
  - rockchip
  - socfpga
  - spear
  - ste
  - zynq

Would you mind sending a patch to fix all these?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--o+N5O4bNGxsQWEyZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJT3jNeAAoJEBx+YmzsjxAgepUP/2FR8y+fLQVNDwfKRSFyuXOa
jPVYsZmSlPQxz4mXHwosOaKRvN6iwHbGKLV1CZ5v9GdW8aEv/nKUjpWT9Hr4/p+8
msA7N/wU+DeOm6sckDUmM2VJWu/QrrWJ0Ar+v4qXtGRQB3HnybAuJBMwSVm09Osz
ZHjJQXj2rtsNAst+vI29Zo1R4aPRw8wwJ8mcUF9y1i6a9U8AFd71EJDuf74bW9bN
y/7VG+8lwz8yZ9GSHA/5k1LJFgFKw8J3Tz1PzAjiLbh8/+aYO+/UAuxjWopZeZHU
qnXbwzxBEGo5d9aa1o+uuAS82Q6TRkGHedPlak7JejogYiGb4nqkd/4MZ8MB3PRB
/0mqHlUbH+WerO+bHi1fDj0DlNkXoPryNpSG7X6c/XLegMYtMl8s+KwWyBEajEfD
fJTA7qbW4s0BZjBqOW1ZrrEPFaY8fk3vPLKIJQ//Vq0tA2GUq77N+blH93aZJ/E3
OB0wCOVuaoFZ3aQwik3CZZ7ItsIPaojj/HcHpD27vx05CFufrljvP5xb0wtWTAgq
mSwED/TUrPGIE7X526A2xt5CEidTY6DHKG56847ym8eba12xA4RYX8bzINCGdu2U
E+GwcxDQsFaVH5v8Ysz8xs8X1Ss6M1Cpawc+FMJHe7EUFBCNXKW5W+p2dIPscmup
ttfQNiLyB96r/CpjqRFU
=G0HG
-----END PGP SIGNATURE-----

--o+N5O4bNGxsQWEyZ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
