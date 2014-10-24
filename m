From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/3] ARM: mediatek: Add basic support for mt6592
Date: Fri, 24 Oct 2014 15:48:41 +0200
Message-ID: <CABuKBeL3i+tjx_AQg5N+e=2GWgLuBWbt-dY0-Rif6duKsM-X5Q@mail.gmail.com>
References: <1413775401-4501-1-git-send-email-ibanezchen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413775401-4501-1-git-send-email-ibanezchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Howard Chen <ibanezchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2014-10-20 5:23 GMT+02:00 Howard Chen <ibanezchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> * A dtsi for boards based on Mediatek MT6592 SoCs
> * Compatible string in arch/arm/mach-mediatek/mediatek.c
>
> Signed-off-by: Howard Chen <ibanezchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/mt6592.dtsi     | 138 ++++++++++++++++++++++++++++++++++++++
>  arch/arm/mach-mediatek/mediatek.c |   1 +
>  2 files changed, 139 insertions(+)
>  create mode 100644 arch/arm/boot/dts/mt6592.dtsi
>
> diff --git a/arch/arm/boot/dts/mt6592.dtsi b/arch/arm/boot/dts/mt6592.dtsi
> new file mode 100644
> index 0000000..367ba8f
> --- /dev/null
> +++ b/arch/arm/boot/dts/mt6592.dtsi
> @@ -0,0 +1,138 @@
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
> +       uart_clk: uart_clk {
> +               compatible = "fixed-clock";
> +               clock-frequency = <26000000>;
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
> +               compatible = "arm,cortex-a9-gic";

Should be arm,cortex-a7-gic, right?

> +               interrupt-controller;
> +               #interrupt-cells = <3>;
> +               reg = <0x10211000 0x1000>,
> +                         <0x10212000 0x1000>;
> +       };
> +
> +       uart0: serial@11002000 {
> +               compatible = "mediatek,mt6592-uart", "mediatek,mt6577-uart";
> +               reg = <0x11002000 0x400>;
> +               reg-shift = <2>;
> +               interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;

I tried this on v3.18-rc1 but it does not boot for me. I think this
depends on different bootloader on the different platforms.
This is critical for me. Can you send me your intpol register values,
so that I can check with my values when booting the kernel?

> +               clocks = <&uart_clk>;
> +               status = "disabled";
> +       };
> +
> +       uart1: serial@11003000 {
> +               compatible = "mediatek,mt6592-uart", "mediatek,mt6577-uart";
> +               reg = <0x11003000 0x400>;
> +               reg-shift = <2>;
> +               interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&uart_clk>;
> +               status = "disabled";
> +       };
> +
> +       uart2: serial@11004000 {
> +               compatible = "mediatek,mt6592-uart", "mediatek,mt6577-uart";
> +               reg = <0x11004000 0x400>;
> +               reg-shift = <2>;
> +               interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&uart_clk>;
> +               status = "disabled";
> +       };
> +
> +       uart3: serial@11005000 {
> +               compatible = "mediatek,mt6592-uart", "mediatek,mt6577-uart";
> +               reg = <0x11005000 0x400>;
> +               reg-shift = <2>;
> +               interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&uart_clk>;
> +               status = "disabled";
> +       };
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
