From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: at91/dt: sama5d4 xplained: don't disable hsmci
 regulator
Date: Tue, 22 Mar 2016 11:55:19 +0100
Message-ID: <56F12497.8080602@atmel.com>
References: <1457692516-3151-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457692516-3151-1-git-send-email-ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 11/03/2016 11:35, Ludovic Desroches a =E9crit :
> If enabling the hsmci regulator on card detection, the board can rebo=
ot
> on sd card insertion. Keeping the regulator always enabled fixes this
> issue.
>=20
> Signed-off-by: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Fixes: 8d545f32bd77 ("ARM: at91/dt: sama5d4 xplained: add regulators =
for
> v(q)mmc1 supplies")
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org #4.3 and later

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

And changed the $subject prefix to the new convention:
"ARM: dts: at91:"

Thanks, bye.

> ---
>  arch/arm/boot/dts/at91-sama5d4_xplained.dts | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/boot/dts/at91-sama5d4_xplained.dts b/arch/arm/b=
oot/dts/at91-sama5d4_xplained.dts
> index 569026e..da84e65 100644
> --- a/arch/arm/boot/dts/at91-sama5d4_xplained.dts
> +++ b/arch/arm/boot/dts/at91-sama5d4_xplained.dts
> @@ -268,5 +268,6 @@
>  		regulator-min-microvolt =3D <3300000>;
>  		regulator-max-microvolt =3D <3300000>;
>  		vin-supply =3D <&vcc_3v3_reg>;
> +		regulator-always-on;
>  	};
>  };
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
