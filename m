Return-Path: <SRS0=BMvq=F5=ucw.cz=pavel@kernel.org>
Date: Wed, 7 Mar 2018 22:58:36 +0100
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: document Panasonic AN30259A
 bindings
Message-ID: <20180307215836.GB10438@amd>
References: <20180307004722.23524-1-simon@lineageos.org>
 <20180307004722.23524-2-simon@lineageos.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline
In-Reply-To: <20180307004722.23524-2-simon@lineageos.org>
To: Simon Shields <simon@lineageos.org>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>


--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2018-03-07 11:47:21, Simon Shields wrote:
> Signed-off-by: Simon Shields <simon@lineageos.org>

Well, single line for a changelog would not hurt :-).

Acked-by: Pavel Machek <pavel@ucw.cz>


> ---
>  .../devicetree/bindings/leds/leds-an30259a.txt     | 43 ++++++++++++++++=
++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-an30259a.=
txt
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-an30259a.txt b/D=
ocumentation/devicetree/bindings/leds/leds-an30259a.txt
> new file mode 100644
> index 000000000000..34ad4b189853
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-an30259a.txt
> @@ -0,0 +1,43 @@
> +* Panasonic AN30259A 3-channel LED driver
> +
> +The AN30259A is a LED controller capable of driving three LEDs independe=
ntly. It supports
> +constant current output and sloping current output modes. The chip is co=
nnected over I2C.
> +
> +Required properties:
> +	- compatible: Must be "panasonic,an30259a".
> +	- reg: I2C slave address.
> +	- #address-cells: Must be 1.
> +	- #size-cells: Must be 0.
> +
> +Each LED is represented as a sub-node of the panasonic,an30259a node.
> +
> +Required sub-node properties:
> +	- reg: Pin that the LED is connected to. Must be 1, 2, or 3.
> +
> +Optional sub-node properties:
> +	- label: see Documentation/devicetree/bindings/leds/common.txt
> +	- linux,default-trigger: see Documentation/devicetree/bindings/leds/com=
mon.txt
> +
> +Example:
> +leds@30 {
> +	compatible =3D "panasonic,an30259a";
> +	reg =3D <0x30>;
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	led@1 {
> +		reg =3D <1>;
> +		linux,default-trigger =3D "heartbeat";
> +		label =3D "an30259a:red:notification";
> +	};
> +
> +	led@2 {
> +		reg =3D <2>;
> +		label =3D "an30259a:green:notification";
> +	};
> +
> +	led@3 {
> +		reg =3D <3>;
> +		label =3D "an30259a:blue:notification";
> +	};
> +};

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlqgYIwACgkQMOfwapXb+vJBTwCgg+io4SGa6lhhF5f1/0k8mvg5
3bsAnAyrbhL5rLU8p61zMeEaHYMwX7/1
=XWPr
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
