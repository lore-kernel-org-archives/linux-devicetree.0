From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pwrap: mediatek: add pwrap support for
 MT6765
Date: Tue, 25 Sep 2018 17:37:40 +0200
Message-ID: <ce016218-bfa7-4599-7140-fb89e5c19faa@gmail.com>
References: <1536064314-31967-1-git-send-email-argus.lin@mediatek.com>
 <1536064314-31967-2-git-send-email-argus.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1536064314-31967-2-git-send-email-argus.lin@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Argus Lin <argus.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Chenglin Xu <chenglin.xu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, wsd_upstream@mediatek.com, henryc.chen@mediatek.com, flora.fu@mediatek.com, Chen Zhong <chen.zhong@mediatek.com>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, "shailendra.v" <shailendra.v@samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 04/09/2018 14:31, Argus Lin wrote:
> Add binding document of pwrap for MT6765 SoCs.
> 
> Signed-off-by: Argus Lin <argus.lin@mediatek.com>
> ---

Applied to v4.19-next/soc



>  Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> index f9987c3..359d64f 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> +++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> @@ -19,6 +19,7 @@ IP Pairing
>  Required properties in pwrap device node.
>  - compatible:
>  	"mediatek,mt2701-pwrap" for MT2701/7623 SoCs
> +	"mediatek,mt6765-pwrap" for MT6765 SoCs
>  	"mediatek,mt6797-pwrap" for MT6797 SoCs
>  	"mediatek,mt7622-pwrap" for MT7622 SoCs
>  	"mediatek,mt8135-pwrap" for MT8135 SoCs
> 
