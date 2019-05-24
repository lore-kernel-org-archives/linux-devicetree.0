From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v1 1/5] of/platform: Speed up of_find_device_by_node()
Date: Fri, 24 May 2019 10:56:25 -0700
Message-ID: <6f4ca588-106f-93d1-8579-9e8d32c8031d@gmail.com>
References: <20190524010117.225219-1-saravanak@google.com>
 <20190524010117.225219-2-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524010117.225219-2-saravanak@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

Hi Sarvana,

I'm not reviewing patches 1-5 in any detail, given my reply to patch 0.

But I had already skimmed through this patch before I received the
email for patch 0, so I want to make one generic comment below,
to give some feedback as you continue thinking through possible
implementations to solve the underlying problems.


On 5/23/19 6:01 PM, Saravana Kannan wrote:
> Add a pointer from device tree node to the device created from it.
> This allows us to find the device corresponding to a device tree node
> without having to loop through all the platform devices.
> 
> However, fallback to looping through the platform devices to handle
> any devices that might set their own of_node.
> 
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/of/platform.c | 20 +++++++++++++++++++-
>  include/linux/of.h    |  3 +++
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 04ad312fd85b..1115a8d80a33 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -42,6 +42,8 @@ static int of_dev_node_match(struct device *dev, void *data)
>  	return dev->of_node == data;
>  }
>  
> +static DEFINE_SPINLOCK(of_dev_lock);
> +
>  /**
>   * of_find_device_by_node - Find the platform_device associated with a node
>   * @np: Pointer to device tree node
> @@ -55,7 +57,18 @@ struct platform_device *of_find_device_by_node(struct device_node *np)
>  {
>  	struct device *dev;
>  
> -	dev = bus_find_device(&platform_bus_type, NULL, np, of_dev_node_match);
> +	/*
> +	 * Spinlock needed to make sure np->dev doesn't get freed between NULL
> +	 * check inside and kref count increment inside get_device(). This is
> +	 * achieved by grabbing the spinlock before setting np->dev = NULL in
> +	 * of_platform_device_destroy().
> +	 */
> +	spin_lock(&of_dev_lock);
> +	dev = get_device(np->dev);
> +	spin_unlock(&of_dev_lock);
> +	if (!dev)
> +		dev = bus_find_device(&platform_bus_type, NULL, np,
> +				      of_dev_node_match);
>  	return dev ? to_platform_device(dev) : NULL;
>  }
>  EXPORT_SYMBOL(of_find_device_by_node);
> @@ -196,6 +209,7 @@ static struct platform_device *of_platform_device_create_pdata(
>  		platform_device_put(dev);
>  		goto err_clear_flag;
>  	}
> +	np->dev = &dev->dev;
>  
>  	return dev;
>  
> @@ -556,6 +570,10 @@ int of_platform_device_destroy(struct device *dev, void *data)
>  	if (of_node_check_flag(dev->of_node, OF_POPULATED_BUS))
>  		device_for_each_child(dev, NULL, of_platform_device_destroy);
>  
> +	/* Spinlock is needed for of_find_device_by_node() to work */
> +	spin_lock(&of_dev_lock);
> +	dev->of_node->dev = NULL;
> +	spin_unlock(&of_dev_lock);
>  	of_node_clear_flag(dev->of_node, OF_POPULATED);
>  	of_node_clear_flag(dev->of_node, OF_POPULATED_BUS);
>  
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 0cf857012f11..f2b4912cbca1 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -48,6 +48,8 @@ struct property {
>  struct of_irq_controller;
>  #endif
>  
> +struct device;
> +
>  struct device_node {
>  	const char *name;
>  	phandle phandle;
> @@ -68,6 +70,7 @@ struct device_node {
>  	unsigned int unique_id;
>  	struct of_irq_controller *irq_trans;
>  #endif
> +	struct device *dev;		/* Device created from this node */

We have actively been working on shrinking the size of struct device_node,
as part of reducing the devicetree memory usage.  As such, we need strong
justification for adding anything to this struct.  For example, proof that
there is a performance problem that can only be solved by increasing the
memory usage.

-Frank


>  };
>  
>  #define MAX_PHANDLE_ARGS 16
> 
