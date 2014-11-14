From: Howard Chen <ibanezchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 1/4] ARM: mediatek: Add basic support for mt6592
Date: Fri, 14 Nov 2014 13:03:17 +0800
Message-ID: <CAHwZioFS==fkVKUEa7Qs6NUm6Q-N9npBFz-nj-s_mDiW6mcSkQ@mail.gmail.com>
References: <1415808457-4030-1-git-send-email-ibanezchen@gmail.com>
	<CABuKBeJv0S2Q4W1fqb=8BUG6AEvFsZ6sY9QXuz=CRe+qbaYzQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABuKBeJv0S2Q4W1fqb=8BUG6AEvFsZ6sY9QXuz=CRe+qbaYzQQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 14, 2014 at 12:17 AM, Matthias Brugger
<matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 2014-11-12 17:07 GMT+01:00 Howard Chen <ibanezchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>> * A dtsi for boards based on Mediatek MT6592 SoCs
>> * Compatible string in arch/arm/mach-mediatek/mediatek.c
>>
>> Signed-off-by: Howard Chen <ibanezchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/mt6592.dtsi     | 97 +++++++++++++++++++++++++++++++++++++++
>>  arch/arm/mach-mediatek/mediatek.c |  1 +
>>  2 files changed, 98 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/mt6592.dtsi
>>
>> diff --git a/arch/arm/boot/dts/mt6592.dtsi b/arch/arm/boot/dts/mt6592.dtsi
>> new file mode 100644
>> index 0000000..65aa81b
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/mt6592.dtsi
>> @@ -0,0 +1,97 @@
>> +/*
>> + * Copyright (c) 2014 MediaTek Inc.
>> + * Author: Howard Chen <ibanezchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include "skeleton.dtsi"
>
> Regarding a discussion I had with Joe and Arnd [0], I think we should
> use skeleton64.dtsi here, right?
> The datasheets states that mt6592 supports up to 8 GB.
>
> [0] https://lkml.org/lkml/2014/11/4/192


  No, the maximum addressing capacity of mt6592 is 2G bytes.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
