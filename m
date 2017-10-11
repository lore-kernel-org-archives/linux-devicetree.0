From: Guochun Mao <guochun.mao@mediatek.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: mtd: add new compatible strings and
 improve description
Date: Wed, 11 Oct 2017 11:15:13 +0800
Message-ID: <1507691713.14979.2.camel@mhfsdcap03>
References: <1505997906-30921-1-git-send-email-guochun.mao@mediatek.com>
         <1505997906-30921-2-git-send-email-guochun.mao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505997906-30921-2-git-send-email-guochun.mao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Marek Vasut <marek.vasut@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

gentle ping...

On Thu, 2017-09-21 at 20:45 +0800, Guochun Mao wrote:
> Add "mediatak,mt2712-nor" and "mediatek,mt7622-nor"
> for nor flash node's compatible strings.
> Explicate the fallback compatible.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> ---
>  .../devicetree/bindings/mtd/mtk-quadspi.txt        |   15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> index 840f940..56d3668 100644
> --- a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> @@ -1,13 +1,16 @@
>  * Serial NOR flash controller for MTK MT81xx (and similar)
>  
>  Required properties:
> -- compatible: 	  The possible values are:
> -		  "mediatek,mt2701-nor"
> -		  "mediatek,mt7623-nor"
> +- compatible: 	  For mt8173, compatible should be "mediatek,mt8173-nor",
> +		  and it's the fallback compatible for other Soc.
> +		  For every other SoC, should contain both the SoC-specific compatible
> +		  string and "mediatek,mt8173-nor".
> +		  The possible values are:
> +		  "mediatek,mt2701-nor", "mediatek,mt8173-nor"
> +		  "mediatek,mt2712-nor", "mediatek,mt8173-nor"
> +		  "mediatek,mt7622-nor", "mediatek,mt8173-nor"
> +		  "mediatek,mt7623-nor", "mediatek,mt8173-nor"
>  		  "mediatek,mt8173-nor"
> -		  For mt8173, compatible should be "mediatek,mt8173-nor".
> -		  For every other SoC, should contain both the SoC-specific compatible string
> -		  and "mediatek,mt8173-nor".
>  - reg: 		  physical base address and length of the controller's register
>  - clocks: 	  the phandle of the clocks needed by the nor controller
>  - clock-names: 	  the names of the clocks
