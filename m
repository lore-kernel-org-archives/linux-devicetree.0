From: Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: bcm476x: Add stub clock driver
Date: Fri, 12 Oct 2012 07:52:21 -0700
Message-ID: <20121012145221.2941.35101@nucleus>
References: <20121007015300.828366635@gmail.com>
 <20121007015407.154476821@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121007015407.154476821-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Domenico Andreoli <cavokz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Domenico Andreoli (2012-10-06 18:53:04)
> Index: b/drivers/clk/clk-bcm476x.c
> ===================================================================
> --- /dev/null
> +++ b/drivers/clk/clk-bcm476x.c
> @@ -0,0 +1,52 @@
> +/*
> + * Broadcom BCM476x SoCs clocks
> + *
> + * Copyright (C) 2011-2012 Domenico Andreoli <domenico.andreoli-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-private.h>

Why clk-private.h?  That is deprecated and should not be used unless
absolutely necessary.  It will be removed once Tegra and OMAP stop using
it.

> +#include <linux/clk-provider.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk/bcm476x.h>
> +
> +/*
> + * These are fixed clocks (and device tree doesn't support clk!).
> + *
> + * They're probably not all root clocks and it may be possible to
> + * turn them on and off but until this is mapped out better it's
> + * the only way they can be used.
> + */
> +DEFINE_CLK_FIXED_RATE(sys_pclk,   CLK_IS_ROOT, 312000000, 0);
> +DEFINE_CLK_FIXED_RATE(apb_pclk,   CLK_IS_ROOT, 156000000, 0);
> +DEFINE_CLK_FIXED_RATE(uart0_pclk, CLK_IS_ROOT, 78000000, 0);
> +DEFINE_CLK_FIXED_RATE(uart1_pclk, CLK_IS_ROOT, 78000000, 0);
> +DEFINE_CLK_FIXED_RATE(uart2_pclk, CLK_IS_ROOT, 78000000, 0);
> +

Can you use clk_register_fixed_rate instead?

Regards,
Mike
