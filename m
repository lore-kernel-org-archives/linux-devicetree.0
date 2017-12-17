From: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Subject: Re: [PATCH v2 9/9] ARM: dts: imx7: add Toradex Colibri iMX7D 1GB
 (eMMC) support
Date: Sun, 17 Dec 2017 23:55:36 +0100
Message-ID: <CAOFm3uHFcHnh-CHLfJwgeB1M8niWBtdpVv-f+Dr7b43f70zwbw@mail.gmail.com>
References: <20171217203723.15896-1-stefan@agner.ch> <20171217203723.15896-9-stefan@agner.ch>
 <CAOMZO5BXEj9AKeQEVNhDYMCydpe+PVnXjchvTAuuwdM7Yp6d2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5BXEj9AKeQEVNhDYMCydpe+PVnXjchvTAuuwdM7Yp6d2w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fabio,

On Sun, Dec 17, 2017 at 10:59 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Stefan,
>
> On Sun, Dec 17, 2017 at 6:37 PM, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org> wrote:
>
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/imx7d-colibri-emmc-eval-v3.dts
>> @@ -0,0 +1,20 @@
>> +/*
>> + * Copyright 2017 Toradex AG
>> + *
>> + * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> + */
>
> In the previous patch you used GPL-2.0 text, instead of GPL-2.0+.
>
> The SPDX line should be the first one and start with a // style comment:
>
> // SPDX-License-Identifier: (GPL-2.0 OR MIT)

Yes this line as the top line is the correct way as explained in
Thomas doc patches [1]
I cannot comment of whether the author wants GPL 2 or 2+ though KISS is best.

[1] https://lkml.org/lkml/2017/12/4/934

> Philippe, please confirm this is the correct way.
>
> With this fixed you can add:
>
> Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

-- 
Cordially
Philippe Ombredanne
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
