From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v2] ARM: dts: imx6qdl-sabresd.dtsi: Add red led
Date: Wed, 5 Mar 2014 19:42:28 +0800
Message-ID: <20140305114223.GN8784@S2101-09.ap.freescale.net>
References: <20140305062216.GI8784@S2101-09.ap.freescale.net>
 <1394007383-21874-1-git-send-email-vincent.stehle@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1394007383-21874-1-git-send-email-vincent.stehle@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@freescale.com>
Cc: Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 05, 2014 at 09:16:23AM +0100, Vincent Stehl=E9 wrote:
> Make the red gpio led available to the user.
>=20
> This can be toggled with the sysfs for example, or used as a heartbea=
t or mmc
> activity light by changing the trigger.
>=20
> Signed-off-by: Vincent Stehl=E9 <vincent.stehle@freescale.com>
> Cc: Shawn Guo <shawn.guo@linaro.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
>=20
> ---
>=20
> Hi Shawn,
>=20
> Thanks for your feedback.
>=20
> If you don't want to make the led a heartbeat by default, here is v2 =
of the
> patch, which only makes the led available to the user. One is then fr=
ee to use
> it as a heartbeat, or something else. Do you prefer it this way?
>=20
> Best regards,
>=20
> V.
>=20
>=20
> Changes since v1:
> - Do not make it a heartbeat by default.
>=20
>  arch/arm/boot/dts/imx6qdl-sabresd.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/d=
ts/imx6qdl-sabresd.dtsi
> index e75e11b..210a8df 100644
> --- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> @@ -88,6 +88,16 @@
>  		default-brightness-level =3D <7>;
>  		status =3D "okay";
>  	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		red {
> +		        gpios =3D <&gpio1 2 0>;
> +		        linux,default-trigger =3D "none";

Per Documentation/devicetree/bindings/leds/common.txt, 'none' is not a
valid value of property 'linux,default-trigger'.  I suggest you simply
drop the property.

> +		        default-state =3D "on";
> +		};
> +	};
>  };
> =20
>  &audmux {
> @@ -182,6 +192,7 @@
>  				MX6QDL_PAD_ENET_TXD1__GPIO1_IO29 0x80000000
>  				MX6QDL_PAD_EIM_D22__GPIO3_IO22  0x80000000
>  				MX6QDL_PAD_ENET_CRS_DV__GPIO1_IO25 0x80000000
> +				MX6QDL_PAD_GPIO_2__GPIO1_IO02 0x80000000

It's not a hog pin, so shouldn't be added here.  (Right, most of the
existing pins shouldn't be here from the beginning)

The patch from Liu Ying [1] could be a good example on this regard.

Shawn

[1] http://www.spinics.net/lists/arm-kernel/msg308999.html

>  			>;
>  		};
>  	};
> --=20
> 1.9.0
>=20
>=20
