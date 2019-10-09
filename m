From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v5, 24/32] drm/mediatek: add clock property check before
 get it
Date: Wed, 9 Oct 2019 17:36:01 +0800
Message-ID: <1570613761.7713.15.camel@mtksdaap41>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
         <1567090254-15566-25-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567090254-15566-25-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yongqiang.niu@mediatek.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi, Yongqiang:

On Thu, 2019-08-29 at 22:50 +0800, yongqiang.niu@mediatek.com wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> This patch add clock property check before get it
> 

I've rewrite this patch and applied to mediatek-drm-next-5.5 [1] with
the title "drm/mediatek: add no_clk into ddp private data", thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.5

Regards,
CK

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> index a5a6689..effc24a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -657,10 +657,12 @@ static int mtk_ddp_probe(struct platform_device *pdev)
>  	for (i = 0; i < 10; i++)
>  		ddp->mutex[i].id = i;
>  
> -	ddp->clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(ddp->clk)) {
> -		dev_err(dev, "Failed to get clock\n");
> -		return PTR_ERR(ddp->clk);
> +	if (of_find_property(dev->of_node, "clocks", &i)) {
> +		ddp->clk = devm_clk_get(dev, NULL);
> +		if (IS_ERR(ddp->clk)) {
> +			dev_err(dev, "Failed to get clock\n");
> +			return PTR_ERR(ddp->clk);
> +		}
>  	}
>  
>  	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
