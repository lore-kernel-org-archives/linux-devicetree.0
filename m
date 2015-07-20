From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: at91: sama5/dt: update rstc to correct compatible
 string
Date: Mon, 20 Jul 2015 14:37:47 +0200
Message-ID: <55ACEB9B.70901@atmel.com>
References: <1437384726-24927-1-git-send-email-josh.wu@atmel.com> <1437384726-24927-2-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437384726-24927-2-git-send-email-josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 20/07/2015 11:32, Josh Wu a =E9crit :
> They'll use "atmel,sama5d3-rstc" for reset function.
>=20
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

And we'll have to synchronize with the other patches. The best way to
deal with that can be to take both of them with us through arm-soc.

Sebastian,

1/ as you weren't in the CC list of the original patch, do you want me
to re-send the whole series?

2/ can we take these driver's changes with use through the arm-soc git
tree so that we can manage the synchronization better?

Thanks, bye,

> ---
>=20
> Changes in v2: None
>=20
>  arch/arm/boot/dts/sama5d3.dtsi | 2 +-
>  arch/arm/boot/dts/sama5d4.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5=
d3.dtsi
> index 9e2444b..280255b 100644
> --- a/arch/arm/boot/dts/sama5d3.dtsi
> +++ b/arch/arm/boot/dts/sama5d3.dtsi
> @@ -1259,7 +1259,7 @@
>  			};
> =20
>  			rstc@fffffe00 {
> -				compatible =3D "atmel,at91sam9g45-rstc";
> +				compatible =3D "atmel,sama5d3-rstc";
>  				reg =3D <0xfffffe00 0x10>;
>  			};
> =20
> diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5=
d4.dtsi
> index 3ee22ee..481196c 100644
> --- a/arch/arm/boot/dts/sama5d4.dtsi
> +++ b/arch/arm/boot/dts/sama5d4.dtsi
> @@ -1277,7 +1277,7 @@
>  			};
> =20
>  			rstc@fc068600 {
> -				compatible =3D "atmel,at91sam9g45-rstc";
> +				compatible =3D "atmel,sama5d3-rstc";
>  				reg =3D <0xfc068600 0x10>;
>  			};
> =20
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
