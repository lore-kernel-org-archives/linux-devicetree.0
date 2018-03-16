From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH v2 4/4] clk: imx: add clock driver for i.MX8MQ CCM
Date: Fri, 16 Mar 2018 10:29:29 +0000
Message-ID: <AM3PR04MB3060D75EF763926D9732BB780D70@AM3PR04MB306.eurprd04.prod.outlook.com>
References: <20180201175412.9480-1-l.stach@pengutronix.de>
 <20180201175412.9480-4-l.stach@pengutronix.de>
 <20180315213304.ejvgpkhxtblr6xb3@pengutronix.de>
 <1521195019.3492.7.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1521195019.3492.7.camel@pengutronix.de>
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
To: Lucas Stach <l.stach@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Lucas Stach [mailto:l.stach@pengutronix.de]
> Sent: Friday, March 16, 2018 6:10 PM
> To: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> <sboyd@codeaurora.org>; A.s. Dong <aisheng.dong@nxp.com>;
> devicetree@vger.kernel.org; patchwork-lst@pengutronix.de; Rob Herring
> <robh+dt@kernel.org>; dl-linux-imx <linux-imx@nxp.com>;
> kernel@pengutronix.de; Fabio Estevam <fabio.estevam@nxp.com>; Shawn
> Guo <shawnguo@kernel.org>; linux-clk@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH v2 4/4] clk: imx: add clock driver for i.MX8MQ CCM
> 
> Am Donnerstag, den 15.03.2018, 22:33 +0100 schrieb Sascha Hauer:
> > On Thu, Feb 01, 2018 at 06:54:12PM +0100, Lucas Stach wrote:
> > > Add driver for the Clock Control Module found on i.MX8MQ.
> > >
> > > This is largely based on the downstream driver from Anson Huang and
> > > Bai Ping at NXP, with only some small adaptions to mainline from me.
> > >
> > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> >
> > A general thought: The i.MX8M finally has a consistent clock tree. We
> > have for example 70 Peripheral clock slices consisting of a mux, a
> > gate and two dividers, all 70 looking the same.
> > For these it might make sense to create a more complex clock type
> > providing mux, gate and set rate functionality in one clock. This
> > would drastically reduce the number of clocks we have to handle.
> 
> I agree. It seems we are missing the 4.17 merge window with this anyways,
> due to the large number of changes still required and time constraints on my
> side, so a larger rework of the driver might be possible if we target 4.18.
> 

Yes, that would be worth a try.

Thanks for doing it.

Regards
Dong Aisheng

> Regards,
> Lucas
