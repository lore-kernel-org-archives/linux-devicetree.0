From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND 1/4] dt-bindings: mtd: make partitions doc a bit
 more generic
Date: Thu, 20 Apr 2017 16:37:53 -0700
Message-ID: <20170420233753.GJ20555@google.com>
References: <20170420135431.12585-1-zajec5@gmail.com>
 <20170420135731.13272-1-zajec5@gmail.com>
 <20170420135731.13272-2-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170420135731.13272-2-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

+ others

Hi Rafał,

Thanks for drudging up my old work. This is something that's been stuck
too far down in my stack of TODOs that it essentially timed out...

On Thu, Apr 20, 2017 at 03:57:28PM +0200, Rafał Miłecki wrote:
> From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Currently the only documented partitioning is "fixed-partitions" but
> there are more methods in use that we may want to support in the future.
> Mention them and make it clear Fixed Partitions are just a single case.
> 
> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---

I mentioned the missing changelog on IRC, but to fill in the gaps:
essentially you've dropped the partition parser and associated bindings
I had in my series (for the 'Google FMAP' format). That's fine, but I
just wanted to note it.

And with that, I think you've not quite nailed the purpose of my
original patch. This now seems to suggest there are other potential
bindings here, but then you leave the reader hanging. One note to that
effect below. If that's the only objection, then I can make the
additions myself when applying.

>  .../devicetree/bindings/mtd/partition.txt          | 28 +++++++++++++++++-----
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
> index 81a224da63be..27593adc45c2 100644
> --- a/Documentation/devicetree/bindings/mtd/partition.txt
> +++ b/Documentation/devicetree/bindings/mtd/partition.txt
> @@ -1,29 +1,45 @@
> -Representing flash partitions in devicetree
> +Flash partitions in device tree
> +===============================
>  
> -Partitions can be represented by sub-nodes of an mtd device. This can be used
> +Flash devices can be partitioned into one or more functional ranges (e.g. "boot
> +code", "nvram", "kernel").
> +
> +Different devices may be partitioned in a different ways. Some may use a fixed
> +flash layout set at production time. Some may use on-flash table that describes
> +the geometry and naming/purpose of each functional region. It is also possible
> +to see these methods mixed.
> +
> +To assist system software in locating partitions, we provide a binding to
> +describe which method is used for a given flash.


We've suggested above that there may be "different ways" (fixed vs.
on-flash tables) to partition, but then we still only describe one way.
Maybe we can just paste something like this as a caveat before moving
on?

"We currently only document a binding for fixed layouts."

We can delete that in the presumed follow-up that proposes the
"on-flash" parser bindings. Sound OK?

Brian

> +
> +
> +Fixed Partitions
> +================
> +
> +Partitions can be represented by sub-nodes of a flash device. This can be used
>  on platforms which have strong conventions about which portions of a flash are
>  used for what purposes, but which don't use an on-flash partition table such
>  as RedBoot.
>  
> -The partition table should be a subnode of the mtd node and should be named
> +The partition table should be a subnode of the flash node and should be named
>  'partitions'. This node should have the following property:
>  - compatible : (required) must be "fixed-partitions"
>  Partitions are then defined in subnodes of the partitions node.
>  
> -For backwards compatibility partitions as direct subnodes of the mtd device are
> +For backwards compatibility partitions as direct subnodes of the flash device are
>  supported. This use is discouraged.
>  NOTE: also for backwards compatibility, direct subnodes that have a compatible
>  string are not considered partitions, as they may be used for other bindings.
>  
>  #address-cells & #size-cells must both be present in the partitions subnode of the
> -mtd device. There are two valid values for both:
> +flash device. There are two valid values for both:
>  <1>: for partitions that require a single 32-bit cell to represent their
>       size/address (aka the value is below 4 GiB)
>  <2>: for partitions that require two 32-bit cells to represent their
>       size/address (aka the value is 4 GiB or greater).
>  
>  Required properties:
> -- reg : The partition's offset and size within the mtd bank.
> +- reg : The partition's offset and size within the flash
>  
>  Optional properties:
>  - label : The label / name for this partition.  If omitted, the label is taken
> -- 
> 2.11.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
