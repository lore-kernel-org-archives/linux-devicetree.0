From: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 1/3] iio: adc: Cosmic Circuits 10001 ADC driver
Date: Thu, 27 Nov 2014 12:08:19 -0300
Message-ID: <54773E63.4020300@imgtec.com>
References: <1415888044-16635-1-git-send-email-ezequiel.garcia@imgtec.com> <1415888044-16635-2-git-send-email-ezequiel.garcia@imgtec.com> <546FE3A7.6040308@gmx.de> <5474C062.2020604@imgtec.com> <5474F7A5.6030008@gmx.de> <5474FCC8.8080906@imgtec.com> <5475085E.8090806@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5475085E.8090806-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Pawel.Moll-5wv7dgnIgG8@public.gmane.org, Mark.Rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, Phani Movva <Phani.Movva-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 11/25/2014 07:53 PM, Hartmut Knaack wrote:
> Ezequiel Garcia schrieb am 25.11.2014 23:03:
>>
>>
>> On 11/25/2014 06:41 PM, Hartmut Knaack wrote:
>>>>
>>>> Unless I'm missing something, that's exactly what XOR does.
>>>>
>>>> Example:
>>>>
>>>> reserved_channels = 0x2;
>>>> channel_map = 0x7 ^ reserved_channels -> 0x5
>>>>
>>> You miss to check ret for a valid range, which you don't need to do when masking out channels.
>>> Example:
>>> reserved_channels = 0x8;
>>> channel_map = 0x7 ^ reserved_channels -> 0xf
>>> And this is actually happening in the current revision (with the wrong channel_map assignment), that a reserved channel in DT would become usable.
>>
>> Right, definitely a check is needed.
> No, that's not needed when using AND, as it can not add bits in the channel map. The following will do the job:
> 		adc_dev->channel_map &= ~ret;

Gah, of course, that's way much better.

>>
>>>>>> +
>>>>>> +	adc_dev->reg = devm_regulator_get(&pdev->dev, "vref");
>>>>>> +	if (IS_ERR_OR_NULL(adc_dev->reg))
>>>>>> +		return -EINVAL;
>>>>> 	if (IS_ERR(adc_dev->reg))
>>>>> 		return PTR_ERR(adc_dev->reg);
>>>>
>>>> Are you sure? What if devm_regulator_get() returns NULL?
>>>>
>>> I had a look at it, but couldn't figure out a condition in which it would return NULL. But I'd be happy to be informed of anything different.
>>
>> If CONFIG_REGULATOR=n you get NULL there (although I added a select REGULATOR
>> on the v4 I just posted).
>>
> Indeed, thanks. Now I'm thinking if it would make sense to handle this special case in a special way (as it would be caused by an invalid kernel config). Well, I guess, I leave it up to you.

Well, adding the select REGULATOR that shouldn't happen, so let's better
drop the NULL check entirely.
-- 
Ezequiel
