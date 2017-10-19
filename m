From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: overlay: pr_err from return NOTIFY_OK to overlay
 apply/remove
Date: Thu, 19 Oct 2017 14:49:20 -0700
Message-ID: <59E91DE0.5090106@gmail.com>
References: <1508447907-4462-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508447907-4462-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/19/17 14:18, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
> 
> A device tree overlay notifier can return NOTIFY_OK, NOTIFY_STOP,
> or an embedded errno.  overlay_notify() incorrectly reports an
> error for NOTIFY_OK.
> 
> Reported-by: atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
> Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
> ---
>  drivers/of/overlay.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index c99842bb4b09..f5fce0fea40b 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -133,7 +133,7 @@ static int overlay_notify(struct overlay_changeset *ovcs,
>  
>  		ret = blocking_notifier_call_chain(&overlay_notify_chain,
>  						   action, &nd);
> -		if (ret == NOTIFY_STOP)
> +		if (ret == NOTIFY_OK || ret == NOTIFY_STOP)
>  			return 0;
>  		if (ret) {
>  			ret = notifier_to_errno(ret);
> 

Not needed in any stable kernel.  This is caused by
"[PATCH v3 00/12] of: overlay: clean up device tree overlay code".

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
