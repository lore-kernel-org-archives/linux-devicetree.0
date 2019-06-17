Return-Path: <SRS0=PUqE=UQ=the-dreams.de=wsa@kernel.org>
Date: Mon, 17 Jun 2019 12:11:13 +0200
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/2 v4] dt-bindings: i2c: i2c-mt7621: Add bindings for
 MediaTek MT7621/28/88 I2C
Message-ID: <20190617101113.GE3502@kunai>
References: <20190617083117.1690-1-sr@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CGDBiGfvSTbxKZlW"
Content-Disposition: inline
In-Reply-To: <20190617083117.1690-1-sr@denx.de>
To: Stefan Roese <sr@denx.de>
Cc: linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--CGDBiGfvSTbxKZlW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 10:31:16AM +0200, Stefan Roese wrote:
> Add bindings for the I2C controller that can be found in the MediaTek
> MT7621/7628/7688 SoCs.
>=20
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>

CCing the DT mailing list.

> ---
> v4:
> - No change
>=20
> v3:
> - New patch
>=20
>  .../devicetree/bindings/i2c/i2c-mt7621.txt    | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt7621.txt
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt7621.txt b/Docum=
entation/devicetree/bindings/i2c/i2c-mt7621.txt
> new file mode 100644
> index 000000000000..bc36f0eb94cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt7621.txt
> @@ -0,0 +1,25 @@
> +MediaTek MT7621/MT7628 I2C master controller
> +
> +Required properties:
> +
> +- compatible: Should be one of the following:
> +  - "mediatek,mt7621-i2c": for MT7621/MT7628/MT7688 platforms
> +- #address-cells: should be 1.
> +- #size-cells: should be 0.
> +- reg: Address and length of the register set for the device
> +- resets: phandle to the reset controller asserting this device in
> +          reset
> +  See ../reset/reset.txt for details.
> +
> +Optional properties :
> +
> +Example:
> +
> +i2c: i2c@900 {
> +	compatible =3D "mediatek,mt7621-i2c";
> +	reg =3D <0x900 0x100>;
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	resets =3D <&rstctrl 16>;
> +	reset-names =3D "i2c";
> +};
> --=20
> 2.22.0
>=20

--CGDBiGfvSTbxKZlW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0HZ0AACgkQFA3kzBSg
KbaDww//acLBksHIUwrMGAgzn21geWRQD/wlHJaHLwChUscVu61DKax4AdpMDcAi
+L368hOOO5NFF9GkveFrD/tkh7DJBMaF71KhRApCxVHNMcC/q5peVLyWd+sJ3Dmn
X1Ki8pv3LDishTmlacr1jI9QTzdecuaudu3B6uD2wtEditG/CdxjDhnvMJ9Ewbhs
08cbMmv5eNEzOCBa6ZphPqepkx6RPMlWgVj8H5m2OGxlygIQoC1/92lVMGG34YL4
H9g7t5MkMIJH3DIYtM501bbZtDV6woTI1EVd6gfLJgr8I0wZeWBBfViJanWzIvOb
jz3HlDForT8W1NS8CsSX0UY7kT+RTS66gnQfZrOMHfYy6reUuJtJ5t7zFU9Lx7KG
oCQP4cMSN/3jxqzHlGht8C+71Gn5BvjDUuRBdL68g4wHJKhnDc1fMGaj6KOerC0j
911rxNoblwOruiHYBqVlojWU2XY+JhsiJ0OCUN5V8pqIr5yX2q6q8U/jStJ+T1nG
HRftQM/awc+oolhfUeN5nyiXoshj6n4rDLXZDuPLOSKE7CJPG/nvg0Oh+l4bMOt3
qm3nM/B9llp3JrwVJ3I8Y2AskvW8QDzYY10CVvuP9WRVKiPCy3DKmrOHJiSjG11P
1kL86p8063/RXDU8TBrUz43/UVj0Fn4C2Hwo/M8qA6Ek4QJ5mCg=
=FMtm
-----END PGP SIGNATURE-----

--CGDBiGfvSTbxKZlW--
