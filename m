From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: arm/marvell: ABI unstability warning
 about Marvell 7K/8K
Date: Wed, 24 Feb 2016 17:25:46 +0000
Message-ID: <20160224172545.GC9137@leverpostej>
References: <1456327007-31008-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1456327007-31008-2-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456327007-31008-2-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

[adding the device tree list to Cc]

On Wed, Feb 24, 2016 at 04:16:45PM +0100, Thomas Petazzoni wrote:
> Since we are still very early in the support of Marvell Armada 7/8K
> chips and those chips are significantly different from earlier 32 bits
> Armada SOCs, it is difficult to commit to Device Tree ABI stability at
> this point.

I don't see why difference to an existing SoC means that we cannot
guarantee support for this DT. Why does that contribute to instability?

If there's something we're unsure about, we should be seeding the DT
with sufficient information to do the right thing(TM) in future. What
areas in particular do you think are likely to be problematic? Is there
anything in particular that you think that approach doesn't work for?

>From my PoV, if we're so uncertain about a DT binding that it cannot be
kept supported, it is a prototype not yet fit for mainline.

> Therefore, this commit adds a warning to the Marvell 7K/8K DT binding
> documentation to indicate that the bindings are for the moment
> unstable.

As with the other thread, I'm strongly opposed to this mentality.

This is really the last thing we want to see for new platforms which are
DT from day one. The messy problems with platform data => DT don't
apply, and I really can't see a compelling reason to not put the effort
in here to do things "properly".

Thanks.
Mark.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  .../devicetree/bindings/arm/marvell/armada-7k-8k.txt         | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.txt b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.txt
> index df98a9c..758b3ae 100644
> --- a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.txt
> +++ b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.txt
> @@ -1,6 +1,18 @@
>  Marvell Armada 7K/8K Platforms Device Tree Bindings
>  ---------------------------------------------------
>  
> +Work in progress statement:
> +
> +Device tree files and bindings applying to Marvell Armada 7K and 8K
> +SoCs and boards are considered "unstable". Any Marvell Armada 7K/8K
> +device tree binding may change at any time. Be sure to use a device
> +tree binary and a kernel image generated from the same source tree.
> +
> +Please refer to Documentation/devicetree/bindings/ABI.txt for a
> +definition of a stable binding/ABI.
> +
> +---------------------------------------------------------------
> +
>  Boards using a SoC of the Marvell Armada 7K or 8K families must carry
>  the following root node property:
>  
> -- 
> 2.6.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
