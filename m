From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v12 4/6] fpga: add fpga bridge framework
Date: Wed, 28 Oct 2015 10:50:27 +0100
Message-ID: <20151028095027.GK1166@pengutronix.de>
References: <1445983755-24007-1-git-send-email-atull@opensource.altera.com>
 <1445983755-24007-5-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445983755-24007-5-git-send-email-atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 27, 2015 at 05:09:13PM -0500, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> 
> This framework adds API functions for enabling/
> disabling FPGA bridges under kernel control.
> 
> This allows the Linux kernel to disable FPGA bridges
> during FPGA reprogramming and to enable FPGA bridges
> when FPGA reprogramming is done.  This framework is
> be manufacturer-agnostic, allowing it to be used in
> interfaces that use the FPGA Manager Framework to
> reprogram FPGAs.
> 
> The functions are:
> * of_fpga_bridge_get
> * fpga_bridge_put
>    Get/put a reference to a FPGA bridge.
> 
> * fpga_bridge_enable
> * fpga_bridge_disable
>    Enable/Disable traffic through a bridge.
> 
> * fpga_bridge_register
> * fpga_bridge_unregister
>    Register/unregister a device-specific low level FPGA
>    Bridge driver.
> 
> Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> ---
> v2:  Minor cleanup
> v12: Bump version to line up with simple fpga bus
>      Remove sysfs
>      Improve get/put functions, get the low level driver too.
>      Clean up class implementation
>      Add kernel doc documentation
>      Rename (un)register_fpga_bridge -> fpga_bridge_(un)register
> ---
>  drivers/fpga/Kconfig             |    7 ++
>  drivers/fpga/Makefile            |    3 +
>  drivers/fpga/fpga-bridge.c       |  242 ++++++++++++++++++++++++++++++++++++++
>  include/linux/fpga/fpga-bridge.h |   49 ++++++++
>  4 files changed, 301 insertions(+)
>  create mode 100644 drivers/fpga/fpga-bridge.c
>  create mode 100644 include/linux/fpga/fpga-bridge.h
> 
> diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
> index e8f5453..143072b 100644
> --- a/drivers/fpga/Kconfig
> +++ b/drivers/fpga/Kconfig
> @@ -32,6 +32,13 @@ config FPGA_MGR_SOCFPGA_A10
>  	help
>  	  FPGA manager driver support for Altera Arria10 SoCFPGA.
>  
> +config FPGA_BRIDGE
> +       bool "FPGA Bridge Drivers"
> +       depends on OF
> +       help
> +         Say Y here if you want to support bridges connected between host
> +	 processors and FPGAs or between FPGAs.
> +
>  endif # FPGA
>  
>  endmenu
> diff --git a/drivers/fpga/Makefile b/drivers/fpga/Makefile
> index 0385622..9302662 100644
> --- a/drivers/fpga/Makefile
> +++ b/drivers/fpga/Makefile
> @@ -9,5 +9,8 @@ obj-$(CONFIG_FPGA)			+= fpga-mgr.o
>  obj-$(CONFIG_FPGA_MGR_SOCFPGA)		+= socfpga.o
>  obj-$(CONFIG_FPGA_MGR_SOCFPGA_A10)	+= socfpga-a10.o
>  
> +# FPGA Bridge Drivers
> +obj-$(CONFIG_FPGA_BRIDGE)		+= fpga-bridge.o
> +
>  # High Level Interfaces
>  obj-$(CONFIG_SIMPLE_FPGA_BUS)		+= simple-fpga-bus.o
> diff --git a/drivers/fpga/fpga-bridge.c b/drivers/fpga/fpga-bridge.c
> new file mode 100644
> index 0000000..c135988
> --- /dev/null
> +++ b/drivers/fpga/fpga-bridge.c
> @@ -0,0 +1,242 @@
> +/*
> + * fpga bridge driver
> + *
> + *  Copyright (C) 2013-2015 Altera Corporation, All Rights Reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +#include <linux/fpga/fpga-bridge.h>
> +#include <linux/idr.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/slab.h>
> +
> +static DEFINE_IDA(fpga_bridge_ida);
> +static struct class *fpga_bridge_class;
> +
> +/**
> + * fpga_bridge_enable
> + * @bridge: fpga bridge
> + *
> + * Enable transactions on the bridge
> + *
> + * Return: 0 for success, error code otherwise.
> + */
> +int fpga_bridge_enable(struct fpga_bridge *bridge)
> +{
> +	pr_err("%s %s\n", __func__, dev_name(&bridge->dev));

Please clean this...

> +
> +	return bridge->br_ops->enable_set(bridge, 1);
> +}
> +EXPORT_SYMBOL_GPL(fpga_bridge_enable);
> +
> +/**
> + * fpga_bridge_disable
> + * @bridge: fpga bridge
> + *
> + * Disable transactions on the bridge
> + *
> + * Return: 0 for success, error code otherwise.
> + */
> +int fpga_bridge_disable(struct fpga_bridge *bridge)
> +{
> +	pr_err("%s %s\n", __func__, dev_name(&bridge->dev));

and this up.

> +
> +	return bridge->br_ops->enable_set(bridge, 0);
> +}
> +EXPORT_SYMBOL_GPL(fpga_bridge_disable);
> +
> +static int fpga_bridge_of_node_match(struct device *dev, const void *data)
> +{
> +	return dev->of_node == data;
> +}
> +
> +/**
> + * of_fpga_bridge_get - get an exclusive reference to a fpga bridge
> + * @node: device node
> + *
> + * Given a device node, get an exclusive reference to a fpga bridge.
> + *
> + * Returns a fpga manager struct or IS_ERR() condition containing errno.
> + */
> +struct fpga_bridge *of_fpga_bridge_get(struct device_node *node)
> +{
> +	struct device *dev;
> +	struct fpga_bridge *bridge;
> +	int ret = -ENODEV;
> +
> +	dev = class_find_device(fpga_bridge_class, NULL, node,
> +				fpga_bridge_of_node_match);
> +	if (!dev)
> +		return ERR_PTR(-ENODEV);
> +
> +	bridge = to_fpga_bridge(dev);
> +	if (!bridge)
> +		goto err_dev;
> +
> +	if (!mutex_trylock(&bridge->mutex)) {
> +		ret = -EBUSY;
> +		goto err_dev;
> +	}
> +
> +	if (!try_module_get(dev->parent->driver->owner))
> +		goto err_ll_mod;
> +
> +	return bridge;
> +
> +err_ll_mod:
> +	mutex_unlock(&bridge->mutex);
> +err_dev:
> +	put_device(dev);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(of_fpga_bridge_get);
> +
> +/**
> + * fpga_bridge_put - release a reference to a fpga bridge
> + * @bridge: fpga bridge
> + */
> +void fpga_bridge_put(struct fpga_bridge *bridge)
> +{
> +	module_put(bridge->dev.parent->driver->owner);
> +	mutex_unlock(&bridge->mutex);
> +	put_device(&bridge->dev);
> +}
> +EXPORT_SYMBOL_GPL(fpga_bridge_put);
> +
> +/**
> + * fpga_bridge_register - register a fpga bridge driver
> + * @dev:	fpga bridge device from pdev
> + * @name:	fpga bridge name
> + * @br_ops:	pointer to structure of fpga bridge ops
> + * @priv:	fpga bridge private data
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int fpga_bridge_register(struct device *dev, const char *name,
> +			 struct fpga_bridge_ops *br_ops, void *priv)
> +{
> +	struct fpga_bridge *bridge;
> +	const char *dt_label;
> +	int id, ret = 0;
> +
> +	if (!br_ops || !br_ops->enable_set || !br_ops->enable_show) {
> +		dev_err(dev, "Attempt to register without fpga_bridge_ops\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!name || !strlen(name)) {
> +		dev_err(dev, "Attempt to register with no name!\n");
> +		return -EINVAL;
> +	}
> +
> +	bridge = kzalloc(sizeof(*bridge), GFP_KERNEL);
> +	if (!bridge)
> +		return -ENOMEM;
> +
> +	id = ida_simple_get(&fpga_bridge_ida, 0, 0, GFP_KERNEL);
> +	if (id < 0) {
> +		ret = id;
> +		goto error_kfree;
> +	}
> +
> +	mutex_init(&bridge->mutex);
> +
> +	bridge->name = name;
> +	bridge->br_ops = br_ops;
> +	bridge->priv = priv;
> +
> +	device_initialize(&bridge->dev);
> +	bridge->dev.class = fpga_bridge_class;
> +	bridge->dev.parent = dev;
> +	bridge->dev.of_node = dev->of_node;
> +	bridge->dev.id = id;
> +	dev_set_drvdata(dev, bridge);
> +
> +	dt_label = of_get_property(bridge->dev.of_node, "label", NULL);
> +	if (dt_label)
> +		ret = dev_set_name(&bridge->dev, "%s", dt_label);
> +	else
> +		ret = dev_set_name(&bridge->dev, "br%d", id);
> +	if (ret)
> +		goto error_device;
> +
> +	ret = device_add(&bridge->dev);
> +	if (ret)
> +		goto error_device;
> +
> +	dev_info(bridge->dev.parent, "fpga bridge [%s] registered\n",
> +		 bridge->name);
> +
> +	return 0;
> +
> +error_device:
> +	ida_simple_remove(&fpga_bridge_ida, id);
> +error_kfree:
> +	kfree(bridge);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(fpga_bridge_register);
> +
> +void fpga_bridge_unregister(struct device *dev)
> +{
> +	struct fpga_bridge *bridge = dev_get_drvdata(dev);
> +
> +	dev_info(&bridge->dev, "%s : %s\n", __func__, bridge->name);

Is this necessary information?

> +
> +	/*
> +	 * If the low level driver provides a method for putting bridge into
> +	 * a desired state upon unregister, do it.
> +	 */
> +	if (bridge->br_ops->fpga_bridge_remove)
> +		bridge->br_ops->fpga_bridge_remove(bridge);
> +
> +	device_unregister(&bridge->dev);
> +}
> +EXPORT_SYMBOL_GPL(fpga_bridge_unregister);
> +
> +static void fpga_bridge_dev_release(struct device *dev)
> +{
> +	struct fpga_bridge *bridge = to_fpga_bridge(dev);
> +
> +	ida_simple_remove(&fpga_bridge_ida, bridge->dev.id);
> +	kfree(bridge);
> +}
> +
> +static int __init fpga_bridge_dev_init(void)
> +{
> +	pr_info("FPGA bridge framework driver\n");

Dito.
IMHO unnecessary log spam. Maybe change this to dbg?

> +
> +	fpga_bridge_class = class_create(THIS_MODULE, "fpga_bridge");
> +	if (IS_ERR(fpga_bridge_class))
> +		return PTR_ERR(fpga_bridge_class);
> +
> +	fpga_bridge_class->dev_release = fpga_bridge_dev_release;
> +
> +	return 0;
> +}
> +
> +static void __exit fpga_bridge_dev_exit(void)
> +{
> +	class_destroy(fpga_bridge_class);
> +	ida_destroy(&fpga_bridge_ida);
> +}
> +
> +MODULE_DESCRIPTION("FPGA Bridge Driver");
> +MODULE_AUTHOR("Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>");
> +MODULE_LICENSE("GPL v2");
> +
> +subsys_initcall(fpga_bridge_dev_init);
> +module_exit(fpga_bridge_dev_exit);
> diff --git a/include/linux/fpga/fpga-bridge.h b/include/linux/fpga/fpga-bridge.h
> new file mode 100644
> index 0000000..da6791e
> --- /dev/null
> +++ b/include/linux/fpga/fpga-bridge.h
> @@ -0,0 +1,49 @@
> +#include <linux/cdev.h>

