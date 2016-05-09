From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 3/3] of: overlay: Pick up label symbols from overlays.
Date: Mon, 09 May 2016 22:32:12 +0200
Message-ID: <5730F3CC.7020207@denx.de>
References: <1462817488-8370-1-git-send-email-pantelis.antoniou@konsulko.com> <1462817488-8370-4-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462817488-8370-4-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robherring2@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Grant Likely <grant.likely@secretlab.ca>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

On 05/09/2016 08:11 PM, Pantelis Antoniou wrote:
> Insert overlay symbols to the base tree when applied.
> This makes it possible to apply an overlay that references a label
> that a previously inserted overlay had.
> 
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> ---
>  drivers/of/overlay.c | 102 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
> 
> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index a274d65..a7956a2 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -514,6 +514,101 @@ static int of_free_overlay_info(struct of_overlay *ov)
>  	return 0;
>  }
>  
> +static int of_overlay_add_symbols(
> +		struct device_node *tree,
> +		struct of_overlay *ov)
> +{
> +	struct of_overlay_info *ovinfo;
> +	struct device_node *root_sym = NULL;
> +	struct device_node *child = NULL;
> +	struct property *prop;
> +	const char *path, *s;
> +	char *new_path;
> +	int i, len, err;
> +
> +	/* this may fail (if no fixups are required) */
> +	root_sym = of_find_node_by_path("/__symbols__");
> +
> +	/* do nothing if no root symbols */
> +	if (!root_sym)
> +		return 0;
> +
> +	/* locate the symbols & fixups nodes on resolve */
> +	for_each_child_of_node(tree, child) {
> +		if (of_node_cmp(child->name, "__symbols__") == 0)
> +			goto found;
> +	}
> +	/* no symbols, no problem */
> +	of_node_put(root_sym);
> +	return 0;
> +
> +found:

You might want to factor this loop into a separate function instead of
the elaborate use of goto .

> +	err = -EINVAL;
> +	for_each_property_of_node(child, prop) {
> +
> +		/* skip properties added automatically */
> +		if (of_prop_cmp(prop->name, "name") == 0)
> +			continue;
> +
> +		err = of_property_read_string(child,
> +				prop->name, &path);
> +		if (err != 0) {
> +			pr_err("%s: Could not find symbol '%s'\n",
> +					__func__, prop->name);

It is useful to print the errno here I think.

> +			continue;
> +		}
> +
> +
> +		/* now find fragment index */
> +		s = path;
> +
> +		/* compare paths to find fragment index */
> +		ovinfo = NULL;
> +		len = -1;
> +		for (i = 0; i < ov->count; i++) {
> +			ovinfo = &ov->ovinfo_tab[i];
> +
> +			pr_debug("%s: #%d: overlay->name=%s target->name=%s\n",
> +					__func__, i, ovinfo->overlay->full_name,
> +					ovinfo->target->full_name);
> +
> +			len = strlen(ovinfo->overlay->full_name);
> +			if (strncasecmp(path, ovinfo->overlay->full_name,
> +						len) == 0 && path[len] == '/')
> +				break;
> +		}
> +
> +		if (i >= ov->count)
> +			continue;
> +
> +		pr_debug("%s: found target at #%d\n", __func__, i);
> +		new_path = kasprintf(GFP_KERNEL, "%s%s",
> +				ovinfo->target->full_name,
> +				path + len);
> +		if (!new_path) {
> +			pr_err("%s: Failed to allocate propname for \"%s\"\n",
> +					__func__, prop->name);

You ran out of memory here, so the pr_err() will probably also fail.

> +			continue;
> +		}
> +
> +		err = of_changeset_add_property_string(&ov->cset, root_sym,
> +				prop->name, new_path);
> +
> +		/* free always */
> +		kfree(new_path);
> +
> +		if (err) {
> +			pr_err("%s: Failed to add property for \"%s\"\n",
> +					__func__, prop->name);
> +		}
> +	}
> +
> +	of_node_put(child);
> +	of_node_put(root_sym);
> +
> +	return 0;
> +}
> +
>  static LIST_HEAD(ov_list);
>  static DEFINE_IDR(ov_idr);
>  
> @@ -642,6 +737,13 @@ static int __of_overlay_create(struct device_node *tree,
>  		goto err_abort_trans;
>  	}
>  
> +	err = of_overlay_add_symbols(tree, ov);
> +	if (err) {
> +		pr_err("%s: of_overlay_add_symbols() failed for tree@%s\n",
> +				__func__, tree->full_name);
> +		goto err_abort_trans;
> +	}
> +
>  	/* apply the changeset */
>  	err = __of_changeset_apply(&ov->cset);
>  	if (err) {
> 


-- 
Best regards,
Marek Vasut
