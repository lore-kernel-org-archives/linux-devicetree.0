From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [RFC PATCH 1/2] driver core: introduce module_platform_driver_match_and_probe
Date: Thu, 21 Nov 2013 12:47:36 +0000
Message-ID: <20131121124736.6EBEBC40A2C@trevor.secretlab.ca>
References: <1383113571-13029-1-git-send-email-robherring2@gmail.com> < 1383113571-13029-2-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1383113571-13029-2-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Wed, 30 Oct 2013 01:12:50 -0500, Rob Herring <robherring2@gmail.com> wrote:
> From: Rob Herring <rob.herring@calxeda.com>
> 
> Introduce a helper to match, create and probe a platform device. This
> is for drivers such as cpuidle or cpufreq that typically don't have a
> bus device node and need to match on a system-level compatible property.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Grant Likely <grant.likely@linaro.org>
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>

Oh, ick. Please no. If a platform_device isn't getting created for a
device tree node, then we should be asking why it isn't getting created
and fix the core logic rather than trying to bodge it in the driver init
code.

We should never be creating and registering devices in module init code.
We've spent the last 4 years trying to get away from that.

g.

> ---
>  include/linux/platform_device.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
> index ce8e4ff..0b4b1c9 100644
> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@ -12,6 +12,7 @@
>  #define _PLATFORM_DEVICE_H_
>  
>  #include <linux/device.h>
> +#include <linux/err.h>
>  #include <linux/mod_devicetable.h>
>  
>  #define PLATFORM_DEVID_NONE	(-1)
> @@ -241,6 +242,28 @@ extern struct platform_device *platform_create_bundle(
>  	struct resource *res, unsigned int n_res,
>  	const void *data, size_t size);
>  
> +/*
> + * module_platform_driver_match_and_probe() - Helper macro for drivers without
> + * a bus device node and need to match on an arbitrary compatible property.
> + * This eliminates a lot of boilerplate.  Each module may only use this macro
> + * once, and calling it replaces module_init() and module_exit()
> + */
> +#define module_platform_driver_match_and_probe(__platform_driver, __platform_probe) \
> +static int __init __platform_driver##_init(void) \
> +{ \
> +	if (of_find_matching_node(NULL, (__platform_driver).driver.of_match_table)) \
> +		return PTR_ERR_OR_ZERO(platform_create_bundle(&(__platform_driver), \
> +			__platform_probe, NULL, 0, NULL, 0)); \
> +	else \
> +		return -ENODEV;	\
> +} \
> +module_init(__platform_driver##_init); \
> +static void __exit __platform_driver##_exit(void) \
> +{ \
> +	platform_driver_unregister(&(__platform_driver)); \
> +} \
> +module_exit(__platform_driver##_exit);
> +
>  /* early platform driver interface */
>  struct early_platform_driver {
>  	const char *class_str;
> -- 
> 1.8.1.2
> 
