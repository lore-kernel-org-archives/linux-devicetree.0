From: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/3] iio: temperature: add max6675 thermocouple converter
 driver
Date: Mon, 3 Aug 2015 19:10:19 -0400
Message-ID: <20150803231019.GJ15004@beef>
References: <1438635410-3757-1-git-send-email-mporter@konsulko.com>
 <1438635410-3757-3-git-send-email-mporter@konsulko.com>
 <CAKzfze9EcW0=yRGq=JBim7P8kQ4q+UgOd00qm=zA6oLz+Ut4DQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKzfze9EcW0=yRGq=JBim7P8kQ4q+UgOd00qm=zA6oLz+Ut4DQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linux IIO List <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 03, 2015 at 03:39:00PM -0700, Matt Ranostay Matt Ranostay wrote:
> On Mon, Aug 3, 2015 at 1:56 PM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:

...

> > +static int max6675_probe(struct spi_device *spi)
> > +{
> > +       struct iio_dev *indio_dev;
> > +       struct max6675_state *st;
> > +       int ret = 0;
> > +
> > +       indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
> > +       if (!indio_dev)
> > +               return -ENOMEM;
> > +
> > +       st = iio_priv(indio_dev);
> > +       st->spi = spi;
> > +
> > +       spi->mode = SPI_MODE_1;
> > +       spi->bits_per_word = 16;
> 
> Have this error or display a warning when it doesn't match the passed
> DT binding settings. Otherwise it may get confusing why other SPI
> modes and word sizes don't work.

Ok, good point. The only thing here is that I've specified that spi-cpha
is required in the binding, indicating that Mode 1 will be used. I need
this driver to be instantiated via three methods: ACPI, DT, and "board
file" so for the latter I'm hardcoding in the driver the mode. The
device only works in Mode 1 so this seems sane, it's not configurable.
I don't parse that mode from either DT or ACPI data since it's not
needed. About the only thing I could do is pedantically check for
spi-cpha and if not present complain..but I think it's fine to simply
not parse at all given that we've hardcoded this for the allowed mode.

There's no property for bits_per_word, it's configured on a per-transfer
basis. In this case, this configures the default to do a 16-bit transfer
as required by the device. There is no way to modify this by a client of
this driver.

-Matt
