From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: at91/dt: sam9263: Add missing clocks to lcdc
 node
Date: Mon, 12 Jan 2015 14:50:25 +0100
Message-ID: <54B3D121.3010308@atmel.com>
References: <1417786299-14026-1-git-send-email-alexanders83@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417786299-14026-1-git-send-email-alexanders83-S0/GAf8tV78@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 05/12/2014 14:31, Alexander Stein a =E9crit :
> atmel_lcdfb needs also uses hclk clock, but AT91SAM9263 doesn't have =
that
> specific clock, so use lcd_clk twice. The same is done in
> arch/arm/mach-at91/at91sam9263.c
>=20
> Signed-off-by: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

With modification by Alexandre, stacked on at91-3.19-fixes.
Thanks, bye.

> ---
>  arch/arm/boot/dts/at91sam9263.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/at91sam9263.dtsi b/arch/arm/boot/dts/a=
t91sam9263.dtsi
> index 635f871..7989756 100644
> --- a/arch/arm/boot/dts/at91sam9263.dtsi
> +++ b/arch/arm/boot/dts/at91sam9263.dtsi
> @@ -932,6 +932,8 @@
>  			interrupts =3D <26 IRQ_TYPE_LEVEL_HIGH 3>;
>  			pinctrl-names =3D "default";
>  			pinctrl-0 =3D <&pinctrl_fb>;
> +			clocks =3D <&lcd_clk>, <&lcd_clk>;
> +			clock-names =3D "lcdc_clk", "hclk";
>  			status =3D "disabled";
>  		};
> =20
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
