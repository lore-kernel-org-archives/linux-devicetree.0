From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/5] drivers/of: add EXPORT_SYMBOL to of_irq_count
Date: Mon, 08 Feb 2016 10:56:18 +0100
Message-ID: <2848200.MLs7SEvRJG@wuerfel>
References: <1454889644-27830-1-git-send-email-paul.gortmaker@windriver.com> <1454889644-27830-3-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454889644-27830-3-git-send-email-paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 07 February 2016 19:00:41 Paul Gortmaker wrote:
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index 7ee21ae305ae..0d714748a571 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -449,6 +449,7 @@ int of_irq_count(struct device_node *dev)
>  
>         return nr;
>  }
> +EXPORT_SYMBOL(of_irq_count);
>  
>  /**
>   * of_irq_to_resource_table - Fill in resource table with node's IRQ info
> -- 
> 

I think the drivers should be changed to call platform_irq_count() instead.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
