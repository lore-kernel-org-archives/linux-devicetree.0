From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v10 2/3] arm: dts: add Nuvoton NPCM750 device tree
Date: Thu, 15 Feb 2018 13:09:35 +1030
Message-ID: <CACPK8XeU=6SooAka-eQTp1938CmMTDgA-dOP8Wur=+EzQ6Lpfw@mail.gmail.com>
References: <20180213200959.160157-1-brendanhiggins@google.com> <20180213200959.160157-3-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180213200959.160157-3-brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Tomer Maimon <tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Avi Fishman <avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, julien.thierry-5wv7dgnIgG8@public.gmane.org, Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, OpenBMC Maillist <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 14, 2018 at 6:39 AM, Brendan Higgins
<brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:

> +       ahb {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               compatible = "simple-bus";
> +               interrupt-parent = <&gic>;
> +               ranges;
> +
> +               clk: clock-controller@f0801000 {
> +                       compatible = "nuvoton,npcm750-clk";
> +                       #clock-cells = <1>;
> +                       reg = <0xf0801000 0x1000>;
> +                       status = "okay";

Nit: The ok is redundant.

> +               };
> +
> +               apb {
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       compatible = "simple-bus";
> +                       interrupt-parent = <&gic>;
> +                       ranges = <0x0 0xf0000000 0x00300000>;
> +
> +                       timer0: timer@8000 {
> +                               compatible = "nuvoton,npcm750-timer";
> +                               interrupts = <0 32 4>;
> +                               reg = <0x8000 0x1000>;
> +                               clocks = <&clk NPCM7XX_CLK_TIMER>;
> +                       };
> +
> +                       serial0: serial@1000 {
> +                               compatible = "nuvoton,npcm750-uart";
> +                               reg = <0x1000 0x1000>;
> +                               clocks = <&clk NPCM7XX_CLK_UART_CORE>;

I really would like to see this merged, but lets get the last of these
things sorted out first.

The clocks.h that I have in the openbmc tree uses NPCM7XX_CLK_UART. Is
what you have here line up with the latest version of the clk driver
that Tomer posted?

 https://patchwork.kernel.org/patch/10200029/

His driver calls for a header called dt-bindings/clock/nuvoton,npcm7xx-clock.h.

An alternative would be to defer this by using the numbers instead of
#defines here, and omitting the header until the clock patch is
reviewed and merged. I had a similar chicken-egg problem with the
aspeed clk driver.

> +                               interrupts = <0 2 4>;

The irq header provides defines for the first and third cell. These
could instead be:

interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;

> +                               status = "disabled";

Add reg-shift = <2> to all of the uart nodes. This is required now
that we're using the generic 8250 driver.

> +                       };
> +

> --- /dev/null
> +++ b/include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2018 Nuvoton Technology corporation.
> +// Copyright 2018 Google, Inc.
> +
> +#ifndef _DT_BINDINGS_CLK_NPCM7XX_H
> +#define _DT_BINDINGS_CLK_NPCM7XX_H
> +
> +#define NPCM7XX_CLK_PLL0       0
> +#define NPCM7XX_CLK_PLL1       1
> +#define NPCM7XX_CLK_PLL2       2
> +#define NPCM7XX_CLK_GFX                3
> +#define NPCM7XX_CLK_APB1       4
> +#define NPCM7XX_CLK_APB2       5
> +#define NPCM7XX_CLK_APB3       6
> +#define NPCM7XX_CLK_APB4       7
> +#define NPCM7XX_CLK_APB5       8
> +#define NPCM7XX_CLK_MC         9
> +#define NPCM7XX_CLK_CPU                10
> +#define NPCM7XX_CLK_SPI0       11
> +#define NPCM7XX_CLK_SPI3       12
> +#define NPCM7XX_CLK_SPIX       13
> +#define NPCM7XX_CLK_UART_CORE  14
> +#define NPCM7XX_CLK_TIMER      15
> +#define NPCM7XX_CLK_HOST_UART  16
> +#define NPCM7XX_CLK_MMC                17
> +#define NPCM7XX_CLK_SDHC       18
> +#define NPCM7XX_CLK_ADC                19
> +#define NPCM7XX_CLK_GFX_MEM    20
> +#define NPCM7XX_CLK_USB_BRIDGE 21
> +#define NPCM7XX_CLK_AXI                22
> +#define NPCM7XX_CLK_AHB                23
> +#define NPCM7XX_CLK_EMC                24
> +#define NPCM7XX_CLK_GMAC       25
> +
> +#endif
> --
> 2.16.0.rc1.238.g530d649a79-goog
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
