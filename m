From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/1] of: Empty of_read_number when !OF
Date: Mon, 4 Apr 2016 00:16:24 -0500
Message-ID: <20160404051624.GN17806@rob-hp-laptop>
References: <1459686365-19837-1-git-send-email-alexanders83@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459686365-19837-1-git-send-email-alexanders83-S0/GAf8tV78@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Apr 03, 2016 at 02:26:05PM +0200, Alexander Stein wrote:
> Introduce empty of_read_number when CONFIG_OF is not defined. This allows
> us to compile test gpio drivers.

The only user I see is sodaville. That case should use 
of_property_read_u32 instead.

Rob

> 
> Signed-off-by: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
> ---
> Changes in v2:
> * rebased to current gpio's for-next branch
> 
>  include/linux/of.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 7fcb681baadf..f0564a2f0a98 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -672,6 +672,11 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
>  {
>  }
>  
> +static inline u64 of_read_number(const __be32 *cell, int size)
> +{
> +	return 0;
> +}
> +
>  #define of_match_ptr(_ptr)	NULL
>  #define of_match_node(_matches, _node)	NULL
>  #endif /* CONFIG_OF */
> -- 
> 2.8.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
