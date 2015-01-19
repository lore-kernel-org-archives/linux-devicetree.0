From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/3] ARM: at91/dt: sama5d4: add pioD controller
Date: Mon, 19 Jan 2015 11:46:20 +0100
Message-ID: <54BCE07C.8060601@atmel.com>
References: <1421422267-2934-1-git-send-email-ludovic.desroches@atmel.com> <1421422267-2934-3-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421422267-2934-3-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 16/01/2015 16:31, Ludovic Desroches a =E9crit :
> PioD controller was not described in the device tree since we don't u=
se
> it. As pinctrl-at91 allows disabled gpio controllers in the device
> tree, we can add it to complete the device description.
>=20
> Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Linus,

As there is no dependency with the other patches in the series, I can
take this patch or you can keep it together with the other ones. Just
tell me once we agree all on a solution.

Bye,


> ---
>  arch/arm/boot/dts/sama5d4.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5=
d4.dtsi
> index 1b0f30c..368973e 100644
> --- a/arch/arm/boot/dts/sama5d4.dtsi
> +++ b/arch/arm/boot/dts/sama5d4.dtsi
> @@ -62,6 +62,7 @@
>  		gpio0 =3D &pioA;
>  		gpio1 =3D &pioB;
>  		gpio2 =3D &pioC;
> +		gpio3 =3D &pioD;
>  		gpio4 =3D &pioE;
>  		tcb0 =3D &tcb0;
>  		tcb1 =3D &tcb1;
> @@ -1111,6 +1112,18 @@
>  					clocks =3D <&pioC_clk>;
>  				};
> =20
> +				pioD: gpio@fc068000 {
> +					compatible =3D "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio"=
;
> +					reg =3D <0xfc068000 0x100>;
> +					interrupts =3D <5 IRQ_TYPE_LEVEL_HIGH 1>;
> +					#gpio-cells =3D <2>;
> +					gpio-controller;
> +					interrupt-controller;
> +					#interrupt-cells =3D <2>;
> +					clocks =3D <&pioD_clk>;
> +					status =3D "disabled";
> +				};
> +
>  				pioE: gpio@fc06d000 {
>  					compatible =3D "atmel,at91sam9x5-gpio", "atmel,at91rm9200-gpio"=
;
>  					reg =3D <0xfc06d000 0x100>;
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
