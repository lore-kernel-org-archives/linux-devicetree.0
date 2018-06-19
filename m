From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of/platform: add initcall_debug logs for device creates
Date: Tue, 19 Jun 2018 08:11:12 -0700
Message-ID: <43fca3e7-4ba5-661f-0871-fedd9ff67673@gmail.com>
References: <20180619014608.92061-1-toddpoynor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619014608.92061-1-toddpoynor@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Todd Poynor <toddpoynor@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, Todd Poynor <toddpoynor@google.com>
List-Id: devicetree@vger.kernel.org

Hi Todd,

On 06/18/18 18:46, Todd Poynor wrote:
> From: Todd Poynor <toddpoynor@google.com>
> 
> Add initcall_debug logs for the amount of time taken by each OF platform
> bus device create call.  For example:
> 
>    of platform device create /reserved-memory/ramoops@a3800000 took
>    3255 usecs
> 
> initcall_debug already reports the total of all such device creates
> as a single entry for function of_platform_default_populate_init (or
> similar, depending on the board).  The new logs help identify which of
> the potentially hundreds of device inits take significant amounts of
> time.
> 
> Signed-off-by: Todd Poynor <toddpoynor@google.com>
> ---
>  drivers/of/platform.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> Note it's likely only a few devices take significant lengths of time to
> init, whereas there may be hundreds of uninteresting cases also logged.
> Adding a threshold for reporting might be desirable, although for boot
> time sleuthing it's probably fine to generate a ton of output and narrow
> down the points of interest with tools.
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 6925d993e1f0..eeb4c595f43c 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -14,6 +14,7 @@
>  #include <linux/amba/bus.h>
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/init.h>
>  #include <linux/slab.h>
>  #include <linux/of_address.h>
>  #include <linux/of_device.h>
> @@ -159,6 +160,19 @@ struct platform_device *of_device_alloc(struct device_node *np,
>  }
>  EXPORT_SYMBOL(of_device_alloc);
>  
> +static void of_platform_log_inittime(struct device_node *node,
> +				     ktime_t starttime)

Please call it pr_delta_time() instead.


> +{
> +	ktime_t delta, endtime;
> +	unsigned long long duration;
> +
> +	endtime = ktime_get();
> +	delta = ktime_sub(endtime, starttime);
> +	duration = (unsigned long long) ktime_to_ns(delta) >> 10;
> +	pr_debug("of platform device create %s took %lld usecs\n",
> +		 node->full_name, duration);

The device node full_name field no longer contains the full path of
the node name.  To deal with this, use %pOF on node instead of
%s on node->full_name  (core-api/printk-formats.rst).


> +}
> +
>  /**
>   * of_platform_device_create_pdata - Alloc, initialize and register an of_device
>   * @np: pointer to node to create device for
> @@ -176,6 +190,8 @@ static struct platform_device *of_platform_device_create_pdata(
>  					struct device *parent)
>  {
>  	struct platform_device *dev;
> +	ktime_t starttime = 0;

I assume the initialization to zero is to silence a compiler warning.  Is my
assumption correct?


> +	int ret;
>  
>  	if (!of_device_is_available(np) ||
>  	    of_node_test_and_set_flag(np, OF_POPULATED))
> @@ -187,9 +203,14 @@ static struct platform_device *of_platform_device_create_pdata(
>  
>  	dev->dev.bus = &platform_bus_type;
>  	dev->dev.platform_data = platform_data;
> +	if (initcall_debug)
> +		starttime = ktime_get();
>  	of_msi_configure(&dev->dev, dev->dev.of_node);
> +	ret = of_device_add(dev);
> +	if (initcall_debug)
> +		of_platform_log_inittime(np, starttime);
>  
> -	if (of_device_add(dev) != 0) {
> +	if (ret != 0) {
>  		platform_device_put(dev);
>  		goto err_clear_flag;
>  	}
> @@ -352,6 +373,7 @@ static int of_platform_bus_create(struct device_node *bus,
>  	struct platform_device *dev;
>  	const char *bus_id = NULL;
>  	void *platform_data = NULL;
> +	ktime_t starttime = 0;
>  	int rc = 0;
>  
>  	/* Make sure it has a compatible property */
> @@ -384,7 +406,11 @@ static int of_platform_bus_create(struct device_node *bus,
>  		 * Don't return an error here to keep compatibility with older
>  		 * device tree files.
>  		 */
> +		if (initcall_debug)
> +			starttime = ktime_get();
>  		of_amba_device_create(bus, bus_id, platform_data, parent);
> +		if (initcall_debug)
> +			of_platform_log_inittime(bus, starttime);
>  		return 0;
>  	}
>  
> 
