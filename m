From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] Input: bcm-keypad: Add Broadcom keypad controller
Date: Sat, 28 Feb 2015 07:36:02 -0800
Message-ID: <54F1E062.8070609@broadcom.com>
References: <Scott Branden <sbranden@broadcom.com>	 <1424966930-28097-1-git-send-email-sbranden@broadcom.com>	 <1424966930-28097-3-git-send-email-sbranden@broadcom.com> <1425132978.24292.39.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425132978.24292.39.camel@x220>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Yes, will correct.  Thanks.

On 15-02-28 06:16 AM, Paul Bolle wrote:
> On Thu, 2015-02-26 at 08:08 -0800, Scott Branden wrote:
>> Add driver for Broadcom's keypad controller.
>>
>> Broadcom Keypad controller is used to interface a SoC with a matrix-type
>> keypad device. The keypad controller supports multiple row and column lines.
>> A key can be placed at each intersection of a unique row and a unique column.
>> The keypad controller can sense a key-press and key-release and report the
>> event using a interrupt to the cpu.
>>
>> Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> ---
>>   drivers/input/keyboard/Kconfig      |  10 +
>>   drivers/input/keyboard/Makefile     |   1 +
>>   drivers/input/keyboard/bcm-keypad.c | 464 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 475 insertions(+)
>>   create mode 100644 drivers/input/keyboard/bcm-keypad.c
>
> License nit follows.
>
>> diff --git a/drivers/input/keyboard/bcm-keypad.c b/drivers/input/keyboard/bcm-keypad.c
>> new file mode 100644
>> index 0000000..f229ac0
>> --- /dev/null
>> +++ b/drivers/input/keyboard/bcm-keypad.c
>> @@ -0,0 +1,464 @@
>> +/*
>> + * Copyright (C) 2014 Broadcom Corporation
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License as
>> + * published by the Free Software Foundation version 2.
>
> This states that the license is GPL v2 only.
>
>> + *
>> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any
>> + * kind, whether express or implied; without even the implied warranty
>> + * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>
> [...]
>
>> +MODULE_LICENSE("GPL");
>
> So you probably want
>      MODULE_LICENSE("GPL v2");
>
>
> Paul Bolle
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
