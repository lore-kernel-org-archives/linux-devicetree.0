From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC 1/3] OLPC: Use device tree for platform identification
Date: Fri, 4 Mar 2011 21:28:10 -0700
Message-ID: <20110305042810.GG7579@angua.secretlab.ca>
References: <20110304171214.2B5C69D401D@zog.reactivated.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110304171214.2B5C69D401D-k/4jFdqg8LLlyo9zxV8I99HuzzzSOjJt@public.gmane.org>
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

On Fri, Mar 04, 2011 at 05:12:14PM +0000, Daniel Drake wrote:
> Make OLPC fully depend on device tree, and use it to identify the OLPC
> platform details. Some nodes are exposed as platform devices where we
> plan to use device tree for device probing.
> 
> Signed-off-by: Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>

Looks good to me.

g.

> ---
>  arch/x86/Kconfig                 |    2 +-
>  arch/x86/include/asm/olpc_ofw.h  |    8 +----
>  arch/x86/platform/olpc/Makefile  |    4 +--
>  arch/x86/platform/olpc/olpc.c    |   51 ++++++++++++++++++++-----------------
>  arch/x86/platform/olpc/olpc_dt.c |   15 +++++++++++
>  5 files changed, 47 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index b4c2e9c..471221b 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2071,7 +2071,7 @@ config OLPC
>  	depends on !X86_PAE
>  	select GPIOLIB
>  	select OF
> -	select OF_PROMTREE if PROC_DEVICETREE
> +	select OF_PROMTREE
>  	---help---
>  	  Add support for detecting the unique features of the OLPC
>  	  XO hardware.
> diff --git a/arch/x86/include/asm/olpc_ofw.h b/arch/x86/include/asm/olpc_ofw.h
> index c5d3a5a..a0e24e7 100644
> --- a/arch/x86/include/asm/olpc_ofw.h
> +++ b/arch/x86/include/asm/olpc_ofw.h
> @@ -26,15 +26,11 @@ extern void setup_olpc_ofw_pgd(void);
>  /* check if OFW was detected during boot */
>  extern bool olpc_ofw_present(void);
>  
> +extern void olpc_dt_build_devicetree(void);
> +
>  #else /* !CONFIG_OLPC */
>  static inline void olpc_ofw_detect(void) { }
>  static inline void setup_olpc_ofw_pgd(void) { }
>  #endif /* !CONFIG_OLPC */
>  
> -#ifdef CONFIG_OF_PROMTREE
> -extern void olpc_dt_build_devicetree(void);
> -#else
> -static inline void olpc_dt_build_devicetree(void) { }
> -#endif
> -
>  #endif /* _ASM_X86_OLPC_OFW_H */
> diff --git a/arch/x86/platform/olpc/Makefile b/arch/x86/platform/olpc/Makefile
> index c2a8cab..81c5e21 100644
> --- a/arch/x86/platform/olpc/Makefile
> +++ b/arch/x86/platform/olpc/Makefile
> @@ -1,4 +1,2 @@
> -obj-$(CONFIG_OLPC)		+= olpc.o
> +obj-$(CONFIG_OLPC)		+= olpc.o olpc_ofw.o olpc_dt.o
>  obj-$(CONFIG_OLPC_XO1)		+= olpc-xo1.o
> -obj-$(CONFIG_OLPC)		+= olpc_ofw.o
> -obj-$(CONFIG_OF_PROMTREE)	+= olpc_dt.o
> diff --git a/arch/x86/platform/olpc/olpc.c b/arch/x86/platform/olpc/olpc.c
> index edaf3fe..2ecc98d 100644
> --- a/arch/x86/platform/olpc/olpc.c
> +++ b/arch/x86/platform/olpc/olpc.c
> @@ -18,6 +18,7 @@
>  #include <linux/io.h>
>  #include <linux/string.h>
>  #include <linux/platform_device.h>
> +#include <linux/of.h>
>  
>  #include <asm/geode.h>
>  #include <asm/setup.h>
> @@ -187,41 +188,45 @@ err:
>  }
>  EXPORT_SYMBOL_GPL(olpc_ec_cmd);
>  
> -static bool __init check_ofw_architecture(void)
> +static bool __init check_ofw_architecture(struct device_node *root)
>  {
> -	size_t propsize;
> -	char olpc_arch[5];
> -	const void *args[] = { NULL, "architecture", olpc_arch, (void *)5 };
> -	void *res[] = { &propsize };
> +	const char *olpc_arch;
> +	int propsize;
>  
> -	if (olpc_ofw("getprop", args, res)) {
> -		printk(KERN_ERR "ofw: getprop call failed!\n");
> -		return false;
> -	}
> +	olpc_arch = of_get_property(root, "architecture", &propsize);
>  	return propsize == 5 && strncmp("OLPC", olpc_arch, 5) == 0;
>  }
>  
> -static u32 __init get_board_revision(void)
> +static u32 __init get_board_revision(struct device_node *root)
>  {
> -	size_t propsize;
> -	__be32 rev;
> -	const void *args[] = { NULL, "board-revision-int", &rev, (void *)4 };
> -	void *res[] = { &propsize };
> -
> -	if (olpc_ofw("getprop", args, res) || propsize != 4) {
> -		printk(KERN_ERR "ofw: getprop call failed!\n");
> -		return cpu_to_be32(0);
> -	}
> -	return be32_to_cpu(rev);
> +	int propsize;
> +	const __be32 *rev;
> +
> +	rev = of_get_property(root, "board-revision-int", &propsize);
> +	if (propsize != 4)
> +		return 0;
> +
> +	return be32_to_cpu(*rev);
>  }
>  
>  static bool __init platform_detect(void)
>  {
> -	if (!check_ofw_architecture())
> +	struct device_node *root = of_find_node_by_path("/");
> +	bool success;
> +
> +	if (!root)
>  		return false;
> +
> +	success = check_ofw_architecture(root);
> +	if (!success)
> +		goto out;
> +
>  	olpc_platform_info.flags |= OLPC_F_PRESENT;
> -	olpc_platform_info.boardrev = get_board_revision();
> -	return true;
> +	olpc_platform_info.boardrev = get_board_revision(root);
> +
> +out:
> +	of_node_put(root);
> +	return success;
>  }
>  
>  static int __init add_xo1_platform_devices(void)
> diff --git a/arch/x86/platform/olpc/olpc_dt.c b/arch/x86/platform/olpc/olpc_dt.c
> index 044bda5..09cbede 100644
> --- a/arch/x86/platform/olpc/olpc_dt.c
> +++ b/arch/x86/platform/olpc/olpc_dt.c
> @@ -19,6 +19,7 @@
>  #include <linux/kernel.h>
>  #include <linux/bootmem.h>
>  #include <linux/of.h>
> +#include <linux/of_platform.h>
>  #include <linux/of_pdt.h>
>  #include <asm/olpc_ofw.h>
>  
> @@ -180,3 +181,17 @@ void __init olpc_dt_build_devicetree(void)
>  	pr_info("PROM DT: Built device tree with %u bytes of memory.\n",
>  			prom_early_allocated);
>  }
> +
> +/* A list of DT node/bus matches that we want to expose as platform devices */
> +static struct of_device_id __initdata of_ids[] = {
> +	{ .compatible = "olpc,xo1-battery" },
> +	{ .compatible = "olpc,xo1-dcon" },
> +	{ .compatible = "olpc,xo1-rtc" },
> +	{},
> +};
> +
> +static int __init declare_of_platform_devices(void)
> +{
> +	return of_platform_bus_probe(NULL, of_ids, NULL);
> +}
> +device_initcall(declare_of_platform_devices);
> -- 
> 1.7.4
> 
