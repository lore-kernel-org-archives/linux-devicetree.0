From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 5/5] ARM: at91/dt: define a dumb irq demultiplexer
 chip connected on irq1
Date: Wed, 14 Jan 2015 14:48:27 +0100
Message-ID: <54B673AB.6040404@atmel.com>
References: <1421174781-4340-1-git-send-email-boris.brezillon@free-electrons.com> <1421174781-4340-6-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421174781-4340-6-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 13/01/2015 19:46, Boris Brezillon a =E9crit :
> IRQ is multiplexing several peripheral IRQs, but there's no way to
> properly demultiplex those IRQs.
> Use a dumb irq demux chip to achieve this demultiplexing operation.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm/boot/dts/at91sam9260.dtsi | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/at91sam9260.dtsi b/arch/arm/boot/dts/a=
t91sam9260.dtsi
> index dd1313c..debe8d2 100644
> --- a/arch/arm/boot/dts/at91sam9260.dtsi
> +++ b/arch/arm/boot/dts/at91sam9260.dtsi
> @@ -10,7 +10,7 @@
> =20
>  #include "skeleton.dtsi"
>  #include <dt-bindings/pinctrl/at91.h>
> -#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/atmel-aic.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/clock/at91.h>
> =20
> @@ -89,6 +89,7 @@
>  				atmel,external-irqs =3D <29 30 31>;
>  			};
> =20
> +
>  			ramc0: ramc@ffffea00 {
>  				compatible =3D "atmel,at91sam9260-sdramc";
>  				reg =3D <0xffffea00 0x200>;
> @@ -97,7 +98,7 @@
>  			pmc: pmc@fffffc00 {
>  				compatible =3D "atmel,at91sam9260-pmc";
>  				reg =3D <0xfffffc00 0x100>;
> -				interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH 7>;
> +				interrupts-extended =3D <&dumb_irq1_demux AIC_IRQ1_PMC>;
>  				interrupt-controller;
>  				#address-cells =3D <1>;
>  				#size-cells =3D <0>;
> @@ -364,7 +365,7 @@
>  			pit: timer@fffffd30 {
>  				compatible =3D "atmel,at91sam9260-pit";
>  				reg =3D <0xfffffd30 0xf>;
> -				interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH 7>;
> +				interrupts-extended =3D <&dumb_irq1_demux AIC_IRQ1_PIT>;
>  				clocks =3D <&mck>;
>  			};
> =20
> @@ -750,7 +751,7 @@
>  			dbgu: serial@fffff200 {
>  				compatible =3D "atmel,at91sam9260-usart";
>  				reg =3D <0xfffff200 0x200>;
> -				interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH 7>;
> +				interrupts-extended =3D <&dumb_irq1_demux AIC_IRQ1_DBGU>;
>  				pinctrl-names =3D "default";
>  				pinctrl-0 =3D <&pinctrl_dbgu>;
>  				clocks =3D <&mck>;
> @@ -959,7 +960,7 @@
>  			rtc@fffffd20 {
>  				compatible =3D "atmel,at91sam9260-rtt";
>  				reg =3D <0xfffffd20 0x10>;
> -				interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH 7>;
> +				interrupts-extended =3D <&dumb_irq1_demux AIC_IRQ1_RTT>;
>  				clocks =3D <&clk32k>;
>  				status =3D "disabled";
>  			};
> @@ -967,7 +968,7 @@
>  			watchdog@fffffd40 {
>  				compatible =3D "atmel,at91sam9260-wdt";
>  				reg =3D <0xfffffd40 0x10>;
> -				interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH 7>;
> +				interrupts-extended =3D <&dumb_irq1_demux AIC_IRQ1_WATCHDOG>;
>  				atmel,watchdog-type =3D "hardware";
>  				atmel,reset-type =3D "all";
>  				atmel,dbg-halt;
> @@ -1010,6 +1011,19 @@
>  		};
>  	};
> =20
> +	dumb_irq1_demux: dumb-irq-demux@1 {
> +		compatible =3D "irqchip-dumb-demux";
> +		interrupt-controller;
> +		#interrupt-cells =3D <1>;
> +		interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH 7>;
> +		irqs =3D <(AIC_IRQ_MASK(AIC_IRQ1_PMC) |
> +			 AIC_IRQ_MASK(AIC_IRQ1_PIT) |
> +			 AIC_IRQ_MASK(AIC_IRQ1_DBGU) |
> +			 AIC_IRQ_MASK(AIC_IRQ1_RTT) |
> +			 AIC_IRQ_MASK(AIC_IRQ1_WATCHDOG) |
> +			 AIC_IRQ_MASK(AIC_IRQ1_RSTC))>;
> +	};
> +

Yep, with the modification that you suggested in "Re: [PATCH v2 4/5]
ARM: at91/dt: add AIC irq1 muxed peripheral id definitions" it would be
even simpler.

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

>  	i2c@0 {
>  		compatible =3D "i2c-gpio";
>  		gpios =3D <&pioA 23 GPIO_ACTIVE_HIGH /* sda */
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
