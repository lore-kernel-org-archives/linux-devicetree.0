MIME-Version: 1.0
Date: Tue, 7 May 2019 13:03:00 -0500
References: <1556846821-8581-1-git-send-email-aisheng.dong@nxp.com>
	<1556846821-8581-2-git-send-email-aisheng.dong@nxp.com>
	<CAL_JsqLJ+Lc_3huQizy4BVFgVV94Yg8KsOOgXLv4dQU8H=WfWw@mail.gmail.com>
	<AM0PR04MB4211B2F21350CAE370D7A93780360@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB4211B2F21350CAE370D7A93780360@AM0PR04MB4211.eurprd04.prod.outlook.com>
Message-ID: <CAL_JsqLNRnYxUGyhpiL2OFxOT1wXZH2LG4XUH7qf14TpA5Dk=A@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: firmware: imx-scu: new binding to
 parse clocks from device tree
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Aisheng Dong <aisheng.dong@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Sat, May 4, 2019 at 7:19 AM Aisheng Dong <aisheng.dong@nxp.com> wrote:
>
> > From: Rob Herring [mailto:robh+dt@kernel.org]
> > Sent: Friday, May 3, 2019 10:53 PM
> > Subject: Re: [PATCH V2 1/2] dt-bindings: firmware: imx-scu: new binding to
> > parse clocks from device tree
> >
> > On Thu, May 2, 2019 at 8:34 PM Aisheng Dong <aisheng.dong@nxp.com>
> > wrote:
> >
> > > There's a few limitations on the original one cell clock binding
> > > (#clock-cells = <1>) that we have to define all clock IDs for device
> > > tree to reference. This may cause troubles if we want to use common
> > > clock IDs for multi platforms support when the clock of those
> > > platforms are mostly the same.
> > > e.g. Current clock IDs name are defined with SS prefix.
> > >
> > > However the device may reside in different SS across CPUs, that means
> > > the SS prefix may not valid anymore for a new SoC. Furthermore, the
> > > device availability of those clocks may also vary a bit.
> > >
> > > For such situation, We formerly planned to add all new IDs for each SS
> > > and dynamically check availability for different SoC in driver. That
> > > can be done but that may involve a lot effort and may result in more
> > > changes and duplicated code in driver, also make device tree
> > > upstreaming hard which depends on Clock IDs.
> > >
> > > To relief this situation, we want to move the clock definition into
> > > device tree which can fully decouple the dependency of Clock ID
> > > definition from device tree. This can make us write a full generic
> > > clock driver for SCU based SoCs. No more frequent changes needed in
> > > clock driver any more.
> > >
> > > In the meanwhile, we can also use the existence of clock nodes in
> > > device tree to address the device and clock availability differences
> > > across different SoCs.
> > >
> > > For SCU clocks, only two params required. The first one is resource id
> > > which is encoded in reg property and the second is clock type index
> > > which is encoded in generic clock-indices property they're not continuously.
> > >
> > > And as we also want to support clock set parent function, 'clocks'
> > > property is also used to pass all the possible input parents.
> > >
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Sascha Hauer <kernel@pengutronix.de>
> > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > Cc: devicetree@vger.kernel.org
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > ---
> > > ChangeLog:
> > > v1->v2:
> > >  * changed to one cell binding inspired by arm,scpi.txt
> > >    Documentation/devicetree/bindings/arm/arm,scpi.txt
> > >    Resource ID is encoded in 'reg' property.
> > >    Clock type is encoded in generic clock-indices property.
> > >    Then we don't have to search all the DT nodes to fetch
> > >    those two value to construct clocks which is relatively
> > >    low efficiency.
> > >  * Add required power-domain property as well.
> > > ---
> > >  .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 45
> > ++++++++++++++++++----
> > >  include/dt-bindings/firmware/imx/rsrc.h            | 17 ++++++++
> > >  2 files changed, 54 insertions(+), 8 deletions(-)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > index 5d7dbab..2f46e89 100644
> > > --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > @@ -89,6 +89,27 @@ Required properties:
> > >                           "fsl,imx8qm-clock"
> > >                           "fsl,imx8qxp-clock"
> > >                         followed by "fsl,scu-clk"
> > > +- #address-cells:      Should be 1.
> > > +- #size-cells:         Should be 0.
> > > +
> > > +Sub nodes are required to represent all available SCU clocks within
> > > +this hardware subsystem and the following properties are needed:
> > > +
> > > +- reg:                 Should contain the Resource ID of this SCU clock.
> > > +- #clock-cells:                Should be 1.
> > > +- clock-indices:       Index of all clock types supported by this SCU clock.
> > > +                       The order should match the clock-output-names
> > array.
> > > +                       Refer to
> > <include/dt-bindings/firmware/imx/rsrc.h> for
> > > +                       available clock types supported by SCU.
> >
> > I would have expected the clock cell to contain the Resource ID.
> >
> > Also, this still has one clock per node which you should avoid unless there's
> > only a small number of clocks (say ~20). Move this all to a single node with the
> > list of clock IDs in clock-indices and other properties like power-domains can
> > match up with clock-indices. IOW, both should have the same length (in
> > elements).
> >
>
> Do you mean something like this?
>
> #define IMX_SCU_CLK_ID(rsrc, type)      (type << 16 | rsrc)
> scu_clk: scu-clock-controller {
>         compatible = "fsl,imx8qxp-scu-clk", "fsl,scu-clk";
>         #clock-cells = <1>;
>         clock-indices = <IMX_SCU_CLK_ID(IMX_SC_R_ENET_0, IMX_SC_PM_CLK_PER)>,
>                         <IMX_SCU_CLK_ID(IMX_SC_R_ENET_0, IMX_SC_PM_CLK_BYPASS)>,
>                         <IMX_SCU_CLK_ID(IMX_SC_R_ENET_0, IMX_SC_PM_CLK_MISC0)>,
>                         <IMX_SCU_CLK_ID(IMX_SC_R_UART_0, IMX_SC_PM_CLK_PER)>,
>                         ...
>
>         clock-output-names = "enet0_clk",
>                              "enet0_bypass_clk",
>                              "enet0_rgmii_clk",
>                              "uart0_clk",
>                              ...
>
>         power-domains = <&pd IMX_SC_R_ENET_0>,
>                         <&pd IMX_SC_R_ENET_0>,
>                         <&pd IMX_SC_R_ENET_0>,
>                         <&pd IMX_SC_R_UART_0>,
>                         ...
> };

Yes, but...

> serial@5a060000 {
>         ...
>         clocks = <&scu_clk IMX_SCU_CLK_ID(IMX_SC_R_UART_0, IMX_SC_PM_CLK_PER)>;

I thought devices got clocks from the LPCG?

>         power-domains = <&pd IMX_SC_R_UART_0>;
> };
>
> I wonder moving all clock resources into a single clock controller node may result in losing
> the configuration granularity of individual clocks from device tree.
>
> For SCU based platforms, the resource availability (e.g. device/clocks/power) are
> configurable by SCU firmware according to the different SW execution partition configuration.
> e.g. According to customer's requirements, we may allocate some resources to M4 partition
> like some I2C, CAN, audio resources which can't be accessed by A core.
> And we may allocate even more for virtual machines running at another CPU core.
> Thus, defining all the clock sources (fixed) in device tree for A core seems to be a little bit
> meaningless and it also causes us hard to extend for a new SoC.

I'm not suggesting that. It's really just re-arranging all the same
data from a bunch of child nodes to a single node. Granted, it may be
easier to add/delete nodes than add/delete elements from an array of
property values, but really that's just a tooling problem

> E.g. MX8QM has more clocks than QXP in different SS.
> That's why we want the per clock source node definition in DT.
> Then we can configure the clock sources conveniently according to different partition
> setting and new SoC property.
>
> Furthermore, per clock resource node also makes us more easily to handle power domain
> In a more standard way and do state save&restore during system suspend/resume due to
> the clock state will be lost when the power is off.
>
> Another important thing is that MX8 is consisted of a number of HW subsystem while each
> Subsystem has separate clock controllers (both SCU clock controllers and LPCG clock controllers).
> I believe this is different from other vendor like TI and ARM Juno which might make us feel we should
> use the same way as theirs at the first glance. But we're different.
>
> That's why I use per clock resource node as it seems to be better for i.MX special characteristic.
>
> Considering all above requirements, how would you suggest us to do?
>
> > For the clock type, perhaps combine that in the clock cell with the resource ID
> > such as using the upper 8-bits.
> >
>
> It seems we must combine them because current clock-indices binding does not
> support two cells index which seems a drawback from user point of view.
> e.g.
> clocks = <&scu_clk IMX_SCU_CLK_ID(IMX_SC_R_UART_0, IMX_SC_PM_CLK_PER)>;

That was my original thought, but we could just say the clock-indices
element size is equal to the #clock-cells size and use 2 cells.

Rob
