From: jacopo <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/4] iio: adc: Add Maxim max9611 ADC driver
Date: Sun, 26 Mar 2017 12:02:39 +0200
Message-ID: <20170326100239.GB5981@w540>
References: <1490369323-13866-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490369323-13866-4-git-send-email-jacopo+renesas@jmondi.org>
 <a911f5d1-e019-772f-0889-849cf42e6827@kernel.org>
 <20170325171735.GA5981@w540>
 <834f03d3-36d2-9b86-6b1e-04a23d440e10@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <834f03d3-36d2-9b86-6b1e-04a23d440e10-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jonathan,

On Sat, Mar 25, 2017 at 05:37:52PM +0000, Jonathan Cameron wrote:
> On 25/03/17 17:21, jacopo wrote:
> > Hi Jonathan,
> >     thanks for review

[snip]

> >>> +
> >>> +	indio_dev->dev.parent	= &client->dev;
> >>> +	indio_dev->dev.of_node	= client->dev.of_node;
> >>> +	indio_dev->name		= client->dev.of_node->name;
> >> What's this going to give for the name?  Name in IIO is supposed to
> >> be an indication of the part rather than anything more explicit.
> >> That's not easily obtained from device tree directly...
> >>
> > 
> > I used the one coming from device tree as otherwise device entries
> > have the same name, and I wanted to have it to inclued the unit
> > address (eg. adc@7c and not just adc)
> > But from you comment I guess it's fine just adc, so I'll change this
> > back to v1).
> Should be the part number - so max9611 or similar..
> 
> You can query the device node details directly if you need to identify
> which is which.

That would not help, as I've been suggested to use a generic "adc" in
node name property.

I can hard-code "max9611" here. That would not help with the fact that
two chips will appear in userspace with the same name (and that's why
I wanted to have the unit address).

Otherwise I can do what Quentin is suggesting in his review of
AST2400: have different name for each compatible entry, so that this
will appear as either max9611 or max9612 in userspace

Thanks
   j

> > 
> > Thanks
> >   j
> > 
> >>> +	indio_dev->modes	= INDIO_DIRECT_MODE;
> >>> +	indio_dev->info		= &indio_info;
> >>> +	indio_dev->channels	= max9611_channels;
> >>> +	indio_dev->num_channels	= ARRAY_SIZE(max9611_channels);
> >>> +
> >>> +	return devm_iio_device_register(&client->dev, indio_dev);
> >>> +}
> >>> +
> >>> +static const struct of_device_id max9611_of_table[] = {
> >>> +	{.compatible = "maxim,max9611"},
> >>> +	{.compatible = "maxim,max9612"},
> >>> +	{ },
> >>> +};
> >>> +
> >>> +MODULE_DEVICE_TABLE(of, max9611_of_table);
> >>> +
> >>> +static struct i2c_driver max9611_driver = {
> >>> +	.driver = {
> >>> +		   .name = DRIVER_NAME,
> >>> +		   .owner = THIS_MODULE,
> >>> +		   .of_match_table = max9611_of_table,
> >>> +	},
> >>> +	.probe = max9611_probe,
> >>> +};
> >>> +module_i2c_driver(max9611_driver);
> >>> +
> >>> +MODULE_AUTHOR("Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>");
> >>> +MODULE_DESCRIPTION("Maxim max9611/12 current sense amplifier with 12bit ADC");
> >>> +MODULE_LICENSE("GPL v2");
> >>>
> >>
> 
