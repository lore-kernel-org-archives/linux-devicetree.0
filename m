From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: k3dma: add optional property
 hisilicon,dma-min-chan
Date: Mon, 9 Jul 2018 16:04:38 +0530
Message-ID: <20180709103438.GC22377@vkoul-mobl>
References: <20180706035521.13736-1-guodong.xu@linaro.org>
 <20180706035521.13736-2-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180706035521.13736-2-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guodong Xu <guodong.xu@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, dan.j.williams@intel.com, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, liyu65@hisilicon.com, suzhuangluan@hisilicon.com, xuhongtao8@hisilicon.com, zhongkaihua@huawei.com, xuezhiliang@hisilicon.com, xupeng7@huawei.com, sunliang10@huawei.com, fengbaopeng@hisilicon.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 06-07-18, 11:55, Guodong Xu wrote:
> From: Li Yu <liyu65@hisilicon.com>
> 
> Add optional property hisilicon,dma-min-chan for k3dma.
> 
> Signed-off-by: Li Yu <liyu65@hisilicon.com>
> Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
> ---
>  Documentation/devicetree/bindings/dma/k3dma.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/k3dma.txt b/Documentation/devicetree/bindings/dma/k3dma.txt
> index 4945aeac4dc4..f34202a80f3c 100644
> --- a/Documentation/devicetree/bindings/dma/k3dma.txt
> +++ b/Documentation/devicetree/bindings/dma/k3dma.txt
> @@ -12,6 +12,11 @@ Required properties:
>  		have specific request line
>  - clocks: clock required
>  
> +Optional properties:
> +- hisilicon,dma-min-chan: the minimum DMA channel number which is usable
> +		Default value is 0, but in some platform it is
> +		configured 1, like in hi3660 platform
> +
>  Example:
>  
>  Controller:
> @@ -21,6 +26,7 @@ Controller:
>  			#dma-cells = <1>;
>  			dma-channels = <16>;
>  			dma-requests = <27>;
> +			hisilicon,dma-min-chan = <1>;

Am still expecting this to be a mask

-- 
~Vinod
