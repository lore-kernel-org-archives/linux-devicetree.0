From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: BCM5301X: Add DT for Luxul XAP-1510
Date: Thu, 5 May 2016 00:36:24 +0200
Message-ID: <CACna6ryWGsOwBhhauJTROi2BPbmgGn_4oYnKc-L8-3Joy+5M7g@mail.gmail.com>
References: <1462296501-5209-1-git-send-email-dhaab@luxul.com>
	<572A453E.6010000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <572A453E.6010000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dan Haab <dhaab-RSK6WAzFx3QAvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 4 May 2016 at 20:53, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 03/05/16 10:28, Dan Haab wrote:
>> Luxul XAP-1510 is an AP device based on BCM4708 SoC. It uses flash
>> memory connected to the SPI controller.
>
> Looks fine, except one nit:
>
>> diff --git a/arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts b/arch/arm=
/boot/dts/bcm4708-luxul-xap-1510.dts
>> new file mode 100644
>> index 0000000..f4460b5
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts
>> @@ -0,0 +1,67 @@
>> +/*
>> + * Broadcom BCM470X / BCM5301X ARM platform code.
>> + * DTS for Luxul XAP-1510
>> + *
>> + * Copyright 2015 Luxul Inc.
>> + *
>> + * Licensed under the GNU/GPL. See COPYING for details.
>
> The ARM SoC maintainer have been asking to utilize a license which is
> also BSD compatible, so something along the lines of this one:
>
> arch/arm/boot/dts/bcm911360k.dts
>
> Do you mind respining the patch to include that kind of license heade=
r?

I wasn't aware of this neither. Shall we re-license existing DTS files
as well? I'm fine with changing them to BSD compatible.

I'm a bit confused by using BSD license only. Kernel is licensed under
GNU GPL version 2 and if there are some BSD compatible modules, they
use dual licensing model (BSD/GPL). Shouldn't we use BSD/GPL in DTS
files as well then?

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
