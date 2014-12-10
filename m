From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: at91/dt: sama5d3: enable D2 as the heartbeat
 LED
Date: Wed, 10 Dec 2014 11:00:10 +0100
Message-ID: <548819AA.6000100@atmel.com>
References: <1418122486-23184-1-git-send-email-josh.wu@atmel.com> <1418122486-23184-2-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418122486-23184-2-git-send-email-josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 09/12/2014 11:54, Josh Wu a =E9crit :
> This D2 led is aviable for all sama5d3x-ek board. So make it as
> heartbeat led.
>=20
> Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

and queued on at91-3.20-dt. Thanks, bye.


> ---
>  arch/arm/boot/dts/sama5d3xcm.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/boot/dts/sama5d3xcm.dtsi b/arch/arm/boot/dts/sa=
ma5d3xcm.dtsi
> index 962dc28..5a57c45 100644
> --- a/arch/arm/boot/dts/sama5d3xcm.dtsi
> +++ b/arch/arm/boot/dts/sama5d3xcm.dtsi
> @@ -122,6 +122,7 @@
>  		d2 {
>  			label =3D "d2";
>  			gpios =3D <&pioE 25 GPIO_ACTIVE_LOW>;	/* PE25, conflicts with A25=
, RXD2 */
> +			linux,default-trigger =3D "heartbeat";
>  		};
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
