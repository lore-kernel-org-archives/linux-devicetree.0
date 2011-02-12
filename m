From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC][PATCH] add FDT address translation
Date: Sat, 12 Feb 2011 02:11:24 -0700
Message-ID: <20110212091124.GC17755@angua.secretlab.ca>
References: <4D1BC658.4040608@home.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4D1BC658.4040608-CmkmPbn3yAE@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 30, 2010 at 12:38:00AM +0100, Walter Goossens wrote:
> This patch adds address translations to fdt. Needed when the early
> console is connected to a simple-bus that has address translation
> enabled.
> 
> To be honest, I'm not too happy about this solution but it works and
> most code is stolen from other parts of the fdt code, so I'm
> probably not doing too weird stuff :)
> What do you guys think of this?

Hi Walter,

Thanks for the patch, comments below.

g.

> 
> Greetz Walter

> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index c1360e0..d586efe 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -538,6 +538,161 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>  	/* break now */
>  	return 1;
>  }
> +/**
> + * flat_dt_translate_address - Translate an address using the ranges property
> + *
> + * This function converts address from "node address-space" to "parent address-
> + * space"
> + */
> +static int __init flat_dt_translate_address(unsigned long node, unsigned long parent, u64 *address)
> +{
> +	unsigned long size = 0;
> +	__be32 *prop;
> +	__be32 *ranges;
> +	int size_cells = 0;
> +	int addr_cells = 0;
> +	int paddr_cells = OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
> +
> +	ranges = (u32 *)of_get_flat_dt_prop(node,"ranges",&size);

Shouldn't need the cast here.  Also coding style.  Need spaced after each ','

Lots of other style issues through this patch.  You should run this
patch through scripts/checkpatch.pl before resubmitting.

> +
> +	if(size==0) {

Coding style:
	if (size == 0) {

> +		pr_debug("No translation possible/necessary\n");

These are two different cases.  If ranges is *not* present, then the
address cannot be translated and it looks like -EINVAL should be
returned.  If ranges is empty, then the node address is 1:1 mapped to
the parent address and success should be returned.

> +		return 0;
> +	}
> +
> +	prop = of_get_flat_dt_prop(node, "#size-cells", NULL);
> +	if (prop)
> +		size_cells = be32_to_cpup(prop);

I'd reverse the logic:

	prop = of_get_flat_dt_prop(node, "#size-cells", NULL);
	if (!prop)
		return -EINVAL;
	size_cells = be32_to_cpup(prop);

> +	pr_debug("size_cells = %x\n", size_cells);
> +
> +	prop = of_get_flat_dt_prop(node, "#address-cells", NULL);
> +	if (prop)
> +		addr_cells = be32_to_cpup(prop);

Ditto here.

Also, before I dig too deep into the implementation, have you looked
at dt_xlate() in arch/powerpc/boot/devtree.c?  It would need a bit of
rework, but it is essentially the algorithm you want to implement.

> +	pr_debug("addr_cells = %x\n", addr_cells);
> +
> +	if(parent) {
> +		prop = of_get_flat_dt_prop(parent, "#address-cells", NULL);
> +		if (prop)
> +			paddr_cells = be32_to_cpup(prop);
> +		pr_debug("paddr_cells = %x\n", paddr_cells);
> +	}
> +	if((addr_cells<=0)||(size_cells<=0)||
> +		(addr_cells>2)||(size_cells>2)||(paddr_cells>2)) {
> +		pr_warn("Translation not possible in fdt. Invalid address.\n");
> +		*address = 0;
> +		return -1;
> +	}
> +	pr_debug("FDT-Ranges:\n");
> +	while(size>0) {
> +		u64 from,to,tsize;
> +		from = be32_to_cpup(ranges++);
> +		size-=4;
> +		if(addr_cells==2) {
> +			from += (((u64)be32_to_cpup(ranges++))<<32);
> +			size-=4;
> +		}
> +		to = be32_to_cpup(ranges++);
> +		size-=4;
> +		if(paddr_cells==2) {
> +			to += (((u64)be32_to_cpup(ranges++))<<32);
> +			size-=4;
> +		}
> +		tsize = be32_to_cpup(ranges++);
> +		size-=4;
> +		if(size_cells==2) {
> +			tsize += (((u64)be32_to_cpup(ranges++))<<32);
> +			size-=4;
> +		}
> +		pr_debug("  From %llX To %llX Size %llX\n", from, to, tsize);
> +		if((*address>=from)&&(*address<(from+tsize)))
> +			*address += (to - from);
> +	}
> +	return 1;
> +}
> +
> +static int __init of_scan_flat_dt_ranges(unsigned long *pnode, 
> +				unsigned long parent, unsigned long target, 
> +				u64 *address, int ignore)
> +{
> +	int rc = 0;
> +	int depth = -1;
> +	char *pathp;
> +	unsigned long p = *pnode;
> +	do {
> +		u32 tag = be32_to_cpup((__be32 *)p);
> +
> +		p += 4;
> +		if (tag == OF_DT_END_NODE) {
> +			if(depth--) {
> +				break;
> +			} else {
> +				continue;
> +			}
> +		}
> +		if (tag == OF_DT_NOP)
> +			continue;
> +		if (tag == OF_DT_END)
> +			break;
> +		if (tag == OF_DT_PROP) {
> +			u32 sz = be32_to_cpup((__be32 *)p);
> +			p += 8;
> +			if (be32_to_cpu(initial_boot_params->version) < 0x10)
> +				p = ALIGN(p, sz >= 8 ? 8 : 4);
> +			p += sz;
> +			p = ALIGN(p, 4);
> +			continue;
> +		}
> +		if (tag != OF_DT_BEGIN_NODE) {
> +			pr_err("Invalid tag %x in flat device tree!\n", tag);
> +			return -EINVAL;
> +		}
> +		pathp = (char *)p;
> +		p = ALIGN(p + strlen(pathp) + 1, 4);
> +		if ((*pathp) == '/') {
> +			char *lp, *np;
> +			for (lp = NULL, np = pathp; *np; np++)
> +				if ((*np) == '/')
> +					lp = np+1;
> +			if (lp != NULL)
> +				pathp = lp;
> +		}
> +		if((ignore==0) && (p == target)) {
> +			rc = 1;
> +			ignore++;
> +			pr_debug("Found target. Start address translation\n");
> +		}
> +		if(depth) {
> +			int res;
> +			*pnode=p;
> +			res = of_scan_flat_dt_ranges(pnode, p, target, 
> +							address,ignore);
> +			if(res<0) {
> +				/* Something bad happened */
> +				return -1;
> +			} else if(res>0) {
> +				/* Something gooed happened. Translate. */
> +				rc++;
> +				pr_debug("translate %08lX %s\n", p, pathp);
> +				if(flat_dt_translate_address(p, parent, 
> +						address)<0) {
> +					return -1;
> +				}
> +			}
> +			p=*pnode;
> +		} else {
> +			depth++;
> +		}
> +	} while (1);
> +	*pnode=p;
> +	return rc;
> +}

You don't need to implement this.  drivers/of/fdt.c has functions that
already parse the flattened tree.

> +int __init early_init_dt_translate_address(unsigned long node, u64 *address)
> +{
> +	unsigned long p = ((unsigned long)initial_boot_params) +
> +			be32_to_cpu(initial_boot_params->off_dt_struct);

of_get_flat_dt_root()

> +	return of_scan_flat_dt_ranges(&p, 0, node, address,0);
> +}
> +
>  
>  /**
>   * unflatten_device_tree - create tree of device_nodes from flat blob
> diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
> index 7bbf5b3..92e8694 100644
> --- a/include/linux/of_fdt.h
> +++ b/include/linux/of_fdt.h
> @@ -82,6 +82,8 @@ extern void early_init_dt_add_memory_arch(u64 base, u64 size);
>  extern u64 early_init_dt_alloc_memory_arch(u64 size, u64 align);
>  extern u64 dt_mem_next_cell(int s, __be32 **cellp);
>  
> +extern int early_init_dt_translate_address(unsigned long node, u64 *address);
> +
>  /*
>   * If BLK_DEV_INITRD, the fdt early init code will call this function,
>   * to be provided by the arch code. start and end are specified as

> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
