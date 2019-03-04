From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: ls1028a: add pmu dt nodes
Date: Mon, 4 Mar 2019 09:48:40 +0800
Message-ID: <20190304014838.GV26041@dragon>
References: <20190227015752.18342-1-alison.wang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190227015752.18342-1-alison.wang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alison Wang <alison.wang@nxp.com>
Cc: leoyang.li@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 27, 2019 at 09:57:52AM +0800, Alison Wang wrote:
> This patch adds pmu dt nodes for LS1028A.
> 
> Signed-off-by: Alison Wang <alison.wang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index a8cf92a..36ef9c5 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -89,6 +89,11 @@
>  					  IRQ_TYPE_LEVEL_LOW)>;
>  	};
>  
> +	pmu {
> +		compatible = "arm,armv8-pmuv3";

Shouldn't we use "arm,cortex-a72-pmu" as compatible for better?

Shawn

> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
>  	gic: interrupt-controller@6000000 {
>  		compatible= "arm,gic-v3";
>  		#address-cells = <2>;
> -- 
> 1.7.1
> 
