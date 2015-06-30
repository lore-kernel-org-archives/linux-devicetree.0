From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH/RFC 3/3] of/dynamic: Update list of aliases on aliases
 changes
Date: Tue, 30 Jun 2015 18:21:31 +0100
Message-ID: <20150630172131.D4E6CC4041A@trevor.secretlab.ca>
References: <1435675876-2159-1-git-send-email-geert+renesas@glider.be>
	<1435675876-2159-4-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435675876-2159-4-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

On Tue, 30 Jun 2015 16:51:16 +0200
, Geert Uytterhoeven <geert+renesas@glider.be>
 wrote:
> Currently the list of aliases is not updated when an overlay that
> modifies /aliases is added or removed. This breaks drivers (e.g. serial)
> that rely on of_alias_get_id().
> 
> Update the list of aliases when a property of the /aliases node is
> added, removed, or updated.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   - Should the OF core handle this itself, by registering a notifier
>     using of_reconfig_notifier_register()?

Yes. Let's not add new hooks.

>   - Adding or destroying the /aliases node itself should be handled,
>     too.

Yes

>   - Is it safe to deallocate struct alias_prop using kfree()? It may
>     have been allocated using early_init_dt_alloc_memory_arch() /
>     memblock_alloc(). What's the alternative? Leaking memory?

Properties are not refcounted, so yes we leak memory. The memory remains
owned by the aliases node, but because the aliases node is never freed,
neither are any of the properties. Solving this isn't easy because it
would require adding refcounting *everywhere* that properties are
accessed. I think we have to just live with it until someone clever can
some up with a solution.

g.

> ---
>  drivers/of/dynamic.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index 1901f8870591fe30..65dfb26f879c3a9a 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -502,6 +502,16 @@ static void __of_changeset_entry_invert(struct of_changeset_entry *ce,
>  	}
>  }
>  
> +static void *alias_alloc(u64 size, u64 align)
> +{
> +	return kzalloc(size, GFP_KERNEL);
> +}
> +
> +static void alias_free(void *p)
> +{
> +	kfree(p);
> +}
> +
>  static void __of_changeset_entry_notify(struct of_changeset_entry *ce, bool revert)
>  {
>  	struct of_reconfig_data rd;
> @@ -513,6 +523,20 @@ static void __of_changeset_entry_notify(struct of_changeset_entry *ce, bool reve
>  		ce = &ce_inverted;
>  	}
>  
> +	if (ce->np == of_aliases) {
> +		switch (ce->action) {
> +		case OF_RECONFIG_ADD_PROPERTY:
> +			of_alias_create(ce->prop, alias_alloc);
> +			break;
> +		case OF_RECONFIG_REMOVE_PROPERTY:
> +			of_alias_destroy(ce->prop->name, alias_free);
> +			break;
> +		case OF_RECONFIG_UPDATE_PROPERTY:
> +			of_alias_destroy(ce->old_prop->name, alias_free);
> +			of_alias_create(ce->prop, alias_alloc);
> +			break;
> +		}
> +	}
>  	switch (ce->action) {
>  	case OF_RECONFIG_ATTACH_NODE:
>  	case OF_RECONFIG_DETACH_NODE:
> -- 
> 1.9.1
> 
