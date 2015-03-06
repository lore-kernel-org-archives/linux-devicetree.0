From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pinctrl: dt: at91: new binding
Date: Fri, 6 Mar 2015 16:08:46 +0100
Message-ID: <54F9C2FE.8060804@atmel.com>
References: <1424943294-8805-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424943294-8805-1-git-send-email-plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 26/02/2015 10:34, Jean-Christophe PLAGNIOL-VILLARD a =E9crit :
> Today if we want to disable a pio bank we may will siliently break pi=
nctrl
> configuration in the DT. This will be detected only at runtime.
>=20
> So move the pinctrl configuration to the bank instead of the bus.
> This allow to detect pinctrl issue at DT compiling time when disable =
a bank.
>=20
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTDQFizaE/u3fw@public.gmane.org=
m>
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  .../bindings/pinctrl/atmel,at91-pinctrl.txt        | 66 ++++++++++++=
++++++++++
>  1 file changed, 66 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pin=
ctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl=
=2Etxt
> index b7a93e8..78355ee 100644
> --- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.tx=
t
> +++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.tx=
t
> @@ -148,3 +148,69 @@ dbgu: serial@fffff200 {
>  	pinctrl-0 =3D <&pinctrl_dbgu>;
>  	status =3D "disabled";
>  };
> +
> +II) New Bindings per PIO Block

Sorry but NACK.

I don't want to manage another flavor of the pinmux biding with no real
benefit. I would have been good if we had it from day-1. Now it's too l=
ate.

Moreover, splitting a binding definition if you have a function given b=
y
multiple banks can be weird and not well understood in regard to our
current group+function definition scheme (Cf. your last example).


> +This allow to detect pinctrl issue at DT compiling time when disable=
 a bank
> +
> +Required properties for iomux controller:
> +- compatible: "atmel,at91rm9200-pio-pinctrl" or "atmel,at91sam9x5-pi=
o-pinctrl"
> +		or "atmel,sama5d3-pio-pinctrl"
> +- atmel,mux-mask: array of mask (periph per bank) to describe if a p=
in can be
> +  configured in this periph mode. All the periph and bank need to be=
 describe.
> +
> +How to create such array:
> +
> +Each column will represent the possible peripheral of the pinctrl fo=
r the bank
> +
> +Take an example on the 9260
> +Peripheral: 2 ( A and B)
> +=3D>
> +
> +  /*    A         B     */
> +  0xffffffff 0xffc00c3b  /* pioA */
> +
> +For each peripheral/bank we will descibe in a u32 if a pin can be
> +configured in it by putting 1 to the pin bit (1 << pin)
> +
> +Required properties for pin configuration node:
> +- atmel,pins: 3 integers array, represents a group of pins mux and c=
onfig
> +  setting. The format is atmel,pins =3D <PIN_NUM PERIPH CONFIG>.
> +  The PERIPH 0 means gpio, PERIPH 1 is periph A, PERIPH 2 is periph =
B...
> +
> +Bits used for CONFIG:
> +cf atmel,at91-pinctrl
> +
> +pioB: gpio@fffff600 {
> +	compatible =3D "atmel,at91rm9200-gpio", "atmel,at91rm9200-pio-pinct=
rl";
> +	reg =3D <0xfffff600 0x200>;
> +	interrupts =3D <3 IRQ_TYPE_LEVEL_HIGH 1>;
> +	#gpio-cells =3D <2>;
> +	gpio-controller;
> +	interrupt-controller;
> +	#interrupt-cells =3D <2>;
> +	clocks =3D <&pioB_clk>;
> +
> +			 /*    A         B     */
> +	atmel,mux-mask =3D <0xffffffff 0x7fff3ccf>;
> +
> +	dbgu {
> +		pinctrl_dbgu: dbgu-0 {
> +			atmel,pins =3D
> +				<14 0x1 0x0	/* PB14 periph A */
> +				 15 0x1 0x1>;	/* PB15 periph A with pullup */
> +		};
> +	};
> +};
> +
> +dbgu: serial@fffff200 {
> +	compatible =3D "atmel,at91sam9260-usart";
> +	reg =3D <0xfffff200 0x200>;
> +	interrupts =3D <1 4 7>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_dbgu>;
> +	status =3D "disabled";
> +};
> +
> +if you have to use multiple bank
> +	pinctrl-0 =3D <&pinctrl_ip_piaa>, <&pinctrl_ip_piab>;
>=20

Best regards,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
