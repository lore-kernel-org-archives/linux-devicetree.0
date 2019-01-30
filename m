From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RESEND v1 4/4] dt-bindings: imx8-clock: add a53 and a72
 clock id
Date: Wed, 30 Jan 2019 10:45:46 -0600
Message-ID: <CAL_JsqKwJEJmb2iAom1nckj6-eFrpfMXoGC4id5rqWiQZZn2yw@mail.gmail.com>
References: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com>
 <1547207400-28307-5-git-send-email-aisheng.dong@nxp.com>
 <20190122001011.GA15952@bogus>
 <AM0PR04MB4211003C959DCC89B169D39B80980@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB4211003C959DCC89B169D39B80980@AM0PR04MB4211.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Aisheng Dong <aisheng.dong@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 22, 2019 at 6:59 AM Aisheng Dong <aisheng.dong@nxp.com> wrote:
>
> > From: Rob Herring [mailto:robh@kernel.org]
> > Sent: Tuesday, January 22, 2019 8:10 AM
> >
> > On Fri, Jan 11, 2019 at 11:56:09AM +0000, Aisheng Dong wrote:
> > > Add a53 and a72 clock id, as there's still no users, we update
> > > IMX_LSIO_MEM_CLK base to start from 6 to allow a53 and a72 clock id to
> > > be continued with a35 clk.
> > >
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Sascha Hauer <kernel@pengutronix.de>
> > > Cc: Fabio Estevam <fabio.estevam@nxp.com>
> > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > ---
> > >  include/dt-bindings/clock/imx8-clock.h | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/include/dt-bindings/clock/imx8-clock.h
> > > b/include/dt-bindings/clock/imx8-clock.h
> > > index 4236818..2f1aa2f 100644
> > > --- a/include/dt-bindings/clock/imx8-clock.h
> > > +++ b/include/dt-bindings/clock/imx8-clock.h
> > > @@ -13,10 +13,12 @@
> > >
> > >  /* CPU */
> > >  #define IMX_A35_CLK                                        1
> > > +#define IMX_A53_CLK                                        2
> > > +#define IMX_A72_CLK                                        3
> >
> > All 3 cores in one chip? If not maybe these should be split or define them as
> > cpu cluster x clocks.
> >
>
> Not in one chip.
> Here are common clock IDs used for both MX8QXP and MX8QM.
> You mean change to something like below?
>
> #define IMX_CPU_CLUSTER_A53_CLK                 2
> #define IMX_CPU_CLUSTER_A72_CLK                 3

What happened to A35? What I'm saying is if the same clock controller
registers are used across chips even if the cores are different, use
the same clock ID. Ideally, clock IDs have some relationship to the
h/w such as their control register address and offset.

To put it another way, don't create a common number space of clock IDs
across SoCs unless they are strictly subsets and supersets of each
other.

Rob
