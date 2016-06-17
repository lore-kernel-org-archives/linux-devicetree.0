From: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCHv3 1/7] EDAC, altera: Check parent status for Arria10 EDAC
 block
Date: Fri, 17 Jun 2016 18:46:32 +0200
Message-ID: <20160617164632.GD3912@pd.tnic>
References: <1465852752-11018-1-git-send-email-tthayer@opensource.altera.com>
 <1465852752-11018-2-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465852752-11018-2-git-send-email-tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
Cc: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 13, 2016 at 04:19:06PM -0500, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> 
> In preparation for the Arria10 ECC modules, check the status
> of the parent in the device tree to ensure the block is enabled.
> Skip if no parent phandle is set in the device tree.
> 
> Signed-off-by: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---
> v2  No change
> v3  Move check into validate_parent_available().
> ---
>  drivers/edac/altera_edac.c |   17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> index 6f5d586..926bcaf 100644
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c
> @@ -1125,6 +1125,20 @@ static void altr_edac_a10_irq_handler(struct irq_desc *desc)
>  	chained_irq_exit(chip, desc);
>  }
>  
> +static int validate_parent_available(struct device_node *np)
> +{
> +	struct device_node *parent;
> +
> +	/* Ensure parent device is enabled if parent node exists */
> +	parent = of_parse_phandle(np, "parent", 0);
> +	if (parent && !of_device_is_available(parent)) {
> +		of_node_put(parent);
> +		return -ENODEV;
> +	}
> +	of_node_put(parent);
> +	return 0;
> +}

How about this - it is a bit simpler:

static int validate_parent_available(struct device_node *np)
{
        struct device_node *parent;
        int ret = 0;

        /* Ensure parent device is enabled if parent node exists */
        parent = of_parse_phandle(np, "parent", 0);
        if (parent && !of_device_is_available(parent))
                ret = -ENODEV;

        of_node_put(parent);
        return ret;
}

?

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
