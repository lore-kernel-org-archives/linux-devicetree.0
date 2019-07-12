Return-Path: <SRS0=sQcx=VJ=ragnatech.se=niklas.soderlund+renesas@kernel.org>
Date: Fri, 12 Jul 2019 16:17:03 +0900
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2] dt-bindings: rcar-{csi2,vin}: Rename bindings
 documentation files
Message-ID: <20190712071703.GE9317@wyvern>
References: <20190612211241.1455-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190612211241.1455-1-niklas.soderlund+renesas@ragnatech.se>
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Ulrich Hecht <uli+renesas@fpond.eu>
List-ID: <devicetree@vger.kernel.org>

Hi,

A gentle ping on this patch. I assume if it could get a ack from Rob it 
could be taken in thru the media-tree?

On 2019-06-12 23:12:41 +0200, Niklas S�derlund wrote:
> Renesas media binding documentation files uses a naming schema of
> 'renesas,<module>.txt'. Rename VIN and CSI-2 files to match this
> pattern.
> 
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
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

-- 
Regards,
Niklas S�derlund
