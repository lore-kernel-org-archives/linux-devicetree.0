From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: rng: update bindings for MediaTek
 ARMv8 SoCs
Date: Thu, 30 May 2019 15:56:55 -0700
Message-ID: <CAGp9LzrQegBb9Oe-=jfkwOrsYY=eN3BSF=DWnu+aSBAhQ5bexA@mail.gmail.com>
References: <1558946326-13630-1-git-send-email-neal.liu@mediatek.com> <1558946326-13630-3-git-send-email-neal.liu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558946326-13630-3-git-send-email-neal.liu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neal Liu <neal.liu@mediatek.com>
Cc: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, wsd_upstream@mediatek.com, Crystal Guo <Crystal.Guo@mediatek.com>
List-Id: devicetree@vger.kernel.org

Hi, Neal

On Mon, May 27, 2019 at 1:39 AM Neal Liu <neal.liu@mediatek.com> wrote:
>
> Document the binding used by the MediaTek ARMv8 SoCs random
> number generator with TrustZone enabled.
>
> Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/rng/mtk-rng.txt |   13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.txt b/Documentation/devicetree/bindings/rng/mtk-rng.txt
> index 2bc89f1..1fb9b1d 100644
> --- a/Documentation/devicetree/bindings/rng/mtk-rng.txt
> +++ b/Documentation/devicetree/bindings/rng/mtk-rng.txt
> @@ -3,9 +3,12 @@ found in MediaTek SoC family
>
>  Required properties:
>  - compatible       : Should be
> -                       "mediatek,mt7622-rng",  "mediatek,mt7623-rng" : for MT7622
> -                       "mediatek,mt7629-rng",  "mediatek,mt7623-rng" : for MT7629
> -                       "mediatek,mt7623-rng" : for MT7623
> +                       "mediatek,mt7622-rng", "mediatek,mt7623-rng" for MT7622
> +                       "mediatek,mt7629-rng", "mediatek,mt7623-rng" for MT7629
> +                       "mediatek,mt7623-rng" for MT7623

No make any change for those lines not belong to the series

> +                       "mediatek,mtk-sec-rng" for MediaTek ARMv8 SoCs

I thought "mediatek,mtk-sec-rng" is only for those MediaTek ARMv8 SoCs
with security RNG

> +
> +Optional properties:
>  - clocks           : list of clock specifiers, corresponding to
>                       entries in clock-names property;
>  - clock-names      : Should contain "rng" entries;
> @@ -19,3 +22,7 @@ rng: rng@1020f000 {
>         clocks = <&infracfg CLK_INFRA_TRNG>;
>         clock-names = "rng";
>  };

For those MediaTek ARMv8 SoCs with security RNG

> +
> +hwrng: hwrng {
> +       compatible = "mediatek,mtk-sec-rng";
> +};
> --
> 1.7.9.5
>
