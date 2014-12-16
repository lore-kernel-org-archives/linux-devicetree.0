From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] ARM: at91/dt: sama5d4: fix the timer reg length
Date: Tue, 16 Dec 2014 11:33:56 +0100
Message-ID: <54900A94.1080001@atmel.com>
References: <1418266473-30187-1-git-send-email-voice.shen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1418266473-30187-1-git-send-email-voice.shen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bo Shen <voice.shen@atmel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Le 11/12/2014 03:54, Bo Shen a =E9crit :
> The second property of reg is the length, so correct it for timer.
>=20
> Signed-off-by: Bo Shen <voice.shen@atmel.com>

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

and stacked on top of at91-3.19-fixes.

Thanks.

> ---
>=20
>  arch/arm/boot/dts/sama5d4.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5=
d4.dtsi
> index 2cc3cfe..0901706 100644
> --- a/arch/arm/boot/dts/sama5d4.dtsi
> +++ b/arch/arm/boot/dts/sama5d4.dtsi
> @@ -940,7 +940,7 @@
> =20
>  			pit: timer@fc068630 {
>  				compatible =3D "atmel,at91sam9260-pit";
> -				reg =3D <0xfc068630 0xf>;
> +				reg =3D <0xfc068630 0x10>;
>  				interrupts =3D <3 IRQ_TYPE_LEVEL_HIGH 5>;
>  				clocks =3D <&h32ck>;
>  			};
>=20


--=20
Nicolas Ferre
