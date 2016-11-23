From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 3/3] ARM: dts: sunxi: enable SDIO Wi-Fi on Orange Pi Zero
Date: Wed, 23 Nov 2016 08:59:50 +0100
Message-ID: <20161123075950.fjtplylunwale6j4@lukather>
References: <20161121162421.800-1-icenowy@aosc.xyz>
 <20161121162421.800-3-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4780815808593788657=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161121162421.800-3-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vishnu Patekar <vishnupatekar0510@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Andre Przywara <andre.przywara@arm.com>, linux-doc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============4780815808593788657==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bjlgigef2u3ezvmr"
Content-Disposition: inline


--bjlgigef2u3ezvmr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 22, 2016 at 12:24:21AM +0800, Icenowy Zheng wrote:
> There's a Allwinner's XR819 SDIO Wi-Fi module soldered on the board of
> Orange Pi Zero, which used a dedicated regulator to power.
>=20
> Add the device tree node of the regulator, the enable gpio (with
> mmc-pwrseq) and the sdio controller.
>=20
> There's a out-of-tree driver tested to work with this device tree.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
> New patch in the patchset, since a out-of-tree working xradio driver is d=
one.
>=20
> If there is any problem in this patch, it can be omitted.

No particular problem with this one, however it can and should be
merged with the previous one.

Minor comments below though.

>=20
>  arch/arm/boot/dts/sun8i-h2plus-orangepi-zero.dts | 42 ++++++++++++++++++=
++++++
>  1 file changed, 42 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h2plus-orangepi-zero.dts b/arch/arm/=
boot/dts/sun8i-h2plus-orangepi-zero.dts
> index b428e47..39cac26 100644
> --- a/arch/arm/boot/dts/sun8i-h2plus-orangepi-zero.dts
> +++ b/arch/arm/boot/dts/sun8i-h2plus-orangepi-zero.dts
> @@ -79,6 +79,24 @@
>  			gpios =3D <&pio 0 17 GPIO_ACTIVE_HIGH>;
>  		};
>  	};
> +
> +	reg_vcc_wifi: reg_vcc_wifi {
> +		compatible =3D "regulator-fixed";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&vcc_wifi_pin_opi0>;
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-name =3D "vcc-wifi";
> +		enable-active-high;
> +		gpio =3D <&pio 0 20 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	wifi_pwrseq: wifi_pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&wifi_pwrseq_pin_opi0>;
> +		reset-gpios =3D <&r_pio 0 7 GPIO_ACTIVE_LOW>;
> +	};
>  };
> =20
>  &ehci1 {
> @@ -95,6 +113,20 @@
>  	status =3D "okay";
>  };
> =20
> +&mmc1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc1_pins_a>;
> +	vmmc-supply =3D <&reg_vcc_wifi>;
> +	mmc-pwrseq =3D <&wifi_pwrseq>;
> +	bus-width =3D <4>;
> +	non-removable;
> +	status =3D "okay";
> +};
> +
> +&mmc1_pins_a {
> +	allwinner,pull =3D <SUN4I_PINCTRL_PULL_UP>;

This should be bias-pull-up.

> +};
> +
>  &ohci1 {
>  	status =3D "okay";
>  };
> @@ -104,6 +136,11 @@
>  		pins =3D "PA17";
>  		function =3D "gpio_out";
>  	};
> +
> +	vcc_wifi_pin_opi0: vcc_wifi_pin@0 {
> +		allwinner,pins =3D "PA20";

This should be pins

> +		allwinner,function =3D "gpio_out";

This should be function

> +	};
>  };
> =20
>  &r_pio {
> @@ -111,6 +148,11 @@
>  		pins =3D "PL10";
>  		function =3D "gpio_out";
>  	};
> +
> +	wifi_pwrseq_pin_opi0: wifi_pwrseq_pin@0 {
> +		allwinner,pins =3D "PL7";
> +		allwinner,function =3D "gpio_out";

And same thing here.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--bjlgigef2u3ezvmr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYNUx2AAoJEBx+YmzsjxAg3MgQAJl1ppzNHgy1TrCpaz0TlZ/X
tzphrmvYOJ8vkNOKCmCFVQRwXQbZcwClfugPJA/gUNm7gphZpMvERJniB8vi+tDS
bRBf456tBSb46Swfgk+5brPjmKr0fWl0o0LqMhRUb8yG8hwCA1SkhevGeSntO3Un
fXyUTAc+ZJ7h4ZLnsir7PUlJleB4CHU0jF3dK1Ggzcq9aYs8rf4GbE7NEP/flTLY
2/mcVNgG0MsDSn1Zp1pWqBEnMMULcebQFyhBHd5hnryovsoPABamYvPBi0sPoaEA
WAxw24ZMWrlHyI+ib6gncy4ypmuoWtgasEmrgMXL9B84NUw8lXTS/Ez3UmQ1YD9N
0XuV84eLpXXd9CfbZJRNdZfpz6pAbV/AGc3/OGcXn9GJ/QeaCCwHaqvZNYp2nk5M
mHLaOs0dieXNcQUX18+Ss2QPanvtLz+Nw3PyqSesmZnmAK1kp6j7pVsS87Lgo1ZQ
87WBSnsSu4wqEX1R+4AQQSVZurJTwLPdRHiu0DEasZ2f9Ei3UGrhZxI4II31SWo4
T4zz/EG3pOmTSWB7ioaVJnwWBawOLW86Rn0thh48P6L+P1QUvjxesKRqGGzZInc3
92P+47RVeTVWzU4azD2OIJX3au4tL32127HuCmeEW0umbNHDiHRVa+7BepD8Krxh
Hv8PgsfZmYFjqS9ldCus
=gv8O
-----END PGP SIGNATURE-----

--bjlgigef2u3ezvmr--


--===============4780815808593788657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4780815808593788657==--
