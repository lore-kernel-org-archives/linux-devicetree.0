From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/4] mfd: max14577: Add max14577 MFD driver core
Date: Thu, 14 Nov 2013 09:32:40 +0100
Message-ID: <1384417960.5901.14.camel@AMDC1943>
References: <1384328457-5147-1-git-send-email-k.kozlowski@samsung.com>
 <1384328457-5147-2-git-send-email-k.kozlowski@samsung.com>
 <20131113115018.GE21713@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20131113115018.GE21713-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,


On Wed, 2013-11-13 at 11:50 +0000, Mark Rutland wrote:
> I see some of_* calls in the code, but no documentation of the binding.
> As this has more than just a compatible, interrupts, and reg, it needs
> its own binding document.
> 
> [...]
> 
> > +static struct mfd_cell max14577_devs[] = {
> > +       { .name = "max14577-muic",
> > +               .of_compatible = "maxim,max14577-muic", },
> 
> The compatible string looks fine to me, but should be documented.

Sure, I will add documentation.

> [...]
> 
> > +#ifdef CONFIG_OF
> > +static struct max14577_platform_data *max14577_i2c_parse_dt(struct device *dev)
> > +{
> > +       struct max14577_platform_data *pdata;
> > +       struct device_node *np = dev->of_node;
> > +
> > +       pdata = devm_kzalloc(dev, sizeof(struct max14577_platform_data),
> > +                            GFP_KERNEL);
> > +       if (!pdata)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       pdata->irq_gpio = of_get_named_gpio(np, "irq_gpio", 0);
> 
> In general, '-' is preferred to '_' in property names. This should be
> irq-gpio.

OK.


> What exactly is this used for? I know that others have strong opinions
> about how gpio/irq interaction should be handled.

Later also Mark Brown raised this. I'll leave this to discussion with
Kyungmin Park as I'm not entirely the author of the code.


> 
> > +       if (!gpio_is_valid(pdata->irq_gpio)) {
> > +               dev_err(dev, "Invalid irq_gpio in DT\n");
> > +               return ERR_PTR(-EINVAL);
> > +       }
> > +
> > +       if (of_property_read_bool(np, "wakeup"))
> > +               pdata->wakeup = true;
> 
> What does this mean? It seems like a remarkably generic name for
> something that I'd guess is _very_ specific to this particular binding.
> 
> It might be worth prefixing it, and is certainly worth having a more
> precise name.

It is used for marking device as wake up source. This is same code as in
other max drivers used on Exynos boards (max77693 and max77686).


Thanks for review,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
