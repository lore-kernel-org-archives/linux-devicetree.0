From: Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH V4 1/8] dt-bindings: pwrap: mediatek: add MT6351 PMIC
 support for MT6797
Date: Thu, 3 May 2018 10:01:02 +0800
Message-ID: <1525312862.14792.37.camel@mtkswgap22>
References: <20180502092112.3991-1-argus.lin@mediatek.com>
         <20180502092112.3991-2-argus.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180502092112.3991-2-argus.lin@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: argus.lin@mediatek.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Chenglin Xu <chenglin.xu@mediatek.com>, wsd_upstream@mediatek.com, henryc.chen@mediatek.com, flora.fu@mediatek.com, Chen Zhong <chen.zhong@mediatek.com>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, "shailendra . v" <shailendra.v@samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 2018-05-02 at 17:21 +0800, argus.lin@mediatek.com wrote:
> From: Argus Lin <argus.lin@mediatek.com>
> 
> We add MT6351 PMIC support for MT6797 SoCs.
> 
> Signed-off-by: Argus Lin <argus.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> index bf80e3f96f8c..f9987c30f0d5 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> +++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> @@ -19,6 +19,7 @@ IP Pairing
>  Required properties in pwrap device node.
>  - compatible:
>  	"mediatek,mt2701-pwrap" for MT2701/7623 SoCs
> +	"mediatek,mt6797-pwrap" for MT6797 SoCs
>  	"mediatek,mt7622-pwrap" for MT7622 SoCs
>  	"mediatek,mt8135-pwrap" for MT8135 SoCs
>  	"mediatek,mt8173-pwrap" for MT8173 SoCs

The content doesn't describe anything about MT6351, which seems to be
inconsistent with its title
