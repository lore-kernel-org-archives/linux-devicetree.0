From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] iio: core: Introduce IIO_CHAN_INFO_CALIBREPETITIONS
Date: Wed, 22 Apr 2015 22:00:45 +0100
Message-ID: <55380BFD.4060401@kernel.org>
References: <1429267830-13681-1-git-send-email-irina.tirdea@intel.com> <1429267830-13681-2-git-send-email-irina.tirdea@intel.com> <55328A92.9020807@kernel.org> <1F3AC3675D538145B1661F571FE1805F19A5B355@irsmsx105.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1F3AC3675D538145B1661F571FE1805F19A5B355-pww93C2UFcwu0RiL9chJVbfspsVTdybXVpNB7YpNyf8@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Tirdea, Irina" <irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 22/04/15 12:33, Tirdea, Irina wrote:
> 
> 
>> -----Original Message-----
>> From: Jonathan Cameron [mailto:jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
>> Sent: 18 April, 2015 19:47
>> To: Tirdea, Irina; linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Hartmut Knaack; Lars-Peter Clausen; Peter Meerwald; Rob Herring; Pawel Moll; Mark Rutland; Ian
>> Campbell; Kumar Gala
>> Subject: Re: [PATCH 1/3] iio: core: Introduce IIO_CHAN_INFO_CALIBREPETITIONS
>>
>> On 17/04/15 11:50, Irina Tirdea wrote:
>>> Some magnetometers can perform a number of repetitions in HW
>>> for each measurement to increase accuracy. One example is
>>> Bosch BMC150:
>>> http://ae-bst.resource.bosch.com/media/products/dokumente/bmc150/BST-BMC150-DS000-04.pdf.
>>>
>>> Introduce an interface to set the number of repetitions
>>> for these devices.
>>>
>>> Signed-off-by: Irina Tirdea <irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  Documentation/ABI/testing/sysfs-bus-iio | 10 ++++++++++
>>>  drivers/iio/industrialio-core.c         |  1 +
>>>  include/linux/iio/iio.h                 |  1 +
>>>  3 files changed, 12 insertions(+)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
>>> index 866b4ec..74c1444 100644
>>> --- a/Documentation/ABI/testing/sysfs-bus-iio
>>> +++ b/Documentation/ABI/testing/sysfs-bus-iio
>>> @@ -1375,3 +1375,13 @@ Description:
>>>  		The emissivity ratio of the surface in the field of view of the
>>>  		contactless temperature sensor.  Emissivity varies from 0 to 1,
>>>  		with 1 being the emissivity of a black body.
>>> +
>>> +What:		/sys/bus/iio/devices/iio:deviceX/in_magn_x_calibrepetitions
>>> +What:		/sys/bus/iio/devices/iio:deviceX/in_magn_y_calibrepetitions
>>> +What:		/sys/bus/iio/devices/iio:deviceX/in_magn_z_calibrepetitions
>>> +KernelVersion:	4.2
>>> +Contact:	linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> +Description:
>>> +		Hardware applied number of repetitions for acquiring one
>>> +		data point. The HW will do <type>[_name]_calibrepetitions
>>> +		measurements and return the average value as output data.
>> This is an interesting way of naming what is often referred to as oversampling.
>> I'd like to get some other opinions on naming before we go with the ABI for this..
>>
>> We do have one driver in staging exporting oversampling_ratio which is probably
>> the same thing, but that ABI was never standardized so I have no problem with
>> ignoring that one case.  A couple of other drivers provide oversampling control
>> via platform data.   We must make sure we give a sensible default for this.
>>
> I didn't know about the oversampling_ratio. I used "repetitions" because Bosch calls them so
> in the datasheet.
> However, I think oversampling_ratio is a better name since it suggests a
> connection with sampling. I will change it to oversampling_ratio in v2 and then
> wait for more opinions on this.
> 
>> There is also the interesting question of whether sampling_frequency applies
>> before or after this...  I'd argue after, but again would like more opinions
>> before we dictate that.  However, whatever we choose should definitely be
>> documented here!
>>
> The HW sees the sampling_frequency as the frequency the user sees, so it does not take into
> account the oversampling_ratio: each value resulted after oversampling_ratio repetitions is
> considered one sample for the sampling_frequency. However, I am not sure how other
> devices handle this so more opinions on this would be useful.
That description works for me. Put something like this in the docs and
hopefully we will be consistent across devices.
> 
> Looking more into the oversampling ratio from BMC150, seems there are some
> sampling limitations I missed the first time: when setting a certain value for x/y/z repetitions,
> not all sampling rates are available.  I am going to fix this in v2 by not allowing invalid
> sampling rates once a certain value for oversampling_ratio is set.
Cool. As long as you update sampling_frequency_available that's fine.

J
> 
> Thanks,
> Irina
> 
>>> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
>>> index 7c98bc1..9e0da7f 100644
>>> --- a/drivers/iio/industrialio-core.c
>>> +++ b/drivers/iio/industrialio-core.c
>>> @@ -129,6 +129,7 @@ static const char * const iio_chan_info_postfix[] = {
>>>  	[IIO_CHAN_INFO_DEBOUNCE_COUNT] = "debounce_count",
>>>  	[IIO_CHAN_INFO_DEBOUNCE_TIME] = "debounce_time",
>>>  	[IIO_CHAN_INFO_CALIBEMISSIVITY] = "calibemissivity",
>>> +	[IIO_CHAN_INFO_CALIBREPETITIONS] = "calibrepetitions",
>>>  };
>>>
>>>  /**
>>> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
>>> index b1e46ae..07fbfb2 100644
>>> --- a/include/linux/iio/iio.h
>>> +++ b/include/linux/iio/iio.h
>>> @@ -44,6 +44,7 @@ enum iio_chan_info_enum {
>>>  	IIO_CHAN_INFO_DEBOUNCE_COUNT,
>>>  	IIO_CHAN_INFO_DEBOUNCE_TIME,
>>>  	IIO_CHAN_INFO_CALIBEMISSIVITY,
>>> +	IIO_CHAN_INFO_CALIBREPETITIONS,
>>>  };
>>>
>>>  enum iio_shared_by {
>>>
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
