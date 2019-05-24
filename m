From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v14 1/3] arm64: dts: fsl: librem5: Add a device tree for
 the Librem5 devkit
Date: Fri, 24 May 2019 22:49:18 +0200
Message-ID: <20190524204918.GB18646@amd>
References: <20190524183257.16066-1-angus@akkea.ca>
 <20190524183257.16066-2-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190524183257.16066-2-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Angus Ainslie <angus@akkea.ca>
Cc: angus.ainslie@puri.sm, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_gpio_leds>;
> +
> +		led1 {
> +			label =3D "LED 1";
> +			gpios =3D <&gpio1 13 GPIO_ACTIVE_HIGH>;
> +			default-state =3D "off";
> +		};
> +	};

Found it, so my mail made it to lkml:

https://lkml.org/lkml/2019/5/23/1356

								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzoWM4ACgkQMOfwapXb+vIxzgCaAmWuRbFWskhbWNwkrEY3/u8n
ywcAniQla3W/GJpO7gyvRuJL3wTXgZUp
=lx7Z
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
