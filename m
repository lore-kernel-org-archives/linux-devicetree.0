From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2] of: irq: Fix interrupt-map entry matching
Date: Thu, 07 Nov 2013 12:32:25 +0100
Message-ID: <1773667.KXPxL5WsyI@amdc1227>
References: <1381869563-16083-1-git-send-email-grant.likely@linaro.org>
 <2177804.l4VGDTRFDu@amdc1227> <2713030.RoDxNQo0oz@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <2713030.RoDxNQo0oz@amdc1227>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

Could you pick this patch up? It fixes boot-up at least on several Exynos
based platforms, which use interrupt-map nodes with #interrupt-cells
higher than 1.

Also please disregard patch 2/2, as your fix that has been merged seems
to be fine.

Best regards,
Tomasz

On Tuesday 05 of November 2013 16:21:18 Tomasz Figa wrote:
> This patch fixes interrupt-map entry matching code to properly match all
> specifier cells with interrupt map entries.
> 
> Signed-off-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/of/irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 0ed5ed4..717eed4 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -195,7 +195,7 @@ int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq)
>  			/* Compare specifiers */
>  			match = 1;
>  			for (i = 0; i < (addrsize + intsize); i++, imaplen--)
> -				match = !((match_array[i] ^ *imap++) & imask[i]);
> +				match &= !((match_array[i] ^ *imap++) & imask[i]);
>  
>  			pr_debug(" -> match=%d (imaplen=%d)\n", match, imaplen);
>  
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
