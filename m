From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: k3dma: add optional property
 dma_min_chan
Date: Tue, 3 Jul 2018 12:54:42 -0600
Message-ID: <20180703185442.GA18008@rob-hp-laptop>
References: <20180622032416.20133-1-guodong.xu@linaro.org>
 <20180622032416.20133-2-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180622032416.20133-2-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guodong Xu <guodong.xu@linaro.org>
Cc: vkoul@kernel.org, mark.rutland@arm.com, dan.j.williams@intel.com, liyu65@hisilicon.com, suzhuangluan@hisilicon.com, xuhongtao8@hisilicon.com, zhongkaihua@huawei.com, xuezhiliang@hisilicon.com, xupeng7@huawei.com, sunliang10@huawei.com, fengbaopeng@hisilicon.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 22, 2018 at 11:24:14AM +0800, Guodong Xu wrote:
> From: Li Yu <liyu65@hisilicon.com>
> 
> Add optional property dma_min_chan for k3dma.
> 
> Signed-off-by: Li Yu <liyu65@hisilicon.com>
> ---
>  Documentation/devicetree/bindings/dma/k3dma.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/k3dma.txt b/Documentation/devicetree/bindings/dma/k3dma.txt
> index 4945aeac4dc4..2fa1370c3173 100644
> --- a/Documentation/devicetree/bindings/dma/k3dma.txt
> +++ b/Documentation/devicetree/bindings/dma/k3dma.txt
> @@ -12,6 +12,11 @@ Required properties:
>  		have specific request line
>  - clocks: clock required
>  
> +Optional properties:
> +- dma_min_chan: the minimum number of DMA channel which begin to use
> +		the default value is 0, but in some platform is
> +		configured 1, like hi3660 platform

Can't this be implied by the compatible?

If not, needs vendor prefix and don't use '_' in property names.

Rob
