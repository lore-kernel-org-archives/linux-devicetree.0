From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 16/16] drivers/fsi: Add GPIO based FSI master
Date: Fri, 9 Dec 2016 15:12:05 +1100
Message-ID: <6a39f4d9-0f20-a146-3122-86d3f75c58fa@ozlabs.org>
References: <1481069677-53660-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1481069677-53660-17-git-send-email-christopher.lee.bostic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481069677-53660-17-git-send-email-christopher.lee.bostic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Bostic <christopher.lee.bostic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Chris,

> +static ssize_t store_scan(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf,
> +				size_t count)
> +{
> +	struct fsi_master_gpio *master = dev_get_drvdata(dev);
> +
> +	fsi_master_gpio_init(master);
> +
> +	/* clear out any old scan data if present */
> +	fsi_master_unregister(&master->master);
> +	fsi_master_register(&master->master);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR(scan, 0200, NULL, store_scan);

I think it would make more sense to have the scan attribute populated by
the fsi core; we want this on all masters, not just GPIO.

Currently, the only GPIO-master-specific functionality here is the
fsi_master_gpio_init() - but isn't this something that we can do at
probe time instead?

> +static int fsi_master_gpio_probe(struct platform_device *pdev)
> +{
> +	struct fsi_master_gpio *master;
> +	struct gpio_desc *gpio;
> +
> +	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
> +	if (!master)
> +		return -ENOMEM;

We should be populating master->dev.parent, see

  https://github.com/jk-ozlabs/linux/commit/5225d6c47


> +	/* Optional pins */
> +
> +	gpio = devm_gpiod_get(&pdev->dev, "trans", 0);
> +	if (IS_ERR(gpio))
> +		dev_dbg(&pdev->dev, "probe: failed to get trans pin\n");
> +	else
> +		master->gpio_trans = gpio;

I found devm_gpiod_get_optional(), which might make this a little
neater.

Cheers,


Jeremy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
