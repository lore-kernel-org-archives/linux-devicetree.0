MIME-Version: 1.0
Date: Fri, 3 May 2019 09:53:16 -0500
References: <1556846821-8581-1-git-send-email-aisheng.dong@nxp.com>
	<1556846821-8581-2-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1556846821-8581-2-git-send-email-aisheng.dong@nxp.com>
Message-ID: <CAL_JsqLJ+Lc_3huQizy4BVFgVV94Yg8KsOOgXLv4dQU8H=WfWw@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: firmware: imx-scu: new binding to
 parse clocks from device tree
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Aisheng Dong <aisheng.dong@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, May 2, 2019 at 8:34 PM Aisheng Dong <aisheng.dong@nxp.com> wrote:
>
> There's a few limitations on the original one cell clock binding
> (#clock-cells = <1>) that we have to define all clock IDs for device
> tree to reference. This may cause troubles if we want to use common
> clock IDs for multi platforms support when the clock of those platforms
> are mostly the same.
> e.g. Current clock IDs name are defined with SS prefix.
>
> However the device may reside in different SS across CPUs, that means the
> SS prefix may not valid anymore for a new SoC. Furthermore, the device
> availability of those clocks may also vary a bit.
>
> For such situation, We formerly planned to add all new IDs for each SS
> and dynamically check availability for different SoC in driver. That can
> be done but that may involve a lot effort and may result in more changes
> and duplicated code in driver, also make device tree upstreaming hard which
> depends on Clock IDs.
>
> To relief this situation, we want to move the clock definition into
> device tree which can fully decouple the dependency of Clock ID definition
> from device tree. This can make us write a full generic clock driver
> for SCU based SoCs. No more frequent changes needed in clock driver
> any more.
>
> In the meanwhile, we can also use the existence of clock nodes in device
> tree to address the device and clock availability differences across
> different SoCs.
>
> For SCU clocks, only two params required. The first one is resource id
> which is encoded in reg property and the second is clock type index
> which is encoded in generic clock-indices property they're not continuously.
>
> And as we also want to support clock set parent function, 'clocks' property
> is also used to pass all the possible input parents.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> ChangeLog:
> v1->v2:
>  * changed to one cell binding inspired by arm,scpi.txt
>    Documentation/devicetree/bindings/arm/arm,scpi.txt
>    Resource ID is encoded in 'reg' property.
>    Clock type is encoded in generic clock-indices property.
>    Then we don't have to search all the DT nodes to fetch
>    those two value to construct clocks which is relatively
>    low efficiency.
>  * Add required power-domain property as well.
> ---
>  .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 45 ++++++++++++++++++----
>  include/dt-bindings/firmware/imx/rsrc.h            | 17 ++++++++
>  2 files changed, 54 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> index 5d7dbab..2f46e89 100644
> --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> @@ -89,6 +89,27 @@ Required properties:
>                           "fsl,imx8qm-clock"
>                           "fsl,imx8qxp-clock"
>                         followed by "fsl,scu-clk"
> +- #address-cells:      Should be 1.
> +- #size-cells:         Should be 0.
> +
> +Sub nodes are required to represent all available SCU clocks within this
> +hardware subsystem and the following properties are needed:
> +
> +- reg:                 Should contain the Resource ID of this SCU clock.
> +- #clock-cells:                Should be 1.
> +- clock-indices:       Index of all clock types supported by this SCU clock.
> +                       The order should match the clock-output-names array.
> +                       Refer to <include/dt-bindings/firmware/imx/rsrc.h> for
> +                       available clock types supported by SCU.

I would have expected the clock cell to contain the Resource ID.

Also, this still has one clock per node which you should avoid unless
there's only a small number of clocks (say ~20). Move this all to a
single node with the list of clock IDs in clock-indices and other
properties like power-domains can match up with clock-indices. IOW,
both should have the same length (in elements).

For the clock type, perhaps combine that in the clock cell with the
resource ID such as using the upper 8-bits.

> +- clock-output-names:  Shall be the corresponding names of the outputs.
> +- power-domains:       Should contain the power domain used by this SCU clock.
> +
> +Optional properties:
> +- clocks:              Shall be the input parent clock(s) phandle for the clock.
> +                       For multiplexed clocks, the list order must match the hardware
> +                       programming order.
> +
> +Legacy Clock binding (No sub-nodes which is DEPRECATED):
>  - #clock-cells:                Should be 1. Contains the Clock ID value.
>  - clocks:              List of clock specifiers, must contain an entry for
>                         each required entry in clock-names
> @@ -144,6 +165,21 @@ lsio_mu1: mailbox@5d1c0000 {
>         #mbox-cells = <2>;
>  };
>
> +conn-scu-clock-controller {
> +       compatible = "fsl,imx8qxp-clk", "fsl,scu-clk";
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       uart0_clk: clock-scu@57 {
> +               reg = <57>;
> +               #clock-cells = <1>;
> +               clock-indices = <IMX_SC_PM_CLK_PER>;
> +               clock-output-names = "uart0_clk";
> +               power-domains = <&pd IMX_SC_R_UART_0>;
> +       };
> +       ...
> +}
> +
>  firmware {
>         scu {
>                 compatible = "fsl,imx-scu";
> @@ -160,11 +196,6 @@ firmware {
>                           &lsio_mu1 1 3
>                           &lsio_mu1 3 3>;
>
> -               clk: clk {
> -                       compatible = "fsl,imx8qxp-clk", "fsl,scu-clk";
> -                       #clock-cells = <1>;
> -               };
> -
>                 iomuxc {
>                         compatible = "fsl,imx8qxp-iomuxc";
>
> @@ -192,8 +223,6 @@ serial@5a060000 {
>         ...
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_lpuart0>;
> -       clocks = <&clk IMX8QXP_UART0_CLK>,
> -                <&clk IMX8QXP_UART0_IPG_CLK>;
> -       clock-names = "per", "ipg";
> +       clocks = <&uart0_clk IMX_SC_PM_CLK_PER>;
>         power-domains = <&pd IMX_SC_R_UART_0>;
>  };
> diff --git a/include/dt-bindings/firmware/imx/rsrc.h b/include/dt-bindings/firmware/imx/rsrc.h
> index 4e61f64..fbeaca7 100644
> --- a/include/dt-bindings/firmware/imx/rsrc.h
> +++ b/include/dt-bindings/firmware/imx/rsrc.h
> @@ -547,4 +547,21 @@
>  #define IMX_SC_R_ATTESTATION           545
>  #define IMX_SC_R_LAST                  546
>
> +/*
> + * Defines for SC PM CLK
> + */
> +#define IMX_SC_PM_CLK_SLV_BUS          0       /* Slave bus clock */
> +#define IMX_SC_PM_CLK_MST_BUS          1       /* Master bus clock */
> +#define IMX_SC_PM_CLK_PER              2       /* Peripheral clock */
> +#define IMX_SC_PM_CLK_PHY              3       /* Phy clock */
> +#define IMX_SC_PM_CLK_MISC             4       /* Misc clock */
> +#define IMX_SC_PM_CLK_MISC0            0       /* Misc 0 clock */
> +#define IMX_SC_PM_CLK_MISC1            1       /* Misc 1 clock */
> +#define IMX_SC_PM_CLK_MISC2            2       /* Misc 2 clock */
> +#define IMX_SC_PM_CLK_MISC3            3       /* Misc 3 clock */
> +#define IMX_SC_PM_CLK_MISC4            4       /* Misc 4 clock */
> +#define IMX_SC_PM_CLK_CPU              2       /* CPU clock */
> +#define IMX_SC_PM_CLK_PLL              4       /* PLL */
> +#define IMX_SC_PM_CLK_BYPASS           4       /* Bypass clock */

I don't understand how these work with overlapping numbers.

Rob
