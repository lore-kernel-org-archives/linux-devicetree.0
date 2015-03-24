From: Jiri Slaby <jslaby@suse.cz>
Subject: Re: [PATCH 2/3] TTY: add support for tty_slave devices.
Date: Tue, 24 Mar 2015 11:31:55 +0100
Message-ID: <55113D1B.1030906@suse.cz>
References: <20150318055437.21025.13990.stgit@notabene.brown> <20150318055831.21025.85317.stgit@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150318055831.21025.85317.stgit@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
To: NeilBrown <neil@brown.name>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>
Cc: GTA04 owners <gta04-owner@goldelico.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 03/18/2015, 06:58 AM, NeilBrown wrote:
> --- /dev/null
> +++ b/drivers/tty/slave/tty_slave_core.c
> @@ -0,0 +1,136 @@

...

> +static int tty_slave_match(struct device *dev, struct device_driver *drv)
> +{
> +	return of_driver_match_device(dev, drv);
> +}
> +
> +static void tty_slave_release(struct device *dev)
> +{
> +	kfree(dev);

This should free the slave where the dev is contained. This is never
called IMO due to missing put_device's in the code.

> +}
> +
> +struct bus_type tty_slave_bus_type = {
> +	.name		= "tty-slave",
> +	.match		= tty_slave_match,
> +};
> +
> +int tty_slave_register(struct device *parent, struct device_node *node,
> +		       struct device *tty, struct tty_driver *drv)
> +{
> +	struct tty_slave *slave;
> +	int retval;
> +
> +	if (!of_get_property(node, "compatible", NULL))
> +		return -ENODEV;
> +
> +	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
> +	if (!slave)
> +		return -ENOMEM;
> +

device_initialize();

> +	slave->dev.bus = &tty_slave_bus_type;
> +	slave->dev.parent = parent;
> +	slave->dev.release = tty_slave_release;
> +	slave->dev.of_node = of_node_get(node);
> +	dev_set_name(&slave->dev, "%s", node->name);
> +	slave->tty_dev = tty;
> +	slave->tty_drv = drv;
> +	slave->ops = *drv->ops;
> +	retval = device_register(&slave->dev);
> +	if (retval) {
> +		of_node_put(node);
> +		kfree(slave);

Do device_put() instead of the two. And do the two in .release.

> +	}
> +	return retval;
> +}
> +EXPORT_SYMBOL(tty_slave_register);
...
> --- a/drivers/tty/tty_io.c
> +++ b/drivers/tty/tty_io.c
...
> @@ -3205,6 +3208,29 @@ static void tty_device_create_release(struct device *dev)
>  	kfree(dev);
>  }
>  
> +int tty_register_finalize(struct tty_driver *driver, struct device *dev)
> +{
> +	int retval;
> +	bool cdev = false;
> +	int index = dev->devt - MKDEV(driver->major,
> +				      driver->minor_start);
> +	printk("REGISTER %d %d 0x%x %d\n", driver->major, driver->minor_start, dev->devt, index);
> +	if (!(driver->flags & TTY_DRIVER_DYNAMIC_ALLOC)) {
> +		retval = tty_cdev_add(driver,
> +				      dev->devt,
> +				      index, 1);
> +		if (retval)
> +			return retval;
> +		cdev = true;
> +	}
> +	retval = device_register(dev);
> +	if (retval == 0)
> +		return 0;
> +	if (cdev)
> +		cdev_del(&driver->cdevs[index]);
> +	return retval;
> +}
> +EXPORT_SYMBOL(tty_register_finalize);
>  /**
>   *	tty_register_device_attr - register a tty device
>   *	@driver: the tty driver that describes the tty device
> @@ -3234,7 +3260,8 @@ struct device *tty_register_device_attr(struct tty_driver *driver,
>  	dev_t devt = MKDEV(driver->major, driver->minor_start) + index;
>  	struct device *dev = NULL;
>  	int retval = -ENODEV;
> -	bool cdev = false;
> +	struct device_node *node;
> +	bool slave_registered = false;
>  
>  	if (index >= driver->num) {
>  		printk(KERN_ERR "Attempt to register invalid tty line number "
> @@ -3247,13 +3274,6 @@ struct device *tty_register_device_attr(struct tty_driver *driver,
>  	else
>  		tty_line_name(driver, index, name);
>  
> -	if (!(driver->flags & TTY_DRIVER_DYNAMIC_ALLOC)) {
> -		retval = tty_cdev_add(driver, devt, index, 1);
> -		if (retval)
> -			goto error;
> -		cdev = true;
> -	}
> -
>  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>  	if (!dev) {
>  		retval = -ENOMEM;
> @@ -3268,16 +3288,24 @@ struct device *tty_register_device_attr(struct tty_driver *driver,
>  	dev->groups = attr_grp;
>  	dev_set_drvdata(dev, drvdata);
>  
> -	retval = device_register(dev);
> -	if (retval)
> -		goto error;
> +	if (device && device->of_node)
> +		for_each_available_child_of_node(device->of_node, node) {
> +			if (tty_slave_register(device, node, dev, driver) == 0)
> +				slave_registered = true;
> +			if (slave_registered)
> +				break;
> +		}
> +
> +	if (!slave_registered) {
> +		retval = tty_register_finalize(driver, dev);
> +		if (retval)
> +			goto error;
> +	}
>  
>  	return dev;

And what about ttys not using the tty_register_device* helpers?

What happens when the tty is unregistered?

> --- /dev/null
> +++ b/include/linux/tty_slave.h
> @@ -0,0 +1,26 @@
> +
> +struct tty_slave {
> +	struct device *tty_dev;
> +	struct tty_driver *tty_drv;
> +	struct tty_operations ops;
> +	struct device dev;
> +};
> +
> +int tty_slave_finalize(struct tty_slave *slave);
> +int tty_slave_driver_register(struct device_driver *drv);
> +#if config_enabled(CONFIG_TTY_SLAVE)

Since TTY_SLAVE is tristate, this will work only for TTY_SLAVE == y, not
m. Use IS_ENABLED instead.

> +void tty_slave_activate(struct tty_struct *tty);
> +int tty_slave_register(struct device *parent, struct device_node *node,
> +		       struct device *tty, struct tty_driver *drv);
> +#else
> +static inline void tty_slave_activate(struct tty_struct *tty)
> +{
> +}
> +static inline int tty_slave_register(struct device *parent,
> +				     struct device_node *node,
> +				     struct device *tty,
> +				     struct tty_driver *drv)
> +{
> +	return -ENODEV;
> +}
> +#endif

thanks,
-- 
js
suse labs
