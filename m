From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] dt-bindings: watchdog: mediatek: add support for
 MediaTek MT7623 and MT7622 SoC
Date: Mon, 14 Aug 2017 10:51:55 -0700
Message-ID: <20170814175155.GC7764@roeck-us.net>
References: <2d18c98edcef994a19e342bea5209ddd0cbd6c25.1502728495.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2d18c98edcef994a19e342bea5209ddd0cbd6c25.1502728495.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: wim@iguana.be, robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 15, 2017 at 12:41:38AM +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> This updates dt-binding documentation for MediaTek MT7622 and
> MT7623 SoC. For the both SoCs supported all rely on the fallback
> binding of the case with "mediatek,mt6589-wdt".
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 6a00939..096bbfb 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -4,6 +4,8 @@ Required properties:
>  
>  - compatible should contain:
>  	* "mediatek,mt2701-wdt" for MT2701 compatible watchdog timers
> +	* "mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
> +	* "mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
>  	* "mediatek,mt6589-wdt" for all compatible watchdog timers (MT2701,
>  		MT6589)
>  
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
