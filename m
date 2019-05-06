Return-Path: <SRS0=1u45=TG=linaro.org=rui.silva@kernel.org>
References: <20190504144027.31920-1-festevam@gmail.com> <20190504144027.31920-6-festevam@gmail.com>
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH 1/8] media: dt-bindings: imx7-csi: Document a single CSI clock
In-reply-to: <20190504144027.31920-6-festevam@gmail.com>
Date: Mon, 06 May 2019 22:21:40 +0100
Message-ID: <m3ef5b5lej.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain
To: Fabio Estevam <festevam@gmail.com>
Cc: hverkuil-cisco@xs4all.nl, slongerbeam@gmail.com, p.zabel@pengutronix.de, linux-media@vger.kernel.org, sebastien.szymanski@armadeus.com, otavio@ossystems.com.br, robh+dt@kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Oi Fabio,
On Sat 04 May 2019 at 15:40, Fabio Estevam wrote:
> As per the i.MX7D Reference Manual only the MCLK is used for
> the CSI block, so only document this single clock.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

You missed to add a cover-letter to the series, but I have tested
it and reviewed on top of Steve series [0] and everything looks good.

Thanks for fixes.

For the all series:
Tested-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

---
Cheers,
	Rui

[0]: https://lore.kernel.org/linux-media/20190503224326.21039-1-slongerbeam@gmail.com/

> ---
>  Documentation/devicetree/bindings/media/imx7-csi.txt | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/imx7-csi.txt b/Documentation/devicetree/bindings/media/imx7-csi.txt
> index 3c07bc676bc3..443aef07356e 100644
> --- a/Documentation/devicetree/bindings/media/imx7-csi.txt
> +++ b/Documentation/devicetree/bindings/media/imx7-csi.txt
> @@ -14,8 +14,7 @@ Required properties:
>  - interrupts    : should contain CSI interrupt;
>  - clocks        : list of clock specifiers, see
>          Documentation/devicetree/bindings/clock/clock-bindings.txt for details;
> -- clock-names   : must contain "axi", "mclk" and "dcic" entries, matching
> -                 entries in the clock property;
> +- clock-names   : must contain "mclk";
>  
>  The device node shall contain one 'port' child node with one child 'endpoint'
>  node, according to the bindings defined in:
> @@ -32,10 +31,8 @@ example:
>                          compatible = "fsl,imx7-csi";
>                          reg = <0x30710000 0x10000>;
>                          interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> -                        clocks = <&clks IMX7D_CLK_DUMMY>,
> -                                        <&clks IMX7D_CSI_MCLK_ROOT_CLK>,
> -                                        <&clks IMX7D_CLK_DUMMY>;
> -                        clock-names = "axi", "mclk", "dcic";
> +                        clocks = <&clks IMX7D_CSI_MCLK_ROOT_CLK>;
> +                        clock-names = "mclk";
>  
>                          port {
>                                  csi_from_csi_mux: endpoint {
