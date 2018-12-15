From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: dt-bindings: watchdog: update bindings for MT7629 SoC
Date: Sat, 15 Dec 2018 08:23:32 -0800
Message-ID: <20181215162332.GA30762@roeck-us.net>
References: <55d108719233b3c30c747e75a010b9e64681af09.1541573395.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55d108719233b3c30c747e75a010b9e64681af09.1541573395.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org, Weijie Gao <weijie.gao@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 07, 2018 at 03:10:36PM +0800, Ryder Lee wrote:
> This updates dt-binding documentation for MT7629 SoC
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 859dee1..8682d6a 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -8,6 +8,7 @@ Required properties:
>  	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
>  	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
>  	"mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
> +	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
>  
>  - reg : Specifies base physical address and size of the registers.
>  
