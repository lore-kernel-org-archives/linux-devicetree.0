From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: use pr_fmt prefix for all console printing
Date: Thu, 2 Jun 2016 10:33:16 -0700
Message-ID: <57506DDC.3060804@gmail.com>
References: <1464880499-29864-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464880499-29864-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/02/16 08:14, Rob Herring wrote:
> Clean-up all the DT printk functions to use common pr_fmt prefix.
> 
> Some print statements such as kmalloc errors were redundant, so just
> drop those.
> 
> Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/of/address.c         | 49 ++++++++++++++++++++++----------------------
>  drivers/of/base.c            | 11 ++++++----
>  drivers/of/dynamic.c         | 47 +++++++++++++++++++++---------------------
>  drivers/of/fdt.c             | 12 +++++------
>  drivers/of/fdt_address.c     | 35 ++++++++++++++++---------------
>  drivers/of/irq.c             |  2 ++
>  drivers/of/of_numa.c         | 22 ++++++--------------
>  drivers/of/of_pci.c          |  6 ++++--
>  drivers/of/of_reserved_mem.c | 22 ++++++++++----------
>  drivers/of/overlay.c         | 43 +++++++++++++++-----------------------
>  drivers/of/platform.c        | 16 +++++++--------
>  drivers/of/resolver.c        |  2 ++
>  12 files changed, 130 insertions(+), 137 deletions(-)
> 

Nice cleanup.  A couple of comments below.

Reviewed-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

< snip >

> diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
> index 0f2784b..e5764c5 100644
> --- a/drivers/of/of_numa.c
> +++ b/drivers/of/of_numa.c
> @@ -16,6 +16,8 @@
>   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#define pr_fmt(fmt)	"OF: " fmt
> +
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/nodemask.h>
> @@ -65,11 +67,7 @@ static int __init of_numa_parse_memory_nodes(void)
>  	u32 nid;
>  	int r = 0;
>  
> -	for (;;) {
> -		np = of_find_node_by_type(np, "memory");
> -		if (!np)
> -			break;
> -
> +	for_each_node_by_type(np, "memory") {
>  		r = of_property_read_u32(np, "numa-node-id", &nid);
>  		if (r == -EINVAL)
>  			/*
> @@ -83,18 +81,10 @@ static int __init of_numa_parse_memory_nodes(void)
>  			break;
>  
>  		r = of_address_to_resource(np, 0, &rsrc);
> -		if (r) {
> -			pr_err("NUMA: bad reg property in memory node\n");
> -			break;
> -		}
> -
> -		pr_debug("NUMA:  base = %llx len = %llx, node = %u\n",
> -			 rsrc.start, rsrc.end - rsrc.start + 1, nid);
> -
> -		r = numa_add_memblk(nid, rsrc.start,

Missing declaration: int i;

Calling of_address_to_resource() with index > 0 and then calling
numa_add_memblk() with the resulting resource(s) is a change in
functionality.  This should be in a separate patch.
 
> +		for (i = 0; !r; i++, r = of_address_to_resource(np, i, &rsrc)) {
> +			r = numa_add_memblk(nid, rsrc.start,
>  				    rsrc.end - rsrc.start + 1);
> -		if (r)
> -			break;
> +		}
>  	}
>  	of_node_put(np);
>  

< snip >

> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 8225081..318dbb5 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -8,7 +8,9 @@
>   * modify it under the terms of the GNU General Public License
>   * version 2 as published by the Free Software Foundation.
>   */
> -#undef DEBUG
> +
> +#define pr_fmt(fmt)	"OF: overlay: " fmt
> +
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -137,8 +139,8 @@ static int of_overlay_apply_one(struct of_overlay *ov,
>  	for_each_property_of_node(overlay, prop) {
>  		ret = of_overlay_apply_single_property(ov, target, prop);
>  		if (ret) {
> -			pr_err("%s: Failed to apply prop @%s/%s\n",
> -				__func__, target->full_name, prop->name);
> +			pr_err("Failed to apply prop @%s/%s\n",
> +			       target->full_name, prop->name);
>  			return ret;
>  		}
>  	}
> @@ -146,9 +148,8 @@ static int of_overlay_apply_one(struct of_overlay *ov,
>  	for_each_child_of_node(overlay, child) {
>  		ret = of_overlay_apply_single_device_node(ov, target, child);
>  		if (ret != 0) {
> -			pr_err("%s: Failed to apply single node @%s/%s\n",
> -					__func__, target->full_name,
> -					child->name);
> +			pr_err("Failed to apply single node @%s/%s\n",
> +			       target->full_name, child->name);
>  			of_node_put(child);
>  			return ret;
>  		}
> @@ -176,8 +177,7 @@ static int of_overlay_apply(struct of_overlay *ov)
>  
>  		err = of_overlay_apply_one(ov, ovinfo->target, ovinfo->overlay);
>  		if (err != 0) {
> -			pr_err("%s: overlay failed '%s'\n",
> -				__func__, ovinfo->target->full_name);
> +			pr_err("apply failed '%s'\n", ovinfo->target->full_name);
>  			return err;
>  		}
>  	}
> @@ -208,7 +208,7 @@ static struct device_node *find_target_node(struct device_node *info_node)
>  	if (ret == 0)
>  		return of_find_node_by_path(path);
>  
> -	pr_err("%s: Failed to find target for node %p (%s)\n", __func__,
> +	pr_err("Failed to find target for node %p (%s)\n",
>  		info_node, info_node->name);
>  
>  	return NULL;
> @@ -355,8 +355,6 @@ int of_overlay_create(struct device_node *tree)
>  
>  	id = idr_alloc(&ov_idr, ov, 0, 0, GFP_KERNEL);
>  	if (id < 0) {
> -		pr_err("%s: idr_alloc() failed for tree@%s\n",
> -				__func__, tree->full_name);

Every other error in of_overlay_create() results in a pr_err().
(The other cases of removing pr_err() in this file are fine, because
the errors are already reported in the functions called from this
function.)

I would recommend leaving in the pr_err() for idr_alloc() failure.

>  		err = id;
>  		goto err_destroy_trans;
>  	}
> @@ -365,26 +363,21 @@ int of_overlay_create(struct device_node *tree)
>  	/* build the overlay info structures */
>  	err = of_build_overlay_info(ov, tree);
>  	if (err) {
> -		pr_err("%s: of_build_overlay_info() failed for tree@%s\n",
> -				__func__, tree->full_name);
> +		pr_err("of_build_overlay_info() failed for tree@%s\n",
> +		       tree->full_name);
>  		goto err_free_idr;
>  	}
>  
>  	/* apply the overlay */
>  	err = of_overlay_apply(ov);
> -	if (err) {
> -		pr_err("%s: of_overlay_apply() failed for tree@%s\n",
> -				__func__, tree->full_name);
> +	if (err)
>  		goto err_abort_trans;
> -	}
>  
>  	/* apply the changeset */
>  	err = __of_changeset_apply(&ov->cset);
> -	if (err) {
> -		pr_err("%s: __of_changeset_apply() failed for tree@%s\n",
> -				__func__, tree->full_name);
> +	if (err)
>  		goto err_revert_overlay;
> -	}
> +
>  
>  	/* add to the tail of the overlay list */
>  	list_add_tail(&ov->node, &ov_list);
> @@ -469,8 +462,7 @@ static int overlay_removal_is_ok(struct of_overlay *ov)
>  
>  	list_for_each_entry(ce, &ov->cset.entries, node) {
>  		if (!overlay_is_topmost(ov, ce->np)) {
> -			pr_err("%s: overlay #%d is not topmost\n",
> -					__func__, ov->id);
> +			pr_err("overlay #%d is not topmost\n", ov->id);
>  			return 0;
>  		}
>  	}
> @@ -496,16 +488,13 @@ int of_overlay_destroy(int id)
>  	ov = idr_find(&ov_idr, id);
>  	if (ov == NULL) {
>  		err = -ENODEV;
> -		pr_err("%s: Could not find overlay #%d\n",
> -				__func__, id);
> +		pr_err("destroy: Could not find overlay #%d\n", id);
>  		goto out;
>  	}
>  
>  	/* check whether the overlay is safe to remove */
>  	if (!overlay_removal_is_ok(ov)) {
>  		err = -EBUSY;
> -		pr_err("%s: removal check failed for overlay #%d\n",
> -				__func__, id);
>  		goto out;
>  	}
>  

< snip >
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
