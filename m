From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 06/12] drm/mediatek: update dt-bindings
Date: Fri, 16 Nov 2018 17:06:09 -0600
Message-ID: <20181116230609.GA9744@bogus>
References: <20181116125449.23581-1-matthias.bgg@kernel.org>
 <20181116125449.23581-7-matthias.bgg@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181116125449.23581-7-matthias.bgg@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@kernel.org
Cc: mark.rutland@arm.com, ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com, sboyd@codeaurora.org, ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com, matthias.bgg@gmail.com, sean.wang@mediatek.com, sean.wang@kernel.org, rdunlap@infradead.org, wens@csie.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 16, 2018 at 01:54:43PM +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>

The subject is pretty vague...

> 
> Add mmsys bindings description.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>  .../display/mediatek/mediatek,disp.txt        | 30 +++++++++++--------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index 8469de510001..4b008d992398 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -27,20 +27,24 @@ Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt.
>  
>  Required properties (all function blocks):
>  - compatible: "mediatek,<chip>-disp-<function>", one of
> -	"mediatek,<chip>-disp-ovl"   - overlay (4 layers, blending, csc)
> -	"mediatek,<chip>-disp-rdma"  - read DMA / line buffer
> -	"mediatek,<chip>-disp-wdma"  - write DMA
> -	"mediatek,<chip>-disp-color" - color processor
> -	"mediatek,<chip>-disp-aal"   - adaptive ambient light controller
> -	"mediatek,<chip>-disp-gamma" - gamma correction
> -	"mediatek,<chip>-disp-merge" - merge streams from two RDMA sources
> -	"mediatek,<chip>-disp-split" - split stream to two encoders
> -	"mediatek,<chip>-disp-ufoe"  - data compression engine
> -	"mediatek,<chip>-dsi"        - DSI controller, see mediatek,dsi.txt
> -	"mediatek,<chip>-dpi"        - DPI controller, see mediatek,dpi.txt
> -	"mediatek,<chip>-disp-mutex" - display mutex
> -	"mediatek,<chip>-disp-od"    - overdrive
> +	"mediatek,<chip>-disp-ovl"		- overlay (4 layers, blending, csc)
> +	"mediatek,<chip>-disp-rdma"		- read DMA / line buffer
> +	"mediatek,<chip>-disp-wdma"		- write DMA
> +	"mediatek,<chip>-disp-color"		- color processor
> +	"mediatek,<chip>-disp-aal"		- adaptive ambient light controller
> +	"mediatek,<chip>-disp-gamma"		- gamma correction
> +	"mediatek,<chip>-disp-merge"		- merge streams from two RDMA sources
> +	"mediatek,<chip>-disp-split"		- split stream to two encoders
> +	"mediatek,<chip>-disp-ufoe"		- data compression engine
> +	"mediatek,<chip>-dsi"			- DSI controller, see mediatek,dsi.txt
> +	"mediatek,<chip>-dpi"			- DPI controller, see mediatek,dpi.txt
> +	"mediatek,<chip>-disp-mutex"		- display mutex
> +	"mediatek,<chip>-disp-od"		- overdrive
> +	"mediatek,<chip>-mmsys", "syscon"	- provide clocks and components management

A lot of reformatting for a 1 line change. It's fine if you want to 
leave this as one patch, but make the commit msg clear what's really 
changing here.

>    the supported chips are mt2701, mt2712 and mt8173.
> +  For mt7623, compatible must be:
> +	"mediatek,mt7623-<component>" , "mediatek,mt2701-<component>"
> +
>  - reg: Physical base address and length of the function block register space
>  - interrupts: The interrupt signal from the function block (required, except for
>    merge and split function blocks).
> -- 
> 2.19.1
> 
