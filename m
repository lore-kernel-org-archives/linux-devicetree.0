From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 4/4] ARM: imx6: adopt DT to new GPC binding
Date: Wed, 8 Mar 2017 12:06:03 +0100
Message-ID: <20170308110600.GB17029@x250>
References: <20170217190246.14881-1-l.stach@pengutronix.de>
 <20170217190246.14881-4-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170217190246.14881-4-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: devicetree@vger.kernel.org, Andrey Smirnov <andrew.smirnov@gmail.com>, patchwork-lst@pengutronix.de, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 17, 2017 at 08:02:46PM +0100, Lucas Stach wrote:
> Adopt the i.MX6Q/DL DT to the new and more flexible GPC binding.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

I don't want to introduce a dependency between branches, so please
remind me to apply it after GPC driver changes land on mainline.  And
one small comment below ...

> ---
> v2: adapt to changed domain supply name
> ---
>  arch/arm/boot/dts/imx6q.dtsi   |  2 +-
>  arch/arm/boot/dts/imx6qdl.dtsi | 38 +++++++++++++++++++++++++++-----------
>  2 files changed, 28 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
> index e9a5d0b8c7b0..dd33849335b2 100644
> --- a/arch/arm/boot/dts/imx6q.dtsi
> +++ b/arch/arm/boot/dts/imx6q.dtsi
> @@ -125,7 +125,7 @@
>  			clocks = <&clks IMX6QDL_CLK_OPENVG_AXI>,
>  				 <&clks IMX6QDL_CLK_GPU2D_CORE>;
>  			clock-names = "bus", "core";
> -			power-domains = <&gpc 1>;
> +			power-domains = <&pd_pu>;
>  		};
>  
>  		ipu2: ipu@02800000 {
> diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
> index 53e6e63cbb02..8538b04af097 100644
> --- a/arch/arm/boot/dts/imx6qdl.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl.dtsi
> @@ -1,3 +1,4 @@
> +
>  /*
>   * Copyright 2011 Freescale Semiconductor, Inc.
>   * Copyright 2011 Linaro Ltd.

This is an unrelated change.

Shawn
