Return-Path: <SRS0=rHzN=Q3=the-dreams.de=wsa@kernel.org>
Date: Wed, 20 Feb 2019 20:52:49 +0100
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v3 1/2] dt: snps,designware-i2c: Add clock bindings
 documentation
Message-ID: <20190220195249.GA2523@kunai>
References: <1550677803-29716-1-git-send-email-gareth.williams.jx@renesas.com>
 <1550677803-29716-2-git-send-email-gareth.williams.jx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline
In-Reply-To: <1550677803-29716-2-git-send-email-gareth.williams.jx@renesas.com>
To: Gareth Williams <gareth.williams.jx@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Phil Edworthy <phil.edworthy@renesas.com>, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 20, 2019 at 03:50:02PM +0000, Gareth Williams wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
>=20
> The driver requires an undocumented clock property, so detail it.
> Add documentation for a separate, optional, bus clock.
>=20
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Looks good to me:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Let's see what the designware maintainers have to say.

>=20
> v3:
>  - Changed clocks and clock-names sections to use term "peripheral clock"
>    (pclk) instead of "bus clock" (busclk).
> v2:
>  - No changes.
> v1:
>  - Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-designware.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-designware.txt b/D=
ocumentation/devicetree/bindings/i2c/i2c-designware.txt
> index 3e4bcc2..f94aa59 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-designware.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-designware.txt
> @@ -6,12 +6,21 @@ Required properties :
>                  or "mscc,ocelot-i2c" with "snps,designware-i2c" for fall=
back
>   - reg : Offset and length of the register set for the device
>   - interrupts : <IRQ> where IRQ is the interrupt number.
> + - clocks : phandles for the clocks, see the description of clock-names =
below.
> +   The phandle for the "ic_clk" clock is required. The phandle for the "=
pclk"
> +   clock is optional. If a single clock is specified but no clock-name, =
it is
> +   the "ic_clk" clock. If both clocks are listed, the "ic_clk" must be f=
irst.
> =20
>  Recommended properties :
> =20
>   - clock-frequency : desired I2C bus clock frequency in Hz.
> =20
>  Optional properties :
> +
> + - clock-names : Contains the names of the clocks:
> +    "ic_clk", for the core clock used to generate the external I2C clock.
> +    "pclk", the peripheral clock, required for register accesses.
> +
>   - reg : for "mscc,ocelot-i2c", a second register set to configure the S=
DA hold
>     time, named ICPU_CFG:TWI_DELAY in the datasheet.
> =20
> --=20
> 2.7.4
>=20

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxtsAwACgkQFA3kzBSg
KbbLdA/+IJumuoJcK+yvECoRVPUftlwpO4ehEYPPbjRp9scRSB7mUl4PWLubHqkw
0f6oJh8JCqOWSEVIVFj7i1Fn8EcebN7HG/61CbBMYc5gDdB/XIIgM3kvPHIa88Pj
nd4GbuSY/f/JFJhk7eHwaLmQTGOlFG3OO7XCsVF23QKifr+S4DM+GRK3RudOZt1G
8212ua5UgcIQ2KrGIe6XptFxpQzihwBbRjMiQDiVr/Hlh7D8p74redj1WzGO+eN/
6f2ULtEdbFWtnadLVN0tSCzlSQ0vNZa+CZ2ob3VKDwmG4MF7HN9vs2S4zJVulHbc
QoUXfPGHgDffeYvGp7iu9PANiBnGm9WNkaAAcfk4Lgt8/Zk+V0J34qKpGt0XBruU
nkLd0fHje4NW5l3nYuXMz1ItgYCiLFuu7mUqdNnxb3BpReJ4ZdNO/COXtBk8IfrA
CTbzLgPaIxp6GH+gpLlwpmYtb3tWRaqzBSFa7mGTGpHpbvvBZ3UdNv0bZ09Ycxfv
mLIp+X2yM5apWAosSfsXC9eVDG2fz4xcezCx7sD0dsODG8dAneKOuQkAEmyPbq/R
dCOCzmCL/sQRRXRf19SlnnaIqJ1iH/KNiPCI2YqV+lDRj0/N/ZSDKrdgc9bjYIW8
Fhl0e8cxm3c8d27NKTk5F7gHUrvHAwHDDNYmDrVCYqvTazB1iw4=
=algl
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--
