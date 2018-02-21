Return-Path: <SRS0=hOvY=FP=ucw.cz=pavel@kernel.org>
Date: Wed, 21 Feb 2018 13:25:52 +0100
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/2] dt-bindings: leds: document Panasonic AN30259A
 bindings
Message-ID: <20180221122236.GB25848@amd>
References: <20180220005446.8577-1-simon@lineageos.org>
 <20180220005446.8577-2-simon@lineageos.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qFgkTsE6LiHkLPZw"
Content-Disposition: inline
In-Reply-To: <20180220005446.8577-2-simon@lineageos.org>
To: Simon Shields <simon@lineageos.org>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>


--qFgkTsE6LiHkLPZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Signed-off-by: Simon Shields <simon@lineageos.org>
> ---
>  .../devicetree/bindings/leds/leds-an30259a.txt     | 41 ++++++++++++++++=
++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-an30259a.=
txt
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-an30259a.txt b/D=
ocumentation/devicetree/bindings/leds/leds-an30259a.txt
> new file mode 100644
> index 000000000000..d3586ce71eef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-an30259a.txt
> @@ -0,0 +1,41 @@
> +* Panasonic AN30259A 3-channel LED driver
> +
> +The AN30259A is a LED controller capable of driving three LEDs independe=
ntly. It supports
> +constant current output and sloping current output modes. The chip is co=
nnected over I2C.
> +
> +Required properties:
> +	- compatible : must be "panasonic,an30259a"
> +	- reg -  I2C slave address

Might be nice to be consistent, you use 'label: explanation' below.

> +Each led is represented as a sub-node of the panasonic,an30259a node.

LED.

> +Optional sub-node properties:
> +	- label: see Documentation/devicetree/bindings/leds/common.txt
> +	- linux,default-trigger: see Documentation/devicetree/bindings/leds/com=
mon.txt
> +	- led-sources: 0 if LED is connected to LED1 pin,
> +	  1 if LED is connected to LED2 pin, or 2 if LED is connected to LED3 p=
in.

Normally, we use 'reg' for that, no?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--qFgkTsE6LiHkLPZw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlqNZVAACgkQMOfwapXb+vIlaACgt5ncDOxiXfy3y61TbShql/vE
NAoAn3mvtrydG1pxQX7tDz3Dr61F3M2R
=i/Ku
-----END PGP SIGNATURE-----

--qFgkTsE6LiHkLPZw--
