From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77980: add MMC support
Date: Fri, 20 Apr 2018 11:58:57 +0200
Message-ID: <20180420095857.latofivdh3dnvu2z@verge.net.au>
References: <611daf1f-42a2-d463-0814-ebf762871018@cogentembedded.com>
 <aaa58189-2c27-e51f-1f97-3671c50a1479@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <aaa58189-2c27-e51f-1f97-3671c50a1479@cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Apr 14, 2018 at 10:27:04PM +0300, Sergei Shtylyov wrote:
> Define the generic R8A77980 part of the MMC0 (SDHI2) device node.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  arch/arm64/boot/dts/renesas/r8a77980.dtsi |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> @@ -371,6 +371,18 @@
>  			dma-channels = <16>;
>  		};
>  
> +		mmc0: mmc@ee140000 {

Please use sdhi2: sd@ee140000 for consistency with other SoCs
(I refereed to the r8a7795).

> +			compatible = "renesas,sdhi-r8a77980",
> +				     "renesas,rcar-gen3-sdhi";
> +			reg = <0 0xee140000 0 0x2000>;
> +			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 314>;
> +			power-domains = <&sysc 32>;
> +			resets = <&cpg 314>;
> +			max-frequency = <200000000>;
> +			status = "disabled";
> +		};
> +
>  		gic: interrupt-controller@f1010000 {
>  			compatible = "arm,gic-400";
>  			#interrupt-cells = <3>;
> 
