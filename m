From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: arm: mediatek: add MT7622 string to
 the PMIC wrapper doc
Date: Wed, 19 Jul 2017 00:01:12 +0800
Message-ID: <1500393672.8739.1.camel@mtksdaap41>
References: <cover.1500368529.git.sean.wang@mediatek.com>
         <fff9908edae7da7958ac43dfe9fa98b26c03a4e3.1500368529.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fff9908edae7da7958ac43dfe9fa98b26c03a4e3.1500368529.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, jamesjj.liao@mediatek.com, henryc.chen@mediatek.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, chenglin.xu@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2017-07-18 at 17:49 +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Signed-off-by: Chenglin Xu <chenglin.xu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> index 107700d..2d6d4a9 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> +++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> @@ -35,6 +35,10 @@ Required properties in pwrap device node.
>    "wrap": Main module clock
>  - clocks: Must contain an entry for each entry in clock-names.
>  
> +Required properties in pwrap device node
> +- compatible:
> +	"mediatek,mt7622-pwrap" for MT7622 SoCs
> +

Sean,

Why mt7622 need to be separated from others?


Joe.C
