From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: overlay: Fix uninitialized vars in
 dup_and_fixup_symbol_prop()
Date: Tue, 19 Sep 2017 11:27:35 -0700
Message-ID: <59C16197.4040403@gmail.com>
References: <1505039164-25468-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1505039164-25468-1-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/10/17 03:26, Geert Uytterhoeven wrote:
> With gcc 4.1.2:
> 
>     drivers/of/overlay.c: In function ‘dup_and_fixup_symbol_prop’:
>     drivers/of/overlay.c:108: warning: ‘overlay_name_len’ may be used uninitialized in this function
>     drivers/of/overlay.c:100: warning: ‘ovinfo’ may be used uninitialized in this function
> 
> Indeed, if ov->count == 0, both variables are uninitialized, which may
> lead to a crash when dereferencing ovinfo later.
> 
> Currently this is a false positive, as the sole creator of of_overlay
> structures (of_build_overlay_info(), introduced in commit
> 7518b5890d8ac366 ("of/overlay: Introduce DT overlay support") checks for
> this.
> 
> To prevent future issues, add a check for a zero ov->count to
> dup_and_fixup_symbol_prop().  Note that this does not get rid of the
> actual compiler warning.
> 
> Fixes: d1651b03c2df75db ("of: overlay: add overlay symbols to live device tree")
> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> ---
>  drivers/of/overlay.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 8ecfee31ab6d3874..ebe19e0f8e4d1f4b 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -108,7 +108,7 @@ static struct property *dup_and_fixup_symbol_prop(struct of_overlay *ov,
>  	int overlay_name_len;
>  	int target_path_len;
>  
> -	if (!prop->value)
> +	if (!ov->count || !prop->value)
>  		return NULL;
>  	symbol_path = prop->value;
>  
> 

I did not see this patch due to an overzealous spam filter.  I noticed it
when Rob replied with his applied email.

This check is not needed to prevent accessing overlay_name_len and ovinfo
when ov->count == 0.  That is already prevented by:

        if (k >= ov->count)
                goto err_free;

because k will be zero and ov->count will be zero.

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
