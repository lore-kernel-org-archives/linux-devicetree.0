From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 4/4] of/irq: Typo s/interrupts-names/interrupt-names/g
Date: Wed, 23 Apr 2014 13:02:25 +0100
Message-ID: <20140423120226.0E1FDC40969@trevor.secretlab.ca>
References: <1398192025-31523-1-git-send-email-geert+renesas@glider.be>
	<1398192025-31523-4-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398192025-31523-4-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 22 Apr 2014 20:40:25 +0200, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org> wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

Thanks Geert,

Applied all, but squashed into a single patch. I'll send it up to Linus
as a fix for 3.15

g.

> ---
>  drivers/of/irq.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 9bcf2cf19357..e2e4c548a42f 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -364,7 +364,7 @@ int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
>  
>  		memset(r, 0, sizeof(*r));
>  		/*
> -		 * Get optional "interrupts-names" property to add a name
> +		 * Get optional "interrupt-names" property to add a name
>  		 * to the resource.
>  		 */
>  		of_property_read_string_index(dev, "interrupt-names", index,
> -- 
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
