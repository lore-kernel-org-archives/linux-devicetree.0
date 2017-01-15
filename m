From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/2] iio: adc: Add Maxim MAX11100 driver
Date: Sun, 15 Jan 2017 16:41:50 +0100
Message-ID: <89b6a029-cbeb-e993-db9b-8ed6dbf3029e@gmail.com>
References: <1484301038-16386-1-git-send-email-jacopo+renesas@jmondi.org>
 <502b12a0-6011-c0eb-06b4-a40245d1d8db@jmondi.org>
 <a4fe9cd7-4854-d916-ae30-50a7668cec4e@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a4fe9cd7-4854-d916-ae30-50a7668cec4e-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, jacopo mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/15/2017 03:31 PM, Jonathan Cameron wrote:
> On 15/01/17 14:13, jacopo mondi wrote:
>> Hi Jonathan,
>>    thanks for review,
>>
>> On 13/01/2017 10:50, Jacopo Mondi wrote:
>>> Hello,
>>>    sending out v4 splitting device tree bindings documentation and actual ADC
>>> driver.
>>> No changes in driver code since v3.
>>>
>>> Same question for iio maintainers here:
>>> I would like to have clarified the measure unit returned by read_raw().
>>> Currently (value_raw * value_scale) return the ADC input value in mV.
> Good.
>>> While testing the patch I've been questioned if that should not actually
>>> be in uV. This is easily achievable making _scale return a value in uV.
>>> I have found no mention of this in the ABI documentation as it speaks of
>>> generic voltage. Can we have a final word on this?
>>
>> I see you have reviewed the driver without complaining for the
>> read_raw() measure unit, so I assume this replies to the above
>> question as well...
>>
> The units are specified in Documentation/ABI/testing/sysfs-bus-iio.
> 
>> What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY_raw
>> What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY_supply_raw
>> What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY_i_raw
>> What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY_q_raw
>> KernelVersion:	2.6.35
>> Contact:	linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Description:
>> 		Raw (unscaled no bias removal etc.) voltage measurement from
>> 		channel Y. In special cases where the channel does not
>> 		correspond to externally available input one of the named
>> 		versions may be used. The number must always be specified and
>> 		unique to allow association with event codes. Units after
>> 		application of scale and offset are millivolts.
> 
> So millivolts.  This comes from a, perhaps ill judged, decision to match
> hwmon units were we could.

Fun, regulator framework returns values in uV to add to the chaos :)


-- 
Best regards,
Marek Vasut
