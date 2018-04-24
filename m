Return-Path: <SRS0=akpW=HN=verge.net.au=horms@kernel.org>
Date: Tue, 24 Apr 2018 08:05:09 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] dt-bindings: thermal: rcar-gen3-thermal: update register
 size in example
Message-ID: <20180424060509.ns3jrzapoygoewhf@verge.net.au>
References: <20180417204958.14723-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180417204958.14723-1-niklas.soderlund@ragnatech.se>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 17, 2018 at 10:49:58PM +0200, Niklas Söderlund wrote:
> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> The datasheet have been expanded with more registers and the DT files

Nit: "datasheets have" or "datasheet has"

> have been updated with the new size. This change updates the example so
> writing new DT files can use the enchanted driver which uses the new
> registers.

As Sergei mentioned, maybe enhanced rather than enchanted :)

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

The documentation change itself looks fine to me:

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  .../devicetree/bindings/thermal/rcar-gen3-thermal.txt       | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
> index fdf5caa6229b4fff..39e7d4e61a63c038 100644
> --- a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
> +++ b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
> @@ -27,9 +27,9 @@ Example:
>  
>  	tsc: thermal@e6198000 {
>  		compatible = "renesas,r8a7795-thermal";
> -		reg = <0 0xe6198000 0 0x68>,
> -		      <0 0xe61a0000 0 0x5c>,
> -		      <0 0xe61a8000 0 0x5c>;
> +		reg = <0 0xe6198000 0 0x100>,
> +		      <0 0xe61a0000 0 0x100>,
> +		      <0 0xe61a8000 0 0x100>;
>  		interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
>  			     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
>  			     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> -- 
> 2.17.0
> 
