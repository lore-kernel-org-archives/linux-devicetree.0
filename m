Return-Path: <daniel@zonque.org>
Message-ID: <534FB2CE.4050503@zonque.org>
Date: Thu, 17 Apr 2014 12:54:06 +0200
From: Daniel Mack <daniel@zonque.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 08/21] ARM: pxa27x: device tree support ICP DAS LP-8x4x
References: <1397668411-27162-7-git-send-email-ynvich@gmail.com> <1397668667-27328-1-git-send-email-ynvich@gmail.com> <1397668667-27328-2-git-send-email-ynvich@gmail.com>
In-Reply-To: <1397668667-27328-2-git-send-email-ynvich@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Sergei Ianovich <ynvich@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@arm.linux.org.uk>, Eric Miao <eric.y.miao@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Florian Vaussard <florian.vaussard@epfl.ch>, Jonathan Cameron <jic23@kernel.org>, Shawn Guo <shawn.guo@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Silvio F <silvio.fricke@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open@mail.zonque.de, list@mail.zonque.de, DOCUMENTATION <linux-doc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 04/16/2014 07:17 PM, Sergei Ianovich wrote:
> diff --git a/arch/arm/mach-pxa/pxa27x-dt.c b/arch/arm/mach-pxa/pxa27x-dt.c
> new file mode 100644
> index 0000000..865cf46
> --- /dev/null
> +++ b/arch/arm/mach-pxa/pxa27x-dt.c
> @@ -0,0 +1,64 @@
> +/*
> + *  linux/arch/arm/mach-pxa/pxa27x-dt.c
> + *
> + *  Copyright (C) 2013 Sergei Ianovich
> + *
> + *  based mostly on linux/arch/arm/mach-pxa/pxa-dt.c by Daniel Mack
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 as
> + *  publishhed by the Free Software Foundation.
> + */
> +
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <asm/io.h>
> +#include <asm/mach/arch.h>
> +#include <asm/mach/time.h>
> +#include <mach/irqs.h>
> +#include <mach/pxa27x.h>
> +
> +#include "generic.h"
> +
> +#ifdef CONFIG_PXA27x
> +static const struct of_dev_auxdata pxa27x_auxdata_lookup[] __initconst = {
> +	OF_DEV_AUXDATA("mrvl,pxa-uart",	    0x40100000, "pxa2xx-uart.0", NULL),
> +	OF_DEV_AUXDATA("mrvl,pxa-uart",	    0x40200000, "pxa2xx-uart.1", NULL),
> +	OF_DEV_AUXDATA("mrvl,pxa-uart",	    0x40700000, "pxa2xx-uart.2", NULL),
> +	OF_DEV_AUXDATA("mrvl,pxa-uart",	    0x41600000, "pxa2xx-uart.3", NULL),
> +	OF_DEV_AUXDATA("marvell,pxa-mmc",   0x41100000, "pxa2xx-mci.0", NULL),
> +	OF_DEV_AUXDATA("intel,pxa27x-gpio", 0x40e00000, "pxa27x-gpio", NULL),
> +	OF_DEV_AUXDATA("marvell,pxa-ohci",  0x4c000000, "pxa27x-ohci", NULL),
> +	OF_DEV_AUXDATA("mrvl,pxa-i2c",	    0x40301680, "pxa2xx-i2c.0", NULL),
> +	{}
> +};

This patch should be split into a generic pxa27x part and one for your
platform. The former should also include the changes to pxa27x.dtsi.


Thanks,
Daniel
