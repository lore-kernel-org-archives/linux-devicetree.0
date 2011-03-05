From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC 2/3] OLPC: add missing elements to device tree
Date: Fri, 4 Mar 2011 21:50:42 -0700
Message-ID: <20110305045042.GH7579@angua.secretlab.ca>
References: <20110304171235.10C1F9D401D@zog.reactivated.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110304171235.10C1F9D401D-k/4jFdqg8LLlyo9zxV8I99HuzzzSOjJt@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 04, 2011 at 05:12:34PM +0000, Daniel Drake wrote:
> In response to new device tree code in the kernel, OLPC will start
> using it for probing of certain devices. However, some firmware fixes
> are needed to put the devicetree into a usable state.
> 
> Retain compatibility with old firmware by fixing up the device tree
> at boot-time if it does not contain the new nodes/properties that
> we need for probing.
> 
> Signed-off-by: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>

Hi Daniel,

The concept looks good. here are a few comments on the
implementation.

g.

> ---
>  arch/x86/platform/olpc/olpc_dt.c |   87 ++++++++++++++++++++++++++++++++++++++
>  1 files changed, 87 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/x86/platform/olpc/olpc_dt.c b/arch/x86/platform/olpc/olpc_dt.c
> index 09cbede..58bba78 100644
> --- a/arch/x86/platform/olpc/olpc_dt.c
> +++ b/arch/x86/platform/olpc/olpc_dt.c
> @@ -22,6 +22,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/of_pdt.h>
>  #include <asm/olpc_ofw.h>
> +#include <asm/olpc.h>
>  
>  static phandle __init olpc_dt_getsibling(phandle node)
>  {
> @@ -164,6 +165,91 @@ static struct of_pdt_ops prom_olpc_ops __initdata = {
>  	.pkg2path = olpc_dt_pkg2path,
>  };
>  
> +static char __init *prom_alloc_string(const char *str, int *len)
> +{
> +	int _len = strlen(str);
> +	char *output = prom_early_alloc(_len + 1);
> +
> +	strcpy(output, str);
> +	if (len)
> +		*len = _len;
> +	return output;
> +}
> +
> +static void __init prom_alloc_property(struct device_node *node,
> +	const char *name, const char *value)
> +{
> +	struct property *p = prom_early_alloc(sizeof(struct property));

How early is this running?  If the allocator is set up by now, then
this should use kzalloc()...

> +
> +	p->name = prom_alloc_string(name, NULL);
> +	p->value = prom_alloc_string(value, &p->length);

... which would also mean that kstrdup()/kmemdup() can be used here
directly.

> +	prom_add_property(node, p);
> +}

This would be useful in common code.  prom_create_property() might
be a better name.  It should also accept a length argument for the
size of the data.

> +
> +/* Add dcon device as child of display */
> +static void __init add_dcon_node(struct device_node *display)
> +{
> +	struct device_node *node = prom_early_alloc(sizeof(struct device_node));
> +	unsigned long flags;
> +
> +	kref_init(&node->kref);
> +	node->name = prom_alloc_string("dcon", NULL);
> +	node->full_name = (char *) node->name;
> +	node->parent = display;
> +
> +	write_lock_irqsave(&devtree_lock, flags);
> +	node->sibling = node->parent->child;
> +	node->allnext = allnodes;
> +	node->parent->child = node;
> +	allnodes = node;
> +	write_unlock_irqrestore(&devtree_lock, flags);
> +

This should be using the existing of_attach_node() function to link
the node into the tree (in fact I know you've seen it because the
above 6 lines are identical).  :-)  Also, there already exists a function
"new_node" in arch/powerpc/platforms/iseries/vio.c that would be
useful to move into drivers/of/base.c

> +	prom_alloc_property(node, "compatible", "olpc,xo1-dcon");
> +}
> +
> +static void __init olpc_dt_fixup(void)
> +{
> +	struct device_node *node;
> +
> +	/*
> +	 * Use battery's compatible property to determine if we're running a
> +	 * new-enough firmware. If we have this property, no fixups are needed.
> +	 */
> +	node = of_find_node_by_name(NULL, "battery");
> +	if (node && of_get_property(node, "compatible", NULL)) {
> +		of_node_put(node);
> +		return;
> +	}
> +
> +	/*
> +	 * Add "compatible" property to battery, it was missing from earlier
> +	 * firmware releases.
> +	 */
> +	prom_alloc_property(node, "compatible", "olpc,xo1-battery");
> +	of_node_put(node);
> +
> +	/*
> +	 * Mark XO-1 RTC as compatible with olpc,xo1-rtc - this was not done in
> +	 * earlier firmware releases.
> +	 */
> +	node = of_find_node_by_name(NULL, "rtc");
> +	if (olpc_platform_info.boardrev < olpc_board_pre(0xd0) && node) {
> +		struct property *p = of_get_property(node, "compatible", NULL);
> +		prom_remove_property(node, p);

What if p is NULL?  prom_remove_property() looks like it won't break
if it is, but that looks to be only by luck.  I think this can be more
defensive.

> +		prom_alloc_property(node, "compatible", "olpc,xo1-rtc");
> +	}
> +	of_node_put(node);
> +
> +	/*
> +	 * Add "dcon" device node, it was missing from earlier firmware
> +	 * releases.
> +	 */
> +	node = of_find_node_by_name(NULL, "display");
> +	if (node)
> +		add_dcon_node(node);
> +	of_node_put(node);
> +}
> +
>  void __init olpc_dt_build_devicetree(void)
>  {
>  	phandle root;
> @@ -177,6 +263,7 @@ void __init olpc_dt_build_devicetree(void)
>  		return;
>  	}
>  	of_pdt_build_devicetree(root, &prom_olpc_ops);
> +	olpc_dt_fixup();
>  
>  	pr_info("PROM DT: Built device tree with %u bytes of memory.\n",
>  			prom_early_allocated);
> -- 
> 1.7.4
> 
