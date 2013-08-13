From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: sunxi: dt: Add device tree for Mele A1000
Date: Tue, 13 Aug 2013 22:30:01 +0200
Message-ID: <20130813203001.GC28819@lukather>
References: <1376420865-4650-1-git-send-email-emilio@elopez.com.ar>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6638016807352857123=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1376420865-4650-1-git-send-email-emilio@elopez.com.ar>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, arokux@gmail.com
List-Id: devicetree@vger.kernel.org


--===============6638016807352857123==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="96YOpH+ONegL0A3E"
Content-Disposition: inline


--96YOpH+ONegL0A3E
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Emilio,

On Tue, Aug 13, 2013 at 04:07:45PM -0300, Emilio L=F3pez wrote:
> This adds a device tree usable on Mele A1000 (and A2000, as it
> apparently is the same device except for the case). This device features
> one UART port, Ethernet, an AXP209 PMU on i2c0 and two user configurable
> LEDs.
>=20
> Signed-off-by: Emilio L=F3pez <emilio@elopez.com.ar>
> ---
>=20
> This has been tested by arokux on #linux-sunxi in Freenode and found to=
=20
> work correctly.
>
>  arch/arm/boot/dts/Makefile            |   1 +
>  arch/arm/boot/dts/sun4i-a10-a1000.dts | 106 ++++++++++++++++++++++++++++=
++++++
>  2 files changed, 107 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun4i-a10-a1000.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 641b3c9..3fd3919 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -206,6 +206,7 @@ dtb-$(CONFIG_ARCH_STI)+=3D stih415-b2000.dtb \
>  	stih415-b2020.dtb \
>  	stih416-b2020.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D \
> +	sun4i-a10-a1000.dtb \
>  	sun4i-a10-cubieboard.dtb \
>  	sun4i-a10-mini-xplus.dtb \
>  	sun4i-a10-hackberry.dtb \
> diff --git a/arch/arm/boot/dts/sun4i-a10-a1000.dts b/arch/arm/boot/dts/su=
n4i-a10-a1000.dts
> new file mode 100644
> index 0000000..304a38e
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun4i-a10-a1000.dts
> @@ -0,0 +1,106 @@
> +/*
> + * Copyright 2013 Emilio L=F3pez
> + *
> + * Emilio L=F3pez <emilio@elopez.com.ar>
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +/dts-v1/;
> +/include/ "sun4i-a10.dtsi"
> +
> +/ {
> +	model =3D "Mele A1000";
> +	compatible =3D "mele,a1000", "allwinner,sun4i-a10";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		bootargs =3D "earlyprintk console=3DttyS0,115200";
> +	};

That's not quite useful anymore now that we have a DT-aware bootloader,
I'd remove it.

> +
> +	soc@01c20000 {
> +		emac: ethernet@01c0b000 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&emac_pins_a>;
> +			phy =3D <&phy1>;
> +			status =3D "okay";
> +		};
> +
> +		mdio@01c0b080 {
> +			phy-supply =3D <&reg_emac_3v3>;
> +			status =3D "okay";
> +
> +			phy1: ethernet-phy@1 {
> +				reg =3D <1>;
> +			};
> +		};
> +
> +		pinctrl@01c20800 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&a1000_hogs>;
> +
> +			a1000_hogs: hogs@0 {
> +				allwinner,pins =3D "PH15";
> +				allwinner,function =3D "gpio_out";
> +				allwinner,drive =3D <0>;
> +				allwinner,pull =3D <0>;
> +			};

Why using the hog pins here? I don't think you require it anymore, just
grab the pinctrl node from the regulator, it should work, right?

> +
> +			led_pins_a1000: led_pins@0 {
> +				allwinner,pins =3D "PH10", "PH20";
> +				allwinner,function =3D "gpio_out";
> +				allwinner,drive =3D <1>;

Do you really need the extra 10 mA here?

> +				allwinner,pull =3D <0>;
> +			};
> +		};
> +
> +		uart0: serial@01c28000 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&uart0_pins_a>;
> +			status =3D "okay";
> +		};
> +
> +		i2c0: i2c@01c2ac00 {
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&i2c0_pins_a>;
> +			status =3D "okay";
> +		};
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&led_pins_a1000>;
> +
> +		red {
> +			label =3D "a1000:red:usr";
> +			gpios =3D <&pio 7 10 0>;
> +		};
> +
> +		blue {
> +			label =3D "a1000:blue:usr";
> +			gpios =3D <&pio 7 20 0>;
> +		};
> +	};
> +
> +	regulators {
> +		compatible =3D "simple-bus";
> +
> +		reg_emac_3v3: emac-3v3 {
> +			compatible =3D "regulator-fixed";
> +			regulator-name =3D "emac-3v3";
> +			regulator-min-microvolt =3D <3300000>;
> +			regulator-max-microvolt =3D <3300000>;
> +			enable-active-high;
> +			gpio =3D <&pio 7 15 0>;
> +		};
> +	};
> +};
> --=20
> 1.8.3.4
>=20

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--96YOpH+ONegL0A3E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJSCpdJAAoJEBx+YmzsjxAg7LsQAIpmGWMLouuarS4X16x5Z5R5
/GVepr+fS7GtCvpdt39L8pPB2A7Z+opsA6WhZeuC2+OzHcD6XNFltX2zuEejItmi
J2TYZRIhUKjuTjQtIh80vQF7olVSamsPxrSxeuYDb024zvBhuTzTLMkWjiL1eKiO
knBwKMwcWq8gA1qFcloJyFlh+tGlseMwMglJEl5Uka5rfl3SNYnEVvSwoDQyHtip
EID58bOoMBQQ6kSCAVMbSg3YnLrUsnvxKjKxge76HK9BCOzkt0n+jJ5zdJn4PKf9
IrqEwLq3dyj2ZZeQ0qTW8S0cg8SZsQ125ZV+La5ieMrzJpBwyXXRrsJ4qJ9ZxVaq
+er2g12kWsEGoY6qouwyZkIY8/pTtan6Rz9itLJgwwEcSBmEkzv3fVFm61Kv6y7z
g2Bm1NcNEMhl1nAptge9cGNcJ/z31pQhJsTDc55nMPCDRbpuJzawbdjyEqyr7PS1
Qd9a7RIDPNfOc3KD8r5d/H78f3DJnlxE87KLD4eIp4Im8bmV+KZQdUt2UhA42wIl
LLusCXxzDgkF+7ss0xxXGtHM9tc/DnpBxfbHk5js56dgDOC+KbSd8NKmaZLOGzJd
1kMdfPuuMfYCZ30I11QwOPdaGkg7RglfTSgJAyF3ezAAbWX7Tum8oatl95Pf3UwY
YxNHZUey+gxKCTA/D1gW
=yOUI
-----END PGP SIGNATURE-----

--96YOpH+ONegL0A3E--


--===============6638016807352857123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6638016807352857123==--
