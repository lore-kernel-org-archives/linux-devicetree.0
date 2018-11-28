From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 3/3] soc: imx: gpcv2: add support for i.MX8MQ SoC
Date: Wed, 28 Nov 2018 10:57:10 +0800
Message-ID: <20181128025709.GF20643@dragon>
References: <20181116154927.16152-1-l.stach@pengutronix.de>
 <20181116154927.16152-3-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181116154927.16152-3-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Anson Huang <anson.huang@nxp.com>, patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 16, 2018 at 04:49:27PM +0100, Lucas Stach wrote:
> The GPCv2 on the Freescale i.MX8MQ SoC works in the same way as the
> GPCv2 on the i.MX7, but only controls more power domains with a
> different mapping.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../bindings/power/fsl,imx-gpcv2.txt          |   7 +-

The series looks good to me.

@Rob, can you please ACK on the bindings change?

Shawn

>  drivers/soc/imx/Kconfig                       |   6 +-
>  drivers/soc/imx/Makefile                      |   2 +-
>  drivers/soc/imx/gpcv2.c                       | 208 +++++++++++++++++-
>  include/dt-bindings/power/imx8mq-power.h      |  21 ++
>  5 files changed, 237 insertions(+), 7 deletions(-)
>  create mode 100644 include/dt-bindings/power/imx8mq-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt b/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt
> index 9acce75b29ab..7c947a996df1 100644
> --- a/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt
> +++ b/Documentation/devicetree/bindings/power/fsl,imx-gpcv2.txt
> @@ -6,7 +6,9 @@ Control (PGC) for various power domains.
>  
>  Required properties:
>  
> -- compatible: Should be "fsl,imx7d-gpc"
> +- compatible: Should be one of:
> +	- "fsl,imx7d-gpc"
> +	- "fsl,imx8mq-gpc"
>  
>  - reg: should be register base and length as documented in the
>    datasheet
> @@ -22,7 +24,8 @@ which, in turn, is expected to contain the following:
>  Required properties:
>  
>  - reg: Power domain index. Valid values are defined in
> -  include/dt-bindings/power/imx7-power.h
> +  include/dt-bindings/power/imx7-power.h for fsl,imx7d-gpc and
> +  include/dt-bindings/power/imx8m-power.h for fsl,imx8mq-gpc
>  
>  - #power-domain-cells: Should be 0
