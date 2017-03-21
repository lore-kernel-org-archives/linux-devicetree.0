From: Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] iio: accel: adxl345: Add support for triggered buffer
Date: Tue, 21 Mar 2017 17:56:57 +0800
Message-ID: <20170321095655.GA5213@Socrates-UM>
References: <1489403497-27849-1-git-send-email-eraretuya@gmail.com>
 <1489403497-27849-5-git-send-email-eraretuya@gmail.com>
 <CAHp75VefS18nAH3HkQgNdmo5oUWoaQ7ctj=eXHx9XjwrJtZzuQ@mail.gmail.com>
 <8da981ed-6ce0-0be5-6b56-c3c1ec0d5dab@kernel.org>
 <f03e9577-41f9-8f1f-1963-3e8cbac5f979@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <f03e9577-41f9-8f1f-1963-3e8cbac5f979-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Daniel Baluta <daniel.baluta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alison Schofield <amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 20, 2017 at 08:46:11PM +0100, Lars-Peter Clausen wrote:
> On 03/15/2017 10:50 PM, Jonathan Cameron wrote:
> > On 13/03/17 12:16, Andy Shevchenko wrote:
> >> On Mon, Mar 13, 2017 at 1:11 PM, Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>> Provide an all-axes read for triggered buffering.
> >>
> >> Better description is needed.
> >>
> >>> -static int adxl345_get_triple(struct adxl345_data *data, void *buf)
> >>> +static int adxl345_get_triple(struct adxl345_data *data)
> >>
> >> Ping-ponging again. This should be essentially a change in the patch
> >> where you introduce a helper.
> >>
> >>> +err_buffer_cleanup:
> >>> +       iio_triggered_buffer_cleanup(indio_dev);
> >>>  err_trigger_unregister:
> >>>         if (data->drdy_trig)
> >>>                 iio_trigger_unregister(data->drdy_trig);
> >>
> >> devm_iio_*() ?
> >>
> >>> @@ -334,6 +435,7 @@ int adxl345_core_remove(struct device *dev)
> >>>         struct adxl345_data *data = iio_priv(indio_dev);
> >>>
> >>>         iio_device_unregister(indio_dev);
> >>> +       iio_triggered_buffer_cleanup(indio_dev);
> >>>         if (data->drdy_trig)
> >>>                 iio_trigger_unregister(data->drdy_trig);
> >>
> >> Ditto.
> >>
> >>> diff --git a/drivers/iio/accel/adxl345_i2c.c b/drivers/iio/accel/adxl345_i2c.c
> >>> index 8c791b8..1e0f071 100644
> >>> --- a/drivers/iio/accel/adxl345_i2c.c
> >>> +++ b/drivers/iio/accel/adxl345_i2c.c
> >>> @@ -30,6 +30,10 @@ static int adxl345_i2c_probe(struct i2c_client *client,
> >>>         bool use_int2 = false;
> >>>         int irq;
> >>>
> >>> +       if (!i2c_check_functionality(client->adapter,
> >>> +                                    I2C_FUNC_SMBUS_READ_I2C_BLOCK))
> >>> +               return -EOPNOTSUPP;
> >>
> >> And if driver works before, you make a regression here.
> > Absolutely. Need a fallback if it's not supported...
> 
> I believe regmap has a fallback, so that check could simply be removed, I guess.
> 

Yes, regmap does this check. I've seen it while working on the patchset.
I checked other drivers doing regmap and some have this check_functionality
check so I chose to include it because I'm not sure.

Will remove it on the next version.

Thanks,
Eva
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
