From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 08/10] ARM: mvebu: add core support for Armada 39x
Date: Fri, 6 Feb 2015 21:31:37 +0100
Message-ID: <20150206203137.GH2079@lukather>
References: <1423238276-9206-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1423238276-9206-9-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BXr400anF0jyguTS"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1423238276-9206-9-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--BXr400anF0jyguTS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Fri, Feb 06, 2015 at 04:57:54PM +0100, Thomas Petazzoni wrote:
> This commit adds the core support for Armada 39x, which is quite
> simple:
>=20
>  - a new Kconfig option which selects the appropriate clock and
>    pinctrl drivers as well as other common features (GIC, L2 cache,
>    SMP, etc.)
>=20
>  - a new DT_MACHINE_START which references the top-level compatible
>    strings supported for the Marvell Armada 39x.
>=20
>  - a new SMP enable-method. The mechanism to enable CPUs for Armada
>    39x appears to be the same as Armada 38x. However, we do want to

                                                              ^ not?

>    use marvell,armada-380-smp in the Device Tree, in the case of the
>    discovery of a subtle difference in the future, which would require
>    changing the Device Tree. And the enable-method isn't a compatible
>    string: you can't specify several values and expect a fallback on
>    the second string if the first one isn't supported. Therefore, we
>    simply declare the SMP enable method "marvell,armada-390-smp" as
>    doing the same thing as the "marvell,armada-380-smp" one.
>=20

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--BXr400anF0jyguTS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU1SSpAAoJEBx+YmzsjxAggyIQAMI92aUAgZ4/yZfqXAzUAbCE
Y/fzYAGHpdw3v5kMLtEfglPiZdQxwHDRmj1ToIJryU2UcQQ19L0FaP3ciKZeznHo
kJ0DNDfQMHoDAos3zcxCY+SQ0wwyuwPWpEXPFPe5/zXTIvtUaU5Pbx+d5fdbOwiW
vwghYLW22S1NKkZiMz+sm58gfOjlN6ae+bXrGIRuMXSZY9Dw1pKjVw1Bgex9X4MM
tyV2pS/vrgvOPm4ReHeb67S89cjUkoyAVZ2T8RVtKbR8wjVy2wnwLr3n4JvynrcX
6Wq6NzpkgktVecD7R5Zt98qgO2nYA4KLx0FRDOhB46VXpn9dA8NV/iqApDZ7uHVI
4z6zoH1rrlMOJfpQzLRyFVO33pjx5BZnQzHc15EAc7OjxUMOMhPCq125uBUWF2jm
940DBUFP3h0ylQXlgYrXGgpvLpg3udqqYhLSriPIBUq1JlmDrRJ85XfZ5wiRlY2u
/Y31ghadKjCr6PbQAYAtUWZT5TEPpjVkrxFWQzaJ9+i78Axxdg3r7Kj/QJRibW93
xTB4uYQsufIZv+Mba2fqZM3vweYi5HdGoI6iNh/QBQvRTMSZKbr0KUPPnviJsZxs
H+zQ+XHJ2chruG040D7W9Q6R3mzSlO1KR09j3XSV90u9UjdCzr41crvI6RNP8AKw
g33JKthxMnrT3nwF7oqW
=fQg7
-----END PGP SIGNATURE-----

--BXr400anF0jyguTS--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
