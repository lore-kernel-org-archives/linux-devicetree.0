From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH v2 05/15] clk: sunxi-ng: Add gate clock support
Date: Thu, 9 Jun 2016 09:39:49 +0200
Message-ID: <20160609093949.b1a7a89aa1448226113b8b1d@free.fr>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
	<20160607204154.31967-6-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160607204154.31967-6-maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue,  7 Jun 2016 22:41:44 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> Some clocks in the Allwinner SoCs clocks unit are just simple gates. =
Add
> support for those clocks.
>=20
> Since it's a feature that can also be found in more complex clocks, p=
rovide
> a bunch of helpers that can be reused later on.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  drivers/clk/sunxi-ng/Makefile   |  1 +
>  drivers/clk/sunxi-ng/ccu_gate.c | 82 +++++++++++++++++++++++++++++++=
++++++++++
>  drivers/clk/sunxi-ng/ccu_gate.h | 53 ++++++++++++++++++++++++++
>  3 files changed, 136 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu_gate.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu_gate.h
>=20
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Mak=
efile
> index c59cf2ea509b..608b332e0b1f 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -4,3 +4,4 @@ obj-y +=3D ccu_reset.o
>  obj-y +=3D ccu_frac.o
> =20
>  obj-y +=3D ccu_fixed_factor.o
> +obj-y +=3D ccu_gate.o
> diff --git a/drivers/clk/sunxi-ng/ccu_gate.c b/drivers/clk/sunxi-ng/c=
cu_gate.c
> new file mode 100644
> index 000000000000..1e98f8a33ac3
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu_gate.c
> @@ -0,0 +1,82 @@
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
> +
> +#include "ccu_gate.h"
> +
> +void ccu_gate_helper_disable(struct ccu_common *common, u32 gate)
> +{
> +	unsigned long flags;
> +	u32 reg;
> +
> +	if (!(common->features & CCU_FEATURE_GATE))
> +		return;

	if (!gate)
		return;

seems simpler and permits to remove the feature flag.

> +
> +	spin_lock_irqsave(common->lock, flags);
> +
> +	reg =3D readl(common->base + common->reg);
> +	writel(reg & ~gate, common->base + common->reg);
> +
> +	spin_unlock_irqrestore(common->lock, flags);
> +}
> +
> +static void ccu_gate_disable(struct clk_hw *hw)
> +{
> +	struct ccu_gate *cg =3D hw_to_ccu_gate(hw);
> +
> +	return ccu_gate_helper_disable(&cg->common, cg->enable);
> +}
> +
> +int ccu_gate_helper_enable(struct ccu_common *common, u32 gate)
> +{
> +	unsigned long flags;
> +	u32 reg;
> +
> +	if (!(common->features & CCU_FEATURE_GATE))
> +		return 0;

Same as above.

> +
> +	spin_lock_irqsave(common->lock, flags);
> +
> +	reg =3D readl(common->base + common->reg);
> +	writel(reg | gate, common->base + common->reg);
> +
> +	spin_unlock_irqrestore(common->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int ccu_gate_enable(struct clk_hw *hw)
> +{
> +	struct ccu_gate *cg =3D hw_to_ccu_gate(hw);
> +
> +	return ccu_gate_helper_enable(&cg->common, cg->enable);
> +}
> +
> +int ccu_gate_helper_is_enabled(struct ccu_common *common, u32 gate)
> +{
> +	if (!(common->features & CCU_FEATURE_GATE))
> +		return 1;

Same.

> +
> +	return readl(common->base + common->reg) & gate;
> +}
> +
> +static int ccu_gate_is_enabled(struct clk_hw *hw)
	[snip]

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
