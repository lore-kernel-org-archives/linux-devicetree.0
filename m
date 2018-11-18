Return-Path: <SRS0=riAk=N5=the-dreams.de=wsa@kernel.org>
Date: Mon, 19 Nov 2018 00:18:07 +0100
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/2] dt-bindings: can: rcar_canfd: document r8a77965
 support
Message-ID: <20181118231807.GE2553@kunai>
References: <20181118173201.4645-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="orO6xySwJI16pVnm"
Content-Disposition: inline
In-Reply-To: <20181118173201.4645-1-marek.vasut+renesas@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--orO6xySwJI16pVnm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +  - "renesas,r8a77965-canfd" for R8A77965 (R-Car M3-N) compatible controller.

Eeeks, the 'canfd' is a suffix here not a prefix :( Not your issue,
of course. But Simon, shall we fix that for all CANFD?

> -Required properties for "renesas,r8a7795-canfd" and "renesas,r8a7796-canfd"
> -compatible:
> -In R8A7795 and R8A7796 SoCs, canfd clock is a div6 clock and can be used by both
> -CAN and CAN FD controller at the same time. It needs to be scaled to maximum
> -frequency if any of these controllers use it. This is done using the below
> -properties:
> +Required properties for "renesas,r8a7795-canfd", "renesas,r8a7796-canfd" and
> +"renesas,r8a77965-canfd" compatible:
> +In R8A7795, R8A7796 and R8A77965 SoCs, canfd clock is a div6 clock and can
> +be used by both CAN and CAN FD controller at the same time. It needs to be
> +scaled to maximum frequency if any of these controllers use it. This is done
> +using the below properties:

I think updating this paragraph does not scale. Maybe we should reformat
it the way as for plain CAN, so only in the header the new SoC gets
added? We can fix this incrementally, though, doesn't need to be
addressed within this patch.


--orO6xySwJI16pVnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvx8y8ACgkQFA3kzBSg
Kbb1Tg/7B/6bpk3HkwWfJBO8TbnDy+sXR9TBs43rTQX3sIQM0yREDHH1eXOo3+Fn
X7NjwH3ahvistAVAEeqQf4KlWrmXoO0QHuKYYEY7v4b3WXen0zkMQ8HzN1M5AR9E
drIYDHfj9GQVfe7Sin3PbMmlO+v+3wkpJY3f5gwk8S2fh9FzL+7A/ISVGROnQtk8
C3LPy7FFw/FnMVdcHCy+t0W5lIV24kM4W7ArGX8ZWyCA1/NekQhxM8BwooiTsouh
SuScDjilfiXvMcGw1oCVCzY9ROil/E/Gt/tMgFW3mCpie0qm27QKSJc/5jD/tNT3
rxbNVVU5MgR1H5PoyZJa7S7QuOWucbjmDzRsIje3tLtLj70ftkEdPQB2FldwGloJ
Df9Kyksd3dILtiOEiOIXNAqm+D3KIxYobtwEjHtyMKjCJl4dGYtPUSgs0uJj67Bq
RBggru+qNPUiDfjn09bRcUEToI1W0jSm474GTdWxwFiDinmL4lX0zdz0GneSEFNH
iDVtk+7Rk5qlqvRteqnV65fWpInlU/HnoN0c4Y9ndM25SKg4Wd02WrARh4GNxDyL
hkIkC4znVfm1fL/Tss6TQCnuIxzQ7WDnd8BuLICrds1zf6LbQq1E221ZHkPE1kKg
p+2mUTF1+ef4GlpcC0A38lSZZD3Ygb/iXkiuFkkSMg3qxXuDIwc=
=dcFE
-----END PGP SIGNATURE-----

--orO6xySwJI16pVnm--
