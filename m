From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] ARM: dts: at91: sama5d2 Xplained: Correct the macb irq
 pinctrl node
Date: Tue, 1 Mar 2016 10:48:05 +0100
Message-ID: <56D56555.1030703@atmel.com>
References: <1455790866-13301-1-git-send-email-romain.izard.pro@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1455790866-13301-1-git-send-email-romain.izard.pro@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Romain Izard <romain.izard.pro@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, Linux GPIO List <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Le 18/02/2016 11:21, Romain Izard a =C3=A9crit :
> All pinctrl nodes for the Atmel pinctrl controller need to have their
> bias configuration explicitly defined. Otherwise, the pinctrl mapping
> is not valid.
>=20
> It works for now as the pinctrl driver proceeds even with invalid
> mappings, but this can become an issue, if the pinctrl driver starts
> to require valid mappings. Additionally, the pin is not protected fro=
m
> being remapped later by an other driver.
>=20
> There is an external 1k=E2=84=A6 pull-up to 3.3V, so no bias is requi=
red on
> the Ethernet PHY's interrupt line.
>=20
> Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

And queued on at91-4.5-dt.

Thanks! Bye,

> ---
>  arch/arm/boot/dts/at91-sama5d2_xplained.dts | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/boot/dts/at91-sama5d2_xplained.dts b/arch/arm/b=
oot/dts/at91-sama5d2_xplained.dts
> index e683856c507c..75341eec2dfd 100644
> --- a/arch/arm/boot/dts/at91-sama5d2_xplained.dts
> +++ b/arch/arm/boot/dts/at91-sama5d2_xplained.dts
> @@ -308,6 +308,7 @@
> =20
>  				pinctrl_macb0_phy_irq: macb0_phy_irq {
>  					pinmux =3D <PIN_PC9__GPIO>;
> +					bias-disable;
>  				};
> =20
>  				pinctrl_pdmic_default: pdmic_default {
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
