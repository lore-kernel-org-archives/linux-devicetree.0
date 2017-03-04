From: Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 3/4] iio: accel: adxl345: Split driver into core and
 I2C
Date: Sat, 4 Mar 2017 13:56:34 +0800
Message-ID: <20170304055633.GB6948@Socrates-UM>
References: <cover.1488248485.git.eraretuya@gmail.com>
 <f15e3023ba4cabd1a236943378caa6ab6c1b4d85.1488248485.git.eraretuya@gmail.com>
 <CAHp75VdntzxWpQvnYe346yjJ4e2wwpfFizSxLuUanc7F_QAm+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VdntzxWpQvnYe346yjJ4e2wwpfFizSxLuUanc7F_QAm+Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Daniel Baluta <daniel.baluta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alison Schofield <amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 03, 2017 at 06:51:28PM +0200, Andy Shevchenko wrote:
> On Tue, Feb 28, 2017 at 4:37 AM, Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Move I2C-specific code into its own file and rely on regmap to access
> > registers. The core code provides access to x, y, z and scale readings.
> 
> Portion of minor comments.
> 
> > +config ADXL345_I2C
> > +       tristate "Analog Devices ADXL345 3-Axis Digital Accelerometer I2C Driver"
> 
> >         depends on !(INPUT_ADXL34X=y || INPUT_ADXL34X=m)
> 
> I'm wondering if it works in a form of
> 
> depends on INPUT_ADXL34X=n
> 

Yes it works. Will change it into this form.

> > +int adxl345_common_probe(struct device *dev, struct regmap *regmap,
> > +                        const char *name);
> > +int adxl345_common_remove(struct device *dev);
> 
> I think a "common" word is redundant.
> 

OK. I will use "core" instead.

> > - * IIO driver for ADXL345
> > - * 7-bit I2C slave address: 0x1D (ALT ADDRESS pin tied to VDDIO) or
> > - * 0x53 (ALT ADDRESS pin grounded)
> 
> > + * IIO core driver for ADXL345
> 
> Should not it be at the beginning of header comment?
> 

Ack.

> > +static int adxl345_i2c_probe(struct i2c_client *client,
> > +                            const struct i2c_device_id *id)
> > +{
> 
> > +       struct regmap *regmap;
> > +       const char *name = NULL;
> 
> Reverse tree order, please.
> 
> > +
> > +       regmap = devm_regmap_init_i2c(client, &adxl345_i2c_regmap_config);
> > +       if (IS_ERR(regmap)) {
> > +               dev_err(&client->dev, "Error initializing i2c regmap: %d\n",
> > +                       (int)PTR_ERR(regmap));
> > +               return PTR_ERR(regmap);
> > +       }
> > +
> 
> > +       if (id)
> > +               name = id->name;
> > +
> > +       return adxl345_common_probe(&client->dev, regmap, name);
> 
> Do you need temporary variable?
> 
> return adxl345_probe(&client->dev, regmap, id ? id->name : NULL);
> 

Will remove it and use the form you suggest.

Thanks,
Eva

> -- 
> With Best Regards,
> Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
