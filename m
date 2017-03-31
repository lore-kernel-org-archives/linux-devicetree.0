From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] dts: arm64: add LS1046A DPAA QBMan nodes
Date: Fri, 31 Mar 2017 10:29:43 +0800
Message-ID: <20170331022941.GJ683@dragon>
References: <1490884672-18294-1-git-send-email-madalin.bucur@nxp.com>
 <1490884672-18294-4-git-send-email-madalin.bucur@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1490884672-18294-4-git-send-email-madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, Gang.Liu-3arQi8VN3Tc@public.gmane.org, Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 30, 2017 at 05:37:52PM +0300, Madalin Bucur wrote:
> Add the QBMan device tree nodes for LS1046A devices.
> 
> Signed-off-by: Roy Pledge <roy.pledge-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Madalin Bucur <madalin.bucur-3arQi8VN3Tc@public.gmane.org>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 52 ++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> index 4a164b8..67e073a 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> @@ -268,6 +268,30 @@
>  			};
>  		};
>  
> +		qman: qman@1880000 {
> +			compatible = "fsl,qman";
> +			reg = <0x00 0x1880000 0x0 0x10000>;
> +			interrupts = <0 45 0x4>;
> +			memory-region = <&qman_fqd &qman_pfdr>;
> +
> +		};
> +
> +		bman: bman@1890000 {
> +			compatible = "fsl,bman";
> +			reg = <0x00 0x1890000 0x0 0x10000>;
> +			interrupts = <0 45 0x4>;
> +			memory-region = <&bman_fbpr>;
> +
> +		};
> +
> +		qportals: qman-portals@500000000 {
> +			ranges = <0x0 0x5 0x00000000 0x8000000>;
> +		};
> +
> +		bportals: bman-portals@508000000 {
> +			ranges = <0x0 0x5 0x08000000 0x8000000>;
> +		};
> +
>  		dcfg: dcfg@1ee0000 {
>  			compatible = "fsl,ls1046a-dcfg", "syscon";
>  			reg = <0x0 0x1ee0000 0x0 0x10000>;
> @@ -592,4 +616,32 @@
>  			clocks = <&clockgen 4 1>;
>  		};
>  	};
> +
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

Please have a newline between nodes.

Shawn

> +		qman_fqd: qman-fqd {
> +			compatible = "shared-dma-pool";
> +			size = <0 0x800000>;
> +			alignment = <0 0x800000>;
> +			no-map;
> +		};
> +		qman_pfdr: qman-pfdr {
> +			compatible = "shared-dma-pool";
> +			size = <0 0x2000000>;
> +			alignment = <0 0x2000000>;
> +			no-map;
> +		};
> +	};
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
