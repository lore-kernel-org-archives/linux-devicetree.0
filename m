From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [RFC] (early draft) dt: Linux dt usage model documentation
Date: Wed, 15 Jun 2011 15:13:37 +0800
Message-ID: <20110615071336.GC31712@S2100-06.ap.freescale.net>
References: <20110613132935.16600.94753.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110613132935.16600.94753.stgit@ponder>
Sender: linux-doc-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, Randy Dunlap <rdunlap@xenotime.net>, linaro-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Mon, Jun 13, 2011 at 07:32:15AM -0600, Grant Likely wrote:
[...]
> +Linux board support code calls of_platform_populate(NULL, NULL, NULL)
> +to kick of discovery of devices at the root of the tree.  The
> +parameters are all NULL because when starting from the root of the
> +tree, there is no need to provide a starting node (the first NULL), a
> +parent struct device (the last NULL), and we're not using a match
> +table (yet).  For a board that only needs to register devices,
> +.init_machine() can be completely empty except for the
> +of_platform_populate() call.
> +
> +In the Tegra example, this accounts for the /soc and /sound nodes, but
> +what about the children of the soc node?  Shouldn't they be registered
> +as platform devices too?  For Linux DT support, the generic behaviour
> +is for child devices to be registered by the parent's device driver at
> +driver .probe() time.  So, an i2c bus device driver will register a
> +i2c_client for each child node, an spi bus driver will register
> +it's spi_device children, and similarly for other bus_types.
> +According to that model, a driver could be written that binds to the
> +soc node and simply registers platform_devices for each of it's
> +children.  The board support code would allocate and register an soc
> +device, an soc device driver would bind to the soc device, and
> +register platform_devices for /soc/interrupt-controller, /soc/serial,
> +/soc/i2s, and /soc/i2c in it's .probe() hook.  Easy, right?  Although

I do not quite understand what the "soc device driver" is here.
Looking at the devicetree/test code, I do not find this driver and
its .probe() hook.  Instead, of_platform_bus_create will create
platform_device for the provided device_node, and also recursively
create devices for all the child nodes, no?

> +it is a lot of mucking about for just registering platform devices.
> +

-- 
Regards,
Shawn

