From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] ARM: at91/dt: sama5d4: update pinctrl ranges
Date: Mon, 18 May 2015 17:52:43 +0200
Message-ID: <555A0ACB.1060603@atmel.com>
References: <1430126106-15300-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430126106-15300-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Le 27/04/2015 11:15, Ludovic Desroches a =E9crit :
> Update the pinctrl ranges property to support pioD controller whose
> mapping is not contiguous with other pio controllers. Without this
> update, getting resource will fail, then pinctrl probe will fail too
> because there is a missing pio controller.
>=20
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Thanks.

> ---
>  arch/arm/boot/dts/sama5d4.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5=
d4.dtsi
> index 8679fa9..2cfc65f 100644
> --- a/arch/arm/boot/dts/sama5d4.dtsi
> +++ b/arch/arm/boot/dts/sama5d4.dtsi
> @@ -1214,7 +1214,8 @@
>  				#address-cells =3D <1>;
>  				#size-cells =3D <1>;
>  				compatible =3D "atmel,at91sam9x5-pinctrl", "atmel,at91rm9200-pin=
ctrl", "simple-bus";
> -				ranges =3D <0xfc06a000 0xfc06a000 0x4000>;
> +				ranges =3D <0xfc068000 0xfc068000 0x100
> +					  0xfc06a000 0xfc06a000 0x4000>;
>  				/* WARNING: revisit as pin spec has changed */
>  				atmel,mux-mask =3D <
>  					/*   A          B          C  */
>=20


--=20
Nicolas Ferre
