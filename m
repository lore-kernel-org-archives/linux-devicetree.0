Return-Path: <SRS0=S6L7=IB=linux.intel.com=heikki.krogerus@kernel.org>
Date: Mon, 14 May 2018 16:27:40 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH/RFC v3 1/4] base: devcon: add a new API to find the graph
Message-ID: <20180514132740.GE21435@kuha.fi.intel.com>
References: <1526289360-3997-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1526289360-3997-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526289360-3997-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, May 14, 2018 at 06:15:57PM +0900, Yoshihiro Shimoda wrote:
> This patch adds a new API "device_connection_find_by_graph()" to
> find device connection by using graph.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/driver-api/device_connection.rst |  4 +--
>  drivers/base/devcon.c                          | 43 ++++++++++++++++++++++++++
>  include/linux/device.h                         |  2 ++
>  3 files changed, 47 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/driver-api/device_connection.rst b/Documentation/driver-api/device_connection.rst
> index affbc556..2e2d26f 100644
> --- a/Documentation/driver-api/device_connection.rst
> +++ b/Documentation/driver-api/device_connection.rst
> @@ -19,7 +19,7 @@ Device connections alone do not create a dependency between the two devices.
>  They are only descriptions which are not tied to either of the devices directly.
>  A dependency between the two devices exists only if one of the two endpoint
>  devices requests a reference to the other. The descriptions themselves can be
> -defined in firmware (not yet supported) or they can be built-in.
> +defined in firmware or they can be built-in.
>  
>  Usage
>  -----
> @@ -40,4 +40,4 @@ API
>  ---
>  
>  .. kernel-doc:: drivers/base/devcon.c
> -   : functions: device_connection_find_match device_connection_find device_connection_add device_connection_remove
> +   : functions: device_connection_find_match device_connection_find device_connection_add device_connection_remove device_connection_find_by_graph
> diff --git a/drivers/base/devcon.c b/drivers/base/devcon.c
> index d427e80..5a0da33 100644
> --- a/drivers/base/devcon.c
> +++ b/drivers/base/devcon.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/device.h>
> +#include <linux/property.h>
>  
>  static DEFINE_MUTEX(devcon_lock);
>  static LIST_HEAD(devcon_list);
> @@ -134,3 +135,45 @@ void device_connection_remove(struct device_connection *con)
>  	mutex_unlock(&devcon_lock);
>  }
>  EXPORT_SYMBOL_GPL(device_connection_remove);
> +
> +static int generic_graph_match(struct device *dev, void *fwnode)
> +{
> +	return dev->fwnode == fwnode;
> +}
> +
> +/**
> + * device_connection_find_by_graph - Find two devices connected together
> + * @dev: Device to find connected device
> + * @port: identifier of the @dev port node
> + * @endpoint: identifier of the @dev endpoint node
> + *
> + * Find a connection with @port and @endpoint by using graph between @dev and
> + * another device. On success returns handle to the device that is connected
> + * to @dev, with the reference count for the found device incremented. Returns
> + * NULL if no matching connection was found, or ERR_PTR(-EPROBE_DEFER) when
> + * a connection was found but the other device has not been enumerated yet.
> + */
> +struct device *device_connection_find_by_graph(struct device *dev, u32 port,
> +					       u32 endpoint)
> +{
> +	struct bus_type *bus;
> +	struct fwnode_handle *remote;
> +	struct device *conn;
> +
> +	remote = fwnode_graph_get_remote_node(dev_fwnode(dev), port, endpoint);
> +	if (!remote)
> +		return NULL;
> +
> +	for (bus = generic_match_buses[0]; bus; bus++) {
> +		conn = bus_find_device(bus, NULL, remote, generic_graph_match);
> +		if (conn)
> +			return conn;
> +	}
> +
> +	/*
> +	 * We only get called if a connection was found, tell the caller to
> +	 * wait for the other device to show up.
> +	 */
> +	return ERR_PTR(-EPROBE_DEFER);
> +}
> +EXPORT_SYMBOL_GPL(device_connection_find_by_graph);

Why do we need more API for walking through the graph?

I'm not sure exactly sure what is going on here, I'll try to study
your patches more when I have time, but the approach looks wrong. That
function looks like a helper, but just not that useful one.

We really should be able to use the existing functions. In practice
device_connection_find_match() should eventually parse the graph, then
fallback to build-in connections if no graph is found. Otherwise
parsing graph here is not really useful at all.


Thanks,

-- 
heikki
