From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 2/2] iio: vadc: Qualcomm SPMI PMIC voltage ADC driver
Date: Wed, 12 Nov 2014 10:55:11 +0200
Message-ID: <1415782511.4820.2.camel@mm-sol.com>
References: <1415028270-25860-1-git-send-email-iivanov@mm-sol.com>
		 <1415028270-25860-3-git-send-email-iivanov@mm-sol.com>
		 <54612A0D.7020308@gmx.de> <1415694109.22935.13.camel@mm-sol.com>
	 <54629026.3080002@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54629026.3080002-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Tue, 2014-11-11 at 23:39 +0100, Hartmut Knaack wrote:
> Ivan T. Ivanov schrieb am 11.11.2014 09:21:
> > Hi Hartmut,
> > 
> > On Mon, 2014-11-10 at 22:11 +0100, Hartmut Knaack wrote:
> > > Ivan T. Ivanov schrieb am 03.11.2014 16:24:
> > > > From: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> > > > 
> > > > The voltage ADC is peripheral of Qualcomm SPMI PMIC chips. It has
> > > > 15 bits resolution and register space inside PMIC accessible across
> > > > SPMI bus.
> > > > 
> > > > The vadc driver registers itself through IIO interface.
> > > Reviewing again, I got the feeling that due to the complexity of adc reads (writing to 
> > > register
> > > to start conversion, waiting a decent time for the conversion to complete, reading the 
> > > result),
> > > it would be beneficial to use a mutex in vadc_read_raw or its depending functions.
> > 
> > Hm, yes, but there is such a nice info_exist_lock :-) in core functions,
> > which in practice serve the same purpose.
> I seem to miss that. Please point me in the right direction.

I am referring to info_exist_lock mutex part of struct iio_dev. 
It protects all operations inkern.c, no?

> > > 
> > > > +
> > > > +       ret = of_property_read_u32(node, "reg", &res);
> > > For u16, there would be of_property_read_u16().
> > > > +       if (ret < 0)
> > > > +       return -ENODEV;
> > > Just return ret here?
> > 
> > I am usually trying to follow these recommendations[1]. In practice driver
> > core cares only for EPROBE_DEFER, ENODEV and ENXIO, while of_property_read_u32()
> > can return ENODATA and EOVERFLOW, which did't not make sense for the core.
> Please point me in the right direction on this one, too. It is pretty common to pass error codes 
> up, as it is also mentioned in [1].

Yes, I know that is common to just pass error codes up, but in this case it did't 
make too much sense, I think. Also take a look at realy_probe() and line 343.

> Yet, this thread in [1] seems more like a draft to me, as Greg K-H wrote in the end: "Fair 
> enough, care to respin this and send it out to me for review?"



Yes, but it make sense to me.

Regards,
Ivan
