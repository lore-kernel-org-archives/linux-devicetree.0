From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: meson: Add status LED for Odroid-C1
Date: Mon, 12 Oct 2015 21:15:42 +0200
Message-ID: <CAOQ7t2b050HE10hdPprWwnpbCkx5b4APxexwtsSWtJ7zcX_exw@mail.gmail.com>
References: <1444401430-4396-1-git-send-email-edward.cragg@codethink.co.uk>
	<1444401430-4396-2-git-send-email-edward.cragg@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444401430-4396-2-git-send-email-edward.cragg-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Edward Cragg <edward.cragg-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 9, 2015 at 4:37 PM, Edward Cragg
<edward.cragg-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org> wrote:
> Add the blue status LED to the Hardkernel Odroid C1 board DTS.
> This is the only programmable LED on the board.
>
> Signed-off-by: Edward Cragg <edward.cragg-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> ---
>  arch/arm/boot/dts/meson8b-odroidc1.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
> index a8e2911..3b03523 100644
> --- a/arch/arm/boot/dts/meson8b-odroidc1.dts
> +++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
> @@ -1,6 +1,8 @@
>  /*
>   * Copyright 2015 Endless Mobile, Inc.
>   * Author: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> + * Copyright 2015 Codethink Ltd.
> + * Author: Edward Cragg <edward.cragg-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>

Usually we do not add a copyright line for each small addition to the DTS.

>   *
>   * This file is dual-licensed: you can use it either under the terms
>   * of the GPL or the X11 license, at your option. Note that this dual
> @@ -46,6 +48,7 @@
>
>  /dts-v1/;
>  #include "meson8b.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>
>  / {
>         model = "Hardkernel ODROID-C1";
> @@ -58,6 +61,16 @@
>         memory {
>                 reg = <0x40000000 0x40000000>;
>         };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +               blue {
> +                       label = "c1:blue:alive";
> +                       gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
> +                       linux,default-trigger = "heartbeat";
> +                       default-state = "off";
> +               };
> +       };
>  };

otherwise Acked-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
