From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] ARM: at91/dt: sama5d4: fix dma conf for aes, sha and
 tdes nodes
Date: Tue, 9 Jun 2015 12:12:13 +0200
Message-ID: <5576BBFD.2060605@atmel.com>
References: <1433771754-4999-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433771754-4999-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com
List-Id: devicetree@vger.kernel.org

Le 08/06/2015 15:55, Ludovic Desroches a =E9crit :
> The xdmac channel configuration is done in one cell not two. This err=
or
> prevents from probing devices correctly.
>=20
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> Fixes: 83906783b766 ("ARM: at91/dt: sama5d4: add aes, sha and tdes no=
des")
> Cc: stable@vger.kernel.org # 4.1

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Arnd, Olof, Kevin,

This patch is a fix concerning material that had been added to 4.1, so
it's not exactly a regression.

So, as we missed the last train to 4.1, I'd like to queue it for 4.2 bu=
t
it's the only patch I have on top of my previous DT pull-request
(at91-dt4, not taken by you, yet).

So, should I build another pull-request (at91-dt5) or can you take this
single patch when you pull the at91-dt4 material?

BTW, here is the link to patchwork if it's easier:
https://patchwork.kernel.org/patch/6565591/

Thanks, bye,

> ---
>  arch/arm/boot/dts/sama5d4.dtsi | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5=
d4.dtsi
> index 6b1bb58..51ddec4 100644
> --- a/arch/arm/boot/dts/sama5d4.dtsi
> +++ b/arch/arm/boot/dts/sama5d4.dtsi
> @@ -1125,10 +1125,10 @@
>  				compatible =3D "atmel,at91sam9g46-aes";
>  				reg =3D <0xfc044000 0x100>;
>  				interrupts =3D <12 IRQ_TYPE_LEVEL_HIGH 0>;
> -				dmas =3D <&dma0 (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(=
1))
> -					AT91_XDMAC_DT_PERID(41)>,
> -				       <&dma0 (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)=
)
> -					AT91_XDMAC_DT_PERID(40)>;
> +				dmas =3D <&dma0 (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(=
1)
> +					| AT91_XDMAC_DT_PERID(41))>,
> +				       <&dma0 (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
> +					| AT91_XDMAC_DT_PERID(40))>;
>  				dma-names =3D "tx", "rx";
>  				clocks =3D <&aes_clk>;
>  				clock-names =3D "aes_clk";
> @@ -1139,10 +1139,10 @@
>  				compatible =3D "atmel,at91sam9g46-tdes";
>  				reg =3D <0xfc04c000 0x100>;
>  				interrupts =3D <14 IRQ_TYPE_LEVEL_HIGH 0>;
> -				dmas =3D <&dma0 (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(=
1))
> -					AT91_XDMAC_DT_PERID(42)>,
> -				       <&dma0 (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)=
)
> -					AT91_XDMAC_DT_PERID(43)>;
> +				dmas =3D <&dma0 (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(=
1)
> +					| AT91_XDMAC_DT_PERID(42))>,
> +				       <&dma0 (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1)
> +					| AT91_XDMAC_DT_PERID(43))>;
>  				dma-names =3D "tx", "rx";
>  				clocks =3D <&tdes_clk>;
>  				clock-names =3D "tdes_clk";
> @@ -1153,8 +1153,8 @@
>  				compatible =3D "atmel,at91sam9g46-sha";
>  				reg =3D <0xfc050000 0x100>;
>  				interrupts =3D <15 IRQ_TYPE_LEVEL_HIGH 0>;
> -				dmas =3D <&dma0 (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(=
1))
> -					AT91_XDMAC_DT_PERID(44)>;
> +				dmas =3D <&dma0 (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(=
1)
> +					| AT91_XDMAC_DT_PERID(44))>;
>  				dma-names =3D "tx";
>  				clocks =3D <&sha_clk>;
>  				clock-names =3D "sha_clk";
>=20


--=20
Nicolas Ferre
