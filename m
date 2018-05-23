Return-Path: <SRS0=Oebe=IK=verge.net.au=horms@kernel.org>
Date: Wed, 23 May 2018 10:42:53 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v4 2/3] dt-bindings: thermal: rcar-thermal: add R8A77995
 support
Message-ID: <20180523084252.qpgmrhvq5mdbrgku@verge.net.au>
References: <1526808379-3850-1-git-send-email-ykaneko0929@gmail.com>
 <1526808379-3850-3-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526808379-3850-3-git-send-email-ykaneko0929@gmail.com>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sun, May 20, 2018 at 06:26:18PM +0900, Yoshihiro Kaneko wrote:
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  Documentation/devicetree/bindings/thermal/rcar-thermal.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/rcar-thermal.txt b/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
> index 349e635..67c563f 100644
> --- a/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
> +++ b/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
> @@ -3,7 +3,8 @@
>  Required properties:
>  - compatible		: "renesas,thermal-<soctype>",
>  			   "renesas,rcar-gen2-thermal" (with thermal-zone) or
> -			   "renesas,rcar-thermal" (without thermal-zone) as fallback.
> +			   "renesas,rcar-thermal" (without thermal-zone) as
> +                           fallback except R-Car D3.
>  			  Examples with soctypes are:
>  			    - "renesas,thermal-r8a73a4" (R-Mobile APE6)
>  			    - "renesas,thermal-r8a7743" (RZ/G1M)
> @@ -12,13 +13,15 @@ Required properties:
>  			    - "renesas,thermal-r8a7791" (R-Car M2-W)
>  			    - "renesas,thermal-r8a7792" (R-Car V2H)
>  			    - "renesas,thermal-r8a7793" (R-Car M2-N)
> +			    - "renesas,thermal-r8a77995" (R-Car D3)
>  - reg			: Address range of the thermal registers.
>  			  The 1st reg will be recognized as common register
>  			  if it has "interrupts".
>  
>  Option properties:
>  
> -- interrupts		: use interrupt
> +- interrupts		: If present should contain 3 interrupts for
> +                          R-Car D3 or 1 interrupt otherwise.
>  
>  Example (non interrupt support):
>  
> -- 
> 1.9.1
> 
