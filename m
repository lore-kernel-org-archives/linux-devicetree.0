From: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] iio: adc: hi-843x: Holt HI-8435/8436/8437 descrete
 ADC
Date: Fri, 19 Jun 2015 00:41:49 +0300
Message-ID: <55833B1D.8000407@cogentembedded.com>
References: <1433161073-21967-1-git-send-email-vladimir.barinov@cogentembedded.com> <1433161211-22034-1-git-send-email-vladimir.barinov@cogentembedded.com> <55746D35.1030409@kernel.org> <55831CF3.3070906@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55831CF3.3070906-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lars,

Thank you for the review.

On 18.06.2015 22:33, Lars-Peter Clausen wrote:
> On 06/07/2015 06:11 PM, Jonathan Cameron wrote:
>> On 01/06/15 13:20, Vladimir Barinov wrote:
>>> Add Holt descrete ADC driver for HI-8435/8436/8437 chips
>>>
>>> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>> Hmm. The main issue here is one man's discrete ADC is another man's
>> configurable general purpose input device.
>
> The term discrete ADC is a bit ambiguous and I'm not even sure if this 
> is the right term for this kind of device.
>
> I'd call this a threshold detector. The device seems to have two 
> comparators for each channel, one for the lower threshold, one for the 
> upper threshold. If the voltage level goes above the upper threshold a 
> FF is set, if it goes below the lower threshold the FF is cleared. 
> Both transitions happen asynchronously as soon has the signal is 
> below/above the threshold. And while converts a analog signal to 
> digital one this is not what you typically call a ADC.

Should this be a separate/new directory in the drivers/iio/ for such driver?
What the type of iio_chan_spec should I use instead of IIO_VOLTAGE?

>
>>
>> I wonder if we want to take this oportunity to add 1 bit packing to the
>> demux etc in the IIO core so we can have tighter packing on these
>> values.  Shouldn't be too hard to do and we probably do want it if we 
>> are
>> going to support these sorts of devices.
>>
>> Will take a bit of shuffling to pack the relevant channels together 
>> if only
>> a subset are enabled and to notice when no repacking at all is needed.
>> This will probably first one implementing in the core and pushing out 
>> into
>> the dummy driver to allow for testing of corner cases.
>
> Yeah, the bit shuffling gets quite cumbersome and potentially 
> expensive. I think we should try to avoid it if at least one of the 
> channels in the same bank is enabled all of them are read. And then 
> let userspace figure out which bits it wants to use.
>
> But how exactly is the typical expect usage of this device. Like how 
> would a userspace application use it? Is buffered mode where samples 
> are taken in a continuous mode something that is really needed?
I was expecting to use triggered buffer for this device:
1) setup threshold levels via sysfs
2) enable scan elements
3) setup trigger
4) grab data from triggered iio buffer like the 
tools/iio/generic_buffer.c does, f.e.
./generic_buffer -n hi-8435 -t irqtrig0 -l 100 -c 1000

Actually I understand that I can just read manually the 
/sysfs/.../in_voltageXX_raw (or new/other name) values but using of iio 
generic irq trigger would be very good.

About bits shuffling/separating.  I do think we can use banks byte 
length for one iio channel instead of 1-bit length to avoid such complexity.
Then let user space separate bank's channels by itself.

Regards,
Vladimir

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
