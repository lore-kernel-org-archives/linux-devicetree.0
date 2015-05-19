From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] drivers: of/base: move of_init to driver_init
Date: Tue, 19 May 2015 13:29:16 +0100
Message-ID: <555B2C9C.1000709@arm.com>
References: <1431595695-17103-1-git-send-email-sudeep.holla@arm.com> <1431613704-30801-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431613704-30801-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob/Greg,

On 14/05/15 15:28, Sudeep Holla wrote:
> Commit 5590f3196b29 ("drivers/core/of: Add symlink to device-tree from
> devices with an OF node") adds the symlink `of_node` for each device
> pointing to it's device tree node while creating/initialising it.
>
> However the devicetree sysfs is created and setup in of_init which is
> executed at core_initcall level. For all the devices created before
> of_init, the following error is thrown:
> 	"Error -2(-ENOENT) creating of_node link"
>
> Like many other components in driver model, initialize the sysfs support
> for OF/devicetree from driver_init so that it's ready before any devices
> are created.
>
> Fixes: 5590f3196b29 ("drivers/core/of: Add symlink to device-tree from
> 	devices with an OF node")
> Suggested-by: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>

I assume one of you will pick this up if there are no further comments ?

Regards,
Sudeep

> ---
>   drivers/base/init.c | 2 ++
>   drivers/of/base.c   | 8 +++-----
>   include/linux/of.h  | 6 ++++++
>   3 files changed, 11 insertions(+), 5 deletions(-)
>
> Changes v1->v2:
> 	- renamed of_init to of_core_init to avoid collision with
> 	  PPC nouveau drm driver
>
> diff --git a/drivers/base/init.c b/drivers/base/init.c
> index da033d3bab3c..48c0e220acc0 100644
> --- a/drivers/base/init.c
> +++ b/drivers/base/init.c
> @@ -8,6 +8,7 @@
>   #include <linux/device.h>
>   #include <linux/init.h>
>   #include <linux/memory.h>
> +#include <linux/of.h>
>
>   #include "base.h"
>
> @@ -34,4 +35,5 @@ void __init driver_init(void)
>   	cpu_dev_init();
>   	memory_dev_init();
>   	container_dev_init();
> +	of_core_init();
>   }
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 99764db0875a..f0650265febf 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -189,7 +189,7 @@ int __of_attach_node_sysfs(struct device_node *np)
>   	return 0;
>   }
>
> -static int __init of_init(void)
> +void __init of_core_init(void)
>   {
>   	struct device_node *np;
>
> @@ -198,7 +198,8 @@ static int __init of_init(void)
>   	of_kset = kset_create_and_add("devicetree", NULL, firmware_kobj);
>   	if (!of_kset) {
>   		mutex_unlock(&of_mutex);
> -		return -ENOMEM;
> +		pr_err("devicetree: failed to register existing nodes\n");
> +		return;
>   	}
>   	for_each_of_allnodes(np)
>   		__of_attach_node_sysfs(np);
> @@ -207,10 +208,7 @@ static int __init of_init(void)
>   	/* Symlink in /proc as required by userspace ABI */
>   	if (of_root)
>   		proc_symlink("device-tree", NULL, "/sys/firmware/devicetree/base");
> -
> -	return 0;
>   }
> -core_initcall(of_init);
>
>   static struct property *__of_find_property(const struct device_node *np,
>   					   const char *name, int *lenp)
> diff --git a/include/linux/of.h b/include/linux/of.h
> index ddeaae6d2083..b871ff9d81d7 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -121,6 +121,8 @@ extern struct device_node *of_stdout;
>   extern raw_spinlock_t devtree_lock;
>
>   #ifdef CONFIG_OF
> +void of_core_init(void);
> +
>   static inline bool is_of_node(struct fwnode_handle *fwnode)
>   {
>   	return fwnode && fwnode->type == FWNODE_OF;
> @@ -376,6 +378,10 @@ bool of_console_check(struct device_node *dn, char *name, int index);
>
>   #else /* CONFIG_OF */
>
> +static inline void of_core_init(void)
> +{
> +}
> +
>   static inline bool is_of_node(struct fwnode_handle *fwnode)
>   {
>   	return false;
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
