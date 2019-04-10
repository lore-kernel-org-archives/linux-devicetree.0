From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: firmware: imx-scu: new binding to parse
 clocks from device tree
Date: Wed, 10 Apr 2019 10:32:06 -0500
Message-ID: <CAL_JsqK9xkR3P7_cfhpr3kQBEF_wGgZO4oHpoDW+3ybpqYoXNw@mail.gmail.com>
References: <1550771836-10014-1-git-send-email-aisheng.dong@nxp.com>
 <1550771836-10014-2-git-send-email-aisheng.dong@nxp.com>
 <20190326134715.GA4055@bogus>
 <AM0PR04MB42110F1F251243A165DB9EC680580@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB42110F1F251243A165DB9EC680580@AM0PR04MB4211.eurprd04.prod.outlook.com>
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

On Wed, Mar 27, 2019 at 9:35 AM Aisheng Dong <aisheng.dong@nxp.com> wrote:
>
> > From: Rob Herring [mailto:robh@kernel.org]
> > Sent: Tuesday, March 26, 2019 9:47 PM
> > On Thu, Feb 21, 2019 at 06:03:43PM +0000, Aisheng Dong wrote:
> > > There's a few limitations on one cell clock binding (#clock-cells =
> > > <1>) that we have to define all clock IDs for device tree to reference.
> > > This may cause troubles if we want to use common clock IDs for multi
> > > platforms support when the clock of those platforms are mostly the same.
> > > e.g. Current clock IDs name are defined with SS prefix. However the
> > > device may reside in different SS across CPUs, that means the SS
> > > prefix may not valid anymore for a new SoC. Furthermore, the device
> > > availability of those clocks may also vary a bit.
> > >
> > > For such situation, We formerly planned to add all new IDs for each SS
> > > and dynamically check availability for different SoC in driver. That
> > > can be done but that may involve a lot effort and may result in more
> > > changes and duplicated code in driver, also make device tree
> > > upstreaming hard which depends on Clock IDs.
> > >
> > > To relief this situation, we want to move the clock definition into
> > > device tree which can fully decouple the dependency of Clock ID
> > > definition from device tree. And no frequent changes required in clock driver
> > any more.
> > >
> > > Then we can use the existence of clock nodes in device tree to address
> > > the device and clock availability differences across different SoCs.
> > >
> > > For SCU clocks, only two params required, thus two new property created:
> > > rsrc-id = <IMX_SC_R_UART_0>;
> > > clk-type = <IMX_SC_PM_CLK_PER>;
> > >
> > > And as we want to support clock set parent function, 'clocks' property
> > > is also used to pass all the possible input parents.
> > >
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Sascha Hauer <kernel@pengutronix.de>
> > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > Cc: devicetree@vger.kernel.org
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > ---
> > >  .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 29
> > ++++++++++++++++------
> > >  include/dt-bindings/firmware/imx/rsrc.h            | 17
> > +++++++++++++
> > >  2 files changed, 38 insertions(+), 8 deletions(-)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > index 72d481c..2816789 100644
> > > --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > > @@ -78,6 +78,19 @@ Required properties:
> > >                       "fsl,imx8qm-clock"
> > >                       "fsl,imx8qxp-clock"
> > >                     followed by "fsl,scu-clk"
> > > +- #clock-cells:            Should be 0.
> > > +- rsrc-id:         Resource ID associated with this clock
> > > +- clk-type:                Type of this clock.
> > > +                   Refer to <include/dt-bindings/firmware/imx/rsrc.h> for
> > > +                   available clock types supported by SCU.
> >
> > Can't you just make these 2 values clock cells? I'm all for getting rid of made
> > up clock numbers.
> >
>
> Thanks for the agreement to remove clock IDs.
>
> The 2 values clock cell seems not the best approach for i.MX because it still needs
> to define all clocks in the driver which is exactly we want to avoid now due to some
> special HW characteristic:

Why's that? You can walk the DT and extract the 2 cells for each clock
present. That's not any different than walking child nodes here and
getting the resource ids and type. That's not really fast, but if
speed is really an issue we can consider addressing that in ways that
extend rather than change the binding.

> 1. clock resources may be allocated to different SW execution partition by firmware
> and A core may not have access rights for those clocks not belong to its partition.
> So we want to describe them in DT according to the partition configuration.

Do you have an example? I'd assume you assign peripherals to different
partitions and resource assignment simply follows that. Can clocks not
be available when a peripheral still is?

> 2. Each clock is associated with a different power domain which is better to be
> described in device tree. And clock state will be lost and need restore after power cycle
> of the domain.
>
> Based on above requirements, do you think we can do as below?

Can you provide an example that shows the whole hierarchy for a
peripheral. Here you have FSPI, PWM, and MMC. Reviewing SCU clocks and
LPCG clocks separately is not helpful.

>
> //LSIO SS
> lsio_scu_clk: lsio-scu-clock-controller {
>         compatible = "fsl,imx8qxp-clock", "fsl,scu-clk";
>
>         fspi0_clk: clock-fspi0{
>                 #clock-cells = <0>;
>                 rsrc-id = <IMX_SC_R_FSPI_0>;
>                 clk-type = <IMX_SC_PM_CLK_PER>;
>                 power-domains = <&pd IMX_SC_R_FSPI_0>;

Are the power domain ID and rsrc-id always the same for a clock?

>         };
>
>                 fspi1_clk: clock-fspi1{
>                         ...
>                 };
>         ...
> };
>
> /* LPCG clocks */
> lsio_lpcg_clk: lsio-lpcg-clock-controller {
>         compatible = "fsl,imx8qxp-lpcg";

I think this wrapper node should be removed and the compatible moved
into the child nodes.

>         pwm0_lpcg: clock-controller@5d400000 {
>                 reg = <0x5d400000 0x10000>;
>                 #clock-cells = <1>;
>                 clocks = <&pwm0_clk>, <&pwm0_clk>, <&pwm0_clk>,
>                          <&lsio_bus_clk>, <&pwm0_clk>;
>                 bit-offset = <0 4 16 20 24>;

Are all LPCG instances the same, but some clocks are missing if the
child peripheral doesn't use certain clocks? IOW, bit 0 is always
ipg_clk, bit 24 is always ipg_mstr_clk?

Assuming so, 'bit-offset' should be removed and you should either have
a fixed number of clock entries with 0 entries for non-connected
clocks or use clock-names to define which clocks are present (with the
same set of defined names for all LPCG instances).

>                 clock-output-names = "pwm0_lpcg_ipg_clk",
>                                      "pwm0_lpcg_ipg_hf_clk",
>                                      "pwm0_lpcg_ipg_s_clk",
>                                      "pwm0_lpcg_ipg_slv_clk",
>                                      "pwm0_lpcg_ipg_mstr_clk";

IMO, this is wrong as the names should be relative to the module. So
'ipg_clk', 'ipg_hf_clk', etc.

>                 power-domains = <&pd IMX_SC_R_PWM_0>;
>                 status = "disabled";
>         };
>
>                 pwm1_lpcg: clock-controller@5d410000 {
>                                 ...
>                 }
>         ...
> };
>
> And for users, it could simply be:
> usdhc1: mmc@5b010000 {
>         clocks = <&sdhc0_lpcg 1>,
>                  <&sdhc0_lpcg 0>,
>                  <&sdhc0_lpcg 2>;
>         clock-names = "ipg", "per", "ahb";
>         assigned-clocks = <&sdhc0_clk>;
>         assigned-clock-rates = <200000000>;
>                 ....
> };
