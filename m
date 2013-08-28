From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/2] staging: iio: Documentation sysfs-bus-iio add
 power_mode
Date: Wed, 28 Aug 2013 20:16:32 +0100
Message-ID: <521E4C90.5080608@kernel.org>
References: <1377687678-5761-1-git-send-email-o.v.kravchenko@globallogic.com> <521E1255.2090201@linux.intel.com> <521E12FF.4030709@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <521E12FF.4030709-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Oleksandr Kravchenko <o.v.kravchenko-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org, denis.ciocca-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/28/13 16:10, Jonathan Cameron wrote:
> On 28/08/13 16:08, Srinivas Pandruvada wrote:
>> On 08/28/2013 04:01 AM, Oleksandr Kravchenko wrote:
>>> Add description about in_accelX_power_mode and
>>> in_accel_power_mode_available.
>>>
>>> Signed-off-by: Oleksandr Kravchenko <o.v.kravchenko-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org>
Applied.  Note that neither this nor the next patch applied cleanly. In both
cases some of the context was missing.  Could you check the resulting
merge.  Seems fine to me, but I have messed these up before!

Jonathan
>>> ---
>>>   Documentation/ABI/testing/sysfs-bus-iio |   10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-bus-iio
>>> b/Documentation/ABI/testing/sysfs-bus-iio
>>> index dda81ff..1a333f3 100644
>>> --- a/Documentation/ABI/testing/sysfs-bus-iio
>>> +++ b/Documentation/ABI/testing/sysfs-bus-iio
>>> @@ -792,3 +792,13 @@ Contact:    linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>   Description:
>>>           This attribute is used to read the amount of quadrature error
>>>           present in the device at a given time.
>>> +
>>> +What:        /sys/.../iio:deviceX/in_accelX_power_mode
>> Shall we add power_mode to all sensors not just accelerometer? HID
>> sensor hub spec allows every sensor in it to go low power mode.
>> This is not same as OFF.
> Feel free to add the relevant lines in the patch that adds the attribute.  We should not add stuff here that is not used.
> 
>>> +KernelVersion:    3.11
>>> +Contact:    linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> +Description:
>>> +        Specifies the chip power mode.
>>> +        low_noise: reduce noise level from ADC,
>>> +        low_power: enable low current consumption.
>>> +        For a list of available output power modes read
>>> +        in_accel_power_mode_available.
>>
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
