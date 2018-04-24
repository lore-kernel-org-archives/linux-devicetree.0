Return-Path: <SRS0=puW8=HN=linux.intel.com=heikki.krogerus@kernel.org>
Date: Tue, 24 Apr 2018 15:33:44 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH/RFC 04/11] of: platform: add device connection parsing
Message-ID: <20180424123344.GC25723@kuha.fi.intel.com>
References: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1524039005-30618-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1524039005-30618-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, frowand.list@gmail.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, p.zabel@pengutronix.de, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Yoshihiro,

On Wed, Apr 18, 2018 at 05:09:58PM +0900, Yoshihiro Shimoda wrote:
> This patch adds device connection parsing in of_platform_populate().
> 
> TODO:
>  - How to free the devcon memories?
>  - How to remove the devcon instances?
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/of/platform.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of.h    |  1 +
>  2 files changed, 67 insertions(+)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index c00d81d..41c018d 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -17,6 +17,7 @@
>  #include <linux/slab.h>
>  #include <linux/of_address.h>
>  #include <linux/of_device.h>
> +#include <linux/of_graph.h>
>  #include <linux/of_iommu.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
> @@ -326,6 +327,63 @@ static const struct of_dev_auxdata *of_dev_lookup(const struct of_dev_auxdata *l
>  	return NULL;
>  }
>  
> +static int of_parse_device_connection(struct device_node *np)
> +{
> +	struct device_node *child_ep, *parent, *remote_parent;
> +	struct platform_device *pdev, *remote_pdev;
> +	struct device_connection *devcon = NULL;
> +	const char *id;
> +
> +	if (of_node_check_flag(np, OF_DEVICE_CONNECTED)) {
> +		pr_debug("%s() - skipping %pOF, already device connected\n",
> +			__func__, np);
> +		return 0;
> +	}
> +
> +	of_node_set_flag(np, OF_DEVICE_CONNECTED);
> +
> +	for_each_endpoint_of_node(np, child_ep) {
> +		if (of_property_read_string(child_ep, "device-connection-id",
> +					    &id) < 0)
> +			continue;
> +
> +		remote_parent = of_graph_get_remote_port_parent(child_ep);
> +		if (!remote_parent)
> +			return 0;
> +
> +		parent = of_graph_get_port_parent(child_ep);
> +		if (!parent)
> +			return 0;
> +
> +		pdev = of_find_device_by_node(parent);
> +		if (!pdev)
> +			return 0;
> +
> +		/*
> +		 * WARN_ON in really_probe() may happen if devm_kzalloc is
> +		 * used. TODO: How to free this?
> +		 */
> +		devcon = kzalloc(sizeof(*devcon), GFP_KERNEL);
> +		if (!devcon)
> +			return -ENOMEM;
> +
> +		devcon->id = id;
> +		remote_pdev = of_find_device_by_node(remote_parent);
> +		if (!remote_pdev) {
> +			kfree(devcon);
> +			return 0;
> +		}
> +
> +		devcon->endpoint[0] = dev_name(&pdev->dev);
> +		devcon->endpoint[1] = dev_name(&remote_pdev->dev);
> +
> +		/* TODO: How to remove the connection? */
> +		device_connection_add(devcon);

This is wrong. You are converting a connection that is described in
graph into a "build-in" one. If the connection is already described in
graph there is no need to, actually, we _should not_, add it to the
list of "build-in" connection descriptions.

What should be done is that we parse the graph the moment
device_connection_find*() is called. And that should be done in
drivers/base/devcon.c .

> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * of_platform_bus_create() - Create a device for a node and its children.
>   * @bus: device node of the bus to instantiate
> @@ -477,6 +535,14 @@ int of_platform_populate(struct device_node *root,
>  	}
>  	of_node_set_flag(root, OF_POPULATED_BUS);
>  
> +	for_each_child_of_node(root, child) {
> +		rc = of_parse_device_connection(child);
> +		if (rc) {
> +			of_node_put(child);
> +			break;
> +		}
> +	}
> +
>  	of_node_put(root);
>  	return rc;
>  }
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 4d25e4f..30aa103 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -143,6 +143,7 @@ static inline void of_node_put(struct device_node *node) { }
>  #define OF_DETACHED	2 /* node has been detached from the device tree */
>  #define OF_POPULATED	3 /* device already created for the node */
>  #define OF_POPULATED_BUS	4 /* of_platform_populate recursed to children of this node */
> +#define OF_DEVICE_CONNECTED	5 /* checked devcon on of_platform_populate */
>  
>  #define OF_BAD_ADDR	((u64)-1)


Thanks,

-- 
heikki
