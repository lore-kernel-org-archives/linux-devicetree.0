From: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: initial clock driver for TWL6030
Date: Wed, 30 Jul 2014 16:36:24 +0200
Message-ID: <53D902E8.1030008@kpanic.de>
References: <1406728949-7560-1-git-send-email-sassmann@kpanic.de> <1406728949-7560-3-git-send-email-sassmann@kpanic.de> <53D90159.7040307@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53D90159.7040307-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, t-kristo-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 30.07.2014 16:29, Andreas F=E4rber wrote:
> Hi Stefan,
>
> Glad you got it working. :)
>
> Small nit below:
>
> Am 30.07.2014 16:02, schrieb Stefan Assmann:
>> diff --git a/drivers/clk/ti/clk-6030.c b/drivers/clk/ti/clk-6030.c
>> new file mode 100644
>> index 0000000..baa965b
>> --- /dev/null
>> +++ b/drivers/clk/ti/clk-6030.c
>> @@ -0,0 +1,141 @@
>> +/*
>> + * drivers/clk/ti/clk-6030.c
>> + *
>> + *  Copyright (C) 2014 Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
>> + *
>> + * This program is free software; you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License version 2 a=
s
>> + * published by the Free Software Foundation.
>
> Here you say version 2 ...
>
>> + *
>> + * Clock driver for ti twl6030.
>> + */
> [...]
>> +MODULE_AUTHOR("Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>");
>> +MODULE_DESCRIPTION("clock driver for TI SoC based boards with twl60=
30");
>> +MODULE_LICENSE("GPL");
>
> ... but down here it's "GPL". Either use "GPL v2" here, or IIUC use t=
he
> "or (at your option) any later version" license above if you can.

Thanks for the hint. I'll fix it in the next version. :)

   Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
