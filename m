From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: imx7d: Fix PAD_CTL_DSE_X*
Date: Wed, 3 Apr 2019 15:43:43 +0700
Message-ID: <20190403084341.GA4636@X250>
References: <20190313142040.26694-1-cquast@hanoverdisplays.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190313142040.26694-1-cquast@hanoverdisplays.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, VI1PR04MB42227AA158BA1FCBF314AA27807B0@VI1PR04MB4222.eurprd04.prod.outlook.com
Cc: aisheng.dong@nxp.com, festevam@gmail.com, stefan@agner.ch, kernel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Christina Quast <cquast@hanoverdisplays.com>
List-Id: devicetree@vger.kernel.org

Hi Linus,

I assume this will go via your tree.  Let me know if you think
differently.

Shawn

On Wed, Mar 13, 2019 at 03:20:40PM +0100, Christina Quast wrote:
> In the iMX7d datasheet, the PAD_CTL_DSE_X* values are different from
> the documentation.
> 
> Changes since v2:
> * Changed patch title to 'dt-bindings: pinctrl: imx7d:'
> 
> Signed-off-by: Christina Quast <cquast@hanoverdisplays.com>
> ---
>  .../devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt       | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
> index 6666277c3acb..8ac1d0851a0f 100644
> --- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.txt
> @@ -48,9 +48,9 @@ PAD_CTL_HYS                     (1 << 3)
>  PAD_CTL_SRE_SLOW                (1 << 2)
>  PAD_CTL_SRE_FAST                (0 << 2)
>  PAD_CTL_DSE_X1                  (0 << 0)
> -PAD_CTL_DSE_X2                  (1 << 0)
> -PAD_CTL_DSE_X3                  (2 << 0)
> -PAD_CTL_DSE_X4                  (3 << 0)
> +PAD_CTL_DSE_X4                  (1 << 0)
> +PAD_CTL_DSE_X2                  (2 << 0)
> +PAD_CTL_DSE_X6                  (3 << 0)
>  
>  Examples:
>  While iomuxc-lpsr is intended to be used by dedicated peripherals to take
> -- 
> 2.20.1
> 
