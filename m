From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v5, 24/32] drm/mediatek: add clock property check before
 get it
Date: Fri, 30 Aug 2019 14:11:42 +0800
Message-ID: <1567145502.5942.15.camel@mtksdaap41>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-25-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1567090254-15566-25-git-send-email-yongqiang.niu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: yongqiang.niu@mediatek.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi, Yongqiang:

On Thu, 2019-08-29 at 22:50 +0800, yongqiang.niu@mediatek.com wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> This patch add clock property check before get it
> 
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

Only "mediatek,mt8133-disp-mutex" has no clock property. For other SoC,
clock property is required. So I think this exception is just for
mt8183.

Regards,
CK

>  	}
>  
>  	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
