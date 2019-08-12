From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 02/11] dt-bindings: clock: imx-lpcg: add support to
 parse clocks from device tree
Date: Mon, 12 Aug 2019 17:54:42 +0200
Message-ID: <20190812155440.GA12237@X250>
References: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
 <1563289265-10977-3-git-send-email-aisheng.dong@nxp.com>
 <20190803135048.GL8870@X250.getinternet.no>
 <CAA+hA=TVv8m2GZr0W-u+S6XzJUCYrFDF95iyUGyAsbYMwatyZg@mail.gmail.com>
 <20190812130041.GD27041@X250>
 <AM0PR04MB42117575E82B4B762FE2143880D30@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <AM0PR04MB42117575E82B4B762FE2143880D30@AM0PR04MB4211.eurprd04.prod.outlook.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, Dong Aisheng <dongas86@gmail.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-clk <linux-clk@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 02:41:55PM +0000, Aisheng Dong wrote:
> > From: Shawn Guo <shawnguo@kernel.org>
> > Sent: Monday, August 12, 2019 9:01 PM 
> > On Mon, Aug 05, 2019 at 11:27:20AM +0800, Dong Aisheng wrote:
> > > > > +- compatible:                Should be one of:
> > > > > +                       "fsl,imx8qxp-lpcg"
> > > > > +                       "fsl,imx8qm-lpcg" followed by
> > "fsl,imx8qxp-lpcg".
> > > > > +- reg:                       Address and length of the register set.
> > > > > +- #clock-cells:              Should be 1. One LPCG supports multiple
> > clocks.
> > > > > +- clocks:            Input parent clocks phandle array for each clock.
> > > > > +- bit-offset:                An integer array indicating the bit offset
> > for each clock.
> > > >
> > > > I guess that the driver should be able to figure bit offset from
> > > > 'clock-indices' property.
> > > >
> > >
> > > Yes, it can be done in theory.
> > > Then the binding may look like:
> > > sdhc0_lpcg: clock-controller@5b200000 {
> > >         ...
> > >         #clock-cells = <1>;
> > >         clocks = <&sdhc0_clk IMX_SC_PM_CLK_PER>,
> > >                  <&conn_ipg_clk>, <&conn_axi_clk>;
> > >         clock-indices = <0>, <16>, <20>;
> > >         clock-output-names = "sdhc0_lpcg_per_clk",
> > >                              "sdhc0_lpcg_ipg_clk",
> > >                              "sdhc0_lpcg_ahb_clk";
> > >         power-domains = <&pd IMX_SC_R_SDHC_0>; };
> > >
> > > usdhc1: mmc@5b010000 {
> > >         ...
> > >         clocks = <&sdhc0_lpcg 16>,
> > >                  <&sdhc0_lpcg 0>,
> > >                  <&sdhc0_lpcg 20>;
> > >         clock-names = "ipg", "per", "ahb"; };
> > >
> > > However, after trying, i found  one limitation if using clock-indices
> > > that users have to do a secondary search for the indices value from
> > > clock names which is not very friendly.
> > >
> > > Formerly from the clock output names, user can easily get the clock
> > > index as they're in fixed orders as output names, so very easily to
> > > use.
> > > e.g.
> > > clocks = <&sdhc0_lpcg 1>,
> > >          <&sdhc0_lpcg 0>,
> > >          <&sdhc0_lpcg 2>;
> > >
> > > If using clock-indices, users have no way to know it's clock index
> > > from clock output names order unless they do a secondary search from
> > > the clock-indice array accordingly.
> > > For example, for "sdhc0_lpcg_ahb_clk", user can easily know its
> > > reference is <&sdhc0_lpcg 2>.
> > > But if using clock-indice, we need search clock-indices array to find
> > > its reference becomes <&sdhc0_lpcg 20>. So this seems like a drawback
> > > if using clock-indices.
> > 
> > Shouldn't we have constant macro defined for those numbers, so that both
> > 'clock-indices' and 'clocks' of client device can use?
> > 
> 
> I think we can do it.
> Does below one look ok to you?
> #define IMX_LPCG_ CLK_0	0
> #define IMX_LPCG_ CLK_1	4
> #define IMX_LPCG_ CLK_2	8
> #define IMX_LPCG_ CLK_3	12
> #define IMX_LPCG_ CLK_4	16
> #define IMX_LPCG_ CLK_5	20
> #define IMX_LPCG_ CLK_6	24
> #define IMX_LPCG_ CLK_7	28

Looks fine to me, except the space in the middle of macro name, which
compiler will complain anyway :)

Shawn

> 
> The usage will look like:
> <&sdhc0_lpcg IMX_LPCG_CLK_5>
