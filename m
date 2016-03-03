From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: alloc anywhere from memblock if range not specified
Date: Thu, 3 Mar 2016 16:52:40 -0600
Message-ID: <20160303225240.GA17541@rob-hp-laptop>
References: <1456148744-7583-1-git-send-email-vinmenon@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456148744-7583-1-git-send-email-vinmenon-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinayak Menon <vinmenon-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, vinayakm.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 22, 2016 at 07:15:44PM +0530, Vinayak Menon wrote:
> early_init_dt_alloc_reserved_memory_arch passes end as 0 to
> __memblock_alloc_base, when limits are not specified. But
> __memblock_alloc_base takes end value of 0 as MEMBLOCK_ALLOC_ACCESSIBLE
> and limits the end to memblock.current_limit. This results in regions
> never being placed in HIGHMEM area, for e.g. CMA.
> Let __memblock_alloc_base allocate from anywhere in memory if limits are
> not specified.
> 
> Acked-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Vinayak Menon <vinmenon-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Applied and marked for stable.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
