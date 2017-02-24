From: Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/4] iio: accel: adxl345: Use I2C regmap instead of
 direct I2C access
Date: Fri, 24 Feb 2017 17:02:08 +0800
Message-ID: <20170224090206.GA5012@Socrates-UM>
References: <cover.1487757223.git.eraretuya@gmail.com>
 <b477e7142cb39b5bb86670191f41dcc031e80569.1487757223.git.eraretuya@gmail.com>
 <CAHp75Vca29-H050MgCvdo986+QA5odJmAF3_AwQURMYZOb=wUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Vca29-H050MgCvdo986+QA5odJmAF3_AwQURMYZOb=wUA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, daniel.baluta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 23, 2017 at 06:27:52PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 22, 2017 at 12:22 PM, Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Convert the driver to use regmap instead of I2C-specific functions.
> > Also, introduce the header file "adxl345.h" and export the probe and
> > remove functions. This is done in preparation for splitting this driver
> > into core and I2C-specific code as well as introduction of SPI driver.
> >
> > Signed-off-by: Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Is it possible to use device just after this very patch?
> For me it seems there is bisectability issue.
> 

Hello Andy,

Most likely no because of excessive deletion. Sorry for the mistake, I'll
submit another version that hopefully won't cause this issue.

Thanks,
Eva

> > -static const struct i2c_device_id adxl345_i2c_id[] = {
> > -       { "adxl345", 0 },
> > -       { }
> > -};
> > -
> > -MODULE_DEVICE_TABLE(i2c, adxl345_i2c_id);
> > -
> > -static struct i2c_driver adxl345_driver = {
> > -       .driver = {
> > -               .name   = "adxl345",
> > -       },
> > -       .probe          = adxl345_probe,
> > -       .remove         = adxl345_remove,
> > -       .id_table       = adxl345_i2c_id,
> > -};
> > -
> > -module_i2c_driver(adxl345_driver);
> > +EXPORT_SYMBOL_GPL(adxl345_common_remove);
> 
> -- 
> With Best Regards,
> Andy Shevchenko
