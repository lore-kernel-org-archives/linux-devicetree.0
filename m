From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH anybus v4 1/7] fieldbus_dev: add Fieldbus Device
 subsystem.
Date: Tue, 27 Nov 2018 08:54:31 +0100
Message-ID: <20181127075431.GG13965@kroah.com>
References: <20181121150709.6030-1-TheSven73@googlemail.com>
 <20181121150709.6030-2-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181121150709.6030-2-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thesven73@gmail.com
Cc: svendev@arcx.com, robh+dt@kernel.org, linus.walleij@linaro.org, lee.jones@linaro.org, mark.rutland@arm.com, afaerber@suse.de, treding@nvidia.com, david@lechnology.com, noralf@tronnes.org, johan@kernel.org, monstr@monstr.eu, michal.vokac@ysoft.com, arnd@arndb.de, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, stuyoder@gmail.com, maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 21, 2018 at 10:07:03AM -0500, thesven73@gmail.com wrote:
> +static struct attribute *fieldbus_attrs[] = {
> +	&dev_attr_enabled.attr,
> +	&dev_attr_card_name.attr,
> +	&dev_attr_fieldbus_id.attr,
> +	&dev_attr_read_area_size.attr,
> +	&dev_attr_write_area_size.attr,
> +	&dev_attr_online.attr,
> +	&dev_attr_fieldbus_type.attr,
> +	NULL,
> +};
> +
> +static umode_t fieldbus_is_visible(struct kobject *kobj, struct attribute *attr,
> +				int n)
> +{
> +	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct fieldbus_dev *fb = dev_get_drvdata(dev);
> +	umode_t mode = attr->mode;
> +
> +	if (attr == &dev_attr_enabled.attr) {
> +		mode = 0;
> +		if (fb->enable_get)
> +			mode |= 0444;
> +		if (fb->simple_enable_set)
> +			mode |= 0200;
> +	}
> +
> +	return mode;
> +}
> +
> +static const struct attribute_group fieldbus_group = {
> +	.attrs = fieldbus_attrs,
> +	.is_visible = fieldbus_is_visible,
> +};
> +__ATTRIBUTE_GROUPS(fieldbus);

Why not just use ATTRIBUTE_GROUPS()?

> +static int __fieldbus_dev_register(struct fieldbus_dev *fb)
> +{
> +	dev_t devno;
> +	int err;
> +
> +	if (!fb)
> +		return -EINVAL;
> +	if (!fb->read_area || !fb->write_area || !fb->fieldbus_id_get)
> +		return -EINVAL;
> +	fb->id = ida_simple_get(&fieldbus_ida, 0, MAX_FIELDBUSES, GFP_KERNEL);
> +	if (fb->id < 0)
> +		return fb->id;
> +	devno = MKDEV(MAJOR(fieldbus_devt), fb->id);
> +	init_waitqueue_head(&fb->dc_wq);
> +	cdev_init(&fb->cdev, &fieldbus_fops);
> +	err = cdev_add(&fb->cdev, devno, 1);
> +	if (err) {
> +		pr_err("fieldbus_dev%d unable to add device %d:%d\n",
> +			fb->id, MAJOR(fieldbus_devt), fb->id);
> +		goto err_cdev;
> +	}

Why do you have a static cdev?

> +	fb->dev = device_create(&fieldbus_class, fb->parent, devno, fb,
> +				"fieldbus_dev%d", fb->id);
> +	if (IS_ERR(fb->dev)) {
> +		err = PTR_ERR(fb->dev);
> +		goto err_dev_create;
> +	}
> +	fb->online_sd = sysfs_get_dirent(fb->dev->kobj.sd, "online");

Ick, what?  Why?  Why are you messing around with a raw sysfs attribute?

Also, you are creating sysfs files and you are not documenting any of
them in Documentation/ABI/ which is not allowed.  Please add that to
this patch for the next round.

thanks,

greg k-h
