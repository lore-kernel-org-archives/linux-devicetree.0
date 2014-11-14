From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 1/3] ARM: mediatek: Add basic support for mt6592
Date: Fri, 14 Nov 2014 13:55:51 +0100
Message-ID: <CABuKBeKiXn6=xdTYKWea3M=w6+0FfLeWFZtjVkfdyUSR3SfNsA@mail.gmail.com>
References: <1415942094-11451-1-git-send-email-ibanezchen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415942094-11451-1-git-send-email-ibanezchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Howard Chen <ibanezchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2014-11-14 6:14 GMT+01:00 Howard Chen <ibanezchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> * A dtsi for boards based on Mediatek MT6592 SoCs
> * Compatible string in arch/arm/mach-mediatek/mediatek.c
>
> Signed-off-by: Howard Chen <ibanezchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

I applied the whole series [0].
Thanks.

[0] https://github.com/mbgg/linux-mediatek/commits/v3.19-next/dts

> ---
>  arch/arm/boot/dts/mt6592.dtsi     | 97 +++++++++++++++++++++++++++++++++++++++
>  arch/arm/mach-mediatek/mediatek.c |  1 +
>  2 files changed, 98 insertions(+)
>  create mode 100644 arch/arm/boot/dts/mt6592.dtsi
>
> diff --git a/arch/arm/boot/dts/mt6592.dtsi b/arch/arm/boot/dts/mt6592.dtsi
> new file mode 100644
> index 0000000..65aa81b
> --- /dev/null
> +++ b/arch/arm/boot/dts/mt6592.dtsi
> @@ -0,0 +1,97 @@
> +/*
> + * Copyright (c) 2014 MediaTek Inc.
> + * Author: Howard Chen <ibanezchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include "skeleton.dtsi"
> +
> +/ {
> +       compatible = "mediatek,mt6592";
> +       interrupt-parent = <&gic>;
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a7";
> +                       reg = <0x0>;
> +               };
> +               cpu@1 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a7";
> +                       reg = <0x1>;
> +               };
> +               cpu@2 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a7";
> +                       reg = <0x2>;
> +               };
> +               cpu@3 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a7";
> +                       reg = <0x3>;
> +               };
> +               cpu@4 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a7";
> +                       reg = <0x4>;
> +               };
> +               cpu@5 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a7";
> +                       reg = <0x5>;
> +               };
> +               cpu@6 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a7";
> +                       reg = <0x6>;
> +               };
> +               cpu@7 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a7";
> +                       reg = <0x7>;
> +               };
> +       };
> +
> +       system_clk: dummy13m {
> +               compatible = "fixed-clock";
> +               clock-frequency = <13000000>;
> +               #clock-cells = <0>;
> +       };
> +
> +       rtc_clk: dummy32k {
> +               compatible = "fixed-clock";
> +               clock-frequency = <32000>;
> +               #clock-cells = <0>;
> +       };
> +
> +       timer: timer@10008000 {
> +               compatible = "mediatek,mt6577-timer";
> +               reg = <0x10008000 0x80>;
> +               interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&system_clk>, <&rtc_clk>;
> +               clock-names = "system-clk", "rtc-clk";
> +       };
> +
> +       gic: interrupt-controller@10211000 {
> +               compatible = "arm,cortex-a7-gic";
> +               interrupt-controller;
> +               #interrupt-cells = <3>;
> +               reg = <0x10211000 0x1000>,
> +                     <0x10212000 0x1000>;
> +       };
> +
> +};
> diff --git a/arch/arm/mach-mediatek/mediatek.c b/arch/arm/mach-mediatek/mediatek.c
> index f2acf07..88e4626 100644
> --- a/arch/arm/mach-mediatek/mediatek.c
> +++ b/arch/arm/mach-mediatek/mediatek.c
> @@ -19,6 +19,7 @@
>
>  static const char * const mediatek_board_dt_compat[] = {
>         "mediatek,mt6589",
> +       "mediatek,mt6592",
>         NULL,
>  };
>
> --
> 1.9.1
>



-- 
motzblog.wordpress.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
