From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 13/15] clk: sunxi-ng: Add N-K-M-P factor clock
Date: Mon, 20 Jun 2016 18:42:16 -0700
Message-ID: <20160621014216.GS1521@codeaurora.org>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
 <20160607204154.31967-14-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160607204154.31967-14-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Jean-Francois Moine <moinejf@free.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/07, Maxime Ripard wrote:
> diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu_nkmp.c
> new file mode 100644
> index 000000000000..9f2b98e19dc9
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
> @@ -0,0 +1,167 @@
> +/*
> + * Copyright (C) 2016 Maxime Ripard
> + * Maxime Ripard <maxime.ripard@free-electrons.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of
> + * the License, or (at your option) any later version.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/rational.h>
> +
> +#include "ccu_gate.h"
> +#include "ccu_nkmp.h"
> +
> +struct _ccu_nkmp {
> +	unsigned long	n, max_n;
> +	unsigned long	k, max_k;
> +	unsigned long	m, max_m;
> +	unsigned long	p, max_p;
> +};
> +
> +static void ccu_nkmp_find_best(unsigned long parent, unsigned long rate,
> +			       struct _ccu_nkmp *nkmp)
> +{
> +	unsigned long best_rate = 0;
> +	unsigned long best_n = 0, best_k = 0, best_m = 0, best_p = 0;
> +	unsigned long _n, _k, _m, _p;
> +
> +	for (_k = 1; _k <= nkmp->max_k; _k++) {
> +		for (_p = 0; _p <= nkmp->max_p; _p++) {
> +			unsigned long tmp_rate;
> +
> +			rational_best_approximation(rate / _k, parent >> _p,
> +						    nkmp->max_n, nkmp->max_m,
> +						    &_n, &_m);

Is there a select for RATIONAL somewhere? If not please add it to
the Kconfig. I know that COMMON_CLK has it, but I think we should
try to reduce bloat by not forcing all the basic types on drivers
that aren't using them. Instead we should have drivers start
selecting that code. So it's best to not rely on the common clk
select.


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
