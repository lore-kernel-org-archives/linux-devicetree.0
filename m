From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx8mq: Add sai3 and sai6 nodes
Date: Tue, 2 Jul 2019 16:14:37 +0300
Message-ID: <CAEnQRZDC_wxHbs4ZpeKTo9z7T-tdgeDLwgcf+DLRfZmXDga20A@mail.gmail.com>
References: <20190702131155.18170-1-andradanciu1997@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190702131155.18170-1-andradanciu1997@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andra Danciu <andradanciu1997@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, andrew.smirnov@gmail.com, "Angus Ainslie (Purism)" <angus@akkea.ca>, Carlo Caione <ccaione@baylibre.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Devicetree List <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Looks better now. One comment inline:

On Tue, Jul 2, 2019 at 4:12 PM Andra Danciu <andradanciu1997@gmail.com> wrote:
>
> SAI3 and SAI6 nodes are used to connect to an external codec.
> They have 1 Tx and 1 Rx dataline.
>
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Andra Danciu <andradanciu1997@gmail.com>
> ---
> Changes since v1:
>         - Added sai3 node because we need it to enable audio on pico-pi-8m
>         - Added commit description
>
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index d09b808eff87..2d489c5cdc26 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -278,6 +278,20 @@
>                         #size-cells = <1>;
>                         ranges = <0x30000000 0x30000000 0x400000>;
>
> +                       sai6: sai@30030000 {
> +                               compatible = "fsl,imx8mq-sai",
> +                                       "fsl,imx6sx-sai";
> +                               reg = <0x30030000 0x10000>;
> +                               interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +                               clocks = <&clk IMX8MQ_CLK_SAI6_IPG>,
> +                                       <&clk IMX8MQ_CLK_SAI6_ROOT>,
> +                                       <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
> +                               clock-names = "bus", "mclk1", "mclk2", "mclk3";
> +                               dmas = <&sdma2 4 24 0>, <&sdma2 5 24 0>;
> +                               dma-names = "rx", "tx";
> +                               status = "disabled";
> +                       };
> +
>                         gpio1: gpio@30200000 {
>                                 compatible = "fsl,imx8mq-gpio", "fsl,imx35-gpio";
>                                 reg = <0x30200000 0x10000>;
> @@ -728,6 +742,22 @@
>                                 status = "disabled";
>                         };
>
> +                       sai3: sai@308c0000 {
> +                               compatible = "fsl,imx8mq-sai",
> +                                            "fsl,imx6sx-sai";
> +                               reg = <0x308c0000 0x10000>;
> +                               interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +                               clocks = <&clk IMX8MQ_CLK_SAI3_IPG>,
> +                                       <&clk IMX8MQ_CLK_DUMMY>,
> +                                       <&clk IMX8MQ_CLK_SAI3_ROOT>,
> +                                       <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
> +                               clock-names = "bus", "mclk1", "mclk2", "mclk3";
> +                               dmas = <&sdma1 12 24 0>, <&sdma1 13 24 0>;
> +                               dma-names = "rx", "tx";
> +                               status = "disabled";
> +                       };
> +
> +

Please don't use multiple blank lines here.

>                         i2c1: i2c@30a20000 {
>                                 compatible = "fsl,imx8mq-i2c", "fsl,imx21-i2c";
>                                 reg = <0x30a20000 0x10000>;
> --
> 2.11.0
>
