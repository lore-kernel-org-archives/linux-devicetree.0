From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 1/6] fieldbus_dev: add Fieldbus Device subsystem.
Date: Wed, 5 Dec 2018 11:16:59 +0100
Message-ID: <20181205101659.GA27058@kroah.com>
References: <20181204220224.27324-1-TheSven73@googlemail.com>
 <20181204220224.27324-2-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181204220224.27324-2-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: svendev@arcx.com, robh+dt@kernel.org, linus.walleij@linaro.org, lee.jones@linaro.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, stuyoder@gmail.com, maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 04, 2018 at 05:02:19PM -0500, Sven Van Asbroeck wrote:
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-fieldbus-dev
> @@ -0,0 +1,63 @@
> +What:		/sys/class/fieldbus_dev/fieldbus_devX/card_name

Here's a good example of your naming being a bit too "verbose" :)

There is no need to name your devices with the same prefix as your
class.  Just make it:
	/sys/class/fieldbus/XXX/card_name

And why is this a class and not just a "normal" device and bus?  Devices
live on busses, not generally as a class.  Can your devices live on
different types of busses (USB, PCI, etc.)?

But, if you really just want to leave this as a "class", then just call
it "fieldbus" and make it simple.  You are only exposing the
"fieldbus-specific" type of attributes here, so that's probably good
enough for now.

> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -187,4 +187,5 @@ obj-$(CONFIG_TEE)		+= tee/
>  obj-$(CONFIG_MULTIPLEXER)	+= mux/
>  obj-$(CONFIG_UNISYS_VISORBUS)	+= visorbus/
>  obj-$(CONFIG_SIOX)		+= siox/
> +obj-$(CONFIG_FIELDBUS_DEV)	+= fieldbus/
>  obj-$(CONFIG_GNSS)		+= gnss/

Why not after gnss?

> --- /dev/null
> +++ b/drivers/fieldbus/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for fieldbus_dev drivers.
> +#
> +
> +obj-$(CONFIG_FIELDBUS_DEV)	+= fieldbus_dev_core.o

Why not just "fieldbus.o"?

> +static ssize_t online_show(struct device *dev, struct device_attribute *attr,
> +				char *buf)
> +{
> +	struct fieldbus_dev *fb = dev_get_drvdata(dev);
> +
> +	return snprintf(buf, PAGE_SIZE, "%s\n",

Nit, sysfs attributes are always so small that you don't need to care
about the size of the buffer because you "always" know that you will not
overflow it.

So this can just be a simple:
	return sprintf(buf, "%s\n", ...);

> +		fb->online ? "online" : "offline");
> +}
> +static DEVICE_ATTR_RO(online);
> +
> +static ssize_t enabled_show(struct device *dev, struct device_attribute *attr,
> +				char *buf)
> +{
> +	struct fieldbus_dev *fb = dev_get_drvdata(dev);
> +
> +	if (!fb->enable_get)
> +		return -EINVAL;
> +	return snprintf(buf, PAGE_SIZE, "%s\n",
> +		fb->enable_get(fb) ? ctrl_enabled : ctrl_disabled);
> +}

New line?

> +static ssize_t enabled_store(struct device *dev, struct device_attribute *attr,
> +			     const char *buf, size_t n)
> +{
> +	struct fieldbus_dev *fb = dev_get_drvdata(dev);
> +	int err;
> +
> +	if (!fb->simple_enable_set) {
> +		n = -ENOTSUPP;
> +	} else if (sysfs_streq(buf, ctrl_enabled)) {

Why not just have the normal "0/1" type of parsing?  We have a function
for it already, kstrtobool().

thanks,

greg k-h
