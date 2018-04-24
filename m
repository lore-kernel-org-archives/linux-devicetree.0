Return-Path: <SRS0=akpW=HN=verge.net.au=horms@kernel.org>
Date: Tue, 24 Apr 2018 07:57:07 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: rcar-gen3-thermal: add r8a77965
Message-ID: <20180424055705.zej6jypbtoe6v2rf@verge.net.au>
References: <20180417210045.15798-1-niklas.soderlund@ragnatech.se>
 <20180417210045.15798-2-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180417210045.15798-2-niklas.soderlund@ragnatech.se>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Rob Herring <robh+dt@kernel.org>, Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 17, 2018 at 11:00:44PM +0200, Niklas Söderlund wrote:
> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Based on previous work by Ryo Kataoka <ryo.kataoka.wt@renesas.com>.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

With the nit below resolved please feel free to add:

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  .../devicetree/bindings/thermal/rcar-gen3-thermal.txt          | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
> index 39e7d4e61a63c038..de834c4442d5f213 100644
> --- a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
> +++ b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
> @@ -9,6 +9,7 @@ Required properties:
>  			  Examples with soctypes are:
>  			    - "renesas,r8a7795-thermal" (R-Car H3)
>  			    - "renesas,r8a7796-thermal" (R-Car M3-W)
> +			    - "renesas,r8a77965-thermal" (R-Car M3-N)
>  - reg			: Address ranges of the thermal registers. Each sensor
>  			  needs one address range. Sorting must be done in
>  			  increasing order according to datasheet, i.e.
> @@ -18,7 +19,7 @@ Required properties:
>  
>  Optional properties:
>  
> -- interrupts           : interrupts routed to the TSC (3 for H3 and M3-W)
> +- interrupts           : interrupts routed to the TSC (3 for H3 and M3-W, M3-N)

nit: ... H3, M3-W and M3-N

>  - power-domain		: Must contain a reference to the power domain. This
>  			  property is mandatory if the thermal sensor instance
>  			  is part of a controllable power domain.
> -- 
> 2.17.0
> 
