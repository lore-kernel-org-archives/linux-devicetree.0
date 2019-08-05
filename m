From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH v3 01/11] dt-bindings: firmware: imx-scu: new binding to
 parse clocks from device tree
Date: Mon, 5 Aug 2019 11:48:29 +0800
Message-ID: <CAA+hA=Sm0MAHNwH1sZQfK8cO+3jLkue97u=ceFiUv34+qGos1Q@mail.gmail.com>
References: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
 <1563289265-10977-2-git-send-email-aisheng.dong@nxp.com>
 <20190803144246.GM8870@X250.getinternet.no>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190803144246.GM8870@X250.getinternet.no>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, devicetree <devicetree@vger.kernel.org>, sboyd@kernel.org, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-clk <linux-clk@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Aug 4, 2019 at 11:49 AM Shawn Guo <shawnguo@kernel.org> wrote:
>
> On Tue, Jul 16, 2019 at 11:00:55PM +0800, Dong Aisheng wrote:
> > There's a few limitations on the original one cell clock binding
> > (#clock-cells = <1>) that we have to define some SW clock IDs for device
> > tree to reference. This may cause troubles if we want to use common
> > clock IDs for multi platforms support when the clock of those platforms
> > are mostly the same.
> > e.g. Current clock IDs name are defined with SS prefix.
> >
> > However the device may reside in different SS across CPUs, that means the
> > SS prefix may not valid anymore for a new SoC. Furthermore, the device
> > availability of those clocks may also vary a bit.
> >
> > For such situation, we want to eliminate the using of SW Clock IDs and
> > change to use a more close to HW one instead.
> > For SCU clocks usage, only two params required: Resource id + Clock Type.
>
> If this is how SCU firmware addresses the clock, I agree that it's worth
> witching to this new bindings, which describes the hardware (SCU
> firmware in this case) better, IMO.
>
> > Both parameters are platform independent. So we could use two cells binding
> > to pass those parameters,
> >
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <kernel@pengutronix.de>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> > ChangeLog:
> > v2->v3:
> >  * Changed to two cells binding and register all clocks in driver
> >    instead of parse from device tree.
> > v1->v2:
> >  * changed to one cell binding inspired by arm,scpi.txt
> >    Documentation/devicetree/bindings/arm/arm,scpi.txt
> >    Resource ID is encoded in 'reg' property.
> >    Clock type is encoded in generic clock-indices property.
> >    Then we don't have to search all the DT nodes to fetch
> >    those two value to construct clocks which is relatively
> >    low efficiency.
> >  * Add required power-domain property as well.
> > ---
> >  .../devicetree/bindings/arm/freescale/fsl,scu.txt       | 12 +++++++-----
> >  include/dt-bindings/firmware/imx/rsrc.h                 | 17 +++++++++++++++++
> >  2 files changed, 24 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > index 5d7dbab..351d335 100644
> > --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > @@ -89,7 +89,10 @@ Required properties:
> >                         "fsl,imx8qm-clock"
> >                         "fsl,imx8qxp-clock"
> >                       followed by "fsl,scu-clk"
> > -- #clock-cells:              Should be 1. Contains the Clock ID value.
> > +- #clock-cells:              Should be either
> > +                     2: Contains the Resource and Clock ID value.
> > +                     or
> > +                     1: Contains the Clock ID value. (DEPRECATED)
> >  - clocks:            List of clock specifiers, must contain an entry for
> >                       each required entry in clock-names
> >  - clock-names:               Should include entries "xtal_32KHz", "xtal_24MHz"
> > @@ -162,7 +165,7 @@ firmware {
> >
> >               clk: clk {
> >                       compatible = "fsl,imx8qxp-clk", "fsl,scu-clk";
> > -                     #clock-cells = <1>;
> > +                     #clock-cells = <2>;
> >               };
> >
> >               iomuxc {
> > @@ -192,8 +195,7 @@ serial@5a060000 {
> >       ...
> >       pinctrl-names = "default";
> >       pinctrl-0 = <&pinctrl_lpuart0>;
> > -     clocks = <&clk IMX8QXP_UART0_CLK>,
> > -              <&clk IMX8QXP_UART0_IPG_CLK>;
> > -     clock-names = "per", "ipg";
> > +     clocks = <&uart0_clk IMX_SC_R_UART_0 IMX_SC_PM_CLK_PER>;
> > +     clock-names = "ipg";
> >       power-domains = <&pd IMX_SC_R_UART_0>;
> >  };
> > diff --git a/include/dt-bindings/firmware/imx/rsrc.h b/include/dt-bindings/firmware/imx/rsrc.h
> > index 4e61f64..fbeaca7 100644
> > --- a/include/dt-bindings/firmware/imx/rsrc.h
> > +++ b/include/dt-bindings/firmware/imx/rsrc.h
> > @@ -547,4 +547,21 @@
> >  #define IMX_SC_R_ATTESTATION         545
> >  #define IMX_SC_R_LAST                        546
> >
> > +/*
> > + * Defines for SC PM CLK
> > + */
> > +#define IMX_SC_PM_CLK_SLV_BUS                0       /* Slave bus clock */
> > +#define IMX_SC_PM_CLK_MST_BUS                1       /* Master bus clock */
> > +#define IMX_SC_PM_CLK_PER            2       /* Peripheral clock */
> > +#define IMX_SC_PM_CLK_PHY            3       /* Phy clock */
> > +#define IMX_SC_PM_CLK_MISC           4       /* Misc clock */

This is for typical device resource.

> > +#define IMX_SC_PM_CLK_MISC0          0       /* Misc 0 clock */
> > +#define IMX_SC_PM_CLK_MISC1          1       /* Misc 1 clock */
> > +#define IMX_SC_PM_CLK_MISC2          2       /* Misc 2 clock */
> > +#define IMX_SC_PM_CLK_MISC3          3       /* Misc 3 clock */
> > +#define IMX_SC_PM_CLK_MISC4          4       /* Misc 4 clock */

This is for some special clock types which do not belong to above
normal clock types.
Used very rare in SCU firmware.
e.g.
enet0_mac0_rxclk SC_R_ENE T_0 / SC_PM_CL K_MISC0

> > +#define IMX_SC_PM_CLK_CPU            2       /* CPU clock */
> > +#define IMX_SC_PM_CLK_PLL            4       /* PLL */
> > +#define IMX_SC_PM_CLK_BYPASS         4       /* Bypass clock */

They're for specific clock types for CPU/PLL/BYPASS only.

>
> It seems that there are several sets of clock type which apply to
> different resources/devices?  If so, can you separate them a bit with
> some comments to make the list easier for readers?
>

Yes, i could add comments as above.
Thanks for the suggestions.

Aisheng

> Shawn
>
> > +
> >  #endif /* __DT_BINDINGS_RSCRC_IMX_H */
> > --
> > 2.7.4
> >
