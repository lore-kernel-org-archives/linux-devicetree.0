From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFT 4/4] ARM: dts: imx28-tx28: fix dtc warning
Date: Sun, 5 Jun 2016 11:05:47 -0300
Message-ID: <CAOMZO5DFYg2t44wEdUF+UWhTeDEMMWnjjaQDwLztMAW5Q8UnwA@mail.gmail.com>
References: <1465134747-13536-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465134747-13536-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 5, 2016 at 10:52 AM, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> wrote:
> This fixes the following dtc warning by removing the unnecessary unit:
>
> Warning (unit_address_vs_reg): Node /matrix-keypad@0 has a unit name,
> but no reg property
>
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx28-tx28.dts |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/imx28-tx28.dts b/arch/arm/boot/dts/imx28-tx28.dts
> index fd20e99..0ebbc83 100644
> --- a/arch/arm/boot/dts/imx28-tx28.dts
> +++ b/arch/arm/boot/dts/imx28-tx28.dts
> @@ -173,7 +173,7 @@
>                 default-brightness-level = <50>;
>         };
>
> -       matrix_keypad: matrix-keypad@0 {
> +       matrix_keypad: matrix-keypad {
>                 compatible = "gpio-matrix-keypad";
>                 col-gpios = <
>                         &gpio5 0 GPIO_ACTIVE_HIGH

Looks good. Adding Marek on Cc.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
