From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: ls1088a: add fsl-mc hardware resource
 manager node
Date: Thu, 16 Nov 2017 16:39:21 +0800
Message-ID: <20171116083920.GK25384@dragon>
References: <1510147805-24873-1-git-send-email-ioana.ciornei@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1510147805-24873-1-git-send-email-ioana.ciornei-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ioana Ciornei <ioana.ciornei-3arQi8VN3Tc@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 08, 2017 at 03:30:05PM +0200, Ioana Ciornei wrote:
> Add the fsl-mc node in the LS1088A device tree.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei-3arQi8VN3Tc@public.gmane.org>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 62 ++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index bd80e9a..aa37ffe 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -166,6 +166,68 @@
>  			     <1 10 IRQ_TYPE_LEVEL_LOW>;/* Hypervisor PPI */
>  	};
>  
> +	fsl_mc: fsl-mc@80c000000 {

The unit-address of the node should be somehow related to 'reg'
property.  Can you please help me understand how they are related?

> +		compatible = "fsl,qoriq-mc";
> +		reg = <0x00000008 0x0c000000 0 0x40>,	 /* MC portal base */
> +		      <0x00000000 0x08340000 0 0x40000>; /* MC control reg */
> +		msi-parent = <&its>;
> +		#address-cells = <3>;
> +		#size-cells = <1>;
> +
> +		/*
> +		 * Region type 0x0 - MC portals
> +		 * Region type 0x1 - QBMAN portals
> +		 */
> +		ranges = <0x0 0x0 0x0 0x8 0x0c000000 0x4000000
> +			  0x1 0x0 0x0 0x8 0x18000000 0x8000000>;
> +
> +		dpmacs {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			dpmac1: dpmac@1 {
> +				compatible = "fsl,qoriq-mc-dpmac";
> +				reg = <1>;
> +			};

Please have a newline in between nodes.

Shawn

> +			dpmac2: dpmac@2 {
> +				compatible = "fsl,qoriq-mc-dpmac";
> +				reg = <2>;
> +			};
> +			dpmac3: dpmac@3 {
> +				compatible = "fsl,qoriq-mc-dpmac";
> +				reg = <3>;
> +			};
> +			dpmac4: dpmac@4 {
> +				compatible = "fsl,qoriq-mc-dpmac";
> +				reg = <4>;
> +			};
> +			dpmac5: dpmac@5 {
> +				compatible = "fsl,qoriq-mc-dpmac";
> +				reg = <5>;
> +			};
> +			dpmac6: dpmac@6 {
> +				compatible = "fsl,qoriq-mc-dpmac";
> +				reg = <6>;
> +			};
> +			dpmac7: dpmac@7 {
> +				compatible = "fsl,qoriq-mc-dpmac";
> +				reg = <7>;
> +			};
> +			dpmac8: dpmac@8 {
> +				compatible = "fsl,qoriq-mc-dpmac";
> +				reg = <8>;
> +			};
> +			dpmac9: dpmac@9 {
> +				compatible = "fsl,qoriq-mc-dpmac";
> +				reg = <9>;
> +			};
> +			dpmac10: dpmac@10 {
> +				compatible = "fsl,qoriq-mc-dpmac";
> +				reg = <0xa>;
> +			};
> +		};
> +	};
> +
>  	psci {
>  		compatible = "arm,psci-0.2";
>  		method = "smc";
> -- 
> 1.9.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
