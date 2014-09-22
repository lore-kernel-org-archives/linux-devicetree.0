From: "Li.Xiubo@freescale.com" <Li.Xiubo@freescale.com>
Subject: RE: [PATCH v2] ARM: ls1021a: add gating clocks to IP blocks.
Date: Mon, 22 Sep 2014 07:55:14 +0000
Message-ID: <e7a0fe3cbe4c4ed0bcc489853a392f35@BY2PR0301MB0613.namprd03.prod.outlook.com>
References: <1411366160-42685-1-git-send-email-Li.Xiubo@freescale.com>
 <20140922070037.GR3755@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140922070037.GR3755@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, Shengchao Guo <Shawn.Guo@freescale.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi,


[...]
> > +++ b/arch/arm/mach-imx/clk-ls1021a.c
> > @@ -0,0 +1,124 @@
> > +/*
> > + * Copyright 2014 Freescale Semiconductor, Inc.
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License as publish=
ed by
> > + * the Free Software Foundation; either version 2 of the License, =
or
> > + * (at your option) any later version.
> > + *
> This empty line can be removed.
>=20
Okay.

[...]
> > +static void __init ls1021a_clocks_init(struct device_node *np)
> > +{
> > +	void __iomem *dcfg_base;
> > +
> > +#define DCFG_CCSR_DEVDISR1	(dcfg_base + 0x70)
> > +#define DCFG_CCSR_DEVDISR2	(dcfg_base + 0x74)
> > +#define DCFG_CCSR_DEVDISR3	(dcfg_base + 0x78)
> > +#define DCFG_CCSR_DEVDISR4	(dcfg_base + 0x7c)
> > +#define DCFG_CCSR_DEVDISR5	(dcfg_base + 0x80)
> > +
> > +	dcfg_base =3D of_iomap(np, 0);
> > +
> > +	BUG_ON(!dcfg_base);
> Is this worth a BUG?=20
Yes, I do think so.

There is one story about my platform:
We are using the imx2_wdt watchdog device, which cannot stop or suspend
once it has started.
And our platform will also support the Power Management, if the gating
Clock initialized failed, so when the system enters sleep mode, we cann=
ot
Stop the imx2_wdt IP block, so it will reset the board after 180 second=
s at
most.

So using this gating clock, the watchdog IP block's clock could be disa=
bled
When the system enter sleep mode.

So I think BUG_ON here is make sense.
=20
Doesn't it ?

> Or is it enough to do
> 	if (!dcfg_base) {
> 		pr_warn("failed to map fsl,ls1021a-gate device\n");
> 		return
> 	}
>=20
> > +
> > +	clk[LS1021A_CLK_PBL_EN] =3D ls1021a_clk_gate("pbl_en", "dummy",
> > +						DCFG_CCSR_DEVDISR1, 0, true);
> If the machine's device tree contains two (or more) nodes that are
> compatible to "fsl,ls1021a-gate", you overwrite your static clk array=
=2E Is
> it worth to add another check here?:
>=20
On LS1021A SoC, I can make sure that there will only be one gate node. =
But for
More compatibly using one dynamic clk array will be better.

> 	if (clk[LS1021A_CLK_PBL_EN]) {
> 		pr_warn("only a single instance of fsl,ls1021a-gate supported\n");
> 		return;
> 	}
>=20
> (Is it a valid case that ls1021a_clk_gate returns NULL? In this case =
the
> condition above is wrong.)

Yes, maybe.

I'll have a check of these.

[...]
> > +	clk[LS1021A_CLK_FLEXCAN1_EN] =3D ls1021a_clk_gate("flexcan1_en", =
"dummy",
> > +						DCFG_CCSR_DEVDISR5, 12, true);
> > +	clk[LS1021A_CLK_FLEXCAN234_EN] =3D ls1021a_clk_gate("flexcan234_e=
n",
> > +					"dummy", DCFG_CCSR_DEVDISR5, 13, true);
> > +	/* For flextiemr 2/3/4/5/6/7/8 */
> s/tiemr/timer/
>=20
Yes.

[...]
> > +	clk[LS1021A_CLK_FLEXTIMER1_EN] =3D ls1021a_clk_gate("flextimer1_e=
n",
> > +					"dummy", DCFG_CCSR_DEVDISR5, 31, true);
> > +
> > +	/* Add the clocks to provider list */
> > +	clk_data.clks =3D clk;
> > +	clk_data.clk_num =3D ARRAY_SIZE(clk);
> These two could be initialised statically.
>=20
Yes, I will use LS1021A_CLK_END instead of ARRAY_SIZE(clk).

> > +	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
> > +}
> > +CLK_OF_DECLARE(ls1021a, "fsl,ls1021a-gate", ls1021a_clocks_init);
> > diff --git a/arch/arm/mach-imx/clk.h b/arch/arm/mach-imx/clk.h
> > index 4cdf8b6..dd9e369 100644
> > --- a/arch/arm/mach-imx/clk.h
> > +++ b/arch/arm/mach-imx/clk.h
> > @@ -107,6 +107,27 @@ static inline struct clk *imx_clk_gate_dis(con=
st char
> *name, const char *parent,
> >  			shift, CLK_GATE_SET_TO_DISABLE, &imx_ccm_lock);
> >  }
> >
> > +/* The DCFG registers are in big endian mode on LS1021A SoC */
> > +static inline u8 ls1021a_clk_calculate_shift(u8 shift)
> > +{
> > +	int m, n;
> > +
> > +	m =3D shift / 8;
> > +	n =3D shift % 8;
> > +
> > +	return (3 - m) * 8 + n;
> > +}
> > +
> > +static inline struct clk *ls1021a_clk_gate(const char *name, const=
 char
> *parent,
> > +		void __iomem *reg, u8 shift, bool big_endian)
> > +{
> > +	if (big_endian)
> This is always true up to now. Does this change in the future?
Yes.

> If not I
> suggest to drop the parameter. Even if this might change, I would
> prefer:
>=20
> 	clk[LS1021A_CLK_FLEXTIMER1_EN] =3D
> 			ls1021a_clk_gate("flextimer1_en",
> 					 "dummy", DCFG_CCSR_DEVDISR5,
> 					 ls1021a_clk_shift_be(31));
>=20
> which is moreover more likely to be optimizable by the compiler.
> But maybe that's only me.
>=20
Yes, this looks good to me too.

Thanks very much for your comments.

BRs
Xiubo


> > +		shift =3D ls1021a_clk_calculate_shift(shift);
> > +
> > +	return clk_register_gate(NULL, name, parent, CLK_SET_RATE_PARENT,=
 reg,
> > +			shift, CLK_GATE_SET_TO_DISABLE, &imx_ccm_lock);
> > +}
> > +
> >  static inline struct clk *imx_clk_mux(const char *name, void __iom=
em *reg,
> >  		u8 shift, u8 width, const char **parents, int num_parents)
> >  {
>=20
> --
> Pengutronix e.K.                           | Uwe Kleine-K=F6nig      =
      |
> Industrial Linux Solutions                 | http://www.pengutronix.d=
e/  |
