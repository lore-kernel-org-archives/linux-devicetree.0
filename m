From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] clk: bcm: Add driver for Northstar ILP clock
Date: Fri, 29 Jul 2016 14:15:13 +0100
Message-ID: <20160729131513.GB13080@leverpostej>
References: <1469797120-29298-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1469797120-29298-1-git-send-email-zajec5@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>, Eric Anholt <eric@anholt.net>, Stephen Warren <swarren@wwwdotorg.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 29, 2016 at 02:58:32PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> This clock is present on cheaper Northstar devices like BCM53573 or
> BCM47189 using Corex-A7. This driver uses PMU (Power Management Unit)
> to calculate clock rate and allows using it in a generic (clk_*) way.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  .../devicetree/bindings/clock/brcm,ns-ilp.txt      |  28 ++++
>  drivers/clk/bcm/Makefile                           |   1 +
>  drivers/clk/bcm/clk-ns-ilp.c                       | 146 +++++++++++=
++++++++++
>  3 files changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,ns-i=
lp.txt
>  create mode 100644 drivers/clk/bcm/clk-ns-ilp.c
>=20
> diff --git a/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt =
b/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt
> new file mode 100644
> index 0000000..c4df38e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt
> @@ -0,0 +1,28 @@
> +Broadcom Northstar ILP clock
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +This binding uses the common clock binding:
> +    Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +This binding is used for ILP clock on Broadcom Northstar devices usi=
ng
> +Corex-A7 CPU. ILP clock depends on ALP one and has to be calculated =
on
> +runtime.
> +
> +Required properties:
> +- compatible: "brcm,ns-ilp"
> +- reg: iomem address range of PMU (Power Management Unit)
> +- reg-names: "pmu", the only needed & supported reg right now

=46rom the commit message and binding description, it sounds like there
should be a binding for the PMU, and that should cover the clocks
required/exported by the PMU.

> +- clocks: should reference an ALP clock
> +- clock-names: "alp", the only needed & supported clock right now
> +- #clock-cells: should be <0>

How many clocks does the PMU output, including the ILP clock?

> +static unsigned long ns_ilp_recalc_rate(struct clk_hw *hw,
> +					unsigned long parent_rate)
> +{
> +	struct ns_ilp *ilp =3D container_of(hw, struct ns_ilp, hw);
> +	void __iomem *pmu =3D ilp->pmu;
> +	u32 last_val, cur_val;
> +	u32 sum =3D 0, num =3D 0, loop_num =3D 0;
> +	u32 avg;
> +	int err;
> +
> +	err =3D clk_prepare_enable(ilp->alp_clk);
> +	if (err)
> +		return 0;
> +
> +	/* Enable */
> +	writel(XTAL_CTL_EN, pmu + PMU_XTAL_FREQ_RATIO);

What exactly are we enabling here?

> +
> +	/* Read initial value */
> +	last_val =3D readl(pmu + PMU_XTAL_FREQ_RATIO) & XTAL_ALP_PER_4ILP;
> +
> +	/* Try getting 20 different values for calculating average */

Please describe *why* this is necessary (i.e. why we need to calculate
an average).

> +	while (num < 20) {
> +		cur_val =3D readl(pmu + PMU_XTAL_FREQ_RATIO) & XTAL_ALP_PER_4ILP;
> +
> +		if (cur_val !=3D last_val) {
> +			/* Got different value, use it */
> +			sum +=3D cur_val;
> +			num++;
> +			loop_num =3D 0;
> +			last_val =3D cur_val;
> +		} else if (++loop_num > 5000) {
> +			/* Same value over and over, give up */
> +			sum +=3D cur_val;
> +			num++;
> +			break;
> +		}
> +	}
> +
> +	/* Disable */
> +	writel(0x0, pmu + PMU_XTAL_FREQ_RATIO);
> +
> +	avg =3D sum / num;
> +
> +	return clk_get_rate(ilp->alp_clk) * 4 / avg;
> +}

Shouldn't the clk_prepare_enable be balanced?

> +	index =3D of_property_match_string(np, "reg-names", "pmu");
> +	if (index < 0) {
> +		err =3D index;
> +		goto err_free_ilp;
> +	}
> +	err =3D of_address_to_resource(np, index, &res);
> +	if (err) {
> +		err =3D index;
> +		goto err_free_ilp;
> +	}
> +	ilp->pmu =3D ioremap_nocache(res.start, resource_size(&res));

Use ioremap() for mapping devices.

It is not correct to use ioremap_nocache().

We should probably add an of_get_address_resource_by_name() or somethin=
g
like that to avoid drivers having to open-code this kind of thing.

> +	if (IS_ERR(ilp->pmu)) {
> +		err =3D PTR_ERR(ilp->pmu);
> +		goto err_free_ilp;
> +	}
> +
> +	ilp->alp_clk =3D of_clk_get_by_name(np, "alp-clk");

The binding document said "alp", not "alp-clk".

We already know it's a clock, so the "-clk" suffix is redundant.

> +	if (IS_ERR(ilp->alp_clk)) {
> +		err =3D PTR_ERR(ilp->alp_clk);
> +		goto err_unmap_pmu;
> +	}
> +
> +	init.name =3D np->name;
> +	init.ops =3D &ns_ilp_clk_ops;
> +	init.flags =3D CLK_IS_ROOT;

That's not true; the ALP clock is a parent...

I thought CLK_IS_ROOT was disappearing, regardless.

Thanks,
Mark,
