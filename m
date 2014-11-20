From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 15/15] metag: tz1090: add TZ1090 clocks to device tree
Date: Thu, 20 Nov 2014 13:56:24 +0100
Message-ID: <2363265.Y6kZ4TuTy5@diego>
References: <1416438943-11429-1-git-send-email-james.hogan@imgtec.com> <1416438943-11429-16-git-send-email-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416438943-11429-16-git-send-email-james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi James,

interestingly I only got the cover-letter, so had to find the other patches 
through my list-archive :-) .


Am Mittwoch, 19. November 2014, 23:15:43 schrieb James Hogan:
> Enable the common clock framework for the TZ1090 SoC, add a tz1090_clk
> device tree file describing the clocks, and connect the Meta core clock
> so that the rate of the Meta timer can be determined.
> 
> Most of the clock tree is described apart from some AFE clocks which
> aren't usually of much interest to Linux. These are represented with
> placeholder clocks.
> 
> Signed-off-by: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---


I don't know enough about your clock structure, but it looks quite a bit like 
Mike's mail from May [0] may apply here too.

The register layout also suggests that it is indeed one clock ip-block:

0x02005908 0x4	CR_TOP_CLKSWITCH 
0x0200590c 0x4	CR_TOP_CLKENAB
0x02005950 0x4	CR_TOP_SYSPLL_CTL0
0x02005954 0x4	CR_TOP_SYSPLL_CTL1
0x02005988 0x4	CR_TOP_CLKSWITCH2
0x0200598c 0x4	CR_TOP_CLKENAB2
...


[0] https://lkml.org/lkml/2014/5/14/715



>  arch/metag/Kconfig.soc              |   1 +
>  arch/metag/boot/dts/tz1090.dtsi     |   4 +
>  arch/metag/boot/dts/tz1090_clk.dtsi | 784
> ++++++++++++++++++++++++++++++++++++ 3 files changed, 789 insertions(+)
>  create mode 100644 arch/metag/boot/dts/tz1090_clk.dtsi
> 
> diff --git a/arch/metag/Kconfig.soc b/arch/metag/Kconfig.soc
> index 973640f..93c21c3 100644
> --- a/arch/metag/Kconfig.soc
> +++ b/arch/metag/Kconfig.soc
> @@ -17,6 +17,7 @@ config META21_FPGA
>  config SOC_TZ1090
>  	bool "Toumaz Xenif TZ1090 SoC (Comet)"
>  	select ARCH_WANT_OPTIONAL_GPIOLIB
> +	select COMMON_CLK
>  	select IMGPDC_IRQ
>  	select METAG_LNKGET_AROUND_CACHE
>  	select METAG_META21
> diff --git a/arch/metag/boot/dts/tz1090.dtsi
> b/arch/metag/boot/dts/tz1090.dtsi index 24ea7d2..9e8ef8b 100644
> --- a/arch/metag/boot/dts/tz1090.dtsi
> +++ b/arch/metag/boot/dts/tz1090.dtsi
> @@ -9,12 +9,16 @@
>  #include "skeleton.dtsi"
> 
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include "tz1090_clk.dtsi"
> 
>  / {
>  	compatible = "toumaz,tz1090", "img,meta";
> 
>  	interrupt-parent = <&intc>;
> 
> +	clocks = <&meta_core_clk>;
> +	clock-names = "core";
> +
>  	intc: interrupt-controller {
>  		compatible = "img,meta-intc";
>  		interrupt-controller;
> diff --git a/arch/metag/boot/dts/tz1090_clk.dtsi
> b/arch/metag/boot/dts/tz1090_clk.dtsi new file mode 100644
> index 0000000..e21362d
> --- /dev/null
> +++ b/arch/metag/boot/dts/tz1090_clk.dtsi
> @@ -0,0 +1,784 @@
> +/*
> + * Copyright (C) 2013 Imagination Technologies Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +/*
> + * ============ CLOCK SPECIFIER DEFINITIONS ============
> + */
> +
> +#define CLK_XTAL1_DIV	&pdc_clk	0
> +#define CLK_32KHZ	&pdc_clk	1
> +
> +#define CLK_SYSCLK0_SW	&top_clkswitch	0	/* bit 0 */

I think the more established way is to specify only the index bit as named 
constant, not the whole phandle+index.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
