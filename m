From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 2/5] [media] dt: bindings: Update binding documentation for
 sunxi IR controller
Date: Sat, 16 Dec 2017 12:36:34 -0600
Message-ID: <20171216183634.y6e3o725yzbcrbkq@rob-hp-laptop>
References: <20171216024914.7550-1-embed3d@gmail.com>
 <20171216024914.7550-3-embed3d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171216024914.7550-3-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

gOn Sat, Dec 16, 2017 at 03:49:11AM +0100, Philipp Rossak wrote:
> This patch updates documentation for Device-Tree bindings for sunxi IR
> controller and adds the new requiered property for the base clock frequency.
> 
> Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/media/sunxi-ir.txt | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/sunxi-ir.txt b/Documentation/devicetree/bindings/media/sunxi-ir.txt
> index 91648c569b1e..5f4960c61245 100644
> --- a/Documentation/devicetree/bindings/media/sunxi-ir.txt
> +++ b/Documentation/devicetree/bindings/media/sunxi-ir.txt
> @@ -1,12 +1,13 @@
>  Device-Tree bindings for SUNXI IR controller found in sunXi SoC family
>  
>  Required properties:
> -- compatible	    : "allwinner,sun4i-a10-ir" or "allwinner,sun5i-a13-ir"
> -- clocks	    : list of clock specifiers, corresponding to
> -		      entries in clock-names property;
> -- clock-names	    : should contain "apb" and "ir" entries;
> -- interrupts	    : should contain IR IRQ number;
> -- reg		    : should contain IO map address for IR.
> +- compatible	      : "allwinner,sun4i-a10-ir" or "allwinner,sun5i-a13-ir"
> +- clocks	      : list of clock specifiers, corresponding to
> +		        entries in clock-names property;
> +- clock-names	      : should contain "apb" and "ir" entries;
> +- interrupts	      : should contain IR IRQ number;
> +- reg		      : should contain IO map address for IR.
> +- base-clk-frequency  : should contain the base clock frequency

Use clock-frequency or assigned-clocks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
