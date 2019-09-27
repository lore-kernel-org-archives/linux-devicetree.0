From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 2/3] dt-bindings: arm: fsl: add compatible string for
 Kobo Clara HD
Date: Fri, 27 Sep 2019 11:19:13 +0200
Message-ID: <20190927091913.iben3anhg3jr4eps@pengutronix.de>
References: <20190927061423.17278-1-andreas@kemnade.info>
 <20190927061423.17278-3-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190927061423.17278-3-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, manivannan.sadhasivam@linaro.org, andrew.smirnov@gmail.com, marex@denx.de, angus@akkea.ca, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, j.neuschaefer@gmx.net, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

Hi Andreas,

On 19-09-27 08:14, Andreas Kemnade wrote:
> This adds a compatible string fro the Kobo Clara HD eBook reader.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---

Just a nitpick, this should be patch number 1.

Regards,
  Marco

>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 7294ac36f4c0..afa3bfeca0c0 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -148,6 +148,7 @@ properties:
>          items:
>            - enum:
>                - fsl,imx6sll-evk
> +              - kobo,clarahd
>            - const: fsl,imx6sll
>  
>        - description: i.MX6SX based Boards
> -- 
> 2.20.1
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
