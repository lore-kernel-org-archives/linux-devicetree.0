From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 2/8 v4] Documentation: bindings: dma: Add binding for
 dma-channel-mask
Date: Thu, 17 Jan 2019 22:38:29 +0530
Message-ID: <20190117170829.GJ5283@Mani-XPS-13-9360>
References: <1547658629-25378-1-git-send-email-john.stultz@linaro.org>
 <1547658629-25378-3-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547658629-25378-3-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tanglei Han <hantanglei@huawei.com>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Ryan Grachek <ryan@edited.us>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 16, 2019 at 09:10:23AM -0800, John Stultz wrote:
> Some dma channels can be reserved for secure mode or other
> hardware on the SoC, so provide a binding for a bitmask
> listing the available channels for the kernel to use.
> 
> This follows the pre-existing bcm,dma-channel-mask binding.
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Tanglei Han <hantanglei@huawei.com>
> Cc: Zhuangluan Su <suzhuangluan@hisilicon.com>
> Cc: Ryan Grachek <ryan@edited.us>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: dmaengine@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
> v3: Renamed to hisi-dma-avail-chan
> v4: Reworked to generic dma-channel-mask
> ---
>  Documentation/devicetree/bindings/dma/dma.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/dma.txt b/Documentation/devicetree/bindings/dma/dma.txt
> index 6312fb0..eeb4e4d 100644
> --- a/Documentation/devicetree/bindings/dma/dma.txt
> +++ b/Documentation/devicetree/bindings/dma/dma.txt
> @@ -16,6 +16,9 @@ Optional properties:
>  - dma-channels: 	Number of DMA channels supported by the controller.
>  - dma-requests: 	Number of DMA request signals supported by the
>  			controller.
> +- dma-channel-mask:	Bitmask of available DMA channels in ascending order
> +			that are not reserved by firmware and are available to
> +			the kernel. i.e. first channel corresponds to LSB.

A general assumption is, "dma-channel-mask" refers to the bit fields of
the channels which needs to be masked. But here, it refers to the channels
which are available. Doesn't it contradict?

Thanks,
Mani

>  
>  Example:
>  
> @@ -29,6 +32,7 @@ Example:
>  		#dma-cells = <1>;
>  		dma-channels = <32>;
>  		dma-requests = <127>;
> +		dma-channel-mask = <0xfffe>
>  	};
>  
>  * DMA router
> -- 
> 2.7.4
> 
