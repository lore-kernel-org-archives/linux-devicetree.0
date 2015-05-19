From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH 1/4] ARM: at91/dt: sama5d3 xplained: fill in mmc1 and
 set it to disabled
Date: Tue, 19 May 2015 11:07:16 +0200
Message-ID: <555AFD44.7040007@atmel.com>
References: <1430140753-19998-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430140753-19998-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, ben.dooks@codethink.co.uk
Cc: linux-kernel@vger.kernel.org, plagnioj@jcrosoft.com, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Boris BREZILLON <boris.brezillon@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Le 27/04/2015 15:19, Ludovic Desroches a =E9crit :
> From: Ben Dooks <ben.dooks@codethink.co.uk>
>=20
> The mmc1 channel is not populated on the SAM5D3 Xplained board, howev=
er
> it is enabled and therefore the driver is attaching to it.
>=20
> The node configuration for mmc1 is missing, so add an mmc1 node in th=
e
> device tree and set its status to disabled. Also add the vmmc and the
> necessary slot configuration if this node were enabled to avoid the f=
ollowing
> warnings from the driver:
>=20
> atmel_mci f8000000.mmc: No vmmc regulator found
> atmel_mci f8000000.mmc: No vqmmc regulator found
>=20
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

and queued on at91-4.2-dt branch.

I also sent the update of the at91 defconfigs. We may need to have a
kind of synchronization between them... but a loose one should be okay.=
=2E.

Bye,

> ---
>  arch/arm/boot/dts/at91-sama5d3_xplained.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/at91-sama5d3_xplained.dts b/arch/arm/b=
oot/dts/at91-sama5d3_xplained.dts
> index 9991240..af8b263 100644
> --- a/arch/arm/boot/dts/at91-sama5d3_xplained.dts
> +++ b/arch/arm/boot/dts/at91-sama5d3_xplained.dts
> @@ -43,6 +43,17 @@
>  				};
>  			};
> =20
> +			mmc1: mmc@f8000000 {
> +				vmmc-supply =3D <&vcc_3v3_reg>;
> +				vqmmc-supply =3D <&vcc_3v3_reg>;
> +				status =3D "disabled";
> +				slot@0 {
> +					reg =3D <0>;
> +					bus-width =3D <4>;
> +					cd-gpios =3D <&pioE 1 GPIO_ACTIVE_LOW>;
> +				};
> +			};
> +
>  			spi0: spi@f0004000 {
>  				cs-gpios =3D <&pioD 13 0>, <0>, <0>, <&pioD 16 0>;
>  				status =3D "okay";
>=20


--=20
Nicolas Ferre
