From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 3/3 repost] clocksource: sh_tmu: Document r8a7779 binding
Date: Wed, 27 Aug 2014 10:53:08 +0100
Message-ID: <20140827095308.GD7295@leverpostej>
References: <1409117300-2133-1-git-send-email-horms+renesas@verge.net.au>
 <1409117300-2133-4-git-send-email-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1409117300-2133-4-git-send-email-horms+renesas@verge.net.au>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Magnus Damm <magnus.damm@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 27, 2014 at 06:28:20AM +0100, Simon Horman wrote:
> In general Renesas hardware is not documented to the extent
> where the relationship between IP blocks on different SoCs can be assumed
> although they may appear to operate the same way. Furthermore the
> documentation typically does not specify a version for individual
> IP blocks. For these reasons a convention of using the SoC name in place
> of a version and providing SoC-specific compat strings has been adopted.
> 
> Although not universally liked this convention is used in the bindings
> for the drivers a number of drivers for Renesas hardware. The purpose
> of this patch is to update the Renesas R-Car Timer Unit (TMU)
> driver to follow this convention.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> ---
> * I plan to follow up with a patch patch to use the new binding in the
>   dtsi files for the r8a7779 SoC.
> ---
>  Documentation/devicetree/bindings/timer/renesas,tmu.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.txt b/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> index 425d0c5..712ddfa 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> @@ -8,7 +8,9 @@ are independent. The TMU hardware supports up to three channels.
>  
>  Required Properties:
>  
> -  - compatible: must contain "renesas,tmu"
> +  - compatible: must contain one of the following.
> +    - "renesas,tmu" generic TMU
> +    - "renesas,tmu-r8a7779" R8A7779 TMU

Similarly to patch 2, "one or more" and swap the order here?

Mark.

>  
>    - reg: base address and length of the registers block for the timer module.
>  
> @@ -27,7 +29,7 @@ Optional Properties:
>  Example: R8A7779 (R-Car H1) TMU0 node
>  
>  	tmu0: timer@ffd80000 {
> -		compatible = "renesas,tmu";
> +		compatible = "renesas,tmu-r8a7779", "renesas,tmu";
>  		reg = <0xffd80000 0x30>;
>  		interrupts = <0 32 IRQ_TYPE_LEVEL_HIGH>,
>  			     <0 33 IRQ_TYPE_LEVEL_HIGH>,
> -- 
> 2.0.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
