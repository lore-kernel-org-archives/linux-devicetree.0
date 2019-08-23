From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 03/11] dt-bindings: irq: mtk,sysirq: add support for
 mt6779
Date: Fri, 23 Aug 2019 17:44:52 +0200
Message-ID: <72f68d3b-1011-5746-7bb0-8bc40ce0961d@gmail.com>
References: <1566206502-4347-1-git-send-email-mars.cheng@mediatek.com>
 <1566206502-4347-4-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566206502-4347-4-git-send-email-mars.cheng@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mars Cheng <mars.cheng@mediatek.com>, Rob Herring <robh@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Stephen Boyd <sboyd@kernel.org>, Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, mtk01761 <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 19/08/2019 11:21, Mars Cheng wrote:
> Add binding documentation of mediatek,sysirq for mt6779 SoC.
> 
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  .../interrupt-controller/mediatek,sysirq.txt       |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> index 0e312fe..84ced3f 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> @@ -15,6 +15,7 @@ Required properties:
>  	"mediatek,mt7629-sysirq", "mediatek,mt6577-sysirq": for MT7629
>  	"mediatek,mt6795-sysirq", "mediatek,mt6577-sysirq": for MT6795
>  	"mediatek,mt6797-sysirq", "mediatek,mt6577-sysirq": for MT6797
> +	"mediatek,mt6779-sysirq", "mediatek,mt6577-sysirq": for MT6779
>  	"mediatek,mt6765-sysirq", "mediatek,mt6577-sysirq": for MT6765
>  	"mediatek,mt6755-sysirq", "mediatek,mt6577-sysirq": for MT6755
>  	"mediatek,mt6592-sysirq", "mediatek,mt6577-sysirq": for MT6592
> 
