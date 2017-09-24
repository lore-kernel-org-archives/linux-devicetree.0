From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] default implementation for of_find_all_nodes(...)
Date: Sun, 24 Sep 2017 10:50:38 -0700
Message-ID: <59C7F06E.8020602@gmail.com>
References: <1504117946-3958-1-git-send-email-larturus2@gmail.com>
 <1506268244-6589-1-git-send-email-larturus2@gmail.com>
 <1506268244-6589-2-git-send-email-larturus2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506268244-6589-2-git-send-email-larturus2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Artur Lorincz <larturus2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, larturus-/E1597aS9LQAvxtiuMwx3w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adding Rob Herring.

On 09/24/17 08:50, Artur Lorincz wrote:
> Added default implementation for of_find_all_nodes(). This function is
> used by board.c from the board module (drivers/staging/board).
> 
> Signed-off-by: Artur Lorincz <larturus-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
> ---
>  include/linux/of.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 4a8a709..0a9c17a 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -865,6 +865,11 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
> 
>  #define of_match_ptr(_ptr)	NULL
>  #define of_match_node(_matches, _node)	NULL
> +
> +static inline struct device_node *of_find_all_nodes(struct device_node *prev)
> +{
> +	return NULL;
> +}
>  #endif /* CONFIG_OF */
> 
>  /* Default string compare functions, Allow arch asm/prom.h to override */
> --
> 1.9.1
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
