From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 1/2] iio: vadc: Qualcomm SPMI PMIC voltage ADC driver
Date: Thu, 16 Oct 2014 16:58:56 +0300
Message-ID: <1413467936.6148.17.camel@mm-sol.com>
References: <1411563415-11933-1-git-send-email-svarbanov@mm-sol.com>
		 <1411563415-11933-2-git-send-email-svarbanov@mm-sol.com>
		 <542D1B11.8070600@mm-sol.com> <1412251686.1027.15.camel@iivanov-dev>
	 <542FDF41.2040106@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <542FDF41.2040106-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, lars <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Hi, 

On Sat, 2014-10-04 at 12:51 +0100, Jonathan Cameron wrote:
> On 02/10/14 13:08, Ivan T. Ivanov wrote:
> >  +iio maintainers
> > 
> >  On Thu, 2014-10-02 at 12:29 +0300, Ivan T. Ivanov wrote:
> > >  Hi Stan,
> > > >
> > >  On 09/24/2014 03:56 PM, Stanimir Varbanov wrote:
> > > >
> > >  <snip>
> > > >
> > > >  +static int vadc_get_dt_data(struct vadc_priv *vadc, struct 
> > > > device_node *node)
> > > >  +{
> > > >  +      struct iio_chan_spec *iio_chan = vadc->iio_chans;
> > > >  +      const struct vadc_channels *vadc_chan;
> > > >  +      struct vadc_channel_prop prop;
> > > >  +      struct device_node *child;
> > > >  +      int ret, index = 0;
> > > >  +
> > > >  +      for_each_available_child_of_node(node, child) {
> > > >  +      ret = vadc_get_dt_channel_data(vadc->dev, &prop, 
> > > > child);
> > > >  +      if (ret)
> > > >  +      return ret;
> > > >  +
> > > >  +      vadc->chan_props[index] = prop;
> > > >  +
> > > >  +      vadc_chan = &vadc_chans[prop.channel];
> > > >  +
> > > >  +      iio_chan->channel = prop.channel;
> > > >  +      iio_chan->datasheet_name = vadc_chan->datasheet_name;
> > > >  +      iio_chan->info_mask_separate = vadc_chan->info_mask;
> > > >  +      iio_chan->type = vadc_chan->type;
> > > >  +      iio_chan->indexed = 1;
> > > >  +      iio_chan->scan_type.sign = 's';
> > > >  +      iio_chan->scan_type.realbits = 15;
> > > >  +      iio_chan->scan_type.storagebits = 16;
> > > >  +      iio_chan->address = index++;
> > > >  +
> > > >  +      iio_chan++;
> > > >  +      }
> > > >  +
> > > >  +      return 0;
> > > >  +}
> > > >  +
> > > >
> > >  <snip>
> > > >
> > > >  +static int vadc_probe(struct platform_device *pdev)
> > > >  +{
> > > >
> > >  <snip>
> > > >
> > > >  +
> > > >  +      indio_dev->dev.parent = dev;
> > > >  +      indio_dev->dev.of_node = node;
> > > >  +      indio_dev->name = pdev->name;
> > > >  +      indio_dev->modes = INDIO_DIRECT_MODE;
> > > >  +      indio_dev->info = &vadc_info;
> > > >  +      indio_dev->channels = vadc->iio_chans;
> > > >  +      indio_dev->num_channels = vadc->nchannels;
> > > >
> > >  This will not work as we thought. Registration will be fine and 
> > > entries
> > >  in sysfs are created as expected, but this is breaking 
> > > numbering scheme
> > >  for client drivers. For us the problem is that iio framework 
> > > expect channels
> > >  numbering to be linear and channel number should not be greater 
> > > than
> > >  channel count. For example even if die temperature channel is 
> > > always 8, if
> > >  I describe only 5 channels in DTS files (4 for reference points 
> > > measurement)
> > >  and 1 for die temperature, clients could not get OF reference to
> > >  temperature
> > >  channel using io-channels = <&pm8941_vadc 8>;
> > > >
> > >  Jonathan, please, could you advise us.
> I'd like to let the solution you proposed sit on the list a little 
> longer.
> It seems fairly sensible, but lets see what others suggest.

It is quiet :-) Just for the record the same aproach is used in
PWM, Reset, Gpio and PHY frameworks.

Patch in question: https://lkml.org/lkml/2014/10/2/199

Regards,
Ivan


> 
> Jonathan
