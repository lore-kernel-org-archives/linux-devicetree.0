From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] gpio: document how to order GPIO controllers
Date: Tue, 5 Jul 2016 09:05:46 -0500
Message-ID: <20160705140546.GA10601@rob-hp-laptop>
References: <1467355333-8813-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1467355333-8813-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, kernel@pengutronix.de, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 01, 2016 at 08:42:13AM +0200, Uwe Kleine-K=F6nig wrote:
> This uses the same approach that is already used for spi, i2c and
> several other controllers to ensure a consistent numbering independen=
t
> of probe order. This is in use for several gpio drivers that already =
now
> use of_alias_get_id(np, "gpio").

Like SPI and I2C, I'm against further abuse of aliases for this purpose=
=20
[1].

>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>=20
> Linus requested such a patch as part of a change that introduces
> this mechanism to the gpio-omap driver[1]. IMHO this is better done i=
n a
> separate patch, so here it comes.
>=20
> Best regards
> Uwe
>=20
> [1] http://thread.gmane.org/gmane.linux.kernel.gpio/17399/focus=3D176=
29
>=20
>  Documentation/devicetree/bindings/gpio/gpio.txt | 18 +++++++++++++++=
+++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Docume=
ntation/devicetree/bindings/gpio/gpio.txt
> index 68d28f62a6f4..5dbacc8f094a 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -227,6 +227,24 @@ Example of two SOC GPIO banks defined as gpio-co=
ntroller nodes:
>  		#gpio-cells =3D <2>;
>  	};
> =20
> +Usually the GPIO banks in SoCs are ordered, that is there is a dedic=
ated "first
> +gpio bank". To fix this ordering in the device tree use aliases star=
ting at 0
> +(even if the first bank is called "GPIO1" in the hardware reference)=
=2E
> +This is necessary/handy to ensure deterministical numbering of GPIOs=
 and GPIO
> +controllers.

Why is deterministic numbering needed?

Rob

[1] https://lkml.org/lkml/2016/5/24/470
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
