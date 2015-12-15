From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: at91/dt: sama5d2: add watchdog node
Date: Tue, 15 Dec 2015 11:14:18 +0100
Message-ID: <566FE7FA.6040300@atmel.com>
References: <1446709170-24500-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446709170-24500-1-git-send-email-wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 05/11/2015 08:39, Wenyou Yang a =E9crit :
> Add watchdog node to support SAMA5D4 watchdog.
>=20
> Signed-off-by: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

And stacked on top of at91-4.5-dt.

Thanks!

> ---
>=20
>  arch/arm/boot/dts/at91-sama5d2_xplained.dts |    4 ++++
>  arch/arm/boot/dts/sama5d2.dtsi              |    7 +++++++
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/at91-sama5d2_xplained.dts b/arch/arm/b=
oot/dts/at91-sama5d2_xplained.dts
> index e07c2b2..de3ef02 100644
> --- a/arch/arm/boot/dts/at91-sama5d2_xplained.dts
> +++ b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
> @@ -181,6 +181,10 @@
>  				};
>  			};
> =20
> +			watchdog@f8048040 {
> +				status =3D "okay";
> +			};
> +
>  			uart3: serial@fc008000 {
>  				pinctrl-names =3D "default";
>  				pinctrl-0 =3D <&pinctrl_uart3_default>;
> diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5=
d2.dtsi
> index c1f0cba..c29ff70 100644
> --- a/arch/arm/boot/dts/sama5d2.dtsi
> +++ b/arch/arm/boot/dts/sama5d2.dtsi
> @@ -929,6 +929,13 @@
>  				clocks =3D <&h32ck>;
>  			};
> =20
> +			watchdog@f8048040 {
> +				compatible =3D "atmel,sama5d4-wdt";
> +				reg =3D <0xf8048040 0x10>;
> +				interrupts =3D <4 IRQ_TYPE_LEVEL_HIGH 7>;
> +				status =3D "disabled";
> +			};
> +
>  			sckc@f8048050 {
>  				compatible =3D "atmel,at91sam9x5-sckc";
>  				reg =3D <0xf8048050 0x4>;
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
