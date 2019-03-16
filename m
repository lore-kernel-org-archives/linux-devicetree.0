Return-Path: <SRS0=Mw68=RT=the-dreams.de=wsa@kernel.org>
Date: Sat, 16 Mar 2019 23:26:37 +0100
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v3 2/2] dt-bindings: can: rcar_canfd: add r8a77995 (R-Car
 D3) compatibility strings
Message-ID: <20190316222637.GC1111@kunai>
References: <1543972625-11267-1-git-send-email-uli+renesas@fpond.eu>
 <1543972625-11267-3-git-send-email-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CblX+4bnyfN0pR09"
Content-Disposition: inline
In-Reply-To: <1543972625-11267-3-git-send-email-uli+renesas@fpond.eu>
To: Ulrich Hecht <uli+renesas@fpond.eu>, mkl@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-can@vger.kernel.org, robh@kernel.org, geert+renesas@glider.be, horms+renesas@verge.net.au, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
List-ID: <devicetree@vger.kernel.org>


--CblX+4bnyfN0pR09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 05, 2018 at 09:17:05AM +0800, Ulrich Hecht wrote:
> From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
>=20
> Adds compatible strings for the R-Car CAN FD controller in the D3 SoC.
>=20
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Adding Marc to CC.

> ---
>  Documentation/devicetree/bindings/net/can/rcar_canfd.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/can/rcar_canfd.txt b/D=
ocumentation/devicetree/bindings/net/can/rcar_canfd.txt
> index ac71daa..ae2a2b7 100644
> --- a/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
> +++ b/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
> @@ -8,6 +8,7 @@ Required properties:
>    - "renesas,r8a7796-canfd" for R8A7796 (R-Car M3-W) compatible controll=
er.
>    - "renesas,r8a77970-canfd" for R8A77970 (R-Car V3M) compatible control=
ler.
>    - "renesas,r8a77980-canfd" for R8A77980 (R-Car V3H) compatible control=
ler.
> +  - "renesas,r8a77995-canfd" for R8A77995 (R-Car D3) compatible controll=
er.
> =20
>    When compatible with the generic version, nodes must list the
>    SoC-specific version corresponding to the platform first, followed by =
the
> @@ -26,10 +27,9 @@ The name of the child nodes are "channel0" and "channe=
l1" respectively. Each
>  child node supports the "status" property only, which is used to
>  enable/disable the respective channel.
> =20
> -Required properties for "renesas,r8a7795-canfd" and "renesas,r8a7796-can=
fd"
> -compatible:
> -In R8A7795 and R8A7796 SoCs, canfd clock is a div6 clock and can be used=
 by both
> -CAN and CAN FD controller at the same time. It needs to be scaled to max=
imum
> +Required properties for R8A7795, R8A7796 and R8A77995:
> +In the denoted SoCs, canfd clock is a div6 clock and can be used by both=
 CAN
> +and CAN FD controller at the same time. It needs to be scaled to maximum
>  frequency if any of these controllers use it. This is done using the bel=
ow
>  properties:
> =20
> --=20
> 2.7.4
>=20

--CblX+4bnyfN0pR09
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyNeB0ACgkQFA3kzBSg
KbbetA//Ud45iLvQnZPs2Dm+Nyous6o45L31fGFhN8txgZm/H0jsxUoPQk3KkhZc
H4CKUvZcC/Os70Lo9lwYPNlPbGIOGsARj4a8yhKJGBDZh/TjyavGwRPCt4uQ8wFy
wTI2t7F5VuGa/zzuVVMReur78/m5wIBcKyy0S+FnrKeL2x/P/piJ7ejP+B3ccgHR
D2RyxLN6kM6JAt/IeGGYg5VlO34mUnpRKoyWLpvMBscNq/IrspF3D10L7NtLPt88
7bkk7c8WSB2yXMXXs9wV3UILDZ1sGTAOSWNXIL+GgBOyRT2PIQRvaoYb93itdbFw
TN2yDrWauND3s8cU8yaTwLPsuLoTm3Rb7Zh+4tZfWCTQYnuEsdNkTHmjF9BAgAcs
OACOXZHWyobqNMHUzrG+s5X1jfkGxOMuNl8t07qDqJMMRbdqrOi3NUojb4LkjeYo
DUo51oH2xVJZH/nDdNI/FIae7zWi4j71rvHzunO10mYTd670dczmBGbwH2XQep8x
cEEq1nsCjb0zedZDyh28V1DKPbRu5h6Mk+QcoPBL+CkNtTbhUckTgYzPeQKTgKte
HaOjbPey6usTYeLx35HIfARA81C9nylkUPIUct18+Potp9CgKQzCiF0MCyGlC7OP
Jmkfi5e6f4reTvuMvciGExh81KfuoNJgwuV1ZdFXzAtTuNWZTss=
=U38l
-----END PGP SIGNATURE-----

--CblX+4bnyfN0pR09--
