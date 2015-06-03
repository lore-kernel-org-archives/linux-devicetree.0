From: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] iio: adc: hi-843x: Holt HI-8435/8436/8437 descrete
 ADC
Date: Wed, 03 Jun 2015 10:46:17 +0300
Message-ID: <556EB0C9.2040606@cogentembedded.com>
References: <1433161073-21967-1-git-send-email-vladimir.barinov@cogentembedded.com>	 <1433161211-22034-1-git-send-email-vladimir.barinov@cogentembedded.com> <1433315157.2361.100.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433315157.2361.100.camel@x220>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Paul,

On 03.06.2015 10:05, Paul Bolle wrote:
> Just a nit, that I spotted while scanning for other issues.
>
> On Mon, 2015-06-01 at 15:20 +0300, Vladimir Barinov wrote:
>> --- /dev/null
>> +++ b/drivers/iio/adc/hi-843x.c
>> +ssize_t hi843x_debounce_soft_show(struct device *dev,
>> +				  struct device_attribute *attr, char *buf)
>> +{
>> +	[...]
>> +}
>> +
>> +[...]
>> +
>> +ssize_t hi843x_threshold_socval_store(struct device *dev,
>> +				      struct device_attribute *attr,
>> +				      const char *buf, size_t len)
>> +{
>> +	[...]
>> +}
> It seems all these *_show and *_store functions should be made static,
> right?
Right. Thank you for pointing to this.

Regards,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
