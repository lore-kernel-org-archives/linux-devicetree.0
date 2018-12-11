From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v13 0/5] Add i.MX8MQ clock driver
Date: Tue, 11 Dec 2018 16:02:09 +0800
Message-ID: <20181211080208.GY3987@dragon>
References: <1542125975-8448-1-git-send-email-abel.vesa@nxp.com>
 <154345210894.88331.8277410833858111600@swboyd.mtv.corp.google.com>
 <AM0PR04MB42117F72B9C4D41C14B96CBD80D20@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <154352826457.88331.16669625591730377740@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154352826457.88331.16669625591730377740@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abel.vesa@nxp.com>, Aisheng DONG <aisheng.dong@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Fabio Estevam <fabio.estevam@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Abel Vesa <abelvesa@linux.com>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 29, 2018 at 01:51:04PM -0800, Stephen Boyd wrote:
> Quoting Aisheng DONG (2018-11-28 23:46:41)
> > > -----Original Message-----
> > > From: Stephen Boyd [mailto:sboyd@kernel.org]
> > [...]
> > > >
> > > > Changes since v12:
> > > >  * replaced the division in clk_pll_recalc_rate in clk-frac
> > > >    with do_div as suggested by Stephen
> > > >
> > > > Abel Vesa (2):
> > > >   clk: imx: Add imx composite clock
> > > >   clk: imx: Add clock driver for i.MX8MQ CCM
> > > >
> > > > Lucas Stach (3):
> > > >   dt-bindings: add binding for i.MX8MQ CCM
> > > >   clk: imx: add fractional PLL output clock
> > > >   clk: imx: Add SCCG PLL type
> > > >
> > > 
> > > I had to apply this set of fixes to silence sparse and smatch warnings about
> > > things that are not right. Please take a look over things and see if it's sane.
> > > 
> > 
> > The change looks good to me and tested ok.
> > I did not see this patch series in your tree.
> > Do you want us to apply your changes and re-send for easy pick up?
> > 
> 
> I applied this version and my fixes. I'll just mark v14 as superseded.
> Thanks for testing!

Hi Stephen,

For the same reason as clk-imx7ulp, please keep branch clk-imx8mq
stable.  Thanks.

Shawn
