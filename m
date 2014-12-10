From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: at91/dt: sama5d3: move wm8904 codec to i2c1
Date: Wed, 10 Dec 2014 10:24:35 +0100
Message-ID: <54881153.3050400@atmel.com>
References: <1418122486-23184-1-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418122486-23184-1-git-send-email-josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 09/12/2014 11:54, Josh Wu a =E9crit :
> Since from rev.D MB, the wm8904 is moved to i2c1.
> This patch will adapt to this change.

I'd like a more generic way of dealing with board revisions. So, let's
keep it like it is for now.

Bye,


> Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sama5d3xmb.dtsi | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/sama5d3xmb.dtsi b/arch/arm/boot/dts/sa=
ma5d3xmb.dtsi
> index 49c10d3..74bc633 100644
> --- a/arch/arm/boot/dts/sama5d3xmb.dtsi
> +++ b/arch/arm/boot/dts/sama5d3xmb.dtsi
> @@ -38,12 +38,7 @@
>  				atmel,clk-from-rk-pin;
>  			};
> =20
> -			/*
> -			 * i2c0 conflicts with ISI:
> -			 * disable it to allow the use of ISI
> -			 * can not enable audio when i2c0 disabled
> -			 */
> -			i2c0: i2c@f0014000 {
> +			i2c1: i2c@f0018000 {
>  				wm8904: wm8904@1a {
>  					compatible =3D "wm8904";
>  					reg =3D <0x1a>;
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
