From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: usb: renesas_usbhs: Add support for
 RZ/A1
Date: Mon, 8 Jan 2018 08:57:10 +0100
Message-ID: <20180108075709.woqjjkb7eg4de47u@verge.net.au>
References: <20180105224647.42262-1-chris.brandt@renesas.com>
 <20180105224647.42262-3-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180105224647.42262-3-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 05, 2018 at 05:46:46PM -0500, Chris Brandt wrote:
> Document support for RZ/A1 SoCs
> 
> Signed-off-by: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> ---
> v3:
>  * Removed "renesas,usbhs-r7s72100"

Unless I am mistaken you want both renesas,usbhs-r7s72100, for the SoC
and renesas,rza1-usbhs for the family[*] of SoCs (which currently only has one
member upstream).

Similar to the way there are per-SoC compat strings for R-Car Gen2 and Gen3
SoCs, and per-SoC family fallback compat strings to Gen2 and Gen3.

The motivation for this that empirically SoC families seem to be able to
share the implementation on the driver-side, so only the fallback compat
strings need to be implemented in the driver by defining per-SoC compat
strings we have the flexibility to implement them if differences emerge
between SoCs in the same family.

[*] I used the term family here to group SoCs together. I acknowledge that
Renesas may not refer to them in this way.



> v2:
>  * Added Reviewed-by
> ---
>  Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> index 47394ab788e3..fa16d8d33815 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> @@ -15,6 +15,7 @@ Required properties:
>  	- "renesas,usbhs-r8a77995" for r8a77995 (R-Car D3) compatible device
>  	- "renesas,rcar-gen2-usbhs" for R-Car Gen2 or RZ/G1 compatible devices
>  	- "renesas,rcar-gen3-usbhs" for R-Car Gen3 compatible device
> +	- "renesas,rza1-usbhs" for RZ/A1 compatible device
>  
>  	When compatible with the generic version, nodes must list the
>  	SoC-specific version corresponding to the platform first followed
> -- 
> 2.15.1
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
