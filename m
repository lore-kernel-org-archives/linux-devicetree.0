From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/7] Revert "ARM: mediatek: add MT7623a smp bringup code"
Date: Thu, 7 Feb 2019 17:47:38 +0100
Message-ID: <c9d64405-975a-a7d7-9a1a-19094f1974db@gmail.com>
References: <d1ab6c89b115ad0582815816490fa0c13ea83178.1548735271.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d1ab6c89b115ad0582815816490fa0c13ea83178.1548735271.git.ryder.lee@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, Weijie Gao <weijie.gao@mediatek.com>, Roy Luo <roychl666@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 29/01/2019 05:28, Ryder Lee wrote:
> This reverts commit 3b99ab7deca1e5f4229b4bdecd005d71e22cfc60.
> 
> The compatible "mediatek,mt7623a" is useless, so remove it.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

pushed to v5.0-next/soc

Thanks!

> ---
>  arch/arm/mach-mediatek/mediatek.c | 2 --
>  arch/arm/mach-mediatek/platsmp.c  | 1 -
>  2 files changed, 3 deletions(-)
> 
> diff --git a/arch/arm/mach-mediatek/mediatek.c b/arch/arm/mach-mediatek/mediatek.c
> index 6910b4e..c3cf215 100644
> --- a/arch/arm/mach-mediatek/mediatek.c
> +++ b/arch/arm/mach-mediatek/mediatek.c
> @@ -30,7 +30,6 @@ static void __init mediatek_timer_init(void)
>  
>  	if (of_machine_is_compatible("mediatek,mt6589") ||
>  	    of_machine_is_compatible("mediatek,mt7623") ||
> -	    of_machine_is_compatible("mediatek,mt7623a") ||
>  	    of_machine_is_compatible("mediatek,mt8135") ||
>  	    of_machine_is_compatible("mediatek,mt8127")) {
>  		/* turn on GPT6 which ungates arch timer clocks */
> @@ -50,7 +49,6 @@ static void __init mediatek_timer_init(void)
>  	"mediatek,mt6589",
>  	"mediatek,mt6592",
>  	"mediatek,mt7623",
> -	"mediatek,mt7623a",
>  	"mediatek,mt8127",
>  	"mediatek,mt8135",
>  	NULL,
> diff --git a/arch/arm/mach-mediatek/platsmp.c b/arch/arm/mach-mediatek/platsmp.c
> index 6882ff0..51e8556 100644
> --- a/arch/arm/mach-mediatek/platsmp.c
> +++ b/arch/arm/mach-mediatek/platsmp.c
> @@ -60,7 +60,6 @@ struct mtk_smp_boot_info {
>  static const struct of_device_id mtk_smp_boot_infos[] __initconst = {
>  	{ .compatible   = "mediatek,mt6589", .data = &mtk_mt6589_boot },
>  	{ .compatible   = "mediatek,mt7623", .data = &mtk_mt7623_boot },
> -	{ .compatible   = "mediatek,mt7623a", .data = &mtk_mt7623_boot },
>  	{},
>  };
>  
> 
