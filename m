From: Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH v2 04/12] driver: clk: imx: Add clock driver for imx6sll
Date: Sun, 22 Jan 2017 02:14:35 +0000
Message-ID: <AM3PR04MB530CDCAC082173FDDDFEEFA87730@AM3PR04MB530.eurprd04.prod.outlook.com>
References: <1482832070-22668-1-git-send-email-ping.bai@nxp.com>
 <1482832070-22668-5-git-send-email-ping.bai@nxp.com>
 <20170110003753.GM17126@codeaurora.org>
 <AM3PR04MB5307CB38AA904535AF8D80D87670@AM3PR04MB530.eurprd04.prod.outlook.com>
 <20170112220536.GP17126@codeaurora.org>
 <AM3PR04MB53027B627AE8CEC6D7D0D1B87780@AM3PR04MB530.eurprd04.prod.outlook.com>
 <20170121010009.GC8801@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170121010009.GC8801@codeaurora.org>
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

> > > > The reason why we enable these two clks here is in below commit
> > > > commit
> > > > a5120e89e7e187a91852896f586876c7a2030804
> > > > Author: Peter Chen <peter.chen@freescale.com>
> > > > Date:   Fri Jan 18 10:38:05 2013 +0800
> > > >       ARM i.MX6: change mxs usbphy clock usage
> > > >
> > >
> > > So can we mark these clks with CLK_IS_CRITICAL flag then instead?
> > > Or are they disabled out of the bootloader?
> > >
> >
> > Sure, using 'CLK_IS_CRITICAL'  should be ok for clks_init_on clocks.
> > But for  USBPHY*_GATE, it is only enabled when CONIG_USB_MXC_PHY is
> > true.  And another concern is if we need to add CLK_IS_CRITICAL flag to
> clks_init_on clocks, we may need to add new wrapper function to register
> these critical clock. It is not very good.
> 
> Ok so set the critical flag when CONFIG_USB_MXC_PHY is enabled?
> That isn't too hard to do.
> 

Ok, thanks, I will address this in V3.

> > 
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux
> Foundation Collaborative Project
