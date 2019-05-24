From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v14 1/3] arm64: dts: fsl: librem5: Add a device tree for
 the Librem5 devkit
Date: Fri, 24 May 2019 22:42:39 +0200
Message-ID: <20190524204239.GA18646@amd>
References: <20190524183257.16066-1-angus@akkea.ca>
 <20190524183257.16066-2-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190524183257.16066-2-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Angus Ainslie <angus@akkea.ca>
Cc: angus.ainslie@puri.sm, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

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

I had comments about these...

> +	vibrator {
> +		compatible =3D "gpio-vibrator";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_haptic>;
> +	        enable-gpios =3D <&gpio5 4 GPIO_ACTIVE_LOW>;
> +		vcc-supply =3D <&reg_3v3_p>;
> +	};

Thanks!

> +	charger@6b { /* bq25896 */
> +		compatible =3D "ti,bq25890";
> +		reg =3D <0x6b>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_charger>;
> +		interrupt-parent =3D <&gpio3>;
> +		interrupts =3D <25 IRQ_TYPE_EDGE_FALLING>;
> +		ti,battery-regulation-voltage =3D <4192000>; /* 4.192V */
> +		ti,charge-current =3D <1600000>; /* 1.6 A */
> +		ti,termination-current =3D <66000>;  /* 66mA */
> +		ti,precharge-current =3D <1300000>; /* 1.3A */
> +		ti,minimum-sys-voltage =3D <2750000>; /* 2.75V */
> +		ti,boost-voltage =3D <5000000>; /* 5V */
> +		ti,boost-max-current =3D <50000>; /* 50mA */
> +	};

And this. Did they get lost somewhere?
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzoVz8ACgkQMOfwapXb+vIdgQCghne8A075NT7kuQmW7jP5hq3r
KZUAoKXRSu20WmzRx4utr7RCAfCkzzmY
=GIv0
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
