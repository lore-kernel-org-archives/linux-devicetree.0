From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3] arm64: allwinner: a64: Add initial Orangepi
 Win/WinPlus support
Date: Tue, 13 Jun 2017 09:20:14 +0200
Message-ID: <20170613072014.kq3znsh77mncsfyb@flea.lan>
References: <1497261194-28815-1-git-send-email-jteki@openedev.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="j5r2wj6oaskptvtg"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1497261194-28815-1-git-send-email-jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: zhaoyifan <zhao_steven-Y9sIeH5OGRo@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--j5r2wj6oaskptvtg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2017 at 03:23:13PM +0530, Jagan Teki wrote:
> From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>=20
> Orangepi Win/WinPlus is an open-source single-board computer
> using the Allwinner A64 SOC.
>=20
> A64 Orangepi Win/WinPlus has
> - A64 Quad-core Cortex-A53 64bit
> - 1GB(Win)/2GB(Win Plus) DDR3 SDRAM
> - Debug TTL UART
> - Four USB 2.0
> - HDMI
> - LCD
> - Audio and MIC
> - Wifi + BT
> - IR receiver
> - 5V DC power supply
>=20
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>

You had whitespaces errors in your patch.

I've fixed it, and applied.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--j5r2wj6oaskptvtg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZP5IuAAoJEBx+YmzsjxAgvdUP/0g/2WbHC6ExHmc2i7QYpvdc
1Wc1mL4g2+1ZbxaagcpNqfiqdQeC2BpfSTQm3GzqTGNVP4YCtloXW+5WE8JorJM/
aRdSBSU5xSlPQZ3T56VcwiY5G3tv40t0ne1pIIfTiqr1C1FOjH/F/CF6R4kvWgQ7
ut3/jIbQmFz7povcVthqrjbKK/jxQfOnlVj/o46j7mUkT+OeBbMzb0R8Ux8RXieJ
dT6F2E7fSwrHuQERQoUNp0q3r9utbv/pvNvXa8FdQIJqa5SbRX2ca7EK6oh35wuc
L3SEzY0Y7ajXqeVrjq3/mJChLcjvvqY2nIqwvaig04mmiTXcvahMOfDHM8ApQVu0
arWSG8ltLQ6JK1j0vyQM61GDMmXhOGAFdazFM43FFjFZmFIMXdV1dFDUoe5beNmz
ndKk4FtSH/5st0w2ZIE2Ce9oPwd59dT1IJDuUjL8tqoVjBAXCBhVF9u/qp8ynVqp
UEJqK6glqT49AcB6gfK2E73ZHykLdsQIFhrZQXkw+VXf3y0N2XGOB8duWn1EXBa2
nscBefPXubU4trCO1Z1Ef3rDYVzRwhzP7NSsU+Bf4YEzK3n4j5r+3KIcjmFvTZLg
kOby+GsKlU0l4LzNW269oLFkAu6lc6WqPJKjjtBMQ0VentRsBEjJXXpLm0sRQe8m
Qso2BFgwMABXKwq7zFGq
=15F+
-----END PGP SIGNATURE-----

--j5r2wj6oaskptvtg--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
