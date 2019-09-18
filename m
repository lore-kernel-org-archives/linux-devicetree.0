From: Stephen Boyd <sboyd@kernel.org>
Subject: RE: [EXT] Re: [v4 2/2] clk: ls1028a: Add clock driver for Display output interface
Date: Wed, 18 Sep 2019 10:00:50 -0700
Message-ID: <20190918170051.2AEAF21848@mail.kernel.org>
References: <20190829105919.44363-1-wen.he_1@nxp.com> <20190829105919.44363-2-wen.he_1@nxp.com> <20190916202637.B5F542067B@mail.kernel.org> <DB7PR04MB51953099D6331F4F844A45EFE28E0@DB7PR04MB5195.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB7PR04MB51953099D6331F4F844A45EFE28E0@DB7PR04MB5195.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-devel@linux.nxdi.nxp.com" <linux-devel@linux.nxdi.nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Wen He <wen.he_1@nxp.com>
Cc: Leo Li <leoyang.li@nxp.com>, "liviu.dudau@arm.com" <liviu.dudau@arm.com>
List-Id: devicetree@vger.kernel.org

Quoting Wen He (2019-09-18 02:20:26)
> > -----Original Message-----
> > From: Stephen Boyd <sboyd@kernel.org>
> > Quoting Wen He (2019-08-29 03:59:19)
> > > diff --git a/drivers/clk/clk-plldig.c b/drivers/clk/clk-plldig.c new
> > > file mode 100644 index 000000000000..d3239bcf59de
> > > --- /dev/null
> > > +++ b/drivers/clk/clk-plldig.c
> > > @@ -0,0 +1,298 @@
[...]
>=20
> >=20
> > > +
> > > +/* Maximum of the divider */
> > > +#define MAX_RFDPHI1          63
> > > +
> > > +/* Best value of multiplication factor divider */
> > > +#define PLLDIG_DEFAULE_MULT         44
> > > +
> > > +/*
> > > + * Clock configuration relationship between the PHI1
> > > +frequency(fpll_phi) and
> > > + * the output frequency of the PLL is determined by the PLLDV,
> > > +according to
> > > + * the following equation:
> > > + * fpll_phi =3D (pll_ref * mfd) / div_rfdphi1  */ struct
> > > +plldig_phi1_param {
> > > +       unsigned long rate;
> > > +       unsigned int rfdphi1;
> > > +       unsigned int mfd;
> > > +};
> > > +
> > > +enum plldig_phi1_freq_range {
> > > +       PHI1_MIN        =3D 27000000U,
> > > +       PHI1_MAX        =3D 600000000U
> > > +};
> >=20
> > Please just inline these values in the one place they're used.
> >=20
> > > +
> > > +struct clk_plldig {
> > > +       struct clk_hw hw;
> > > +       void __iomem *regs;
> > > +       struct device *dev;
> >=20
> > Please remove this, it is unused.
>=20
> It is used for probe.

Use a local variable and don't store it away forever in the struct.

> >=20
> > > +
> > > +       val =3D readl(data->regs + PLLDIG_REG_PLLDV);
> > > +       val =3D phi1_param.mfd;
> > > +       rfdphi1 =3D phi1_param.rfdphi1;
> > > +       val |=3D rfdphi1;
> > > +
> > > +       writel(val, data->regs + PLLDIG_REG_PLLDV);
> > > +
> > > +       /* delay 200us make sure that old lock state is cleared */
> > > +       udelay(200);
> > > +
> > > +       /* Wait until PLL is locked or timeout (maximum 1000 usecs) */
> > > +       ret =3D readl_poll_timeout_atomic(data->regs + PLLDIG_REG_PLL=
SR,
> > cond,
> > > +                                       cond & PLLDIG_LOCK_MASK,
> > 0,
> > > +                                       USEC_PER_MSEC);
> > > +
> > > +       return ret;
> >=20
> > Just return readl_poll_timeout_atomic(...) here.
>=20
> Maybe use below code will to best describes.
>=20
> If (ret)
>         return -ETIMEOUT;
>=20
> return 0;

No, just return readl_poll_timeout_atomic().
