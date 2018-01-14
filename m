From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] iio: ad5272: Add support for Analog Devices digital
 potentiometers
Date: Sun, 14 Jan 2018 13:41:49 +0000
Message-ID: <20180114134149.39313916@archlinux>
References: <1515565051-72535-1-git-send-email-preid@electromag.com.au>
        <1515565051-72535-3-git-send-email-preid@electromag.com.au>
        <17f90f57-e1a1-3c5e-4044-fc6673ff1cff@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <17f90f57-e1a1-3c5e-4044-fc6673ff1cff-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Michael.Hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 11 Jan 2018 17:00:31 +0800
Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org> wrote:
...

> > +static int ad5272_probe(struct i2c_client *client,
> > +			const struct i2c_device_id *id)
> > +{
> > +	struct device *dev = &client->dev;
> > +	struct gpio_desc *reset_gpio;
> > +	struct iio_dev *indio_dev;
> > +	struct ad5272_data *data;
> > +	int ret;
> > +
> > +	reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> > +		GPIOD_OUT_LOW);  
> Reset line to the chip is active low, so I guess I should really be setting it to GPIOD_OUT_HIGH.
> Instead of having the DT define it as active-low?
> I'm not sure what makes the most sense.

As long as you are consistent it doesn't really matter.  This flexibility is
more relevant for generic code where we might need to make things work across
both options.

Jonathan


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
