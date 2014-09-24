From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] iio: iadc: Qualcomm SPMI PMIC current ADC driver
Date: Wed, 24 Sep 2014 18:10:46 +0100
Message-ID: <20140924171046.GM5729@leverpostej>
References: <1411567103-2380-1-git-send-email-iivanov@mm-sol.com>
 <20140924145527.GI5729@leverpostej>
 <1411574442.18580.95.camel@iivanov-dev>
 <20140924170522.GL5729@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140924170522.GL5729@leverpostej>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > > > +
> > > > +- qcom,rsense:
> > > > +    Usage: optional
> > > > +    Value type: <u32>
> > > > +    Definition: External sense register value in Ohm. Defining this
> > > > +            propery will instruct ADC to use external ADC sense channel.
> > > > +            If property is not defined ADC will use internal sense channel.
> > > 
> > > The latter two sentences sound like a driver description.
> > > 
> > > What exactly is the difference between the internal and external
> > > channels, and what exactly is the value in the sense register used for?
> > 
> > Internal - when using chip build-in resistor
> > External - when using off-chip resistor
> 
> Would it be possible to use the internal channel when you have an
> external resistor?
> 
> If so, does the device have a channel per resistor, or can either
> resistor be selected and applied to the single channel the device has?
> 
> This might be better worded as "external-registor-ohms".

I meant to say "external-resistor-ohms".

Muscle memory and lack of coffee got the better of me.

Mark.
