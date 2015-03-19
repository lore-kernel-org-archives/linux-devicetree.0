From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] [RFC] OF: probe order dependency aware
 of_platform_populate
Date: Thu, 19 Mar 2015 19:18:34 +0000
Message-ID: <20150319191834.5346CC40A35@trevor.secretlab.ca>
References: <1418731891-24768-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418731891-24768-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 16 Dec 2014 14:11:31 +0200
, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
 wrote:
> A nice side-effect of the changes in DTC for supporting overlays
> is that it is now possible to do dependency tracking of platform
> devices automatically.
> 
> This patch implements dependency aware probe order for users
> of of_platform_populate.
> 
> There are no changes in the syntax of the DTS bindings, the
> dependency is generated automatically by the use of phandle
> references.

Do you have measurements showing improvement? Conceptually, I don't have
a problem with having a small scale solution like this, but I want proof
that it actively makes things better, and is worth the extra complexity.
It's not an easy block of code to understand.

However, this only papers over a fundamental limitation of the device
model, and only works within the context of a single
platform_device_populate() call. It doesn't help for subsequent calls,
and it does nothing for dependecies with i2c/spi/whatever. It also
doesn't help much when drivers are in modules that won't get loaded
until after userspace starts. (although changing device registration
order may mostly get userspace to load drivers in the right order).

g.

