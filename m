Return-Path: <SRS0=uCwi=UM=verge.net.au=horms@kernel.org>
Date: Thu, 13 Jun 2019 11:18:32 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] dt-bindings: rcar-{csi2,vin}: Rename bindings
 documentation files
Message-ID: <20190613091832.77g2ltnvd5o2hndh@verge.net.au>
References: <20190612211241.1455-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190612211241.1455-1-niklas.soderlund+renesas@ragnatech.se>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Ulrich Hecht <uli+renesas@fpond.eu>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jun 12, 2019 at 11:12:41PM +0200, Niklas Söderlund wrote:
> Renesas media binding documentation files uses a naming schema of
> 'renesas,<module>.txt'. Rename VIN and CSI-2 files to match this
> pattern.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>


Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

I wonder if, as a follow-up, renesas-wdt.txt and
renesas-memory-controllers.txt should get similar treatment.


> ---
>  .../media/{renesas,rcar-csi2.txt => renesas,csi2.txt}         | 0
>  .../bindings/media/{rcar_vin.txt => renesas,vin.txt}          | 0
>  MAINTAINERS                                                   | 4 ++--
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/media/{renesas,rcar-csi2.txt => renesas,csi2.txt} (100%)
>  rename Documentation/devicetree/bindings/media/{rcar_vin.txt => renesas,vin.txt} (100%)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt b/Documentation/devicetree/bindings/media/renesas,csi2.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> rename to Documentation/devicetree/bindings/media/renesas,csi2.txt
> diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/renesas,vin.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/rcar_vin.txt
> rename to Documentation/devicetree/bindings/media/renesas,vin.txt
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6a3bac28ebb47830..a0d21ff13c8e8989 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9807,8 +9807,8 @@ L:	linux-media@vger.kernel.org
>  L:	linux-renesas-soc@vger.kernel.org
>  T:	git git://linuxtv.org/media_tree.git
>  S:	Supported
> -F:	Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> -F:	Documentation/devicetree/bindings/media/rcar_vin.txt
> +F:	Documentation/devicetree/bindings/media/renesas,csi2.txt
> +F:	Documentation/devicetree/bindings/media/renesas,vin.txt
>  F:	drivers/media/platform/rcar-vin/
>  
>  MEDIA DRIVERS FOR RENESAS - VSP1
> -- 
> 2.21.0
> 
