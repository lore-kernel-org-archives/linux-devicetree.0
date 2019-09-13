From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 01/12] ARM: dts: imx7d: cl-som-imx7 imx7d-sbc-imx7: move
 USB
Date: Fri, 13 Sep 2019 11:31:46 +0800
Message-ID: <20190913033145.GG17142@dragon>
References: <20190826153800.35400-1-git@andred.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190826153800.35400-1-git@andred.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Igor Grinberg <grinberg@compulab.co.il>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Ilya Ledvich <ilya@compulab.co.il>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 26, 2019 at 04:37:49PM +0100, Andr=E9 Draszik wrote:
> Whether and which USB port is enabled and how they
> are powered is a function of the carrier board, not
> of the SoM. Different carrier boards can have different
> ports enabled / wired up, and power them differently;
> so this should really move into the respective DTS.
> =

> Do so and update the USB power supply to reflect
> the actual situation on the sbc-imx7 carrier board.
> =

> Signed-off-by: Andr=E9 Draszik <git@andred.net>
> Cc: Ilya Ledvich <ilya@compulab.co.il>
> Cc: Igor Grinberg <grinberg@compulab.co.il>

Ilya, Igor, can you have a look at the series?

Shawn

> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 24 ------------------------
>  arch/arm/boot/dts/imx7d-sbc-imx7.dts    | 13 +++++++++++++
>  2 files changed, 13 insertions(+), 24 deletions(-)
> =

> diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/=
imx7d-cl-som-imx7.dts
> index 62d5e9a4a781..6f7e85cf0c28 100644
> --- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
> +++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
> @@ -22,15 +22,6 @@
>  		device_type =3D "memory";
>  		reg =3D <0x80000000 0x10000000>; /* 256 MB - minimal configuration */
>  	};
> -
> -	reg_usb_otg1_vbus: regulator-vbus {
> -		compatible =3D "regulator-fixed";
> -		regulator-name =3D "usb_otg1_vbus";
> -		regulator-min-microvolt =3D <5000000>;
> -		regulator-max-microvolt =3D <5000000>;
> -		gpio =3D <&gpio1 5 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -	};
>  };
>  =

>  &cpu0 {
> @@ -193,13 +184,6 @@
>  	status =3D "okay";
>  };
>  =

> -&usbotg1 {
> -	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pinctrl_usbotg1>;
> -	vbus-supply =3D <&reg_usb_otg1_vbus>;
> -	status =3D "okay";
> -};
> -
>  &usdhc3 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_usdhc3>;
> @@ -278,11 +262,3 @@
>  		>;
>  	};
>  };
> -
> -&iomuxc_lpsr {
> -	pinctrl_usbotg1: usbotg1grp {
> -		fsl,pins =3D <
> -			MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5	0x14 /* OTG PWREN */
> -		>;
> -	};
> -};
> diff --git a/arch/arm/boot/dts/imx7d-sbc-imx7.dts b/arch/arm/boot/dts/imx=
7d-sbc-imx7.dts
> index f8a868552707..aab646903de3 100644
> --- a/arch/arm/boot/dts/imx7d-sbc-imx7.dts
> +++ b/arch/arm/boot/dts/imx7d-sbc-imx7.dts
> @@ -15,6 +15,14 @@
>  / {
>  	model =3D "CompuLab SBC-iMX7";
>  	compatible =3D "compulab,sbc-imx7", "compulab,cl-som-imx7", "fsl,imx7d";
> +
> +	reg_usb_vbus: regulator-usb-vbus {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "usb_vbus";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-always-on;
> +	};
>  };
>  =

>  &usdhc1 {
> @@ -26,6 +34,11 @@
>  	status =3D "okay";
>  };
>  =

> +&&usbotg1 {
> +	vbus-supply =3D <&reg_usb_vbus>;
> +	status =3D "okay";
> +};
> +
>  &iomuxc {
>  	pinctrl_usdhc1: usdhc1grp {
>  		fsl,pins =3D <
> -- =

> 2.23.0.rc1
> =
