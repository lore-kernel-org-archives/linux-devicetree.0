From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 08/10] soc: mediatek: add MT6797 power dt-bindings
Date: Wed, 8 Feb 2017 18:37:41 -0600
Message-ID: <20170209003741.nxcdxah5ydcj6v33@rob-hp-laptop>
References: <1486383336-16892-1-git-send-email-mars.cheng@mediatek.com>
 <1486383336-16892-9-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1486383336-16892-9-git-send-email-mars.cheng@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
To: Mars Cheng <mars.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will.deacon@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, Chieh-Jay Liu <Chieh-Jay.Liu@mediatek.com>, Kevin-CW Chen <kevin-cw.chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 06, 2017 at 08:15:34PM +0800, Mars Cheng wrote:
> This adds power dt-bindings for MT6797

Some consistency in the subject for bindings please.

> 
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Kevin-CW Chen <kevin-cw.chen@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/scpsys.txt    |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> index 16fe94d..b1d165b 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> +++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
> @@ -9,11 +9,14 @@ domain control.
>  
>  The driver implements the Generic PM domain bindings described in
>  power/power_domain.txt. It provides the power domains defined in
> -include/dt-bindings/power/mt8173-power.h and mt2701-power.h.
> +- include/dt-bindings/power/mt8173-power.h
> +- include/dt-bindings/power/mt6797-power.h
> +- include/dt-bindings/power/mt2701-power.h
>  
>  Required properties:
>  - compatible: Should be one of:
>  	- "mediatek,mt2701-scpsys"
> +	- "mediatek,mt6797-scpsys"
>  	- "mediatek,mt8173-scpsys"
>  - #power-domain-cells: Must be 1
>  - reg: Address range of the SCPSYS unit
> @@ -22,6 +25,7 @@ Required properties:
>                        These are clocks which hardware needs to be
>                        enabled before enabling certain power domains.
>  	Required clocks for MT2701: "mm", "mfg", "ethif"
> +	Required clocks for MT6797: "mm", "mfg", "vdec"
>  	Required clocks for MT8173: "mm", "mfg", "venc", "venc_lt"
>  
>  Optional properties:
> -- 
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