> 
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/of/platform.c | 569 +++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 564 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index cd87a36..0683d48 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -464,6 +464,549 @@ int of_platform_bus_probe(struct device_node *root,
>  }
>  EXPORT_SYMBOL(of_platform_bus_probe);
>  
> +struct of_pop_ref_entry {
> +	struct list_head node;
> +	struct device_node *np;
> +};
> +
> +struct of_pop_dep_entry {
> +	struct list_head node;
> +	struct of_pop_entry *pe;
> +};
> +
> +struct of_pop_entry {
> +	struct of_pop_entry *parent;
> +	struct list_head children;
> +	struct list_head node;
> +
> +	struct device_node *np;
> +	unsigned int bus : 1;
> +	unsigned int amba : 1;
> +	unsigned int children_loop : 1;
> +	struct list_head refs;
> +	struct list_head deps;
> +
> +	unsigned int loop : 1;
> +	unsigned int temp_mark : 1;
> +	unsigned int perm_mark : 1;
> +	struct list_head sort_children;
> +	struct list_head sort_node;
> +	int refcnt;
> +
> +	int id;
> +};
> +
> +static phandle __phandle_ref(struct device_node *lfnp, const char *prop,
> +		uint32_t off)
> +{
> +	struct device_node *np;
> +	const void *value;
> +	const char *name;
> +	int len;
> +
> +	name = of_node_full_name(lfnp);
> +	name += strlen("/__local_fixups__");
> +	/* pr_info("%s: %s\n", __func__, name); */
> +	np = of_find_node_by_path(name);
> +	if (!np)
> +		return 0;
> +	value = of_get_property(np, prop, &len);
> +	if (off + sizeof(uint32_t) > len)
> +		return 0;
> +	return be32_to_cpup(value + off);
> +}
> +
> +/* returns true is np_ref is pointing to an external tree */
> +static bool __external_ref(struct device_node *np, struct device_node *np_ref)
> +{
> +	while (np_ref != NULL) {
> +		if (np_ref == np)
> +			return false;
> +		np_ref = np_ref->parent;
> +	}
> +	return true;
> +}
> +
> +/* returns true is np_ref is pointing to an internal tree */
> +static bool __internal_ref(struct device_node *np, struct device_node *np_ref)
> +{
> +	do {
> +		if (np_ref == np)
> +			return true;
> +		np_ref = np_ref->parent;
> +	} while (np_ref != NULL);
> +	return false;
> +}
> +
> +static void __local_fixup_ref(struct of_pop_entry *pe, struct device_node *lfnp)
> +{
> +	struct device_node *child;
> +	struct property *prop;
> +	int i, len;
> +	uint32_t off;
> +	phandle ph;
> +	struct device_node *phnp;
> +	struct of_pop_ref_entry *re;
> +	bool found;
> +
> +	if (!lfnp)
> +		return;
> +
> +	for_each_property_of_node(lfnp, prop) {
> +
> +		/* skip the auto-generated properties */
> +		if (!of_prop_cmp(prop->name, "name") ||
> +		    !of_prop_cmp(prop->name, "phandle") ||
> +		    !of_prop_cmp(prop->name, "linux,phandle") ||
> +		    !of_prop_cmp(prop->name, "ibm,phandle"))
> +			continue;
> +
> +		len = prop->length / 4;
> +
> +		/* pr_info("%s/%s (%d)\n", of_node_full_name(lfnp),
> +				prop->name, len); */
> +
> +		for (i = 0; i < len; i++) {
> +			off = be32_to_cpup((void *)prop->value + i * 4);
> +			ph = __phandle_ref(lfnp, prop->name, off);
> +			if (ph == 0)
> +				continue;
> +			phnp = of_find_node_by_phandle(ph);
> +			if (!phnp)
> +				continue;
> +			if (!__external_ref(pe->np, phnp))
> +				continue;
> +
> +			/* check whether the ref is already there */
> +			found = false;
> +			list_for_each_entry(re, &pe->refs, node) {
> +				if (re->np == phnp) {
> +					found = true;
> +					break;
> +				}
> +			}
> +
> +			if (!found) {
> +				re = kzalloc(sizeof(*re), GFP_KERNEL);
> +				BUG_ON(re == NULL);
> +				re->np = phnp;
> +				list_add_tail(&re->node, &pe->refs);
> +
> +			}
> +
> +			/* pr_info("  %08x - ph %08x - @%s\n", off, ph,
> +					of_node_full_name(phnp)); */
> +
> +			of_node_put(phnp);
> +		}
> +	}
> +
> +	for_each_child_of_node(lfnp, child)
> +		__local_fixup_ref(pe, child);
> +}
> +
> +static void __of_platform_populate_get_refs_internal(struct of_pop_entry *pe)
> +{
> +	struct device_node *np;
> +	struct of_pop_ref_entry *re;
> +	char *base;
> +	bool found;
> +
> +	/* first find the local fixups */
> +	base = kasprintf(GFP_KERNEL, "/__local_fixups__%s",
> +			of_node_full_name(pe->np));
> +	if (base) {
> +		np = of_find_node_by_path(base);
> +		if (np) {
> +			__local_fixup_ref(pe, np);
> +			of_node_put(np);
> +		}
> +		kfree(base);
> +	}
> +
> +	/* now try the old style interrupt */
> +	if (of_get_property(pe->np, "interrupts", NULL) &&
> +			(np = of_irq_find_parent(pe->np)) != NULL) {
> +
> +		/* check whether the ref is already there */
> +		found = false;
> +		list_for_each_entry(re, &pe->refs, node) {
> +			if (re->np == np) {
> +				found = true;
> +				break;
> +			}
> +		}
> +
> +		if (!found) {
> +			re = kzalloc(sizeof(*re), GFP_KERNEL);
> +			BUG_ON(re == NULL);
> +			re->np = np;
> +			list_add_tail(&re->node, &pe->refs);
> +
> +		}
> +
> +		/* pr_info("  %08x - ph %08x - @%s\n", off, ph,
> +				of_node_full_name(phnp)); */
> +		of_node_put(np);
> +	}
> +}
> +
> +static void __of_platform_populate_scan_internal(struct device_node *root,
> +			const struct of_device_id *matches,
> +			struct of_pop_entry *pep, int level)
> +{
> +	struct device_node *child;
> +	struct of_pop_entry *pe;
> +
> +	BUG_ON(root == NULL);
> +
> +	for_each_child_of_node(root, child) {
> +
> +		/* of_platform_bus_create (strict) */
> +		if (!of_get_property(child, "compatible", NULL) ||
> +			!of_device_is_available(child) ||
> +			of_node_check_flag(child, OF_POPULATED))
> +			continue;
> +
> +		pe = kzalloc(sizeof(*pe), GFP_KERNEL);
> +		BUG_ON(pe == NULL);
> +		pe->parent = pep;
> +		INIT_LIST_HEAD(&pe->node);
> +		INIT_LIST_HEAD(&pe->children);
> +		INIT_LIST_HEAD(&pe->refs);
> +		INIT_LIST_HEAD(&pe->deps);
> +		INIT_LIST_HEAD(&pe->sort_children);
> +		INIT_LIST_HEAD(&pe->sort_node);
> +		pe->np = child;
> +
> +		list_add_tail(&pe->node, &pep->children);
> +
> +		if (of_device_is_compatible(pe->np, "arm,primecell"))
> +			pe->amba = 1;
> +		else if (of_match_node(matches, pe->np)) {
> +			pe->bus = 1;
> +			__of_platform_populate_scan_internal(child, matches, pe, level + 1);
> +		}
> +	}
> +}
> +
> +static void __of_platform_get_refs(struct of_pop_entry *pep, int level)
> +{
> +	struct of_pop_entry *pe;
> +
> +	__of_platform_populate_get_refs_internal(pep);
> +
> +	list_for_each_entry(pe, &pep->children, node) {
> +		if (pe->bus)
> +			__of_platform_get_refs(pe, level + 1);
> +		__of_platform_populate_get_refs_internal(pe);
> +	}
> +}
> +
> +static void __of_platform_make_deps_internal(struct of_pop_entry *pe)
> +{
> +	struct of_pop_ref_entry *re;
> +	struct of_pop_entry *ppe, *tpe;
> +	struct of_pop_dep_entry *de;
> +	bool found;
> +
> +	/* for each ref, find sibling that contains it */
> +	list_for_each_entry(re, &pe->refs, node) {
> +		if (!pe->parent)
> +			continue;
> +		ppe = pe->parent;
> +		list_for_each_entry(tpe, &ppe->children, node) {
> +			if (tpe == pe)
> +				continue;
> +			if (!__internal_ref(tpe->np, re->np))
> +				continue;
> +
> +			/* check whether the ref is already there */
> +			found = false;
> +			list_for_each_entry(de, &pe->deps, node) {
> +				if (de->pe == tpe) {
> +					found = true;
> +					break;
> +				}
> +			}
> +
> +			if (!found) {
> +				de = kzalloc(sizeof(*de), GFP_KERNEL);
> +				BUG_ON(de == NULL);
> +				de->pe = tpe;
> +				tpe->refcnt++;
> +				list_add_tail(&de->node, &pe->deps);
> +
> +				/* pr_info("* %s depends on %s\n",
> +						of_node_full_name(pe->np),
> +						of_node_full_name(tpe->np)); */
> +			}
> +		}
> +	}
> +}
> +
> +static void __of_platform_make_deps(struct of_pop_entry *pep, int level)
> +{
> +	struct of_pop_entry *pe;
> +
> +	__of_platform_make_deps_internal(pep);
> +	list_for_each_entry(pe, &pep->children, node)
> +		__of_platform_make_deps(pe, level + 1);
> +}
> +
> +static int __of_platform_visit(struct of_pop_entry *pe)
> +{
> +	struct of_pop_dep_entry *de;
> +	bool circle;
> +	int rc;
> +
> +	/* don't do anything with root or a visited node */
> +	if (!pe->parent || pe->perm_mark)
> +		return 0;
> +
> +	/* cycle */
> +	circle = false;
> +	if (pe->temp_mark) {
> +		pr_info("%s: circle at @%s\n", __func__,
> +				of_node_full_name(pe->np));
> +		circle = true;
> +	} else {
> +		pe->temp_mark = 1;
> +		list_for_each_entry(de, &pe->deps, node) {
> +			rc = __of_platform_visit(de->pe);
> +			if (rc != 0)
> +				circle = true;
> +		}
> +		pe->temp_mark = 0;
> +		list_add_tail(&pe->sort_node, &pe->parent->sort_children);
> +	}
> +
> +	pe->perm_mark = 1;
> +
> +	if (circle)
> +		pe->loop = 1;
> +
> +	return circle ? -1 : 0;
> +}
> +
> +static int __of_platform_reorder_internal(struct of_pop_entry *pep)
> +{
> +	struct of_pop_entry *pe;
> +	int ret;
> +	bool circle;
> +
> +	circle = false;
> +	list_for_each_entry(pe, &pep->children, node) {
> +		ret = __of_platform_visit(pe);
> +		if (ret != 0)
> +			circle = true;
> +	}
> +	return circle ? -1 : 0;
> +}
> +
> +static void __of_platform_reorder(struct of_pop_entry *pep, int level)
> +{
> +	struct of_pop_entry *pe;
> +	int ret;
> +
> +	ret = __of_platform_reorder_internal(pep);
> +	if (ret != 0) {
> +		pr_info("%s: circle at @%s\n", __func__,
> +			of_node_full_name(pep->np));
> +		pep->children_loop = 1;
> +	}
> +
> +	list_for_each_entry(pe, &pep->children, node)
> +		__of_platform_reorder(pe, level + 1);
> +}
> +
> +static int __of_platform_assign_order(struct of_pop_entry *pep, int level, int id)
> +{
> +	struct of_pop_entry *pe;
> +
> +	pep->id = id++;
> +	list_for_each_entry(pe, &pep->sort_children, sort_node)
> +		id = __of_platform_assign_order(pe, level + 1, id);
> +	return id;
> +}
> +
> +static int __count_children(struct of_pop_entry *pep)
> +{
> +	struct of_pop_entry *pe;
> +	int cnt;
> +
> +	cnt = 0;
> +	list_for_each_entry(pe, &pep->children, node)
> +		cnt++;
> +	return cnt;
> +}
> +
> +static int __count_sort_children(struct of_pop_entry *pep)
> +{
> +	struct of_pop_entry *pe;
> +	int cnt;
> +
> +	cnt = 0;
> +	list_for_each_entry(pe, &pep->sort_children, sort_node)
> +		cnt++;
> +	return cnt;
> +}
> +
> +static void __of_platform_populate_scan_dump(struct of_pop_entry *pep, int level)
> +{
> +	struct of_pop_entry *pe;
> +	struct of_pop_ref_entry *re;
> +	struct of_pop_dep_entry *de;
> +
> +	pr_debug("| %s %*s @%s (%d) - count=%d\n",
> +		pep->bus ? "BUS" : (pep->amba ? "AMB" : "PLT"),
> +		level * 4, "", of_node_full_name(pep->np), pep->refcnt,
> +		__count_children(pep));
> +	list_for_each_entry(re, &pep->refs, node)
> +		pr_debug("+     %*s @%s\n", level * 4, "", of_node_full_name(re->np));
> +	list_for_each_entry(de, &pep->deps, node)
> +		pr_debug(">     %*s @%s\n", level * 4, "", of_node_full_name(de->pe->np));
> +
> +	list_for_each_entry(pe, &pep->children, node)
> +		__of_platform_populate_scan_dump(pe, level + 1);
> +}
> +
> +static void __of_platform_populate_scan_sort_dump(struct of_pop_entry *pep, int level)
> +{
> +	struct of_pop_entry *pe;
> +	struct of_pop_dep_entry *de;
> +
> +	pr_debug("* %s %*s @%s (%d) - sort-count=%d - id=%d\n",
> +		pep->bus ? "BUS" : (pep->amba ? "AMB" : "PLT"),
> +		level * 4, "", of_node_full_name(pep->np), pep->refcnt,
> +		__count_sort_children(pep), pep->id);
> +	list_for_each_entry(de, &pep->deps, node)
> +		pr_debug("%%     %*s @%s - id=%d\n", level * 4, "",
> +				of_node_full_name(de->pe->np), de->pe->id);
> +
> +	list_for_each_entry(pe, &pep->sort_children, sort_node)
> +		__of_platform_populate_scan_sort_dump(pe, level + 1);
> +}
> +
> +static void __of_platform_check_dep_order(struct of_pop_entry *pep, int level)
> +{
> +	struct of_pop_entry *pe;
> +	struct of_pop_dep_entry *de;
> +
> +	list_for_each_entry(de, &pep->deps, node) {
> +		if (de->pe->id >= pep->id) {
> +			pr_info("%s: backwards reference @%s(%d) to @%s(%d)\n", __func__,
> +					of_node_full_name(pep->np), pep->id,
> +					of_node_full_name(de->pe->np), de->pe->id);
> +		}
> +	}
> +
> +	list_for_each_entry(pe, &pep->sort_children, sort_node)
> +		__of_platform_check_dep_order(pe, level + 1);
> +}
> +
> +
> +static int __of_platform_populate_probe(struct of_pop_entry *pep,
> +			const struct of_device_id *matches,
> +			const struct of_dev_auxdata *lookup,
> +			struct device *parent,
> +			int level)
> +{
> +	struct of_pop_entry *pe;
> +	const char *bus_id = NULL;
> +	void *platform_data = NULL;
> +	const struct of_dev_auxdata *auxdata;
> +	struct platform_device *dev;
> +	int rc = 0;
> +
> +	if (level > 0) {
> +		auxdata = of_dev_lookup(lookup, pep->np);
> +		if (auxdata) {
> +			bus_id = auxdata->name;
> +			platform_data = auxdata->platform_data;
> +		}
> +
> +		if (pep->amba) {
> +			/* pr_info("of_amba_device_create(%s, %s, ..)\n",
> +					of_node_full_name(pep->np), bus_id ? bus_id : "<NULL>"); */
> +			of_amba_device_create(pep->np, bus_id, platform_data, parent);
> +			return 0;
> +		}
> +
> +		/* pr_info("of_platform_device_create_pdata(%s, %s, ..)\n",
> +				of_node_full_name(pep->np), bus_id ? bus_id : "<NULL>"); */
> +		dev = of_platform_device_create_pdata(pep->np, bus_id, platform_data, parent);
> +		if (!dev || !of_match_node(matches, pep->np))
> +			return 0;
> +	}
> +
> +	list_for_each_entry(pe, &pep->children, node) {
> +		rc = __of_platform_populate_probe(pe, matches, lookup, parent,
> +				level + 1);
> +		if (rc)
> +			break;
> +	}
> +
> +	of_node_set_flag(pep->np, OF_POPULATED_BUS);
> +
> +	return rc;
> +}
> +
> +
> +static void __of_platform_populate_free(struct of_pop_entry *pep)
> +{
> +	struct of_pop_entry *pe, *pen;
> +	struct of_pop_ref_entry *re, *ren;
> +	struct of_pop_dep_entry *de, *den;
> +
> +	list_for_each_entry_safe(pe, pen, &pep->children, node) {
> +		list_del(&pe->node);
> +		__of_platform_populate_free(pe);
> +	}
> +
> +	list_for_each_entry_safe(re, ren, &pep->refs, node) {
> +		list_del(&re->node);
> +		kfree(re);
> +	}
> +	list_for_each_entry_safe(de, den, &pep->deps, node) {
> +		list_del(&de->node);
> +		kfree(de);
> +	}
> +
> +	kfree(pep);
> +}
> +
> +
> +static struct of_pop_entry *__of_platform_populate_scan(struct device_node *root,
> +			const struct of_device_id *matches)
> +{
> +	struct of_pop_entry *pe;
> +	struct device_node *np;
> +
> +	/* if no local fixups are present do not proceed */
> +	np = of_find_node_by_path("/__local_fixups__");
> +	if (!np)
> +		return NULL;
> +
> +	of_node_put(np);
> +
> +	pe = kzalloc(sizeof(*pe), GFP_KERNEL);
> +	if (pe == NULL)
> +		return NULL;
> +	pe->parent = NULL;
> +	INIT_LIST_HEAD(&pe->node);
> +	INIT_LIST_HEAD(&pe->children);
> +	INIT_LIST_HEAD(&pe->refs);
> +	INIT_LIST_HEAD(&pe->deps);
> +	INIT_LIST_HEAD(&pe->sort_children);
> +	INIT_LIST_HEAD(&pe->sort_node);
> +	pe->np = root;
> +
> +	__of_platform_populate_scan_internal(root, matches, pe, 0);
> +	return pe;
> +}
> +
> +
>  /**
>   * of_platform_populate() - Populate platform_devices from device tree data
>   * @root: parent of the first level to probe or NULL for the root of the tree
> @@ -488,18 +1031,34 @@ int of_platform_populate(struct device_node *root,
>  			const struct of_dev_auxdata *lookup,
>  			struct device *parent)
>  {
> -	struct device_node *child;
> +	struct of_pop_entry *pe;
>  	int rc = 0;
>  
>  	root = root ? of_node_get(root) : of_find_node_by_path("/");
>  	if (!root)
>  		return -EINVAL;
>  
> -	for_each_child_of_node(root, child) {
> -		rc = of_platform_bus_create(child, matches, lookup, parent, true);
> -		if (rc)
> -			break;
> +	pe = __of_platform_populate_scan(root, matches);
> +	if (pe) {
> +		__of_platform_get_refs(pe, 0);
> +		__of_platform_make_deps(pe, 0);
> +		__of_platform_populate_scan_dump(pe, 0);
> +		__of_platform_reorder(pe, 0);
> +		__of_platform_assign_order(pe, 0, 0);
> +		__of_platform_populate_scan_sort_dump(pe, 0);
> +		__of_platform_check_dep_order(pe, 0);
> +		rc = __of_platform_populate_probe(pe, matches, lookup, parent, 0);
> +		__of_platform_populate_free(pe);
> +	} else {
> +		struct device_node *child;
> +
> +		for_each_child_of_node(root, child) {
> +			rc = of_platform_bus_create(child, matches, lookup, parent, true);
> +			if (rc)
> +				break;
> +		}
>  	}
> +
>  	of_node_set_flag(root, OF_POPULATED_BUS);
>  
>  	of_node_put(root);
> -- 
> 1.7.12
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
