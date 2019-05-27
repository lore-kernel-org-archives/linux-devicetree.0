Return-Path: <SRS0=1AIr=T3=gmail.com=festevam@kernel.org>
MIME-Version: 1.0
References: <20190504144027.31920-1-festevam@gmail.com> <20190504144027.31920-6-festevam@gmail.com>
In-Reply-To: <20190504144027.31920-6-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 27 May 2019 17:18:44 -0300
Message-ID: <CAOMZO5AZBQuD8Tdhbf+r4C6M7zZy9VevVQoyb8o4KJY4EkO9WA@mail.gmail.com>
Subject: Re: [PATCH 1/8] media: dt-bindings: imx7-csi: Document a single CSI clock
Content-Type: text/plain; charset="UTF-8"
To: Rob Herring <robh+dt@kernel.org>
Cc: Rui Miguel Silva <rui.silva@linaro.org>, Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-media <linux-media@vger.kernel.org>, =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>, Otavio Salvador <otavio@ossystems.com.br>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, hverkuil-cisco@xs4all.nl
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

On Sat, May 4, 2019 at 11:40 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> As per the i.MX7D Reference Manual only the MCLK is used for
> the CSI block, so only document this single clock.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
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

Any comments, please?

Thanks
