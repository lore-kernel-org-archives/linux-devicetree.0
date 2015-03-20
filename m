From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/3] TTY: add support for tty_slave devices.
Date: Fri, 20 Mar 2015 20:41:50 +0100
Message-ID: <20150320194150.GB28194@amd>
References: <20150318055437.21025.13990.stgit@notabene.brown>
 <20150318055831.21025.85317.stgit@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150318055831.21025.85317.stgit@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
To: NeilBrown <neil@brown.name>
Cc: Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, GTA04 owners <gta04-owner@goldelico.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi!

(And yes, I now see dts examples, sorry for the noise.)

Acked-by: Pavel Machek <pavel@ucw.cz>

Minor nits below.

> --- /dev/null
> +++ b/drivers/tty/slave/tty_slave_core.c
> @@ -0,0 +1,136 @@
> +/*
> + * tty-slave-core - device bus for tty slaves

Filename actually uses underscores.

> +			container_of(parent, struct tty_slave, dev);
> +		tty->ops = &dev->ops;
> +	}
> +}
> +EXPORT_SYMBOL(tty_slave_activate);

Not "_GPL"?

> +postcore_initcall(tty_slave_init);
> +module_exit(tty_slave_exit);

Should it have MODULE_LICENSE tag?


> +int tty_register_finalize(struct tty_driver *driver, struct device *dev)
> +{
> +	int retval;
> +	bool cdev = false;
> +	int index = dev->devt - MKDEV(driver->major,
> +				      driver->minor_start);
> +	printk("REGISTER %d %d 0x%x %d\n", driver->major, driver->minor_start, dev->devt, index);

That printk should probably be removed for merge?

> +	if (!(driver->flags & TTY_DRIVER_DYNAMIC_ALLOC)) {
> +		retval = tty_cdev_add(driver,
> +				      dev->devt,
> +				      index, 1);

You can put this on one line.

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

Header files usually have #include guards, and some kind of comment on
top.

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
