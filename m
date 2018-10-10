From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v10 4/5] clk: imx: add imx composite clock
Date: Wed, 10 Oct 2018 07:37:44 +0200
Message-ID: <20181010053744.5pxrlcdxmmyisu62@pengutronix.de>
References: <1539074230-27277-1-git-send-email-abel.vesa@nxp.com>
 <1539074230-27277-5-git-send-email-abel.vesa@nxp.com>
 <5c0cc4de8403fca17431a9382f7e34e8003f497b.camel@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5c0cc4de8403fca17431a9382f7e34e8003f497b.camel@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "A.s. Dong" <aisheng.dong@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "abelvesa@linux.com" <abelvesa@linux.com>, dl-linux-imx <linux-imx@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 09, 2018 at 10:56:14PM +0000, Leonard Crestez wrote:
> On Tue, 2018-10-09 at 08:37 +0000, Abel Vesa wrote:
> > +struct clk *imx_clk_composite_8m_flags(const char *name,
> > +					const char **parent_names,
> > +					int num_parents, void __iomem *reg,
> > +					unsigned long flags);
> > +
> > +#define __imx_clk_composite_8m(name, parent_names, reg, flags) \
> > +	imx_clk_composite_8m_flags(name, parent_names, \
> > +		ARRAY_SIZE(parent_names), reg, \
> > +		flags | CLK_SET_RATE_NO_REPARENT | CLK_OPS_PARENT_ENABLE)
> > +
> > +#define imx_clk_composite_8m(name, parent_names, reg) \
> > +	__imx_clk_composite_8m(name, parent_names, reg, 0)
> > +
> > +#define imx_clk_composite_8m_critical(name, parent_names, reg) \
> > +	__imx_clk_composite_8m(name, parent_names, reg, CLK_IS_CRITICAL)
> 
> Does anyone else think that the "8m" would be prettier next to imx
> rather than as a suffix? Using imx8m_clk_composite* and
> imx7ulp_clk_composite* makes more sense to me.

+1

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
