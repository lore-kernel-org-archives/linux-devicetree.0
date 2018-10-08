From: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH] dt-bindings: misc: bk4: Add device tree binding for
 Liebherr's BK4 SPI bus
Date: Mon, 8 Oct 2018 14:30:43 +0200
Message-ID: <20181008143043.07cf1e56@jawa>
References: <20180927222655.24482-1-lukma@denx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/eZHbOnwSVPpyTV8dcXOw_/x"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180927222655.24482-1-lukma@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--Sig_/eZHbOnwSVPpyTV8dcXOw_/x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear All,

> Add Device Tree binding document for Liebherr's BK4 external SPI bus.
>=20

Gentle ping...

> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
>  Documentation/devicetree/bindings/misc/lwn-bk4.txt | 26
> ++++++++++++++++++++++ 1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/lwn-bk4.txt
>=20
> diff --git a/Documentation/devicetree/bindings/misc/lwn-bk4.txt
> b/Documentation/devicetree/bindings/misc/lwn-bk4.txt new file mode
> 100644 index 000000000000..d6a8c188c087
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/lwn-bk4.txt
> @@ -0,0 +1,26 @@
> +* Liebherr's BK4 controller external SPI
> +
> +A device which handles data acquisition from compatible industrial
> +peripherals.
> +The SPI is used for data and management purposes in both master and
> +slave modes.
> +
> +Required properties:
> +
> +- compatible : Should be "lwn,bk4"
> +
> +Required SPI properties:
> +
> +- reg : Should be address of the device chip select within
> +  the controller.
> +
> +- spi-max-frequency : Maximum SPI clocking speed of device in Hz,
> should be
> +  30MHz at most for the Liebherr's BK4 external bus.
> +
> +Example:
> +
> +spidev0: spi@0 {
> +	compatible =3D "lwn,bk4";
> +	spi-max-frequency =3D <30000000>;
> +	reg =3D <0>;
> +};




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de

--Sig_/eZHbOnwSVPpyTV8dcXOw_/x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlu7TfMACgkQAR8vZIA0
zr0YHQgApyUSUb/7k1+H3dA98OpAvPyaYaIV3WB4NNWkfS0JrPA9s8/m9qc4w4dc
YRGr1n0dzQEcZZ8aSo/e1iH6/x8qzdfuXulQXvbkOnKlJ4SfALO/0VnMxKb5bMTw
EhHHdijsyJn811KALDi+TBvgPbeBBN9DhGV9TiP+fZBdj1nfMB+qyCrBKl9hN3iB
RjIsH5ROczFfh3n6VUiLNznelsPJ+tgh7l/nkfjNHD7Fja6wwSjnnfL50uS5SPT5
GL1PrewyEZ+l2l3dJS12dMzOCxoMky1o1aJ795dIyzYYTwQq0DoNHPJKkE1TaXaF
PTHUaxzfIjfbjaHWTd2xcfY9stHfPQ==
=u8RR
-----END PGP SIGNATURE-----

--Sig_/eZHbOnwSVPpyTV8dcXOw_/x--
