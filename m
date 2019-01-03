From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] dmaengine: Extend the k3dma driver binding
Date: Thu, 3 Jan 2019 17:21:44 -0600
Message-ID: <20190103232144.GA17431@bogus>
References: <1545978983-124360-1-git-send-email-hutenghui@huawei.com>
 <1545978983-124360-2-git-send-email-hutenghui@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1545978983-124360-2-git-send-email-hutenghui@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: h00249924 <hutenghui@huawei.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, liyuequan@hisilicon.com, cash.qianli@hisilicon.com, huangli295@hisilicon.com, hantanglei@huawei.com, wangyoulin1@hisilicon.com, ninggaoyu@hisilicon.com, hanxiaolong3@hisilicon.com, Youlin Wang <wwx575822@notesmail.huawei.com>, Vinod Koul <vkoul@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 28, 2018 at 02:36:22PM +0800, h00249924 wrote:
> From: Youlin Wang <wwx575822@notesmail.huawei.com>
> 
> Extend the k3dma driver binding to support hisi-asp hardware variants.
> 
> Signed-off-by: Youlin Wang <wwx575822@notesmail.huawei.com>
> Signed-off-by: Tanglei Han <hantanglei@huawei.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
>  Documentation/devicetree/bindings/dma/k3dma.txt | 33 ++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/k3dma.txt b/Documentation/devicetree/bindings/dma/k3dma.txt
> index 4945aea..cd21b82 100644
> --- a/Documentation/devicetree/bindings/dma/k3dma.txt
> +++ b/Documentation/devicetree/bindings/dma/k3dma.txt
> @@ -3,7 +3,9 @@
>  See dma.txt first
>  
>  Required properties:
> -- compatible: Should be "hisilicon,k3-dma-1.0"
> +- compatible: Must be one of
> +-		"hisilicon,k3-dma-1.0"
> +-		"hisilicon,hisi-pcm-asp-dma-1.0"
>  - reg: Should contain DMA registers location and length.
>  - interrupts: Should contain one interrupt shared by all channel
>  - #dma-cells: see dma.txt, should be 1, para number
> @@ -43,3 +45,32 @@ For example, i2c0 read channel request line is 18, while write channel use 19
>  			dma-names = "rx", "tx";
>  		};
>  
> +
> +
> +
> +Controller:

Why is a new example needed just for a new compatible string?

> +		asp_dmac: asp_dmac@E804B000 {
> +			compatible = "hisilicon,hisi-pcm-asp-dma-1.0";
> +			reg = <0x0 0xe804b000 0x0 0x1000>;
> +			#dma-cells = <1>;
> +			dma-channels = <16>;
> +			dma-requests = <32>;
> +			dma-min-chan = <0>;
> +			dma-used-chans = <0xFFFE>;
> +			dma-share;
> +			interrupts = <0 216 4>;
> +			interrupt-names = "asp_dma_irq";
> +			status = "ok";
> +		};
> +
> +Client:
> +		i2s2: hisi_i2s {
> +			compatible = "hisilicon,hisi-i2s";
> +			reg = <0x0 0xe804f800 0x0 0x400>,
> +				<0x0 0xe804e000 0x0 0x400>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&i2s2_pmx_func &i2s2_cfg_func>;
> +			dmas = <&asp_dmac 18 &asp_dmac 19>;
> +			dma-names = "rx", "tx";
> +			#sound-dai-cells = <0>;
> +		};
> -- 
> 1.9.1
> 
