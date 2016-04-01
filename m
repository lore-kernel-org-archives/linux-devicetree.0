From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] mtd: nand: document the NAND controller/NAND chip DT
 representation
Date: Fri, 1 Apr 2016 13:57:22 -0700
Message-ID: <20160401205722.GA10227@localhost>
References: <1459513595-14308-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459513595-14308-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 01, 2016 at 02:26:35PM +0200, Boris Brezillon wrote:
> Standardize the NAND controller/NAND chip DT representation. Now, all new
> NAND controller drivers should comply with this representation, even if
> they are only supporting a single NAND chip.
> 
> Existing drivers can keep support for the old representation (where only
> the NAND chip was described), but are encouraged to also support the new
> one.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
> Changes since v1:
> - fix typo
> ---

Thanks for doing this. This mostly looks pretty good.

>  Documentation/devicetree/bindings/mtd/nand.txt | 37 +++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
> index b53f92e..a17662b 100644
> --- a/Documentation/devicetree/bindings/mtd/nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> @@ -1,4 +1,23 @@
> -* MTD generic binding
> +* NAND chip and NAND controller generic binding
> +
> +NAND controller/NAND chip representation:

You're starting with an assumption that there is a difference. I suppose
that's usually the case, but is there ever a case that there isn't
really? For instance, what about gpio.c? It's just a few GPIOs wired
directly to a NAND chip. Or perhaps, does it make sense still, even
there? For instance, if you wanted to wire multiple chips but share most
of the lines, you'd need to coordinate this in a "controller" node
somehow.

All-in-all, looks good though, and we can patch this up with any other
additions. (It's not exactly a formal specification, after all, but just
guidelines.) So:

Acked-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> +The NAND controller should be represented with its own DT node, and all
> +NAND chips attached to this controller should be defined as children nodes
> +of the NAND controller. This representation should be enforced even for
> +simple controllers supporting only one chip.
> +
> +Mandatory NAND controller properties:
> +- #address-cells: depends on your controller. Should at least be 1 to
> +		  encode the CS line id.
> +- #size-cells: depends on your controller. Put zero unless you need a
> +	       mapping between CS lines and dedicated memory regions
> +
> +Optional NAND controller properties
> +- ranges: only needed if you need to define a mapping between CS lines and
> +	  memory regions
> +
> +Optional NAND chip properties:
>  
>  - nand-ecc-mode : String, operation mode of the NAND ecc mode.
>    Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
> @@ -19,3 +38,19 @@ errors per {size} bytes".
>  The interpretation of these parameters is implementation-defined, so not all
>  implementations must support all possible combinations. However, implementations
>  are encouraged to further specify the value(s) they support.
> +
> +Example:
> +
> +	nand-controller {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* controller specific properties */
> +
> +		nand@0 {
> +			reg = <0>;
> +			nand-ecc-mode = "soft_bch";
> +
> +			/* controller specific properties */
> +		};
> +	};
> -- 
> 2.5.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
