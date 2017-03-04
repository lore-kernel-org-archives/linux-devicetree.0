From: Eva Rachel Retuya <eraretuya@gmail.com>
Subject: Re: [PATCH v5 4/4] iio: accel: adxl345: Add SPI support
Date: Sat, 4 Mar 2017 14:00:12 +0800
Message-ID: <20170304060010.GC6948@Socrates-UM>
References: <cover.1488248485.git.eraretuya@gmail.com>
 <698e2cf848231eacde91dd72aa6f73059c9a7752.1488248485.git.eraretuya@gmail.com>
 <CAHp75VcgLTgi51a_A3Jg+uDLeT1S9m8KnotdeZgsD9HHRQkR3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VcgLTgi51a_A3Jg+uDLeT1S9m8KnotdeZgsD9HHRQkR3Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Michael Hennerich <michael.hennerich@analog.com>, Daniel Baluta <daniel.baluta@gmail.com>, Alison Schofield <amsfield22@gmail.com>, Florian Vaussard <florian.vaussard@heig-vd.ch>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 03, 2017 at 06:55:26PM +0200, Andy Shevchenko wrote:
> On Tue, Feb 28, 2017 at 4:37 AM, Eva Rachel Retuya <eraretuya@gmail.com> wrote:
> > Add SPI driver that initializes SPI regmap for the adxl345 core driver.
> > The driver supports the same functionality as I2C namely the x, y, z and
> > scale readings.
> 
> Portion of minor comments.
> 
> > +config ADXL345_SPI
> > +       tristate "Analog Devices ADXL345 3-Axis Digital Accelerometer SPI Driver"
> 
> > +       depends on !(INPUT_ADXL34X=y || INPUT_ADXL34X=m)
> 
> Same question. Would it be just
> 
> depends on INPUT_ADXL34X=n
> 
> ?
> 
> > +        /* Setting bits 7 and 6 enables multiple-byte read */
> > +       .read_flag_mask = BIT(7) | BIT(6),
> 
> GENMASK(7, 6) ?
> 

True, but I would like to keep this as is. It is more readable and
obvious than GENMASK().

> > +static int adxl345_spi_probe(struct spi_device *spi)
> > +{
> 
> > +       struct regmap *regmap;
> > +       const struct spi_device_id *id = spi_get_device_id(spi);
> 
> Reverse order.
> 
> And usually we do assignments from function parameters first.

Ack.

Thanks,
Eva
> 
> > +               dev_err(&spi->dev, "Error initializing spi regmap: %d\n",
> > +                       (int)PTR_ERR(regmap));
> 
> Ugly casting!
> 
> -- 
> With Best Regards,
> Andy Shevchenko
