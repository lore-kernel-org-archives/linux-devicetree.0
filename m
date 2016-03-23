From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH] ARM: at91/dt: sama5d2: add SFR node
Date: Wed, 23 Mar 2016 12:24:26 +0100
Message-ID: <56F27CEA.7000509@atmel.com>
References: <1458230640-26049-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458230640-26049-1-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 17/03/2016 17:04, Ludovic Desroches a =E9crit :
> From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>=20
> This SFR node is looked up by the I2S controller driver to tune the
> SFR_I2SCLKSEL register.
>=20
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

I'll queue it in our upcoming at91-4.7-dt branch. Thanks!

Bye,

> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.txt |  2 +-
>  arch/arm/boot/dts/sama5d2.dtsi                       |  5 +++++
>  include/soc/at91/atmel-sfr.h                         | 18 ++++++++++=
++++++++
>  3 files changed, 24 insertions(+), 1 deletion(-)
>  create mode 100644 include/soc/at91/atmel-sfr.h
>=20
> diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.txt b/D=
ocumentation/devicetree/bindings/arm/atmel-at91.txt
> index 7fd64ec..550fd66 100644
> --- a/Documentation/devicetree/bindings/arm/atmel-at91.txt
> +++ b/Documentation/devicetree/bindings/arm/atmel-at91.txt
> @@ -155,7 +155,7 @@ elsewhere.
> =20
>  required properties:
>  - compatible: Should be "atmel,<chip>-sfr", "syscon".
> -  <chip> can be "sama5d3" or "sama5d4".
> +  <chip> can be "sama5d3", "sama5d4" or "sama5d2".
>  - reg: Should contain registers location and length
> =20
>  	sfr@f0038000 {
> diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5=
d2.dtsi
> index 78996bd..36bb29c 100644
> --- a/arch/arm/boot/dts/sama5d2.dtsi
> +++ b/arch/arm/boot/dts/sama5d2.dtsi
> @@ -973,6 +973,11 @@
>  				status =3D "disabled";
>  			};
> =20
> +			sfr: sfr@f8030000 {
> +				compatible =3D "atmel,sama5d2-sfr", "syscon";
> +				reg =3D <0xf8030000 0x98>;
> +			};
> +
>  			flx0: flexcom@f8034000 {
>  				compatible =3D "atmel,sama5d2-flexcom";
>  				reg =3D <0xf8034000 0x200>;
> diff --git a/include/soc/at91/atmel-sfr.h b/include/soc/at91/atmel-sf=
r.h
> new file mode 100644
> index 0000000..2f9bb98
> --- /dev/null
> +++ b/include/soc/at91/atmel-sfr.h
> @@ -0,0 +1,18 @@
> +/*
> + * Atmel SFR (Special Function Registers) register offsets and bit d=
efinitions.
> + *
> + * Copyright (C) 2016 Atmel
> + *
> + * Author: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef _LINUX_MFD_SYSCON_ATMEL_SFR_H
> +#define _LINUX_MFD_SYSCON_ATMEL_SFR_H
> +
> +#define AT91_SFR_I2SCLKSEL	0x90	/* I2SC Register */
> +
> +#endif /* _LINUX_MFD_SYSCON_ATMEL_SFR_H */
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
