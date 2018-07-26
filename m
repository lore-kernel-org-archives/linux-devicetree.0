From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: Re: [PATCH v3.1 10/10] arm64: dts: allwinner: a64:
 Enable HDMI output on A64 boards w/ HDMI
Date: Thu, 26 Jul 2018 20:03:00 +0200
Message-ID: <1571011.jY5lUBhtiX@jernej-laptop>
References: <20180726171257.6688-1-icenowy@aosc.io> <20180726171257.6688-11-icenowy@aosc.io>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDQNBWPU7YERBWEZ5DNAKGQEFYJEDFA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180726171257.6688-11-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne =C4=8Detrtek, 26. julij 2018 ob 19:12:57 CEST je Icenowy Zheng napisal(=
a):
> From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>=20
> Enable all necessary device tree nodes and add connector node to device
> trees for all supported A64 boards with HDMI.
>=20
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> [Icenowy: squash all board patches altogether and change supply name]
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> Changes in v3,1:
> - Squash all enablement patches altogether.
> - Change supply name to match DT binding & driver change.
> Changes for v3:
> - Enable all pipeline components
> Changes for v2:
> - none
>=20
>  .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 34 +++++++++++++++++++
>  .../dts/allwinner/sun50i-a64-nanopi-a64.dts   | 34 +++++++++++++++++++
>  .../dts/allwinner/sun50i-a64-olinuxino.dts    | 34 +++++++++++++++++++
>  .../dts/allwinner/sun50i-a64-orangepi-win.dts | 34 +++++++++++++++++++
>  .../boot/dts/allwinner/sun50i-a64-pine64.dts  | 34 +++++++++++++++++++
>  .../allwinner/sun50i-a64-sopine-baseboard.dts | 34 +++++++++++++++++++
>  6 files changed, 204 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts index
> 094cfed13df9..0d8f5571d574 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> @@ -60,6 +60,17 @@
>  		stdout-path =3D "serial0:115200n8";
>  	};
>=20
> +	connector {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint =3D <&hdmi_out_con>;
> +			};
> +		};
> +	};
> +
>  	leds {
>  		compatible =3D "gpio-leds";
>=20
> @@ -86,6 +97,10 @@
>  	};
>  };
>=20
> +&de {
> +	status =3D "okay";
> +};
> +
>  &ehci0 {
>  	status =3D "okay";
>  };
> @@ -103,6 +118,17 @@
>  	status =3D "okay";
>  };
>=20
> +&hdmi {
> +	hdmi-supply =3D <&reg_dldo1>;
> +	status =3D "okay";
> +};
> +
> +&hdmi_out {
> +	hdmi_out_con: endpoint {
> +		remote-endpoint =3D <&hdmi_con_in>;
> +	};
> +};
> +
>  &i2c1 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&i2c1_pins>;
> @@ -120,6 +146,10 @@
>  	};
>  };
>=20
> +&mixer1 {
> +	status =3D "okay";
> +};
> +
>  &mmc0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&mmc0_pins>;
> @@ -300,6 +330,10 @@
>  	vcc-hdmi-supply =3D <&reg_dldo1>;
>  };
>=20
> +&tcon1 {
> +	status =3D "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&uart0_pins_a>;
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts index
> 98dbff19f5cc..2bcf02f46366 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
> @@ -57,6 +57,21 @@
>  	chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> +
> +	connector {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint =3D <&hdmi_out_con>;
> +			};
> +		};
> +	};
> +};
> +
> +&de {
> +	status =3D "okay";
>  };
>=20
>  &ehci0 {
> @@ -67,6 +82,17 @@
>  	status =3D "okay";
>  };
>=20
> +&hdmi {
> +	hdmi-supply =3D <&reg_dldo1>;
> +	status =3D "okay";
> +};
> +
> +&hdmi_out {
> +	hdmi_out_con: endpoint {
> +		remote-endpoint =3D <&hdmi_con_in>;
> +	};
> +};
> +
>  /* i2c1 connected with gpio headers like pine64, bananapi */
>  &i2c1 {
>  	pinctrl-names =3D "default";
> @@ -78,6 +104,10 @@
>  	bias-pull-up;
>  };
>=20
> +&mixer1 {
> +	status =3D "okay";
> +};
> +
>  &mmc0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&mmc0_pins>;
> @@ -199,6 +229,10 @@
>  	vcc-hdmi-supply =3D <&reg_dldo1>;
>  };
>=20
> +&tcon1 {
> +	status =3D "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&uart0_pins_a>;
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts index
> 3f531393eaee..5445a7a1db51 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
> @@ -58,12 +58,42 @@
>  		stdout-path =3D "serial0:115200n8";
>  	};
>=20
> +	connector {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint =3D <&hdmi_out_con>;
> +			};
> +		};
> +	};
> +
>  	wifi_pwrseq: wifi_pwrseq {
>  		compatible =3D "mmc-pwrseq-simple";
>  		reset-gpios =3D <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
>  	};
>  };
>=20
> +&de {
> +	status =3D "okay";
> +};
> +
> +&hdmi {
> +	hdmi-supply =3D <&reg_dldo1>;
> +	status =3D "okay";
> +};
> +
> +&hdmi_out {
> +	hdmi_out_con: endpoint {
> +		remote-endpoint =3D <&hdmi_con_in>;
> +	};
> +};
> +
> +&mixer1 {
> +	status =3D "okay";
> +};
> +
>  &mmc0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&mmc0_pins>;
> @@ -218,6 +248,10 @@
>  	vcc-hdmi-supply =3D <&reg_dldo1>;
>  };
>=20
> +&tcon1 {
> +	status =3D "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&uart0_pins_a>;
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts index
> 1221764f5719..81a8f92c6c35 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
> @@ -57,12 +57,42 @@
>  	chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> +
> +	connector {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint =3D <&hdmi_out_con>;
> +			};
> +		};
> +	};
> +};
> +
> +&de {
> +	status =3D "okay";
>  };
>=20
>  &ehci1 {
>  	status =3D "okay";
>  };
>=20
> +&hdmi {
> +	hdmi-supply =3D <&reg_dldo1>;
> +	status =3D "okay";
> +};
> +
> +&hdmi_out {
> +	hdmi_out_con: endpoint {
> +		remote-endpoint =3D <&hdmi_con_in>;
> +	};
> +};
> +
> +&mixer1 {
> +	status =3D "okay";
> +};
> +
>  &mmc0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&mmc0_pins>;
> @@ -195,6 +225,10 @@
>  	vcc-hdmi-supply =3D <&reg_dldo1>;
>  };
>=20
> +&tcon1 {
> +	status =3D "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&uart0_pins_a>;
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts index
> 1b9b92e541d2..1b972bade9f6 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
> @@ -62,6 +62,21 @@
>  	chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> +
> +	connector {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint =3D <&hdmi_out_con>;
> +			};
> +		};
> +	};
> +};
> +
> +&de {
> +	status =3D "okay";
>  };
>=20
>  &ehci0 {
> @@ -82,6 +97,17 @@
>=20
>  };
>=20
> +&hdmi {
> +	hdmi-supply =3D <&reg_dldo1>;
> +	status =3D "okay";
> +};
> +
> +&hdmi_out {
> +	hdmi_out_con: endpoint {
> +		remote-endpoint =3D <&hdmi_con_in>;
> +	};
> +};
> +
>  &i2c1 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&i2c1_pins>;
> @@ -99,6 +125,10 @@
>  	};
>  };
>=20
> +&mixer1 {
> +	status =3D "okay";
> +};
> +
>  &mmc0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&mmc0_pins>;
> @@ -238,6 +268,10 @@
>  	status =3D "disabled";
>  };
>=20
> +&tcon1 {
> +	status =3D "okay";
> +};
> +
>  /* On Exp and Euler connectors */
>  &uart0 {
>  	pinctrl-names =3D "default";
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dt=
s
> b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts index
> c21f2331add6..eff44b069b1d 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> @@ -61,6 +61,17 @@
>  		stdout-path =3D "serial0:115200n8";
>  	};
>=20
> +	connector {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint =3D <&hdmi_out_con>;
> +			};
> +		};
> +	};
> +
>  	reg_vcc1v8: vcc1v8 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vcc1v8";
> @@ -69,6 +80,10 @@
>  	};
>  };
>=20
> +&de {
> +	status =3D "okay";
> +};
> +
>  &ehci0 {
>  	status =3D "okay";
>  };
> @@ -86,6 +101,17 @@
>  	status =3D "okay";
>  };
>=20
> +&hdmi {
> +	hdmi-supply =3D <&reg_dldo1>;
> +	status =3D "okay";
> +};
> +
> +&hdmi_out {
> +	hdmi_out_con: endpoint {
> +		remote-endpoint =3D <&hdmi_con_in>;
> +	};
> +};
> +
>  &mdio {
>  	ext_rgmii_phy: ethernet-phy@1 {
>  		compatible =3D "ethernet-phy-ieee802.3-c22";
> @@ -93,6 +119,10 @@
>  	};
>  };
>=20
> +&mixer1 {
> +	status =3D "okay";
> +};
> +
>  &mmc2 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&mmc2_pins>;
> @@ -138,6 +168,10 @@
>  	vcc-hdmi-supply =3D <&reg_dldo1>;

How is it possible to have vcc-hdmi-supply already defined? Did I miss some=
=20
patch?

Best regards,
Jernej

>  };
>=20
> +&tcon1 {
> +	status =3D "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&uart0_pins_a>;




--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
