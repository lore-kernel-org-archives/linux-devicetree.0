From: "Jon Medhurst (Tixy)" <tixy@linaro.org>
Subject: Re: [PATCH] arm64: dts: juno: Enable some SMMUs
Date: Thu, 18 May 2017 14:13:59 +0100
Message-ID: <1495113239.3174.11.camel@linaro.org>
References: <eeb81dbbd7ddfbbccb961c0f20c5cb90f120e89f.1495110010.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <eeb81dbbd7ddfbbccb961c0f20c5cb90f120e89f.1495110010.git.robin.murphy@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Robin Murphy <robin.murphy@arm.com>, liviu.dudau@arm.com, lorenzo.pieralisi@arm.com, sudeep.holla@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mathieu.poirier@linaro.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-05-18 at 13:23 +0100, Robin Murphy wrote:
> The IOMMU-backed DMA API support has now been in place for a while and
> proven stable, so there's no real need to keep most of Juno's SMMUs
> disabled. The USB, HDLCDs, and CoreSight ETR all just need to map RAM
> buffers for DMA - enabling their SMMUs obviates CPU bounce buffering for
> USB's streaming DMA to the upper memory bank, and lets the other two
> allocate their relatively large coherent buffers without pressuring CMA.
> 
> Some more software work is still needed for the DMA-330 and PCIe before
> those can accommodate SMMU translation correctly in all cases, so we
> leave those alone for now.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---

For those that don't already know, status = "disabled" for smmu is
broken in Linux 4.12-rc1, and this fixes it...
https://lkml.org/lkml/2017/5/17/344

>  arch/arm64/boot/dts/arm/juno-base.dtsi | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
> index bfe7d683a42e..02aea43238fc 100644
> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> @@ -53,7 +53,6 @@
>  		#global-interrupts = <1>;
>  		dma-coherent;
>  		power-domains = <&scpi_devpd 0>;
> -		status = "disabled";
>  	};
>  
>  	gic: interrupt-controller@2c010000 {
> @@ -546,7 +545,6 @@
>  			     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
>  		#iommu-cells = <1>;
>  		#global-interrupts = <1>;
> -		status = "disabled";
>  	};
>  
>  	smmu_hdlcd0: iommu@7fb20000 {
> @@ -556,7 +554,6 @@
>  			     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
>  		#iommu-cells = <1>;
>  		#global-interrupts = <1>;
> -		status = "disabled";
>  	};
>  
>  	smmu_usb: iommu@7fb30000 {
> @@ -567,7 +564,6 @@
>  		#iommu-cells = <1>;
>  		#global-interrupts = <1>;
>  		dma-coherent;
> -		status = "disabled";
>  	};
>  
>  	dma@7ff00000 {
