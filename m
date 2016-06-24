From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 06/14] ARM: dts: sun8i: Add cpu0 label to sun8i-h3.dtsi
Date: Fri, 24 Jun 2016 11:48:23 +0800
Message-ID: <CAGb2v66eskVAxdz8VtjBJBCO7VV9WL4bdFDVrPWrSmxk4RASCw@mail.gmail.com>
References: <20160623192104.18720-1-megous@megous.com> <20160623192104.18720-7-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160623192104.18720-7-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Cc: dev <dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 24, 2016 at 3:20 AM,  <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> wrote:
> From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
>
> Add label to the first cpu so that it can be referenced
> from derived dts files.
>
> Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
> index 9938972..82faefc 100644
> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> @@ -52,7 +52,7 @@
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
> -               cpu@0 {
> +               cpu0: cpu@0 {
>                         compatible = "arm,cortex-a7";
>                         device_type = "cpu";
>                         reg = <0>;

Can you also set the cpu clock here? It is part of the SoC
and does not belong in the board DTS files.

Otherwise this one looks good.

ChenYu

> --
> 2.9.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
