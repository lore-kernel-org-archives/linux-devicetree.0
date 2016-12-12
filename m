From: Christopher Bostic <christopher.lee.bostic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 16/16] drivers/fsi: Add GPIO based FSI master
Date: Mon, 12 Dec 2016 13:49:41 -0600
Message-ID: <CAA0LjjV98roN5MEyfkRFf8m61C_nHi6Wxq_2wHB=c6YQ35_wUQ@mail.gmail.com>
References: <1481069677-53660-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1481069677-53660-17-git-send-email-christopher.lee.bostic@gmail.com> <6a39f4d9-0f20-a146-3122-86d3f75c58fa@ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6a39f4d9-0f20-a146-3122-86d3f75c58fa-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, Open List OF Flattened dev tree bindings <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Moderated list: ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Linux open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 8, 2016 at 10:12 PM, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org> wrote:
> Hi Chris,
>
>> +static ssize_t store_scan(struct device *dev,
>> +                             struct device_attribute *attr,
>> +                             const char *buf,
>> +                             size_t count)
>> +{
>> +     struct fsi_master_gpio *master = dev_get_drvdata(dev);
>> +
>> +     fsi_master_gpio_init(master);
>> +
>> +     /* clear out any old scan data if present */
>> +     fsi_master_unregister(&master->master);
>> +     fsi_master_register(&master->master);
>> +
>> +     return count;
>> +}
>> +
>> +static DEVICE_ATTR(scan, 0200, NULL, store_scan);
>
> I think it would make more sense to have the scan attribute populated by
> the fsi core; we want this on all masters, not just GPIO.
>

Hi Jeremy,

Sure, will move that to the core.

> Currently, the only GPIO-master-specific functionality here is the
> fsi_master_gpio_init() - but isn't this something that we can do at
> probe time instead?
>

Yes that can be done at probe time.  Will change.

>> +static int fsi_master_gpio_probe(struct platform_device *pdev)
>> +{
>> +     struct fsi_master_gpio *master;
>> +     struct gpio_desc *gpio;
>> +
>> +     master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
>> +     if (!master)
>> +             return -ENOMEM;
>
> We should be populating master->dev.parent, see
>
>   https://github.com/jk-ozlabs/linux/commit/5225d6c47
>
>

Will make the change.

>> +     /* Optional pins */
>> +
>> +     gpio = devm_gpiod_get(&pdev->dev, "trans", 0);
>> +     if (IS_ERR(gpio))
>> +             dev_dbg(&pdev->dev, "probe: failed to get trans pin\n");
>> +     else
>> +             master->gpio_trans = gpio;
>
> I found devm_gpiod_get_optional(), which might make this a little
> neater.

Will make this change.


Thanks,
Chris

>
> Cheers,
>
>
> Jeremy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
