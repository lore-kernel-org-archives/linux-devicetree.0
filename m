From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: do not leak console options
Date: Fri, 25 Aug 2017 17:37:21 -0500
Message-ID: <20170825223721.hilqpt5z4urevh6b@rob-hp-laptop>
References: <20170825173647.1004-1-sergey.senozhatsky@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170825173647.1004-1-sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergey Senozhatsky <sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Petr Mladek <pmladek-IBi9RG/b67k@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Aug 26, 2017 at 02:36:47AM +0900, Sergey Senozhatsky wrote:
> If add_preferred_console() returns error then we must free a
> copy of `of_stdout_options' that we create right before the
> console registration.
> 
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/of/base.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 260d33c0f26c..9fcf7011d206 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1779,10 +1779,17 @@ EXPORT_SYMBOL_GPL(of_alias_get_highest_id);
>   */
>  bool of_console_check(struct device_node *dn, char *name, int index)
>  {
> +	bool ret;
> +	char *options;
> +
>  	if (!dn || dn != of_stdout || console_set_on_cmdline)
>  		return false;
> -	return !add_preferred_console(name, index,
> -				      kstrdup(of_stdout_options, GFP_KERNEL));
> +
> +	options = kstrdup(of_stdout_options, GFP_KERNEL);

The real question is why are we doing the kstrdup in the first place. 
AFAICT, the only reason is options within the console/printk code is a 
char * and not a const char *. I can't imagine that options need 
modifications?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
