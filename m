From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v3 1/3] iio: adc: Cosmic Circuits 10001 ADC driver
Date: Thu, 27 Nov 2014 16:16:58 +0100
Message-ID: <5477406A.8020403@metafoo.de>
References: <1415888044-16635-1-git-send-email-ezequiel.garcia@imgtec.com> <1415888044-16635-2-git-send-email-ezequiel.garcia@imgtec.com> <546FE3A7.6040308@gmx.de> <5474C062.2020604@imgtec.com> <5474F7A5.6030008@gmx.de> <5474FCC8.8080906@imgtec.com> <5475085E.8090806@gmx.de> <54773E63.4020300@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54773E63.4020300-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Pawel.Moll-5wv7dgnIgG8@public.gmane.org, Mark.Rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, Phani Movva <Phani.Movva-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[...]
>>>
>>>>>>> +
>>>>>>> +	adc_dev->reg = devm_regulator_get(&pdev->dev, "vref");
>>>>>>> +	if (IS_ERR_OR_NULL(adc_dev->reg))
>>>>>>> +		return -EINVAL;
>>>>>> 	if (IS_ERR(adc_dev->reg))
>>>>>> 		return PTR_ERR(adc_dev->reg);
>>>>>
>>>>> Are you sure? What if devm_regulator_get() returns NULL?
>>>>>
>>>> I had a look at it, but couldn't figure out a condition in which it would return NULL. But I'd be happy to be informed of anything different.
>>>
>>> If CONFIG_REGULATOR=n you get NULL there (although I added a select REGULATOR
>>> on the v4 I just posted).
>>>
>> Indeed, thanks. Now I'm thinking if it would make sense to handle this special case in a special way (as it would be caused by an invalid kernel config). Well, I guess, I leave it up to you.
>
> Well, adding the select REGULATOR that shouldn't happen, so let's better
> drop the NULL check entirely.

Doing a 'select REGULATOR' can (and probably will sooner or later) create 
nasty dependency loops. User selectable config items should not be selected 
by another config item. If the driver really has a hard dependency on the 
regulator framework then 'depends on REGULATOR' is the right thing to do.

- Lars
