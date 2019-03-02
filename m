From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 5/9] staging: iio: ad7780: move regulator to after
 GPIO init
Date: Sat, 2 Mar 2019 19:11:53 +0000
Message-ID: <20190302191153.5d57a86b@archlinux>
References: <cover.1551358569.git.renatogeh@gmail.com>
        <93cabb081605ac356f2f0d9a9a41d5bc5e63820d.1551358569.git.renatogeh@gmail.com>
        <28d78cfc00bc5414c7539879df46200d61e52ee1.camel@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <28d78cfc00bc5414c7539879df46200d61e52ee1.camel@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ardelean, Alexandru" <Alex.Ardelean@analog.com>
Cc: "lars@metafoo.de" <lars@metafoo.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "Popa, Stefan Serban" <StefanSerban.Popa@analog.com>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, "renatogeh@gmail.com" <renatogeh@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "giuliano.belinassi@usp.br" <giuliano.belinassi@usp.br>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "kernel-usp@googlegroups.com" <kernel-usp@googlegroups.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 1 Mar 2019 07:38:45 +0000
"Ardelean, Alexandru" <Alex.Ardelean@analog.com> wrote:

> On Thu, 2019-02-28 at 11:25 -0300, Renato Lui Geh wrote:
> > 
> > 
> > To maintain consistency between ad7780_probe and ad7780_remove orders,
> > regulator initialization has been moved to after GPIO initializations.
> > 
> > Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
> > ---
> >  drivers/staging/iio/adc/ad7780.c | 26 +++++++++++++-------------
> >  1 file changed, 13 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/staging/iio/adc/ad7780.c
> > b/drivers/staging/iio/adc/ad7780.c
> > index ad7617a3a141..12aef0f101bc 100644
> > --- a/drivers/staging/iio/adc/ad7780.c
> > +++ b/drivers/staging/iio/adc/ad7780.c
> > @@ -255,16 +255,6 @@ static int ad7780_probe(struct spi_device *spi)
> > 
> >         ad_sd_init(&st->sd, indio_dev, spi, &ad7780_sigma_delta_info);
> > 
> > -       st->reg = devm_regulator_get(&spi->dev, "avdd");
> > -       if (IS_ERR(st->reg))
> > -               return PTR_ERR(st->reg);
> > -
> > -       ret = regulator_enable(st->reg);
> > -       if (ret) {
> > -               dev_err(&spi->dev, "Failed to enable specified AVdd
> > supply\n");
> > -               return ret;
> > -       }
> > -
> >         st->chip_info =
> >                 &ad7780_chip_info_tbl[spi_get_device_id(spi)-  
> > >driver_data];  
> > 
> > @@ -284,7 +274,7 @@ static int ad7780_probe(struct spi_device *spi)
> >                 ret = PTR_ERR(st->powerdown_gpio);
> >                 dev_err(&spi->dev, "Failed to request powerdown GPIO:
> > %d\n",
> >                         ret);
> > -               goto error_disable_reg;
> > +               return ret;
> >         }
> > 
> >         if (st->chip_info->is_ad778x) {
> > @@ -295,7 +285,7 @@ static int ad7780_probe(struct spi_device *spi)
> >                         ret = PTR_ERR(st->gain_gpio);
> >                         dev_err(&spi->dev, "Failed to request gain GPIO:
> > %d\n",
> >                                 ret);
> > -                       goto error_disable_reg;
> > +                       return ret;
> >                 }
> > 
> >                 st->filter_gpio = devm_gpiod_get_optional(&spi->dev,
> > @@ -306,10 +296,20 @@ static int ad7780_probe(struct spi_device *spi)
> >                         dev_err(&spi->dev,
> >                                 "Failed to request filter GPIO: %d\n",
> >                                 ret);
> > -                       goto error_disable_reg;
> > +                       return ret;
> >                 }
> >         }
> > 
> > +       st->reg = devm_regulator_get(&spi->dev, "avdd");
> > +       if (IS_ERR(st->reg))
> > +               return PTR_ERR(st->reg);
> > +
> > +       ret = regulator_enable(st->reg);
> > +       if (ret) {
> > +               dev_err(&spi->dev, "Failed to enable specified AVdd
> > supply\n");
> > +               return ret;
> > +       }
> > +  
> 
> I'm probably missing something, but other than the fact that this moves the
> regulator init after the GPIOs init, it doesn't change much.
> The order of the probe & remove is more-or-less the same.
> The GPIOs will be free'd via devm_ API/stuff.

This is another one from me.  I'm a fanatic at times when it comes
to probe and remove orders being precise reverses.  It just makes
review easier.  Nice to not actually have to think.

So I agree there is no 'actual' effect but it is in my view
still worth doing.

Jonathan

> 
> 
> >         ret = ad_sd_setup_buffer_and_trigger(indio_dev);
> >         if (ret)
> >                 goto error_disable_reg;
> > --
> > 2.21.0
> >   
