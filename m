From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 5/7] dt-bindings: interrupt-controller: update bindings
 for MT7623
Date: Thu, 7 Feb 2019 18:11:47 +0100
Message-ID: <4c79bb2b-abb1-0306-2eff-884c2d8bbb47@gmail.com>
References: <d1ab6c89b115ad0582815816490fa0c13ea83178.1548735271.git.ryder.lee@mediatek.com>
 <5f226695c861fa9fc641488364f0c19c0a5eb425.1548735271.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5f226695c861fa9fc641488364f0c19c0a5eb425.1548735271.git.ryder.lee@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, Weijie Gao <weijie.gao@mediatek.com>, Roy Luo <roychl666@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 29/01/2019 05:31, Ryder Lee wrote:
> This adds missing bindings for MT7623 sysirq.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

Marc, if you don't have any objections, I'll take this through my tree.

Regards,
Matthias

> ---
>  .../devicetree/bindings/interrupt-controller/mediatek,sysirq.txt         | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> index 8da481c..e8b3688 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
> @@ -9,6 +9,7 @@ Required properties:
>  	"mediatek,mt8135-sysirq", "mediatek,mt6577-sysirq": for MT8135
>  	"mediatek,mt8127-sysirq", "mediatek,mt6577-sysirq": for MT8127
>  	"mediatek,mt7622-sysirq", "mediatek,mt6577-sysirq": for MT7622
> +	"mediatek,mt7623-sysirq", "mediatek,mt6577-sysirq": for MT7623
>  	"mediatek,mt7629-sysirq", "mediatek,mt6577-sysirq": for MT7629
>  	"mediatek,mt6795-sysirq", "mediatek,mt6577-sysirq": for MT6795
>  	"mediatek,mt6797-sysirq", "mediatek,mt6577-sysirq": for MT6797
> 
