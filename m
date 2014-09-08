From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: correct of_console_check()'s return value
Date: Mon, 08 Sep 2014 11:42:38 +0100
Message-ID: <20140908104238.C7B3DC40AB2@trevor.secretlab.ca>
References: <1409767603-3290-1-git-send-email-computersforpeace@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409767603-3290-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed,  3 Sep 2014 11:06:43 -0700, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The comments above of_console_check() say that it will return TRUE if it
> registers a preferred console, but add_preferred_console() uses a
> 0-equals-success convention, so ths leaves of_console_check() with an
> inconsistent policy for its return values.
> 
> Fortunately, nobody was actually checking the return value of
> of_console_check(), so this isn't significant at the moment.
> 
> But let's match the comments, so we're doing what we say.
> 
> Fixes: 3482f2c52b77 ('of: Create of_console_check() for selecting a console specified in /chosen')
> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Good catch. Applied, thanks.

g.

> ---
> This is one way to fix it. Another possibility includes changing
> of_console_check() to use 0-as-success
> 
>  drivers/of/base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index d8574adf0d62..bcfd08c2795c 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1986,7 +1986,7 @@ bool of_console_check(struct device_node *dn, char *name, int index)
>  {
>  	if (!dn || dn != of_stdout || console_set_on_cmdline)
>  		return false;
> -	return add_preferred_console(name, index, NULL);
> +	return !add_preferred_console(name, index, NULL);
>  }
>  EXPORT_SYMBOL_GPL(of_console_check);
>  
> -- 
> 1.9.1
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
