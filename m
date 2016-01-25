From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: sama5d4: add support for Ka-Ro electronics
 TXA5 modules
Date: Mon, 25 Jan 2016 12:34:24 +0100
Message-ID: <20160125113424.GD4027@piout.net>
References: <1453293337-16078-1-git-send-email-LW@KARO-electronics.de>
 <1453293337-16078-4-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453293337-16078-4-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 20/01/2016 at 13:35:37 +0100, Lothar Wa=DFmann wrote :
> diff --git a/arch/arm/boot/dts/at91-sama5d4-txa5-5010.dts b/arch/arm/=
boot/dts/at91-sama5d4-txa5-5010.dts
> new file mode 100644
> index 0000000..fb4a253
> --- /dev/null
> +++ b/arch/arm/boot/dts/at91-sama5d4-txa5-5010.dts
> @@ -0,0 +1,217 @@
> +/*
> + * at91-sama5d4-txa5.dts - Device Tree file for Ka-Ro electronics TX=
A5 module
> + *

This file can also be called at91-txa5-5010.dts if you prefer unless yo=
u
plan to have multiple variants of the board with different SoCs.

> +/dts-v1/;
> +#include "sama5d4.dtsi"
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pwm/pwm.h>
> +
> +/ {
> +	model =3D "Ka-Ro SAMA5D4 TXA5";
> +	compatible =3D "atmel,sama5d4-txa5", "atmel,sama5d4", "atmel,sama5"=
;
> +

The vendor for sama5d4-txa5 is not atmel, this should be
"karo,sama5d4-txa5".

Don't forget to add that vendor prefix in
Documentation/devicetree/bindings/vendor-prefixes.txt


> +	aliases {
> +		display =3D &display;
> +		ethernet0 =3D &macb0;
> +		serial0 =3D &usart0;
> +		serial1 =3D &usart1;
> +		serial2 =3D &usart3;
> +		spi0 =3D &spi0;
> +	};
> +
> +	clocks {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +

Those properties should be removed. You probably based yourself on a dt=
s
for an old kernel.

> +		main_clock: clock@0 {
> +			compatible =3D "atmel,osc", "fixed-clock";
> +			clock-frequency =3D <12000000>;
> +		};

This node is useless, I think you can remove the whole clocks groups as
you define slow_xtal and main_xtal later.

> +	display: display {
> +		display-timings {
> +		};
> +	};
> +

Don't you need some timings?


--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
