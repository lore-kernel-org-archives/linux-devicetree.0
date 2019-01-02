From: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH 2/3] dmaengine: Extend the k3dma driver binding
Date: Wed, 2 Jan 2019 10:00:15 -0800
Message-ID: <CALAqxLW_eGX25sZKVCpGwoq94QdYj9K2nJg6buh=FAZZt_Cuhg@mail.gmail.com>
References: <1545978983-124360-1-git-send-email-hutenghui@huawei.com> <1545978983-124360-2-git-send-email-hutenghui@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545978983-124360-2-git-send-email-hutenghui@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: h00249924 <hutenghui@huawei.com>
Cc: dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, wwx575822@notesmail.huawei.com, hanxiaolong3@hisilicon.com, Zhuangluan Su <suzhuangluan@hisilicon.com>, Hantanglei <hantanglei@huawei.com>, Kongfei <kongfei@hisilicon.com>, ninggaoyu <ninggaoyu@hisilicon.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Liyuequan <liyuequan@hisilicon.com>, "huangli (I)" <huangli295@hisilicon.com>, wangyoulin <wangyoulin1@hisilicon.com>, "Qianli (A)" <cash.qianli@hisilicon.com>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 27, 2018 at 10:39 PM h00249924 <hutenghui@huawei.com> wrote:
>
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
> +-              "hisilicon,k3-dma-1.0"
> +-              "hisilicon,hisi-pcm-asp-dma-1.0"
>  - reg: Should contain DMA registers location and length.
>  - interrupts: Should contain one interrupt shared by all channel
>  - #dma-cells: see dma.txt, should be 1, para number
> @@ -43,3 +45,32 @@ For example, i2c0 read channel request line is 18, while write channel use 19
>                         dma-names = "rx", "tx";
>                 };
>
> +
> +
> +
> +Controller:
> +               asp_dmac: asp_dmac@E804B000 {
> +                       compatible = "hisilicon,hisi-pcm-asp-dma-1.0";
> +                       reg = <0x0 0xe804b000 0x0 0x1000>;
> +                       #dma-cells = <1>;
> +                       dma-channels = <16>;
> +                       dma-requests = <32>;
> +                       dma-min-chan = <0>;
> +                       dma-used-chans = <0xFFFE>;
> +                       dma-share;

Thanks for sending this out!

So min-chan, used-chans and dma-share aren't in the existing binding
document. So they probably should be removed from this example, or the
binding document needs to be updated first.

thanks
-john
