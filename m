From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] ARM: dts: imx28-apf28dev: add user button
Date: Wed, 15 Jan 2014 13:58:32 +0800
Message-ID: <20140115055830.GF1896@S2101-09.ap.freescale.net>
References: <1389709287-25742-1-git-send-email-sebastien.szymanski@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1389709287-25742-1-git-send-email-sebastien.szymanski@armadeus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Julien Boibessot <julien.boibessot@armadeus.com>, Russell King <linux@arm.linux.org.uk>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 14, 2014 at 03:21:27PM +0100, S=E9bastien Szymanski wrote:
> Signed-off-by: S=E9bastien Szymanski <sebastien.szymanski@armadeus.co=
m>
> ---
>  arch/arm/boot/dts/imx28-apf28dev.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Applied, thanks.

Shawn

>=20
> diff --git a/arch/arm/boot/dts/imx28-apf28dev.dts b/arch/arm/boot/dts=
/imx28-apf28dev.dts
> index 334dea5..221cac4 100644
> --- a/arch/arm/boot/dts/imx28-apf28dev.dts
> +++ b/arch/arm/boot/dts/imx28-apf28dev.dts
> @@ -48,6 +48,7 @@
>  						MX28_PAD_LCD_D20__GPIO_1_20
>  						MX28_PAD_LCD_D21__GPIO_1_21
>  						MX28_PAD_LCD_D22__GPIO_1_22
> +						MX28_PAD_GPMI_CE1N__GPIO_0_17
>  					>;
>  					fsl,drive-strength =3D <MXS_DRIVE_4mA>;
>  					fsl,voltage =3D <MXS_VOLTAGE_HIGH>;
> @@ -193,4 +194,14 @@
>  		brightness-levels =3D <0 4 8 16 32 64 128 255>;
>  		default-brightness-level =3D <6>;
>  	};
> +
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +
> +		user-button {
> +			label =3D "User button";
> +			gpios =3D <&gpio0 17 0>;
> +			linux,code =3D <0x100>;
> +		};
> +	};
>  };
> --=20
> 1.8.3.2
>=20
