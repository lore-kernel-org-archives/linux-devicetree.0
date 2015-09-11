From: Adriana Reus <adriana.reus-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 2/2] devicetree: Add documentation for UPISEMI us5182d
 ALS and Proximity sensor
Date: Fri, 11 Sep 2015 14:55:46 +0300
Message-ID: <55F2C142.8010605@intel.com>
References: <1440065534-8601-1-git-send-email-adriana.reus@intel.com>
 <1440065534-8601-3-git-send-email-adriana.reus@intel.com>
 <55DF71A5.1010705@kernel.org>
 <CAL_Jsq+uvhaE77yXqKGXF_p6gAV5F+rPwnT547ym-o23=3fR+w@mail.gmail.com>
 <55ED985E.8070806@intel.com> <55EF85E5.5070708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55EF85E5.5070708-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi,

Sorry for my delayed response, answers inline.

Thank you,
Adriana
On 09.09.2015 04:05, Rob Herring wrote:
> On 09/07/2015 08:59 AM, Adriana Reus wrote:
>> Thanks for your feedback, some comments inline.
>>
>> On 31.08.2015 18:38, Rob Herring wrote:
>>> On Thu, Aug 27, 2015 at 3:23 PM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> wrote:
>>>> On 20/08/15 11:12, Adriana Reus wrote:
>>>>> Added entries in i2c/vendor-prefixes for the us5182d als and
>>>>> proximity sensor.
>>>>> Also added a documentation file for this sensor's properties.
>>>>>
>>>>> Signed-off-by: Adriana Reus <adriana.reus-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>>>> This isn't that trivial so I'd like some device tree maintainer
>>>> input if possible.
>>>
>>> It seems fairly reasonable to me. Would other ALS or proximity sensors
>>> need similar properties?
>> The "glass-coef" is intended to compensate for the material (glass) that
>> may be covering the sensor if it's integrated in a phone, tablet etc. I
>> chose 1000 as resolution for this scaling factor (i'll add a more
>> detailed description). So possibly similar properties could be used for
>> other als sensors as well.
>
> Seems like amstaos,cover-comp-gain would be doing the same thing. But it
> is defined as an integer, so I'm not sure how that would work.
Indeed it seems similar. I had a quick look over it and from what I 
understand it seems to act like a straightforward scaling factor, only 
difference being that it's an int, I opted to float for a better tuning 
and resolution.
>
>>
>> The last 3 tuning parameters are specific to this particular sensor.
>>>
>>>> For now I've backed out the driver from my tree (given timing we have
>>>> loads of time to sort this out!)
>>>>
>>>> Anyhow, anyone device tree related able to take a look at this.
>>>>
>>>> Adriana, btw these should be cc'd to the device tree maintainers in
>>>> the first place (now added).
>>>>
>>>> Jonathan
>>>>> ---
>>>>>    .../devicetree/bindings/iio/light/us5182d.txt      | 23
>>>>> ++++++++++++++++++++++
>>>>>    .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>>>>>    2 files changed, 24 insertions(+)
>>>>>    create mode 100644
>>>>> Documentation/devicetree/bindings/iio/light/us5182d.txt
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/iio/light/us5182d.txt
>>>>> b/Documentation/devicetree/bindings/iio/light/us5182d.txt
>>>>> new file mode 100644
>>>>> index 0000000..7785c56
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/iio/light/us5182d.txt
>>>>> @@ -0,0 +1,23 @@
>>>>> +* UPISEMI us5182d I2C ALS and Proximity sensor
>>>>> +
>>>>> +Required properties:
>>>>> +- compatible: must be "upisemi,usd5182"
>>>>> +- reg: the I2C address of the device
>>>>> +
>>>>> +Optional properties:
>>>
>>> Do you expect certain defaults if not present? Some description of how
>>> all these values are determined would be useful.
>> Yes, if not present they will fall back to default values - the values
>> in the example.
>> - the glass-coef one is 1000 by default - so no glass compensation by
>> default (lux = lux * 1000/1000)
>> - the others were determined experimentally - by fine tuning starting
>> from the default values in those registers).
>
> So the default if the properties are not present is a default register
> value or a default in the driver?

A default in the driver.
>
> Rob
>
