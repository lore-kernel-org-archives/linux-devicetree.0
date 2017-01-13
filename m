From: Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH v2 04/12] driver: clk: imx: Add clock driver for imx6sll
Date: Fri, 13 Jan 2017 03:04:37 +0000
Message-ID: <AM3PR04MB53027B627AE8CEC6D7D0D1B87780@AM3PR04MB530.eurprd04.prod.outlook.com>
References: <1482832070-22668-1-git-send-email-ping.bai@nxp.com>
 <1482832070-22668-5-git-send-email-ping.bai@nxp.com>
 <20170110003753.GM17126@codeaurora.org>
 <AM3PR04MB5307CB38AA904535AF8D80D87670@AM3PR04MB530.eurprd04.prod.outlook.com>
 <20170112220536.GP17126@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170112220536.GP17126@codeaurora.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "jacky.baip@gmail.com" <jacky.baip@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> Subject: Re: [PATCH v2 04/12] driver: clk: imx: Add clock driver for imx6sll
> 
> > > > +
> > > > +static const char *pll_bypass_src_sels[] = { "osc", "dummy", };
> > >
> > > All these should be const char * const unless something is wrong.
> >
> > If changed to 'const char * const', it vill has argument type mismatch
> > error, as imx_clk_* wrapper function has argument type 'const char *'.
> 
> Hmm that's unfortunate.
> 
> >
> > >
> > > > +
> > > > +	for (i = 0; i < ARRAY_SIZE(clks_init_on); i++)
> > > > +		clk_prepare_enable(clks[clks_init_on[i]]);
> > >
> > > Critical clocks?
> >
> > Yes, these clocks must be always on.
> >
> > >
> > > > +
> > > > +	if (IS_ENABLED(CONFIG_USB_MXS_PHY)) {
> > > > +		clk_prepare_enable(clks[IMX6SLL_CLK_USBPHY1_GATE]);
> > > > +		clk_prepare_enable(clks[IMX6SLL_CLK_USBPHY2_GATE]);
> > >
> > > The phy driver can't enable these?
> >
> > The reason why we enable these two clks here is in below commit commit
> > a5120e89e7e187a91852896f586876c7a2030804
> > Author: Peter Chen <peter.chen@freescale.com>
> > Date:   Fri Jan 18 10:38:05 2013 +0800
> >       ARM i.MX6: change mxs usbphy clock usage
> >
> 
> So can we mark these clks with CLK_IS_CRITICAL flag then instead?
> Or are they disabled out of the bootloader?
> 

Sure, using 'CLK_IS_CRITICAL'  should be ok for clks_init_on clocks.  But for  USBPHY*_GATE, it is
only enabled when CONIG_USB_MXC_PHY is true.  And another concern is if we need to add CLK_IS_CRITICAL
flag to clks_init_on clocks, we may need to add new wrapper function to register these critical clock. It is not very good.

 > >
> > > > +	}
> > > > +
> > > > +	/* Lower the AHB clock rate before changing the clock source. */
> > > > +	clk_set_rate(clks[IMX6SLL_CLK_AHB], 99000000);
> > > > +
> > > > +	/* Change periph_pre clock to pll2_bus to adjust AXI rate to 264MHz */
> > > > +	clk_set_parent(clks[IMX6SLL_CLK_PERIPH_CLK2_SEL],
> > > clks[IMX6SLL_CLK_PLL3_USB_OTG]);
> > > > +	clk_set_parent(clks[IMX6SLL_CLK_PERIPH],
> > > clks[IMX6SLL_CLK_PERIPH_CLK2]);
> > > > +	clk_set_parent(clks[IMX6SLL_CLK_PERIPH_PRE],
> > > clks[IMX6SLL_CLK_PLL2_BUS]);
> > > > +	clk_set_parent(clks[IMX6SLL_CLK_PERIPH],
> > > > +clks[IMX6SLL_CLK_PERIPH_PRE]);
> > > > +
> > > > +	clk_set_rate(clks[IMX6SLL_CLK_AHB], 132000000);
> > >
> > > assigned-clocks for rates now? Or perhaps we shouldn't be exposing
> > > these as clks if they have some sort of complicated rate sequence
> > > switch that we can't guarantee with the clk_ops we have today.
> >
> > These clks will be used by some peripherals, so we need to expose these
> clocks.
> > And the above parent and rate swith sequence is not very easy to be
> > handled in assigned-clocks, So we leave it in this place.
> >
> 
> How do we guarantee that the rate switch doesn't happen later on, requiring
> this coordinated sequence of clk operations?
> 

This clock sequence is used for increasing the AXI and AHB bus clock rate. In normal
use, it is very rarely that we need to change them again. If we really need to change
AXI and AHB bus clock later, a similar sequence must be used to do this.

> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux
> Foundation Collaborative Project
