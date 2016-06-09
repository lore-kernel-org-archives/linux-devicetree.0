From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH v2 11/15] clk: sunxi-ng: Add N-M-factor clock support
Date: Thu, 9 Jun 2016 09:41:01 +0200
Message-ID: <20160609094101.426a13c4c61aa6cb11df16fc@free.fr>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
	<20160607204154.31967-12-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160607204154.31967-12-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue,  7 Jun 2016 22:41:50 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> Introduce support for clocks that multiply and divide using linear fa=
ctors.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> ---
> Changes from v1:
>   - Fixed the maximums for both factors passed to the rational factor
>     computation.
> ---
>  drivers/clk/sunxi-ng/Makefile |   1 +
>  drivers/clk/sunxi-ng/ccu_nm.c | 114 ++++++++++++++++++++++++++++++++=
++++++++++
>  drivers/clk/sunxi-ng/ccu_nm.h |  95 ++++++++++++++++++++++++++++++++=
+++
>  3 files changed, 210 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu_nm.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu_nm.h
>=20
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Mak=
efile
> index a201fad6b11d..5c7ae1ad1082 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -9,4 +9,5 @@ obj-y +=3D ccu_gate.o
>  obj-y +=3D ccu_mp.o
>  obj-y +=3D ccu_mux.o
>  obj-y +=3D ccu_nk.o
> +obj-y +=3D ccu_nm.o
>  obj-y +=3D ccu_phase.o
> diff --git a/drivers/clk/sunxi-ng/ccu_nm.c b/drivers/clk/sunxi-ng/ccu=
_nm.c
> new file mode 100644
> index 000000000000..e35ddd8eec8b
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu_nm.c
> @@ -0,0 +1,114 @@
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
> +#include "ccu_frac.h"
> +#include "ccu_gate.h"
> +#include "ccu_nm.h"
	[snip]
> +static unsigned long ccu_nm_recalc_rate(struct clk_hw *hw,
> +					unsigned long parent_rate)
> +{
> +	struct ccu_nm *nm =3D hw_to_ccu_nm(hw);
> +	unsigned long n, m;
> +	u32 reg;
> +
> +	if (ccu_frac_helper_is_enabled(&nm->common, &nm->frac))
> +		return ccu_frac_helper_read_rate(&nm->common, &nm->frac);
> +
> +	reg =3D readl(nm->common.base + nm->common.reg);
> +
> +	n =3D reg >> nm->n.shift;
> +	n &=3D (1 << nm->n.width) - 1;
> +
> +	m =3D reg >> nm->m.shift;
> +	m &=3D (1 << nm->m.width) - 1;
> +
> +	return parent_rate * (n + 1) / (m + 1);

In the H3, 'm' is a pre-divider (audio and video PLLs):

	return parent_rate / (m + 1) * (n + 1);

> +}
> +
> +static long ccu_nm_round_rate(struct clk_hw *hw, unsigned long rate,
> +			      unsigned long *parent_rate)
> +{
> +	struct ccu_nm *nm =3D hw_to_ccu_nm(hw);
> +	unsigned long n, m;
> +
> +	rational_best_approximation(rate, *parent_rate,
> +				    1 << nm->n.width, 1 << nm->m.width,
> +				    &n, &m);
> +
> +	return *parent_rate * n / m;

Same here.

> +}
> +
> +static int ccu_nm_set_rate(struct clk_hw *hw, unsigned long rate,
> +			   unsigned long parent_rate)
> +{
	[snip]

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
