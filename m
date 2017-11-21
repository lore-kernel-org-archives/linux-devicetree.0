From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: pinctrl: mcp23s08: add documentation
 for drive-open-drain
Date: Tue, 21 Nov 2017 13:56:09 +0100
Message-ID: <20171121125608.j77ouhvxqcsebycx@earth>
References: <1511252491-79952-1-git-send-email-preid@electromag.com.au>
 <1511252491-79952-3-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mdkh3gu6zkxw5zrf"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1511252491-79952-3-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--mdkh3gu6zkxw5zrf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 21, 2017 at 04:21:28PM +0800, Phil Reid wrote:
> This flag set the mcp23s08 device irq type to open drain active low.
>=20
> Signed-off-by: Phil Reid <preid@electromag.com.au>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

-- Sebastian

>  Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.t=
xt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
> index 9c451c2..a5a8322 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
> @@ -45,6 +45,8 @@ Optional properties:
>    - first cell is the pin number
>    - second cell is used to specify flags.
>  - interrupt-controller: Marks the device node as a interrupt controller.
> +- drive-open-drain: Sets the ODR flag in the IOCON register. This config=
ures
> +        the IRQ output as open drain active low.
> =20
>  Optional device specific properties:
>  - microchip,irq-mirror: Sets the mirror flag in the IOCON register. Devi=
ces
> --=20
> 1.8.3.1
>=20

--mdkh3gu6zkxw5zrf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAloUImUACgkQ2O7X88g7
+pq8IA/+Lk+zlVZa29Bsf2WbCHIrryS3t8rWYFWSjT6R7xFk9GX6h2KJHQgzaXm/
KpHpC3vs7To3acQuf4GPS6AqeAwY2f+Vn+/s3p80XlNVW59KAlIy0xPSXcS9INEE
uqfrA+51CrJRF6enaK6+3X3WTIkZq01yBDHYzGTABVHyMhT5JdWnq0p0nOXGLjL9
e1e+elYwiZHryiU4g6/nslsYzOFNdz3H/2TjjIZ6Qu3ELNA8C/agVu5sosTcBuNT
boHVTthMaQdOrRVfT6qns14byzreFuctWH4Wjoqbht/IIn+mbNkjQgIOk4Htp9tZ
lYO4DrgPiEmx8bF0453duREuJrLPosch2hYyqIpqNkLZpyYmbgE8HWZKgO8VotCD
ldjXQdmQgRllhCEXhhRzg9dQBReIGhwSNdgis400NNb9pWPgS5SZeaioQXE9lU3k
vLhxhYi4WJhM7jRCK2hy6LH7CxeGY9WfCuasXY/7bAKAIPDFIBr4GrstmtpjeXQL
egwWCP7CtT+OUmWAnl/KoM/UbYTeiP0v1qH4NqsEznKxvpzPlS95Hpj9y7TQd81i
G6Os8V2sH2XB0pyFrxy6rnT+99SXKZmC4ydBgXEK6bjxtE8uPAFet5k5fPb1kSF1
b28o0SJ7CDJGrO+G9x03H0uIwRfcWdzRRjT6HDOtJJ4CzbBq2jo=
=Ml6P
-----END PGP SIGNATURE-----

--mdkh3gu6zkxw5zrf--
