From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH 01/18] drm/mediatek: update dt-bindings for mt8183
Date: Wed, 26 Dec 2018 09:49:13 +0800
Message-ID: <1545788953.14496.6.camel@mtksdaap41>
References: <1545638931-24938-1-git-send-email-yongqiang.niu@mediatek.com>
         <1545638931-24938-2-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545638931-24938-2-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi, Yongqiang:

I would like you to add 'dt-bindings' in title.

On Mon, 2018-12-24 at 16:08 +0800, Yongqiang Niu wrote:
> Update device tree binding documention for the display subsystem for
> Mediatek MT8183 SOCs
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt    | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index 8469de5..1c66f39 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -28,9 +28,12 @@ Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt.
>  Required properties (all function blocks):
>  - compatible: "mediatek,<chip>-disp-<function>", one of
>  	"mediatek,<chip>-disp-ovl"   - overlay (4 layers, blending, csc)
> +	"mediatek,<chip>-disp-ovl-2l"   - overlay (2 layers, blending, csc)

Other '-' is aliened, so do this one.

>  	"mediatek,<chip>-disp-rdma"  - read DMA / line buffer
>  	"mediatek,<chip>-disp-wdma"  - write DMA
> +	"mediatek,<chip>-disp-ccorr" - color correction
>  	"mediatek,<chip>-disp-color" - color processor
> +	"mediatek,<chip>-disp-dither" - dither

Ditto.

>  	"mediatek,<chip>-disp-aal"   - adaptive ambient light controller
>  	"mediatek,<chip>-disp-gamma" - gamma correction
>  	"mediatek,<chip>-disp-merge" - merge streams from two RDMA sources
> @@ -40,7 +43,7 @@ Required properties (all function blocks):
>  	"mediatek,<chip>-dpi"        - DPI controller, see mediatek,dpi.txt
>  	"mediatek,<chip>-disp-mutex" - display mutex
>  	"mediatek,<chip>-disp-od"    - overdrive
> -  the supported chips are mt2701, mt2712 and mt8173.
> +  the supported chips are mt2701, mt2712, mt8173 and mt8183.
>  - reg: Physical base address and length of the function block register space
>  - interrupts: The interrupt signal from the function block (required, except for
>    merge and split function blocks).
> @@ -71,6 +74,12 @@ mmsys: clock-controller@14000000 {
>  	#clock-cells = <1>;
>  };
>  
> +display_components: dispsys@14000000 {
> +		compatible = "mediatek,mt8183-display";

"mediatek,mt8183-display" is undefined. I think this should be
"mediatek,mt8183-mmsys" and you have met the same problem in [1]. You
may depend on that series to develop your patches.

[1]
http://lists.infradead.org/pipermail/linux-mediatek/2018-November/015860.html

Regards,
CK

> +		reg = <0 0x14000000 0 0x1000>;
> +		power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +};
> +
>  ovl0: ovl@1400c000 {
>  	compatible = "mediatek,mt8173-disp-ovl";
>  	reg = <0 0x1400c000 0 0x1000>;
