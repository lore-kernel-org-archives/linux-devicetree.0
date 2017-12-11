From: "Yang, Wenyou" <Wenyou.Yang-P1yVeZNtzML3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH v8 2/2] media: i2c: Add the ov7740 image sensor driver
Date: Mon, 11 Dec 2017 09:33:37 +0800
Message-ID: <d51138eb-0a59-034f-9810-dd72a1690ea2@Microchip.com>
References: <20171208015542.15444-1-wenyou.yang@microchip.com>
 <20171208015542.15444-3-wenyou.yang@microchip.com>
 <CAOFm3uFASPpuMtGSetcYME0pQEmuzoLqY=Yhv5aaFu5AzJwaew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOFm3uFASPpuMtGSetcYME0pQEmuzoLqY=Yhv5aaFu5AzJwaew-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Philippe,


On 2017/12/8 21:14, Philippe Ombredanne wrote:
> Wenyou,
>
> On Fri, Dec 8, 2017 at 2:55 AM, Wenyou Yang <wenyou.yang-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org> wrote:
>> The ov7740 (color) image sensor is a high performance VGA CMOS
>> image snesor, which supports for output formats: RAW RGB and YUV
>> and image sizes: VGA, and QVGA, CIF and any size smaller.
>>
>> Signed-off-by: Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>> Signed-off-by: Wenyou Yang <wenyou.yang-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> []
>> --- /dev/null
>> +++ b/drivers/media/i2c/ov7740.c
>> @@ -0,0 +1,1226 @@
>> +/*
>> + * Copyright (c) 2017 Microchip Corporation.
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License version
>> + * 2 as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>> + * GNU General Public License for more details.
>> + *
>> + */
> Have you considered using the new SPDX ids instead of this fine legalese?
> e.g.:
>
> // SPDX-License-Identifier: GPL-2.0
> // Copyright (c) 2017 Microchip Corporation.
>
> Short and neat! Check also Thomas doc patches and Linus comments on
> why he prefers the C++ comment style for these.
Thank you for your suggestion and information.


Best Regards,
Wenyou Yang
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
