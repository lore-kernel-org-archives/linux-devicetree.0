From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/8] ARM: mediatek: Add basic support for mt8127
Date: Mon, 3 Nov 2014 18:53:14 +0100
Message-ID: <CABuKBeLYMbD-dV_25FJd_NE1RgfVkgF+SoCiAx9O9jKUUAcexA@mail.gmail.com>
References: <1413973797-17619-1-git-send-email-yingjoe.chen@mediatek.com>
	<1413973797-17619-2-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413973797-17619-2-git-send-email-yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hsien-Chun Yen <hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, huang eddie <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Nathan Chung <nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yuhau Chen <yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2014-10-22 12:29 GMT+02:00 Joe.C <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
> From: "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>
> This adds a basic dtsi for MT8127 SoC.
>
> Signed-off-by: Joe.C <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/mt8127.dtsi     | 93 +++++++++++++++++++++++++++++++++++++++
>  arch/arm/mach-mediatek/mediatek.c |  1 +
>  2 files changed, 94 insertions(+)
>  create mode 100644 arch/arm/boot/dts/mt8127.dtsi
>
> diff --git a/arch/arm/boot/dts/mt8127.dtsi b/arch/arm/boot/dts/mt8127.dtsi
> new file mode 100644
> index 0000000..25c9f69
> --- /dev/null
> +++ b/arch/arm/boot/dts/mt8127.dtsi
> @@ -0,0 +1,93 @@
> +/*
> + * Copyright (c) 2014 MediaTek Inc.
> + * Author: Joe.C <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
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
> +#include "skeleton64.dtsi"

Cortex a7 is 32 bits, right? So why do you use skeleton64.dtsi?

> +
> +/ {
> +       compatible = "mediatek,mt8127";
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
> +
> +       };
> +
> +       clocks {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               compatible = "simple-bus";
> +               ranges;
> +
> +               system_clk: dummy13m {
> +                       compatible = "fixed-clock";
> +                       clock-frequency = <13000000>;
> +                       #clock-cells = <0>;
> +               };
> +
> +               rtc_clk: dummy32k {
> +                       compatible = "fixed-clock";
> +                       clock-frequency = <32000>;
> +                       #clock-cells = <0>;
> +               };
> +       };
> +
> +       soc {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               compatible = "simple-bus";
> +               ranges;
> +
> +               timer: timer@10008000 {
> +                       compatible = "mediatek,mt8127-timer", "mediatek,mt6577-timer";
> +                       reg = <0 0x10008000 0 0x80>;

This should be "reg = <0x10008000 0x80>;" right?
Same in mt8135.dtsi

> +                       interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&system_clk>, <&rtc_clk>;
> +                       clock-names = "system-clk", "rtc-clk";
> +               };
> +
> +               gic: interrupt-controller@10211000 {
> +                       compatible = "arm,cortex-a7-gic";
> +                       interrupt-controller;
> +                       #interrupt-cells = <3>;
> +                       reg = <0 0x10211000 0 0x1000>,
> +                             <0 0x10212000 0 0x1000>,
> +                             <0 0x10214000 0 0x2000>,
> +                             <0 0x10216000 0 0x2000>;
> +               };
> +       };
> +};
> diff --git a/arch/arm/mach-mediatek/mediatek.c b/arch/arm/mach-mediatek/mediatek.c
> index f2acf07..7f478ce 100644
> --- a/arch/arm/mach-mediatek/mediatek.c
> +++ b/arch/arm/mach-mediatek/mediatek.c
> @@ -19,6 +19,7 @@
>
>  static const char * const mediatek_board_dt_compat[] = {
>         "mediatek,mt6589",
> +       "mediatek,mt8127",
>         NULL,
>  };
>
> --
> 1.8.1.1.dirty
>



-- 
motzblog.wordpress.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