You don't seem to use this.

> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +
> +#ifndef _LINUX_FPGA_BRIDGE_H
> +#define _LINUX_FPGA_BRIDGE_H
> +
> +struct fpga_bridge;
> +
> +/**
> + * struct fpga_bridge_ops - ops for low level fpga bridge drivers
> + * @enable_show: returns the FPGA bridge's status
> + * @enable_set: set a FPGA bridge as enabled or disabled
> + * @fpga_bridge_remove: set FPGA into a specific state during driver remove
> + */
> +struct fpga_bridge_ops {
> +	int (*enable_show)(struct fpga_bridge *bridge);
> +	int (*enable_set)(struct fpga_bridge *bridge, bool enable);
> +	void (*fpga_bridge_remove)(struct fpga_bridge *bridge);
> +};
> +
> +/**
> + * struct fpga_bridge - fpga bridge structure
> + * @name: name of low level fpga bridge
> + * @dev: fpga bridge device
> + * @br_ops: pointer to struct of fpga bridge ops
> + * @priv: low level driver private date
> + */
> +struct fpga_bridge {
> +	const char *name;
> +	struct device dev;
> +	struct mutex mutex;
> +	struct fpga_bridge_ops *br_ops;
> +	void *priv;
> +};
> +
> +#define to_fpga_bridge(d) container_of(d, struct fpga_bridge, dev)
> +
> +struct fpga_bridge *of_fpga_bridge_get(struct device_node *node);
> +void fpga_bridge_put(struct fpga_bridge *bridge);
> +
> +int fpga_bridge_enable(struct fpga_bridge *bridge);
> +int fpga_bridge_disable(struct fpga_bridge *bridge);
> +
> +int fpga_bridge_register(struct device *dev, const char *name,
> +			 struct fpga_bridge_ops *br_ops, void *priv);
> +void fpga_bridge_unregister(struct device *dev);
> +
> +#endif /* _LINUX_FPGA_BRIDGE_H */

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
