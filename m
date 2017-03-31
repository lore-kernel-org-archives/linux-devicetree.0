From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] dts: arm64: add LS1043A DPAA QBMan nodes
Date: Fri, 31 Mar 2017 10:02:57 +0800
Message-ID: <20170331020255.GI683@dragon>
References: <1490884672-18294-1-git-send-email-madalin.bucur@nxp.com>
 <1490884672-18294-3-git-send-email-madalin.bucur@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1490884672-18294-3-git-send-email-madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Gang.Liu-3arQi8VN3Tc@public.gmane.org, Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 30, 2017 at 05:37:51PM +0300, Madalin Bucur wrote:
> Add the DPAA 1.x QMan and BMan nodes in the LS1043A device tree.
> 
> Signed-off-by: Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 52 ++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> index ec13a6e..8434e89 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> @@ -106,6 +106,33 @@
>  		      /* DRAM space 1, size: 2GiB DRAM */
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		bman_fbpr: bman-fbpr {
> +			compatible = "shared-dma-pool";
> +			size = <0 0x1000000>;
> +			alignment = <0 0x1000000>;
> +			no-map;
> +		};
> +
> +		qman_fqd: qman-fqd {
> +			compatible = "shared-dma-pool";
> +			size = <0 0x400000>;
> +			alignment = <0 0x400000>;
> +			no-map;
> +		};
> +
> +		qman_pfdr: qman-pfdr {
> +			compatible = "shared-dma-pool";
> +			size = <0 0x2000000>;
> +			alignment = <0 0x2000000>;
> +			no-map;
> +		};
> +	};
> +
>  	sysclk: sysclk {
>  		compatible = "fixed-clock";
>  		#clock-cells = <0>;
> @@ -333,6 +360,28 @@
>  			};
>  		};
>  
> +		qman: qman@1880000 {
> +			compatible = "fsl,qman";
> +			reg = <0x00 0x1880000 0x0 0x10000>;

s/0x00/0x0?

Shawn

> +			interrupts = <0 45 0x4>;
> +			memory-region = <&qman_fqd &qman_pfdr>;
> +		};
> +
> +		bman: bman@1890000 {
> +			compatible = "fsl,bman";
> +			reg = <0x00 0x1890000 0x0 0x10000>;
> +			interrupts = <0 45 0x4>;
> +			memory-region = <&bman_fbpr>;
> +		};
> +
> +		bportals: bman-portals@508000000 {
> +			ranges = <0x0 0x5 0x08000000 0x8000000>;
> +		};
> +
> +		qportals: qman-portals@500000000 {
> +			ranges = <0x0 0x5 0x00000000 0x8000000>;
> +		};
> +
>  		dspi0: dspi@2100000 {
>  			compatible = "fsl,ls1043a-dspi", "fsl,ls1021a-v1.0-dspi";
>  			#address-cells = <1>;
> @@ -686,3 +735,6 @@
>  	};
>  
>  };
> +
> +#include "qoriq-qman1-portals.dtsi"
> +#include "qoriq-bman1-portals.dtsi"
> -- 
> 2.1.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
