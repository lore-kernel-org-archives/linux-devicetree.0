From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V4 4/4] dt-bindings: arm: imx: Add the soc binding for
 i.MX8MQ
Date: Mon, 12 Aug 2019 14:30:28 +0200
Message-ID: <20190812123026.GA27041@X250>
References: <20190619022145.42398-1-Anson.Huang@nxp.com>
 <20190619022145.42398-4-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190619022145.42398-4-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, andrew.smirnov@gmail.com, manivannan.sadhasivam@linaro.org, j.neuschaefer@gmx.net, u.kleine-koenig@pengutronix.de, leoyang.li@nxp.com, aisheng.dong@nxp.com, l.stach@pengutronix.de, vabhav.sharma@nxp.com, bhaskar.upadhaya@nxp.com, ping.bai@nxp.com, pramod.kumar_1@nxp.com, leonard.crestez@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Wed, Jun 19, 2019 at 10:21:45AM +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> This patch adds the soc & board binding for i.MX8MQ.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> No changes.
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index b35abb1..f944df8 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -183,6 +183,12 @@ properties:
>                - fsl,imx8mn-ddr4-evk            # i.MX8MN DDR4 EVK Board
>            - const: fsl,imx8mn
>  
> +      - description: i.MX8MQ based Boards
> +        items:
> +          - enum:
> +              - fsl,imx8mq-evk            # i.MX8MQ EVK Board
> +          - const: fsl,imx8mq
> +

We already have this with e126417ff1b1 (dt-bindings: arm: fsl: Add the
imx8mq boards).

Shawn

>        - description: i.MX8QXP based Boards
>          items:
>            - enum:
> -- 
> 2.7.4
> 
