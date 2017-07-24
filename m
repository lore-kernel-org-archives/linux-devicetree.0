From: Jonathan Cameron <Jonathan.Cameron-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] iio: adc: stm32: add optional min-sample-time
Date: Mon, 24 Jul 2017 23:06:06 +0800
Message-ID: <20170724230606.00001044@huawei.com>
References: <1500381332-17086-1-git-send-email-fabrice.gasnier@st.com>
        <1500381332-17086-4-git-send-email-fabrice.gasnier@st.com>
        <20170723120022.7d06063e@kernel.org>
        <80041c76-4428-9330-6dcb-4ca0f718d2e3@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <80041c76-4428-9330-6dcb-4ca0f718d2e3-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 24 Jul 2017 10:16:00 +0200
Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org> wrote:

> On 07/23/2017 01:00 PM, Jonathan Cameron wrote:
> > On Tue, 18 Jul 2017 14:35:32 +0200
> > Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org> wrote:
> >   
> >> STM32 ADC allows each channel to be sampled with a different sampling time,
> >> by setting SMPR registers. Basically, value depends on local electrical
> >> properties. Selecting correct value for sampling time highly depends on
> >> analog source impedance. There is a manual that may help in this process:
> >> 'How to get the best ADC accuracy in STM32...'
> >>
> >> This patch allows to configure min-sample-time via device tree, either for:
> >> - all channels at once:
> >> min-sample-time = <10000>; /* nanosecs */
> >>
> >> - independently for each channel (must match "st,adc-channels" list):
> >> st,adc-channels = <0 1>;
> >> min-sample-time = <5000 10000>; /* nanosecs */
> >>
> >> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>  
> > 
> > On question inline which may well just be down to me missing what
> > happens when you query index element 2 from a 1 element device tree
> > array.  
> 
> Hi Jonathan,
> 
> I should probably comment on it, please see inline.
> 
<snip>
> >>  }
> >> @@ -1538,8 +1651,8 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev)
> >>  	struct property *prop;
> >>  	const __be32 *cur;
> >>  	struct iio_chan_spec *channels;
> >> -	int scan_index = 0, num_channels;
> >> -	u32 val;
> >> +	int scan_index = 0, num_channels, ret;
> >> +	u32 val, smp = 0;
> >>  
> >>  	num_channels = of_property_count_u32_elems(node, "st,adc-channels");
> >>  	if (num_channels < 0 ||
> >> @@ -1548,6 +1661,13 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev)
> >>  		return num_channels < 0 ? num_channels : -EINVAL;
> >>  	}
> >>  
> >> +	/* Optional sample time is provided either for each, or all channels */
> >> +	ret = of_property_count_u32_elems(node, "min-sample-time");
> >> +	if (ret > 1 && ret != num_channels) {
> >> +		dev_err(&indio_dev->dev, "Invalid min-sample-time\n");
> >> +		return -EINVAL;
> >> +	}
> >> +
> >>  	channels = devm_kcalloc(&indio_dev->dev, num_channels,
> >>  				sizeof(struct iio_chan_spec), GFP_KERNEL);
> >>  	if (!channels)
> >> @@ -1558,9 +1678,13 @@ static int stm32_adc_chan_of_init(struct iio_dev *indio_dev)
> >>  			dev_err(&indio_dev->dev, "Invalid channel %d\n", val);
> >>  			return -EINVAL;
> >>  		}
> >> +
> >> +		of_property_read_u32_index(node, "min-sample-time", scan_index,
> >> +					   &smp);
> >> +  
> > I might be missing something, but doesn't this fail for the single shared
> > value case?  
> 
> Yes, this fails in the single shared value case, with index >= 1.
> Rewinding... when index is 0, it picks up 1st (shared) value.
> Then fails for other index values.
> 
> of_property_read_u32_index() documentation states out value remains
> untouched in case of error:
> /**
>  * of_property_read_u32_index...
> [...]
>  * The out_value is modified only if a valid u32 value can be decoded.
> 
> This is what I use here (as far as I tested it, it worked like a charm).
> Do you wish I add a comment to describe this ?
Probably best or I'll forget sometime down the line and think it looks
crazy again ;)

Thanks for the explanation.

Jonathan
> 
> Please let me know,
> Best Regards,
> Fabrice
> 
> >>  		stm32_adc_chan_init_one(indio_dev, &channels[scan_index],
> >>  					&adc_info->channels[val],
> >> -					scan_index);
> >> +					scan_index, smp);
> >>  		scan_index++;
> >>  	}
> >>  
> >> @@ -1755,6 +1879,7 @@ static int stm32_adc_remove(struct platform_device *pdev)
> >>  	.clk_required = true,
> >>  	.start_conv = stm32f4_adc_start_conv,
> >>  	.stop_conv = stm32f4_adc_stop_conv,
> >> +	.smp_cycles = stm32f4_adc_smp_cycles,
> >>  };
> >>  
> >>  static const struct stm32_adc_cfg stm32h7_adc_cfg = {
> >> @@ -1766,6 +1891,7 @@ static int stm32_adc_remove(struct platform_device *pdev)
> >>  	.stop_conv = stm32h7_adc_stop_conv,
> >>  	.prepare = stm32h7_adc_prepare,
> >>  	.unprepare = stm32h7_adc_unprepare,
> >> +	.smp_cycles = stm32h7_adc_smp_cycles,
> >>  };
> >>  
> >>  static const struct of_device_id stm32_adc_of_match[] = {  
> >   
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
