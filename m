From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2 v2] arm64: dts: ls2080a: fsl-mc dt node updates
Date: Mon, 18 Apr 2016 10:56:18 +0800
Message-ID: <20160418025618.GU28903@tiger>
References: <1460581523-32146-1-git-send-email-stuart.yoder@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460581523-32146-1-git-send-email-stuart.yoder-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, german.rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, leoyang.li-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 13, 2016 at 04:05:23PM -0500, Stuart Yoder wrote:
> updates to the fsl-mc node for full functionality:
>    -msi-parent is needed for interrupt support
>    -ranges is needed to enable the bus driver to translate bus addresses
>    -dpmac nodes provide a basis for relating dpmac objects to PHYs
> 
> Signed-off-by: Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>
> ---
> 
> -v2: updated comment to remove some extraneous info, added
>      carriage returns after dpmac nodes
> 
>  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi | 98 ++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> index 9d746c6..15498eb 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> @@ -265,6 +265,104 @@
>  			compatible = "fsl,qoriq-mc";
>  			reg = <0x00000008 0x0c000000 0 0x40>,	 /* MC portal base */
>  			      <0x00000000 0x08340000 0 0x40000>; /* MC control reg */
> +			msi-parent = <&its>;
> +			#address-cells = <3>;
> +			#size-cells = <1>;
> +
> +			/*
> +			 * Region type 0x0 - MC portals
> +			 * Region type 0x1 - QBMAN portals
> +			 */
> +			ranges = <0x0 0x0 0x0 0x8 0x0c000000 0x4000000
> +				  0x1 0x0 0x0 0x8 0x18000000 0x8000000>;
> +
> +			/*
> +			 * Define the maximum number of MACs present on the SoC.
> +			 */
> +			dpmacs {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				dpmac1: dpmac@1 {
> +					compatible = "fsl,qoriq-mc-dpmac";
> +					reg = <1>;
> +				};
> +
> +				dpmac2: dpmac@2 {
> +					compatible = "fsl,qoriq-mc-dpmac";
> +					reg = <2>;
> +				};
> +
> +				dpmac3: dpmac@3 {
> +					compatible = "fsl,qoriq-mc-dpmac";
> +					reg = <3>;
> +				};
> +
> +				dpmac4: dpmac@4 {
> +					compatible = "fsl,qoriq-mc-dpmac";
> +					reg = <4>;
> +				};
> +
> +				dpmac5: dpmac@5 {
> +					compatible = "fsl,qoriq-mc-dpmac";
> +					reg = <5>;
> +				};
> +
> +				dpmac6: dpmac@6 {
> +					compatible = "fsl,qoriq-mc-dpmac";
> +					reg = <6>;
> +				};
> +
> +				dpmac7: dpmac@7 {
> +					compatible = "fsl,qoriq-mc-dpmac";
> +					reg = <7>;
> +				};
> +
> +				dpmac8: dpmac@8 {
> +					compatible = "fsl,qoriq-mc-dpmac";
> +					reg = <8>;
> +				};
> +
> +				dpmac9: dpmac@9 {
> +					compatible = "fsl,qoriq-mc-dpmac";
> +					reg = <9>;
> +				};
> +
> +				dpmac10: dpmac@10 {

The unit-address should be same as reg property, i.e. both are in hex
value.

Shawn

> +					compatible = "fsl,qoriq-mc-dpmac";
> +					reg = <0xa>;
> +				};
> +
> +				dpmac11: dpmac@11 {
> +					compatible = "fsl,qoriq-mc-dpmac";
> +					reg = <0xb>;
> +				};
> +
> +				dpmac12: dpmac@12 {
> +					compatible = "fsl,qoriq-mc-dpmac";
> +					reg = <0xc>;
> +				};
> +
> +				dpmac13: dpmac@13 {
> +					compatible = "fsl,qoriq-mc-dpmac";
> +					reg = <0xd>;
> +				};
> +
> +				dpmac14: dpmac@14 {
> +					compatible = "fsl,qoriq-mc-dpmac";
> +					reg = <0xe>;
> +				};
> +
> +				dpmac15: dpmac@15 {
> +					compatible = "fsl,qoriq-mc-dpmac";
> +					reg = <0xf>;
> +				};
> +
> +				dpmac16: dpmac@16 {
> +					compatible = "fsl,qoriq-mc-dpmac";
> +					reg = <0x10>;
> +				};
> +			};
>  		};
>  
>  		smmu: iommu@5000000 {
> -- 
> 1.9.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
