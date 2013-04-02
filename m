From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v4] clk: add si5351 i2c common clock driver
Date: Tue, 02 Apr 2013 16:46:48 -0700
Message-ID: <20130402234648.8177.86213@quantum>
References: <1363603397-2762-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1364050010-23919-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1364050010-23919-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <thierry.reding@avionic-design.de>, Dom Cobley <popcornmix@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rabeeh Khoury <rabeeh@solid-run.com>, Daniel Mack <zonque@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, Lars-Peter Clausen <lars@metafoo.de>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Sebastian Hesselbarth (2013-03-23 07:46:50)
> diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
> new file mode 100644
> index 0000000..9d0c210
> --- /dev/null
> +++ b/drivers/clk/clk-si5351.c
> @@ -0,0 +1,1411 @@
> +/*
> + * clk-si5351.c: Silicon Laboratories Si5351A/B/C I2C Clock Generator
> + *
> + * Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> + * Rabeeh Khoury <rabeeh@solid-run.com>
> + *
> + * References:
> + * [1] "Si5351A/B/C Data Sheet"
> + *     http://www.silabs.com/Support%20Documents/TechnicalDocs/Si5351.pdf
> + * [2] "Manually Generating an Si5351 Register Map"
> + *     http://www.silabs.com/Support%20Documents/TechnicalDocs/AN619.pdf
> + *
> + * This program is free software; you can redistribute  it and/or modify it
> + * under  the terms of  the GNU General  Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/clk-private.h>

I hope that this is supposed to be clk-provider.h.  I don't plan on
taking in any more clock drivers that depend on clk-private.h.  I didn't
see any reason for this patch to not use clk-provider.h.

Regards,
Mike
