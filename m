From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: at91/dt: sam9263: Add missing clocks to ac97
 node
Date: Wed, 10 Dec 2014 11:05:49 +0100
Message-ID: <54881AFD.2090007@atmel.com>
References: <1417789016-20001-1-git-send-email-alexanders83@web.de> <1417789016-20001-2-git-send-email-alexanders83@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417789016-20001-2-git-send-email-alexanders83-S0/GAf8tV78@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 05/12/2014 15:16, Alexander Stein a =E9crit :
> The clock node specifying 'ac97_clk' was missing.
>=20
> Signed-off-by: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
> ---
>  arch/arm/boot/dts/at91sam9263.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/at91sam9263.dtsi b/arch/arm/boot/dts/a=
t91sam9263.dtsi
> index 5ed2810..2d9d0ad 100644
> --- a/arch/arm/boot/dts/at91sam9263.dtsi
> +++ b/arch/arm/boot/dts/at91sam9263.dtsi
> @@ -821,6 +821,8 @@
>  				interrupts =3D <18 IRQ_TYPE_LEVEL_HIGH 5>;
>  				pinctrl-names =3D "default";
>  				pinctrl-0 =3D <&pinctrl_ac97>;
> +				clocks =3D <&ac97_clk>;
> +				clock-names =3D "ac97_clk";
>  				status =3D "disabled";
>  			};

I see, this one comes after the addition of the node itself. I ignore i=
t.

Bye,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
