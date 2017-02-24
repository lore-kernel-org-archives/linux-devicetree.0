From: Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/4] iio: accel: adxl345: Split driver into core and
 I2C
Date: Fri, 24 Feb 2017 17:06:13 +0800
Message-ID: <20170224090611.GB5012@Socrates-UM>
References: <cover.1487757223.git.eraretuya@gmail.com>
 <68ce56410416b439bd59a8e2f4fe294a48cb5fad.1487757223.git.eraretuya@gmail.com>
 <CAHp75VcWethtVW4Q6Q7Y+E9b6s32mf9YFT8wecXV7dDUS3asLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VcWethtVW4Q6Q7Y+E9b6s32mf9YFT8wecXV7dDUS3asLQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Daniel Baluta <daniel.baluta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alison Schofield <amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 23, 2017 at 06:36:42PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 22, 2017 at 12:23 PM, Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Move I2C-specific code into its own file and rely on regmap to access
> > registers. The core code provides access to x, y, z and scale readings.
> 
> Like Lars already pointed to possibility of use of this in ACPI based
> platforms, I would add a reference to
> commit 01427fe7c4b9 ("Input: adxl34x - make it enumerable in ACPI environment").
> 
> Please fix your patches accordingly.
> 

Ack. Thank you for pointing this out. I'm not aware of the said commit.

Eva

> 
> > +static const struct i2c_device_id adxl345_i2c_id[] = {
> > +       { "adxl345", 0 },
> > +       { }
> > +};
> > +
> > +MODULE_DEVICE_TABLE(i2c, adxl345_i2c_id);
> > +
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id adxl345_of_match[] = {
> > +       { .compatible = "adi,adxl345" },
> > +       { },
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, adxl345_of_match);
> > +#endif
> > +
> > +static struct i2c_driver adxl345_i2c_driver = {
> > +       .driver = {
> > +               .name   = "adxl345_i2c",
> > +               .of_match_table = of_match_ptr(adxl345_of_match),
> > +       },
> > +       .probe          = adxl345_i2c_probe,
> > +       .remove         = adxl345_i2c_remove,
> > +       .id_table       = adxl345_i2c_id,
> > +};
> > +
> > +module_i2c_driver(adxl345_i2c_driver);
> > +
> > +MODULE_AUTHOR("Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>");
> > +MODULE_DESCRIPTION("ADXL345 3-Axis Digital Accelerometer I2C driver");
> > +MODULE_LICENSE("GPL v2");
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
