From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4] mtd: ofpart: document the lock flag.
Date: Fri, 6 Nov 2015 14:40:56 -0600
Message-ID: <20151106204056.GA6525@rob-hp-laptop>
References: <1446237240-10695-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1446237240-10695-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 30, 2015 at 01:34:00PM -0700, Brian Norris wrote:
> From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> The lock flag of ofpart is undocumented. Add to binding doc.
> 
> Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
> It seems my reasoning here [1] was wrong (thanks Sascha!). This is a rewrite of
> Michal's binding doc from [2].
> 
> Note that this property is still broken for the CONFIG_MTD_PARTITIONED_MASTER=y
> case.
> 
> [1] http://lists.infradead.org/pipermail/linux-mtd/2015-October/062822.html
> [2] http://lists.infradead.org/pipermail/linux-mtd/2015-August/061155.html
> 
>  Documentation/devicetree/bindings/mtd/partition.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
> index 8e5557da1955..a7d4d35550e3 100644
> --- a/Documentation/devicetree/bindings/mtd/partition.txt
> +++ b/Documentation/devicetree/bindings/mtd/partition.txt
> @@ -23,6 +23,8 @@ Optional properties:
>    partition should only be mounted read-only. This is usually used for flash
>    partitions containing early-boot firmware images or data which should not be
>    clobbered.
> +- lock : Do not unlock the partition at initialization time (not supported on
> +  all devices)
>  
>  Examples:
>  
> -- 
> 2.6.0.rc2.230.g3dd15c0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
