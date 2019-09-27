From: Rob Herring <robh@kernel.org>
Subject: Re: [v4,3/3] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr1-alt-addr' property
Date: Fri, 27 Sep 2019 12:14:20 -0500
Message-ID: <20190927171420.GA28375@bogus>
References: <20190926024118.15931-1-biwen.li@nxp.com>
 <20190926024118.15931-3-biwen.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190926024118.15931-3-biwen.li@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Biwen Li <biwen.li@nxp.com>
Cc: leoyang.li@nxp.com, shawnguo@kernel.org, mark.rutland@arm.com, ran.wang_1@nxp.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 26, 2019 at 10:41:18AM +0800, Biwen Li wrote:
> The 'fsl,ippdexpcr1-alt-addr' property is used to handle an errata A-008646
> on LS1021A
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v4:
> 	- rename property name
> 	  fsl,ippdexpcr-alt-addr -> fsl,ippdexpcr1-alt-addr
> 
> Change in v3:
> 	- rename property name
> 	  fsl,rcpm-scfg -> fsl,ippdexpcr-alt-addr
> 
> Change in v2:
> 	- update desc of the property 'fsl,rcpm-scfg'
> 
>  .../devicetree/bindings/soc/fsl/rcpm.txt      | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> index 5a33619d881d..751a7655b694 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> @@ -34,6 +34,13 @@ Chassis Version		Example Chips
>  Optional properties:
>   - little-endian : RCPM register block is Little Endian. Without it RCPM
>     will be Big Endian (default case).
> + - fsl,ippdexpcr1-alt-addr : The property is related to a hardware issue
> +   on SoC LS1021A and only needed on SoC LS1021A.
> +   Must include 1 + 2 entries.
> +   The first entry must be a link to the SCFG device node.
> +   The non-first entry must be offset of registers of SCFG.
> +   The second and third entry compose an alt offset address
> +   for IPPDEXPCR1(SCFG_SPARECR8)

If only on 1 SoC, can't all this be implied by "fsl,ls1021a-rcpm"?

Adding a property means you need both a new dtb and kernel to fix the 
errata. Using the compatible string means you only need a new kernel.

>  
>  Example:
>  The RCPM node for T4240:
> @@ -43,6 +50,20 @@ The RCPM node for T4240:
>  		#fsl,rcpm-wakeup-cells = <2>;
>  	};
>  
> +The RCPM node for LS1021A:
> +	rcpm: rcpm@1ee2140 {
> +		compatible = "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-2.1+";

Both of these compatible strings aren't documented.

> +		reg = <0x0 0x1ee2140 0x0 0x8>;
> +		#fsl,rcpm-wakeup-cells = <2>;
> +
> +		/*
> +		 * The second and third entry compose an alt offset
> +		 * address for IPPDEXPCR1(SCFG_SPARECR8)
> +		 */
> +		fsl,ippdexpcr1-alt-addr = <&scfg 0x0 0x51c>;
> +	};
> +
> +
>  * Freescale RCPM Wakeup Source Device Tree Bindings
>  -------------------------------------------
>  Required fsl,rcpm-wakeup property should be added to a device node if the device
> -- 
> 2.17.1
> 
