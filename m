From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [PATCH 2/3] net: socionext: Add Synquacer NetSec driver
Date: Thu, 30 Nov 2017 12:29:17 -0500 (EST)
Message-ID: <20171130.122917.542712364953497229.davem@davemloft.net>
References: <1512058396-15907-1-git-send-email-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512058396-15907-1-git-send-email-jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Date: Thu, 30 Nov 2017 21:43:16 +0530

> +	priv->eeprom_base = devm_memremap(&pdev->dev, eeprom_res->start,
> +					  resource_size(eeprom_res),
> +					  MEMREMAP_WT);
> +	if (!priv->eeprom_base) {
> +		dev_err(&pdev->dev, "devm_memremap() failed for EEPROM\n");
> +		ret = -ENXIO;
> +		goto free_ndev;
> +	}

dev_memremap() is implemented via memremap() which for MEMREMAP_WT is
in turn implemented using ioremap_wt() which returns an "__iomem"
pointer.

The memremap() function talks about __iomem being about side effects.
That's not really the full story.  The __iomem annotation is also
about whether a special accessor is necessary to "dereference" the
pointer.  On sparc64, for example, the ioremap_*() functions return a
physical address not a virtual one.  So you cannot directly
dereference pointers that are returned from the ioremap*() interfaces.

You'll also need to mark priv->eeprom_base as "__iomem".

devm_memremap() returns a straight "void *" without the __iomem
annotation, and this is wrong then ioremap_*() is used.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
