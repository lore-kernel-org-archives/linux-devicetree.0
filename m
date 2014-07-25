From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] Adding selftest testdata dynamically into live tree
Date: Thu, 24 Jul 2014 23:53:04 -0600
Message-ID: <20140725055304.5C61EC4063E@trevor.secretlab.ca>
References: <1405577379-4587-1-git-send-email-gaurav.minocha.os@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405577379-4587-1-git-send-email-gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 16 Jul 2014 23:09:39 -0700, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This patch attaches selftest's device tree data (required by /drivers/of/selftest.c)
> dynamically into live device tree. First, it links selftest device tree data into the
> kernel image and then iterates over all the nodes and attaches them into the live tree.
> Once the testcases are complete, it removes the data attached.
> 
> This patch will remove the manual process of addition and removal of selftest device
> tree data into the machine's dts file. Also, it can be build as a loadable kernel
> module by setting the config symbol OF_SELFTEST=m.
> 
> Tested successfully with current selftest's testcases.
> 
> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Merged, thanks. I've run tested on QEMU PowerPC pseries and ARM
Versatile Express models. One of the testcases fails on powerpc, but
that is a problem with the testcase itself, and not with this code.

g.

> ---
>  arch/arm/boot/dts/versatile-pb.dts                 |    2 -
>  drivers/of/Kconfig                                 |    3 +-
>  drivers/of/Makefile                                |    3 +-
>  drivers/of/base.c                                  |    5 +
>  drivers/of/platform.c                              |    1 +
>  drivers/of/selftest.c                              |  157 ++++++++++++++++++++
>  .../{testcases.dtsi => testcases.dts}              |    1 +
>  7 files changed, 168 insertions(+), 4 deletions(-)
>  rename drivers/of/testcase-data/{testcases.dtsi => testcases.dts} (92%)
> 
> diff --git a/arch/arm/boot/dts/versatile-pb.dts b/arch/arm/boot/dts/versatile-pb.dts
> index 65f6577..8d39677 100644
> --- a/arch/arm/boot/dts/versatile-pb.dts
> +++ b/arch/arm/boot/dts/versatile-pb.dts
> @@ -46,5 +46,3 @@
>  		};
>  	};
>  };
> -
> -#include <testcases.dtsi>
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index 2dcb054..4e4f6f3 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -8,8 +8,9 @@ menu "Device Tree and Open Firmware support"
>  	depends on OF
>  
>  config OF_SELFTEST
> -	bool "Device Tree Runtime self tests"
> +	tristate "Device Tree Runtime self tests"
>  	depends on OF_IRQ
> +	select OF_DYNAMIC
>  	help
>  	  This option builds in test cases for the device tree infrastructure
>  	  that are executed once at boot time, and the results dumped to the
> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
> index 099b1fb..b9e753b 100644
> --- a/drivers/of/Makefile
> +++ b/drivers/of/Makefile
> @@ -5,7 +5,8 @@ obj-$(CONFIG_OF_PROMTREE) += pdt.o
>  obj-$(CONFIG_OF_ADDRESS)  += address.o
>  obj-$(CONFIG_OF_IRQ)    += irq.o
>  obj-$(CONFIG_OF_NET)	+= of_net.o
> -obj-$(CONFIG_OF_SELFTEST) += selftest.o
> +obj-$(CONFIG_OF_SELFTEST) += of_selftest.o
> +of_selftest-objs := selftest.o testcase-data/testcases.dtb.o
>  obj-$(CONFIG_OF_MDIO)	+= of_mdio.o
>  obj-$(CONFIG_OF_PCI)	+= of_pci.o
>  obj-$(CONFIG_OF_PCI_IRQ)  += of_pci_irq.o
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index b986480..b47c1d8 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1814,6 +1814,7 @@ int of_add_property(struct device_node *np, struct property *prop)
>  
>  	return rc;
>  }
> +EXPORT_SYMBOL(of_add_property);
>  
>  /**
>   * of_remove_property - Remove a property from a node.
> @@ -1860,6 +1861,7 @@ int of_remove_property(struct device_node *np, struct property *prop)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL(of_remove_property);
>  
>  /*
>   * of_update_property - Update a property in a node, if the property does
> @@ -1915,6 +1917,7 @@ int of_update_property(struct device_node *np, struct property *newprop)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL(of_update_property);
>  
>  #if defined(CONFIG_OF_DYNAMIC)
>  /*
> @@ -1970,6 +1973,7 @@ int of_attach_node(struct device_node *np)
>  	of_node_add(np);
>  	return 0;
>  }
> +EXPORT_SYMBOL(of_attach_node);
>  
>  /**
>   * of_detach_node - "Unplug" a node from the device tree.
> @@ -2029,6 +2033,7 @@ int of_detach_node(struct device_node *np)
>  	of_node_remove(np);
>  	return rc;
>  }
> +EXPORT_SYMBOL(of_detach_node);
>  #endif /* defined(CONFIG_OF_DYNAMIC) */
>  
>  static void of_alias_add(struct alias_prop *ap, struct device_node *np,
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 500436f..b7a82d6 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -30,6 +30,7 @@ const struct of_device_id of_default_bus_match_table[] = {
>  #endif /* CONFIG_ARM_AMBA */
>  	{} /* Empty terminated list */
>  };
> +EXPORT_SYMBOL(of_default_bus_match_table);
>  
>  static int of_dev_node_match(struct device *dev, void *data)
>  {
> diff --git a/drivers/of/selftest.c b/drivers/of/selftest.c
> index 077314e..3a1c5b5 100644
> --- a/drivers/of/selftest.c
> +++ b/drivers/of/selftest.c
> @@ -9,6 +9,7 @@
>  #include <linux/errno.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_fdt.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/list.h>
> @@ -21,6 +22,10 @@ static struct selftest_results {
>  	int failed;
>  } selftest_results;
>  
> +#define NO_OF_NODES 2
> +static struct device_node *nodes[NO_OF_NODES];
> +static int last_node_index;
> +
>  #define selftest(result, fmt, ...) { \
>  	if (!(result)) { \
>  		selftest_results.failed++; \
> @@ -517,9 +522,156 @@ static void __init of_selftest_platform_populate(void)
>  	}
>  }
>  
> +/**
> + *	update_node_properties - adds the properties
> + *	of np into dup node (present in live tree) and
> + *	updates parent of children of np to dup.
> + *
> + *	@np:	node already present in live tree
> + *	@dup:	node present in live tree to be updated
> + */
> +static void update_node_properties(struct device_node *np,
> +					struct device_node *dup)
> +{
> +	struct property *prop;
> +	struct device_node *child;
> +
> +	for_each_property_of_node(np, prop)
> +		of_add_property(dup, prop);
> +
> +	for_each_child_of_node(np, child)
> +		child->parent = dup;
> +}
> +
> +/**
> + *	attach_node_and_children - attaches nodes
> + *	and its children to live tree
> + *
> + *	@np:	Node to attach to live tree
> + */
> +static int attach_node_and_children(struct device_node *np)
> +{
> +	struct device_node *next, *root = np, *dup;
> +
> +	if (!np) {
> +		pr_warn("%s: No tree to attach; not running tests\n",
> +			__func__);
> +		return -ENODATA;
> +	}
> +
> +
> +	/* skip root node */
> +	np = np->child;
> +	/* storing a copy in temporary node */
> +	dup = np;
> +
> +	while (dup) {
> +		nodes[last_node_index++] = dup;
> +		dup = dup->sibling;
> +	}
> +	dup = NULL;
> +
> +	while (np) {
> +		next = np->allnext;
> +		dup = of_find_node_by_path(np->full_name);
> +		if (dup)
> +			update_node_properties(np, dup);
> +		else {
> +			np->child = NULL;
> +			if (np->parent == root)
> +				np->parent = of_allnodes;
> +			of_attach_node(np);
> +		}
> +		np = next;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + *	selftest_data_add - Reads, copies data from
> + *	linked tree and attaches it to the live tree
> + */
> +static int __init selftest_data_add(void)
> +{
> +	void *selftest_data;
> +	struct device_node *selftest_data_node;
> +	extern uint8_t __dtb_testcases_begin[];
> +	extern uint8_t __dtb_testcases_end[];
> +	const int size = __dtb_testcases_end - __dtb_testcases_begin;
> +
> +	if (!size) {
> +		pr_warn("%s: No testcase data to attach; not running tests\n",
> +			__func__);
> +		return -ENODATA;
> +	}
> +
> +	/* creating copy */
> +	selftest_data = kmemdup(__dtb_testcases_begin, size, GFP_KERNEL);
> +
> +	if (!selftest_data) {
> +		pr_warn("%s: Failed to allocate memory for selftest_data; "
> +			"not running tests\n", __func__);
> +		return -ENOMEM;
> +	}
> +	of_fdt_unflatten_tree(selftest_data, &selftest_data_node);
> +
> +	/* attach the sub-tree to live tree */
> +	return attach_node_and_children(selftest_data_node);
> +}
> +
> +/**
> + *	detach_node_and_children - detaches node
> + *	and its children from live tree
> + *
> + *	@np:	Node to detach from live tree
> + */
> +static void detach_node_and_children(struct device_node *np)
> +{
> +	while (np->child)
> +		detach_node_and_children(np->child);
> +
> +	while (np->sibling)
> +		detach_node_and_children(np->sibling);
> +
> +	of_detach_node(np);
> +}
> +
> +/**
> + *	selftest_data_remove - removes the selftest data
> + *	nodes from the live tree
> + */
> +static void selftest_data_remove(void)
> +{
> +	struct device_node *np;
> +	struct property *prop;
> +
> +	while (last_node_index >= 0) {
> +		if (nodes[last_node_index]) {
> +			np = of_find_node_by_path(nodes[last_node_index]->full_name);
> +			if (strcmp(np->full_name, "/aliases") != 0) {
> +				detach_node_and_children(np->child);
> +				of_detach_node(np);
> +			} else {
> +				for_each_property_of_node(np, prop) {
> +					if (strcmp(prop->name, "testcase-alias") == 0)
> +						of_remove_property(np, prop);
> +				}
> +			}
> +		}
> +		last_node_index--;
> +	}
> +}
> +
>  static int __init of_selftest(void)
>  {
>  	struct device_node *np;
> +	int res;
> +
> +	/* adding data for selftest */
> +	res = selftest_data_add();
> +	if (res)
> +		return res;
>  
>  	np = of_find_node_by_path("/testcase-data/phandle-tests/consumer-a");
>  	if (!np) {
> @@ -539,6 +691,11 @@ static int __init of_selftest(void)
>  	of_selftest_platform_populate();
>  	pr_info("end of selftest - %i passed, %i failed\n",
>  		selftest_results.passed, selftest_results.failed);
> +
> +	/* removing selftest data from live tree */
> +	selftest_data_remove();
> +
>  	return 0;
>  }
>  late_initcall(of_selftest);
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/of/testcase-data/testcases.dtsi b/drivers/of/testcase-data/testcases.dts
> similarity index 92%
> rename from drivers/of/testcase-data/testcases.dtsi
> rename to drivers/of/testcase-data/testcases.dts
> index 6d8d980a..8e7568e 100644
> --- a/drivers/of/testcase-data/testcases.dtsi
> +++ b/drivers/of/testcase-data/testcases.dts
> @@ -1,3 +1,4 @@
> +/dts-v1/;
>  #include "tests-phandle.dtsi"
>  #include "tests-interrupts.dtsi"
>  #include "tests-match.dtsi"
> -- 
> 1.7.9.5
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
