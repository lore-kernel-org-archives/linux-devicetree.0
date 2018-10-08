Return-Path: <SRS0=ioYF=MU=verge.net.au=horms@kernel.org>
Date: Mon, 8 Oct 2018 09:46:26 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: rcar-thermal: document
 R8A77970 bindings
Message-ID: <20181008074625.32ejythsxz5griko@verge.net.au>
References: <366d8e06-6164-94ff-823f-6b0d1e2d8d53@cogentembedded.com>
 <42fe460f-0c2e-ec8c-ecca-15ec5a5a4117@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42fe460f-0c2e-ec8c-ecca-15ec5a5a4117@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-renesas-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Oct 05, 2018 at 12:01:38AM +0300, Sergei Shtylyov wrote:
> Document  the R-Car V3M (R8A77970) SoC in the Renesas R-Car gen2 thermal
> bindings. The hardware is the same as  in the R-Car D3 (R8A77995) plus an
> extra status register.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
> ---
>  Documentation/devicetree/bindings/thermal/rcar-thermal.txt |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> Index: linux-soc-thermal/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
> ===================================================================
> --- linux-soc-thermal.orig/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
> +++ linux-soc-thermal/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
> @@ -4,7 +4,7 @@ Required properties:
>  - compatible		: "renesas,thermal-<soctype>",
>  			   "renesas,rcar-gen2-thermal" (with thermal-zone) or
>  			   "renesas,rcar-thermal" (without thermal-zone) as
> -                           fallback except R-Car D3.
> +                           fallback except R-Car V3M/D3.
>  			  Examples with soctypes are:
>  			    - "renesas,thermal-r8a73a4" (R-Mobile APE6)
>  			    - "renesas,thermal-r8a7743" (RZ/G1M)
> @@ -13,6 +13,7 @@ Required properties:
>  			    - "renesas,thermal-r8a7791" (R-Car M2-W)
>  			    - "renesas,thermal-r8a7792" (R-Car V2H)
>  			    - "renesas,thermal-r8a7793" (R-Car M2-N)
> +			    - "renesas,thermal-r8a77970" (R-Car V3M)
>  			    - "renesas,thermal-r8a77995" (R-Car D3)
>  - reg			: Address range of the thermal registers.
>  			  The 1st reg will be recognized as common register
> @@ -21,7 +22,7 @@ Required properties:
>  Option properties:
>  
>  - interrupts		: If present should contain 3 interrupts for
> -                          R-Car D3 or 1 interrupt otherwise.
> +                          R-Car V3M/D3 or 1 interrupt otherwise.
>  
>  Example (non interrupt support):
>  
> 
