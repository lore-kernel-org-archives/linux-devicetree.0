From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6ul-pico-hobbit: add adc081c support
Date: Wed, 31 Aug 2016 12:06:50 -0300
Message-ID: <CAOMZO5Ce5vOD26dgbExxq9MfMsbXoWZ271JHWy47ogLSmuy6UA@mail.gmail.com>
References: <1472646394-23772-1-git-send-email-wente.wang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472646394-23772-1-git-send-email-wente.wang-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Winter Wang <wente.wang-3arQi8VN3Tc@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Winter,

On Wed, Aug 31, 2016 at 9:26 AM, Winter Wang <wente.wang-3arQi8VN3Tc@public.gmane.org> wrote:
> enable ADC081C on pico-hobbit
>
> Change-Id: Ib1575b50dcf32b74abe0ab618ddc55999d19ee47

Please remove this line.

> Signed-off-by: Winter Wang <wente.wang-3arQi8VN3Tc@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6ul-pico-hobbit.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
> index c72ee8b..b400582 100644
> --- a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
> +++ b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
> @@ -220,6 +220,12 @@
>                         };
>                 };
>         };
> +
> +       adc: adc081c {
> +               compatible = "ti,adc081c";
> +               reg = <0x50>;
> +               vref-supply = <&reg_3p3v>;
> +       };

You missed the @50:

adc: adc081@50
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
