From: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/4] iio: dpot-dac: DAC driver based on a digital
 potentiometer
Date: Thu, 20 Oct 2016 16:08:55 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1610201604280.22512@pmeerw.net>
References: <1476955562-13673-1-git-send-email-peda@axentia.se> <1476955562-13673-3-git-send-email-peda@axentia.se> <alpine.DEB.2.02.1610201254370.19919@pmeerw.net> <22d07498-860d-29f8-07ef-ae2f5df6ab25@axentia.se>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <22d07498-860d-29f8-07ef-ae2f5df6ab25-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


> >> +struct dpot_dac {
> >> +	struct regulator *vref;
> >> +	struct iio_channel *dpot;
> > 
> > const
> 
> const? devm_iio_channel_get doesn't return a const iio_channel. What
> am I missing?

ah, I mixed this up with iio_chan_spec
 
> >> +	u32 max_ohms;
> >> +};
> >> +
> >> +static const struct iio_chan_spec dpot_dac_iio_channel = {
> >> +	.type = IIO_VOLTAGE,
> >> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW)
> >> +			    | BIT(IIO_CHAN_INFO_SCALE),
> >> +	.output = 1,
> >> +};
> >> +
> >> +static int dpot_dac_read_raw(struct iio_dev *indio_dev,
> >> +			     struct iio_chan_spec const *chan,
> >> +			     int *val, int *val2, long mask)
> >> +{
> >> +	struct dpot_dac *dac = iio_priv(indio_dev);
> >> +	int ret;
> >> +	unsigned long long tmp;
> > 
> > s64 (which is used to cast below)
> 
> I assume that what you really want is to get rid of the cast, and
> that you aren't really bothered if tmp is ull or s32, right? Given
> that assumption, I'm just dropping the cast instead. The LL specifier
> on the constant should promote *val anyway.

what I meant to pick upon was mixing
s64 with unsigned long long with LL in the code that follows

anything simpler and more consistent would be good

thanks, p.

-- 

Peter Meerwald-Stadler
+43-664-2444418 (mobile)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
