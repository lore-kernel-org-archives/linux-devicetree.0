Return-Path: <SRS0=riAk=N5=the-dreams.de=wsa@kernel.org>
Date: Mon, 19 Nov 2018 00:14:28 +0100
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] dt-bindings: can: rcar_can: document r8a77990 support
Message-ID: <20181118231428.GD2553@kunai>
References: <20181118173056.4591-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZARJHfwaSJQLOEUz"
Content-Disposition: inline
In-Reply-To: <20181118173056.4591-1-marek.vasut+renesas@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--ZARJHfwaSJQLOEUz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 18, 2018 at 06:30:56PM +0100, Marek Vasut wrote:
> Document the support for rcar_can on R8A77990 SoC devices.
> Add R8A77990 to the list of SoCs which require the "assigned-clocks"
> and "assigned-clock-rates" properties.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Eugeniu Rosca <erosca@de.adit-jv.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/net/can/rcar_can.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/can/rcar_can.txt b/Doc=
umentation/devicetree/bindings/net/can/rcar_can.txt
> index 9936b9ee67c3..d962138d5b50 100644
> --- a/Documentation/devicetree/bindings/net/can/rcar_can.txt
> +++ b/Documentation/devicetree/bindings/net/can/rcar_can.txt
> @@ -16,6 +16,7 @@ Required properties:
>  	      "renesas,can-r8a7795" if CAN controller is a part of R8A7795 SoC.
>  	      "renesas,can-r8a7796" if CAN controller is a part of R8A7796 SoC.
>  	      "renesas,can-r8a77965" if CAN controller is a part of R8A77965 So=
C.

I was wondering why you didn't have a patch adding support for R8A77965.
I see it is already added here but can't find a tree where this line
exists (no linus/master or renesas-drivers/master). Did you maybe forgot
to send out a patch?

> +	      "renesas,can-r8a77990" if CAN controller is a part of R8A77990 So=
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
> +Required properties for R8A7795, R8A7796, R8A77965 and R8A77990:
>  For the denoted SoCs, "clkp2" can be CANFD clock. This is a div6 clock a=
nd can
>  be used by both CAN and CAN FD controller at the same time. It needs to =
be
>  scaled to maximum frequency if any of these controllers use it. This is =
done
> --=20
> 2.18.0
>=20

--ZARJHfwaSJQLOEUz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvx8lQACgkQFA3kzBSg
KbZzIRAAsSNvpXWMKAh5LMpJ/6QRjS0vfr/2wtNTsgTVxL/rcrjS9yaDLUE1vtp5
zeHZWQgPO1uOUC8DbJgi+T5+p34t30qgpYbDmiogSFG4n2eHF8lxftLElw0ziS9o
YDZ38mjbv9pZQ0kCs/BT+M0u8UlR3A2verKfJPI8ioqrAl0RWfrAaIKzExFQVvJM
EBElMXDw6hrpfPbIW6hQi+EnXHhDwILk5Clhi2b8Kce1FPo/nWHn574UUvRwEO9h
8RTKQR9hUgdWRVs9Z1e2goCuiwQNW61BqMHLVngKzTkUvjHHhfOWLTTM+MsdMs3v
p7z4LpBsUQaMNid0FrBEKp1YzOpxTeZ2yYId8bOUSkYM57f2Gpm55zUmx6weA1Rk
4xyF4ckhpOQ3/afWk2NsflVSsWGi7WR/zM44eiOg8ACWP4vledjS43cBi1xj+hx+
zL2+LUJPeMJsK9n1MxY7XR/+rfDNk08dPxxftk9VCSdkfHRJLSmkBZoAH5/P16uG
D7HKoJMHpe8usQcWjPcmDG/oF2r2wcZlBLVYd3fnAfKt6hohfrbva0j+Al2WIADf
fzn1rmWjM/4dvGzJGVdhiyAWKVtWBANKXtWmTQH3N/Yxh/rundNw/VWmZeETaWDQ
jbAmG4Vf/syPQGTt+a3McgVUs7qzhBy3AhcLxIAcFCC9apE36b8=
=/qPg
-----END PGP SIGNATURE-----

--ZARJHfwaSJQLOEUz--
