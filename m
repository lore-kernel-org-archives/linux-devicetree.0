From: Matthew Thode <mthode-sh12bNGkds0dnm+yROfE0A@public.gmane.org>
Subject: exynos4412-odroidx.dts doesn't boot
Date: Wed, 19 Feb 2014 21:01:31 -0600
Message-ID: <5305700B.5060905@mthode.org>
Reply-To: mthode-sh12bNGkds0dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="TwTxJVjHlSqu7pRl2kQGkQ63g36cet91w"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thomas.ag-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Steev Klimaszewski <steev-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TwTxJVjHlSqu7pRl2kQGkQ63g36cet91w
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

doesn't show anything past Starting Linux... even with earlyprintk and
debug_ll enabled (and S3C_UART1)

It also seems to be missing the secure firmware bit (doesn't boot with it=
).

kernel command line was as follows

setenv bootargs "console=3DttySAC1,115200n8 root=3D/dev/mmcblk0p2 rootwai=
t
ro mem=3D1023M verbose earlyprintk=3Dserial,ttySAC1,115200n8"

tar'd up the boot dir for you as well.
http://dev.gentoo.org/~prometheanfire/dist/kernels/odroidx-boot.tar

What is missing from mainline to get this to work and why isn't it in?

--=20
-- Matthew Thode


--TwTxJVjHlSqu7pRl2kQGkQ63g36cet91w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBCgAGBQJTBXA9AAoJECRx6z5ArFrD8HIQALVi3QdFLRov/6FxGgpjdWKJ
nXjG/sYzLMsraZ8SV/nFdd84gei6Pr+PcRWPch9aqfXsIPPhQryvZhJDJveuQhd2
ktOR9Pa2zNliq0C5nMN9FzEZG0f63NVPiV4nQV8byzeH+5/x2iKh0tl4gsHihWP5
yxsNjOX9P/CGIMfb16wdujVmlkhrZWM2IbYpo84AbQCrh6HL9d2SLynwMIibqLMX
KzQiVL/Ib5RFyLwKAKEc05EEuROj3bLZNx7VTVz2r/tc0ZU2UQnqeHpWOUT/QqqO
u7nn/9a1WO6gbnc+htjDH5GJ3UEl9GUdSxMqMTCXMiViVn1meksjmmVtc4XPmU3g
c7+c6H6gM3fgWody9BBNhZNdJ8vm1aDcOud2mhCIixcqr0c+sqGgA0QH7R7cZm6x
7aSUU3+LapMWQwQ+sFo1+plD3Xf5iDG9jbTIOrRnSkxa6xcJ1z2oGwOTxVSfWpGb
gaBWQbgT7+QxVSGsn1M+AoV11YEQnaI6SvQlR3BksUgDDf7GHwNz30mvWCXaLFU1
HCeN1bU/TQSmvKrGdv2DfKoXof4tCck2udkBXaMU8iSafIeLiaeODfXUf4Ttt9kP
UO1FG9aQvxl6u9FkG5STGd/91dMi6eJH4BjwRtP6woHtUHVjMxYdBWWqaQa6JyrQ
cdaRb92sf1yuf7T0Gfsk
=z8ci
-----END PGP SIGNATURE-----

--TwTxJVjHlSqu7pRl2kQGkQ63g36cet91w--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
