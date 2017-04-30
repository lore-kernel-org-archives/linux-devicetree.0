From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/4] of: remove *phandle properties from expanded
 device tree
Date: Sun, 30 Apr 2017 13:49:51 -0700
Message-ID: <59064DEF.1060908@gmail.com>
References: <201704300820.jFYE4Inc%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201704300820.jFYE4Inc%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/29/17 17:22, kbuild test robot wrote:
> Hi Frank,
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on v4.11-rc8 next-20170428]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/frowand-list-gmail-com/of-remove-phandle-properties-from-expanded-device-tree/20170426-000149
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> config: s390-allmodconfig (attached as .config)
> compiler: s390x-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=s390 
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/kobject.h:21:0,
>                     from include/linux/device.h:17,
>                     from include/linux/node.h:17,
>                     from include/linux/cpu.h:16,
>                     from drivers/of/base.c:25:
>    drivers/of/base.c: In function '__of_add_phandle_sysfs':
>>> drivers/of/base.c:198:23: error: 'pp' undeclared (first use in this function)
>      sysfs_bin_attr_init(&pp->attr);
>                           ^

Thanks for the report!

A patch to fix this is now submitted to Rob.

-Frank

>    include/linux/sysfs.h:54:3: note: in definition of macro 'sysfs_attr_init'
>      (attr)->key = &__key;    \
>       ^~~~
>    drivers/of/base.c:198:2: note: in expansion of macro 'sysfs_bin_attr_init'
>      sysfs_bin_attr_init(&pp->attr);
>      ^~~~~~~~~~~~~~~~~~~
>    drivers/of/base.c:198:23: note: each undeclared identifier is reported only once for each function it appears in
>      sysfs_bin_attr_init(&pp->attr);
>                           ^
>    include/linux/sysfs.h:54:3: note: in definition of macro 'sysfs_attr_init'
>      (attr)->key = &__key;    \
>       ^~~~
>    drivers/of/base.c:198:2: note: in expansion of macro 'sysfs_bin_attr_init'
>      sysfs_bin_attr_init(&pp->attr);
>      ^~~~~~~~~~~~~~~~~~~
> 
> vim +/pp +198 drivers/of/base.c
> 
>     19	 */
>     20	
>     21	#define pr_fmt(fmt)	"OF: " fmt
>     22	
>     23	#include <linux/console.h>
>     24	#include <linux/ctype.h>
>   > 25	#include <linux/cpu.h>
>     26	#include <linux/module.h>
>     27	#include <linux/of.h>
>     28	#include <linux/of_device.h>
>     29	#include <linux/of_graph.h>
>     30	#include <linux/spinlock.h>
>     31	#include <linux/slab.h>
>     32	#include <linux/string.h>
>     33	#include <linux/proc_fs.h>
>     34	
>     35	#include "of_private.h"
>     36	
>     37	LIST_HEAD(aliases_lookup);
>     38	
>     39	struct device_node *of_root;
>     40	EXPORT_SYMBOL(of_root);
>     41	struct device_node *of_chosen;
>     42	struct device_node *of_aliases;
>     43	struct device_node *of_stdout;
>     44	static const char *of_stdout_options;
>     45	
>     46	struct kset *of_kset;
>     47	
>     48	/*
>     49	 * Used to protect the of_aliases, to hold off addition of nodes to sysfs.
>     50	 * This mutex must be held whenever modifications are being made to the
>     51	 * device tree. The of_{attach,detach}_node() and
>     52	 * of_{add,remove,update}_property() helpers make sure this happens.
>     53	 */
>     54	DEFINE_MUTEX(of_mutex);
>     55	
>     56	/* use when traversing tree through the child, sibling,
>     57	 * or parent members of struct device_node.
>     58	 */
>     59	DEFINE_RAW_SPINLOCK(devtree_lock);
>     60	
>     61	int of_n_addr_cells(struct device_node *np)
>     62	{
>     63		const __be32 *ip;
>     64	
>     65		do {
>     66			if (np->parent)
>     67				np = np->parent;
>     68			ip = of_get_property(np, "#address-cells", NULL);
>     69			if (ip)
>     70				return be32_to_cpup(ip);
>     71		} while (np->parent);
>     72		/* No #address-cells property for the root node */
>     73		return OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
>     74	}
>     75	EXPORT_SYMBOL(of_n_addr_cells);
>     76	
>     77	int of_n_size_cells(struct device_node *np)
>     78	{
>     79		const __be32 *ip;
>     80	
>     81		do {
>     82			if (np->parent)
>     83				np = np->parent;
>     84			ip = of_get_property(np, "#size-cells", NULL);
>     85			if (ip)
>     86				return be32_to_cpup(ip);
>     87		} while (np->parent);
>     88		/* No #size-cells property for the root node */
>     89		return OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
>     90	}
>     91	EXPORT_SYMBOL(of_n_size_cells);
>     92	
>     93	#ifdef CONFIG_NUMA
>     94	int __weak of_node_to_nid(struct device_node *np)
>     95	{
>     96		return NUMA_NO_NODE;
>     97	}
>     98	#endif
>     99	
>    100	#ifndef CONFIG_OF_DYNAMIC
>    101	static void of_node_release(struct kobject *kobj)
>    102	{
>    103		/* Without CONFIG_OF_DYNAMIC, no nodes gets freed */
>    104	}
>    105	#endif /* CONFIG_OF_DYNAMIC */
>    106	
>    107	struct kobj_type of_node_ktype = {
>    108		.release = of_node_release,
>    109	};
>    110	
>    111	static ssize_t of_node_property_read(struct file *filp, struct kobject *kobj,
>    112					struct bin_attribute *bin_attr, char *buf,
>    113					loff_t offset, size_t count)
>    114	{
>    115		struct property *pp = container_of(bin_attr, struct property, attr);
>    116		return memory_read_from_buffer(buf, count, &offset, pp->value, pp->length);
>    117	}
>    118	
>    119	static ssize_t of_node_phandle_read(struct file *filp, struct kobject *kobj,
>    120					struct bin_attribute *bin_attr, char *buf,
>    121					loff_t offset, size_t count)
>    122	{
>    123		phandle phandle;
>    124		struct device_node *np;
>    125	
>    126		np = container_of(bin_attr, struct device_node, attr_phandle);
>    127		phandle = cpu_to_be32(np->phandle);
>    128		return memory_read_from_buffer(buf, count, &offset, &phandle,
>    129					       sizeof(phandle));
>    130	}
>    131	
>    132	/* always return newly allocated name, caller must free after use */
>    133	static const char *safe_name(struct kobject *kobj, const char *orig_name)
>    134	{
>    135		const char *name = orig_name;
>    136		struct kernfs_node *kn;
>    137		int i = 0;
>    138	
>    139		/* don't be a hero. After 16 tries give up */
>    140		while (i < 16 && (kn = sysfs_get_dirent(kobj->sd, name))) {
>    141			sysfs_put(kn);
>    142			if (name != orig_name)
>    143				kfree(name);
>    144			name = kasprintf(GFP_KERNEL, "%s#%i", orig_name, ++i);
>    145		}
>    146	
>    147		if (name == orig_name) {
>    148			name = kstrdup(orig_name, GFP_KERNEL);
>    149		} else {
>    150			pr_warn("Duplicate name in %s, renamed to \"%s\"\n",
>    151				kobject_name(kobj), name);
>    152		}
>    153		return name;
>    154	}
>    155	
>    156	int __of_add_property_sysfs(struct device_node *np, struct property *pp)
>    157	{
>    158		int rc;
>    159	
>    160		/* Important: Don't leak passwords */
>    161		bool secure = strncmp(pp->name, "security-", 9) == 0;
>    162	
>    163		if (!IS_ENABLED(CONFIG_SYSFS))
>    164			return 0;
>    165	
>    166		if (!of_kset || !of_node_is_attached(np))
>    167			return 0;
>    168	
>    169		sysfs_bin_attr_init(&pp->attr);
>    170		pp->attr.attr.name = safe_name(&np->kobj, pp->name);
>    171		pp->attr.attr.mode = secure ? S_IRUSR : S_IRUGO;
>    172		pp->attr.size = secure ? 0 : pp->length;
>    173		pp->attr.read = of_node_property_read;
>    174	
>    175		rc = sysfs_create_bin_file(&np->kobj, &pp->attr);
>    176		WARN(rc, "error adding attribute %s to node %s\n", pp->name, np->full_name);
>    177		return rc;
>    178	}
>    179	
>    180	/*
>    181	 * In the imported device tree (fdt), phandle is a property.  In the
>    182	 * internal data structure it is instead stored in the struct device_node.
>    183	 * Make phandle visible in sysfs as if it was a property.
>    184	 */
>    185	int __of_add_phandle_sysfs(struct device_node *np)
>    186	{
>    187		int rc;
>    188	
>    189		if (!IS_ENABLED(CONFIG_SYSFS))
>    190			return 0;
>    191	
>    192		if (!of_kset || !of_node_is_attached(np))
>    193			return 0;
>    194	
>    195		if (!np->phandle || np->phandle == 0xffffffff)
>    196			return 0;
>    197	
>  > 198		sysfs_bin_attr_init(&pp->attr);
>    199		np->attr_phandle.attr.name = "phandle";
>    200		np->attr_phandle.attr.mode = 0444;
>    201		np->attr_phandle.size = sizeof(np->phandle);
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
