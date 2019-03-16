Return-Path: <SRS0=Mw68=RT=the-dreams.de=wsa@kernel.org>
Date: Sat, 16 Mar 2019 23:25:47 +0100
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v3 1/2] dt-bindings: can: rcar_can: add r8a77995 (R-Car
 D3) compatibility strings
Message-ID: <20190316222547.GB1111@kunai>
References: <1543972625-11267-1-git-send-email-uli+renesas@fpond.eu>
 <1543972625-11267-2-git-send-email-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Content-Disposition: inline
In-Reply-To: <1543972625-11267-2-git-send-email-uli+renesas@fpond.eu>
To: Ulrich Hecht <uli+renesas@fpond.eu>, mkl@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-can@vger.kernel.org, robh@kernel.org, geert+renesas@glider.be, horms+renesas@verge.net.au, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
List-ID: <devicetree@vger.kernel.org>


--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 05, 2018 at 09:17:04AM +0800, Ulrich Hecht wrote:
> From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
>=20
> Adds compatible strings for the R-Car CAN controller in the D3 SoC.
>=20
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Adding Marc to CC.

> ---
>  Documentation/devicetree/bindings/net/can/rcar_can.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/can/rcar_can.txt b/Doc=
umentation/devicetree/bindings/net/can/rcar_can.txt
> index 9936b9e..a72ced1 100644
> --- a/Documentation/devicetree/bindings/net/can/rcar_can.txt
> +++ b/Documentation/devicetree/bindings/net/can/rcar_can.txt
> @@ -16,6 +16,7 @@ Required properties:
>  	      "renesas,can-r8a7795" if CAN controller is a part of R8A7795 SoC.
>  	      "renesas,can-r8a7796" if CAN controller is a part of R8A7796 SoC.
>  	      "renesas,can-r8a77965" if CAN controller is a part of R8A77965 So=
C.
> +	      "renesas,can-r8a77995" if CAN controller is a part of R8A77995 So=
C.
>  	      "renesas,rcar-gen1-can" for a generic R-Car Gen1 compatible devic=
e.
>  	      "renesas,rcar-gen2-can" for a generic R-Car Gen2 or RZ/G1
>  	      compatible device.
> @@ -37,7 +38,7 @@ Required properties:
>  - pinctrl-0: pin control group to be used for this controller.
>  - pinctrl-names: must be "default".
> =20
> -Required properties for R8A7795, R8A7796 and R8A77965:
> +Required properties for R8A7795, R8A7796, R8A77965 and R8A77995:
>  For the denoted SoCs, "clkp2" can be CANFD clock. This is a div6 clock a=
nd can
>  be used by both CAN and CAN FD controller at the same time. It needs to =
be
>  scaled to maximum frequency if any of these controllers use it. This is =
done
> --=20
> 2.7.4
>=20

--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyNd+sACgkQFA3kzBSg
KbYq7xAAhWcRpqq+YOjLD8iBZJCfOhgeMMRh4pq5cNB9srTFgF8MJNv01YDpPvEI
r1oNtMDlfNraIAlObb3Ssa39susvB2gbvhoyQq/RVfUZfJSZ0YWnWVljhH0Qa3wc
a1S+dEKsd2xASnSWMaxe5HO/0C7cHc2fQleQ5V6wi1h/0zZrJNlheJH+CGMDRzHA
kdvKpLEkFqrKxG4OKdgIUVXiAK2OcrwxEs99JG3HFQplFPPkS9y5KA3i+dLCnmBP
OYfWfOW/YfSSw0V7tTWi9L+jS11wGBQ8AakS2i0r5fjJFatSQ4p5wa+EZi4jR8de
nKcY50m8xkxS6C16eXYl4NEvxGJ2b76HTCDMw6/nJfG5fKHjGmJ5eNbixBFqwIOH
3SXz+1E5bqI9Ft1hfIOxuwS7pvXP0J19GqniJieU9zT0LnS2lZOyWTB0Msz8/y4b
TZMADXYsqVsiDsFaAhNKM5A4s4aneP/HG1LQxaYWnnaPXozcMX9WHkUcFyobPKun
P9Fqquy+t5skBH1gAsnGRdM7mewh4jGVWay1UqQYESFxqO/tITqRyVFLE4hN+kbf
JXU6f14VqLkhh6ZDDyp2PPLsSchv1j7zS8bMkp8XmD9nIbazLSCcZ77iiQ3uICM6
vOIFFiwiW1/qVS4uxVHknLFWFzTZc+UiBgBOaSFAb3HRkLY/mcE=
=fa9F
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--
