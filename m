From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH V3 1/2] dt-bindings: reset: imx7: Add support for i.MX8MM
Date: Thu, 04 Jul 2019 12:16:03 +0200
Message-ID: <1562235363.6641.10.camel@pengutronix.de>
References: <20190704094416.4757-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190704094416.4757-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, ping.bai@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Thu, 2019-07-04 at 17:44 +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> i.MX8MM can reuse i.MX8MQ's reset driver, update the compatible
> property and related info to support i.MX8MM.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V2:
> 	- Add separate line for i.MX8MM in case anything different later for i.MX8MM.
> ---
>  Documentation/devicetree/bindings/reset/fsl,imx7-src.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt b/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
> index 13e0951..c2489e4 100644
> --- a/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
> +++ b/Documentation/devicetree/bindings/reset/fsl,imx7-src.txt
> @@ -8,6 +8,7 @@ Required properties:
>  - compatible:
>  	- For i.MX7 SoCs should be "fsl,imx7d-src", "syscon"
>  	- For i.MX8MQ SoCs should be "fsl,imx8mq-src", "syscon"
> +	- For i.MX8MM SoCs should be "fsl,imx8mm-src", "fsl,imx8mq-src", "syscon"
>  - reg: should be register base and length as documented in the
>    datasheet
>  - interrupts: Should contain SRC interrupt
> @@ -46,5 +47,6 @@ Example:
>  
>  
>  For list of all valid reset indices see
> -<dt-bindings/reset/imx7-reset.h> for i.MX7 and
> -<dt-bindings/reset/imx8mq-reset.h> for i.MX8MQ
> +<dt-bindings/reset/imx7-reset.h> for i.MX7,
> +<dt-bindings/reset/imx8mq-reset.h> for i.MX8MQ and
> +<dt-bindings/reset/imx8mq-reset.h> for i.MX8MM

The last line is misleading, as that file contains reset indices that
are invalid for i.MX8MM.

regards
Philipp
