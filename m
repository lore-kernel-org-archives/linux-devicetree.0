From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 05/16] drivers/fsi: Add fake master driver
Date: Wed, 7 Dec 2016 12:09:05 +0000
Message-ID: <20161207120905.GD7054@leverpostej>
References: <1481069677-53660-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1481069677-53660-6-git-send-email-christopher.lee.bostic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1481069677-53660-6-git-send-email-christopher.lee.bostic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Bostic <christopher.lee.bostic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 06, 2016 at 06:14:26PM -0600, Chris Bostic wrote:
> From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
> 
> For debugging, add a fake master driver, that only supports reads,
> returning a fixed set of data.

> +config FSI_MASTER_FAKE
> +	tristate "Fake FSI master"
> +	depends on FSI
> +	---help---
> +	This option enables a fake FSI master driver for debugging.
> +endif

> +static const struct of_device_id fsi_master_fake_match[] = {
> +	{ .compatible = "ibm,fsi-master-fake" },
> +	{ },
> +};

NAK.

DT should be treated as an ABI, and should describe the HW explicitly.
This makes no sense. This is also missing a binding document.

Have your module take a module parameter allowing you to bind it to
arbitrary devices, or do something like what PCI does where you can
bind/unbind arbitrary drivers to devices using sysfs.

> +
> +static struct platform_driver fsi_master_fake_driver = {
> +	.driver = {
> +		.name		= "fsi-master-fake",
> +		.of_match_table	= fsi_master_fake_match,
> +	},
> +	.probe	= fsi_master_fake_probe,
> +};
> +
> +static int __init fsi_master_fake_init(void)
> +{
> +	struct device_node *np;
> +
> +	platform_driver_register(&fsi_master_fake_driver);
> +
> +	for_each_compatible_node(np, NULL, "ibm,fsi-master-fake")
> +		of_platform_device_create(np, NULL, NULL);

As a general note, please use for_each_matching_node in situations like
this. That way you can reuse your existing of_device_id table, and not
reproduce the string.

That said, this is not necessary. The platform driver has an
of_match_table, so presumes the parent bus registers children, and hence
they should already have platform devices.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
