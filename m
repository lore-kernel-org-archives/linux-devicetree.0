From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: rng: update bindings for MediaTek
 ARMv8 SoCs
Date: Tue, 11 Jun 2019 16:53:51 -0600
Message-ID: <20190611225351.GA17332@bogus>
References: <1560162984-26104-1-git-send-email-neal.liu@mediatek.com>
 <1560162984-26104-3-git-send-email-neal.liu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560162984-26104-3-git-send-email-neal.liu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neal Liu <neal.liu@mediatek.com>
Cc: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com, Crystal Guo <Crystal.Guo@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 10, 2019 at 06:36:23PM +0800, Neal Liu wrote:
> Document the binding used by the MediaTek ARMv8 SoCs random
> number generator with TrustZone enabled.
> 
> Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/rng/mtk-rng.txt |   15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.txt b/Documentation/devicetree/bindings/rng/mtk-rng.txt
> index 2bc89f1..fb3dd59 100644
> --- a/Documentation/devicetree/bindings/rng/mtk-rng.txt
> +++ b/Documentation/devicetree/bindings/rng/mtk-rng.txt
> @@ -3,9 +3,13 @@ found in MediaTek SoC family
>  
>  Required properties:
>  - compatible	    : Should be
> -			"mediatek,mt7622-rng", 	"mediatek,mt7623-rng" : for MT7622
> -			"mediatek,mt7629-rng",  "mediatek,mt7623-rng" : for MT7629
> -			"mediatek,mt7623-rng" : for MT7623
> +			"mediatek,mt7622-rng", "mediatek,mt7623-rng" for MT7622
> +			"mediatek,mt7629-rng", "mediatek,mt7623-rng" for MT7629
> +			"mediatek,mt7623-rng" for MT7623
> +			"mediatek,mtk-sec-rng" for MediaTek ARMv8 SoCs with
> +			security RNG

Is there any commonality with the prior h/w? If not, make this a 
separate binding doc.

> +
> +Optional properties:
>  - clocks	    : list of clock specifiers, corresponding to
>  		      entries in clock-names property;
>  - clock-names	    : Should contain "rng" entries;
> @@ -19,3 +23,8 @@ rng: rng@1020f000 {
>  	clocks = <&infracfg CLK_INFRA_TRNG>;
>  	clock-names = "rng";
>  };
> +
> +/* secure RNG */
> +hwrng: hwrng {
> +	compatible = "mediatek,mtk-sec-rng";

How does one access this? Seems like this should be part of a node for 
firmware? What about other functions?

> +};
> -- 
> 1.7.9.5
> 
