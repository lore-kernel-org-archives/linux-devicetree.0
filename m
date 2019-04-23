From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mt8183: Add watchdog dt-binding
Date: Tue, 23 Apr 2019 16:37:49 +0200
Message-ID: <4a0ad424-f3bf-f6fd-4780-0ba8336e7d82@gmail.com>
References: <1555913284-5591-1-git-send-email-yong.liang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555913284-5591-1-git-send-email-yong.liang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yong Liang <yong.liang@mediatek.com>, wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 22/04/2019 08:08, Yong Liang wrote:
> From: "yong.liang" <yong.liang@mediatek.com>
> 
> This patch add watchdog binding documentation for
> watchdog on MTK Socs.
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  .../devicetree/bindings/watchdog/mtk-wdt.txt       |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 8682d6a..f0824aa 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -9,6 +9,7 @@ Required properties:
>  	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
>  	"mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
>  	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
> +	"mediatek,mt8183-wdt", "mediatek,mt6589-wdt": for MT8183
>  
>  - reg : Specifies base physical address and size of the registers.
>  
> 
