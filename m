From: Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH net-next v5 2/2] net: ethernet: socionext: add AVE
 ethernet driver
Date: Mon, 11 Dec 2017 22:34:17 +0900
Message-ID: <CAA93ih2i+G2uyL8O-4F1juR1DpUYCd1U1dBCRRM5Xdd3L-m95g@mail.gmail.com>
References: <1512979049-15930-3-git-send-email-hayashi.kunihiko@socionext.com>
 <CAOFm3uELNTgenR91-QGL1QQ08zA0N0rQbH4hzCzFKtRw6TckLw@mail.gmail.com> <20171211210455.170A.4A936039@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171211210455.170A.4A936039-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux kernel mailing list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

2017-12-11 21:04 GMT+09:00 Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>:
> On Mon, 11 Dec 2017 10:19:15 +0100 Phlippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org> wrote:
>
>> Dear Kunihiko-san,
>>
>> On Mon, Dec 11, 2017 at 8:57 AM, Kunihiko Hayashi
>> <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
>> > The UniPhier platform from Socionext provides the AVE ethernet
>> > controller that includes MAC and MDIO bus supporting RGMII/RMII
>> > modes. The controller is named AVE.
>> >
>> > Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
>> > Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> > Reviewed-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
>> [...]
>> > --- /dev/null
>> > +++ b/drivers/net/ethernet/socionext/Makefile
>> > @@ -0,0 +1,5 @@
>> > +# SPDX-License-Identifier: GPL-2.0
>>
>> You are correctly using SPDX ids here....
>>
>> > +obj-$(CONFIG_SNI_AVE) += sni_ave.o
>> > diff --git a/drivers/net/ethernet/socionext/sni_ave.c b/drivers/net/ethernet/socionext/sni_ave.c
>> > new file mode 100644
>> > index 0000000..7b293c2
>> > --- /dev/null
>> > +++ b/drivers/net/ethernet/socionext/sni_ave.c
>> > @@ -0,0 +1,1744 @@
>> > +/**
>> > + * sni_ave.c - Socionext UniPhier AVE ethernet driver
>> > + *
>> > + * Copyright 2014 Panasonic Corporation
>> > + * Copyright 2015-2017 Socionext Inc.
>> > + *
>> > + * This program is free software: you can redistribute it and/or modify
>> > + * it under the terms of the GNU General Public License version 2  of
>> > + * the License as published by the Free Software Foundation.
>> > + *
>> > + * This program is distributed in the hope that it will be useful,
>> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> > + * GNU General Public License for more details.
>> > + */
>>
>> ... then I guess you could also use them here, replacing at least 7
>> lines of boilerplate by a single id line?
>>
>> > +// SDPX-License-Identifier: GPL-2.0
>
> Thank you for your kindly comment.
>
> It seems there are few ethernet drivers applying SPDX-License-Identifier
> to C source, then it has been difficult for me to decide whether to replace
> boilerplate.
>
> If it's no problem to apply SPDX to sources of ethernet drivers,
> I'll replace it with the single line.
>
>> And if you go C++ style all the way, this could be even more compact:
>>
>> > +// SDPX-License-Identifier: GPL-2.0
>> > +// sni_ave.c - Socionext UniPhier AVE ethernet driver
>> > +// Copyright 2014 Panasonic Corporation
>> > +// Copyright 2015-2017 Socionext Inc.
>
> It's much simpler.
> If it's reasonable to apply this style here, I can replace it, too.

IMHO, even if we use SPDX license identifier, I recommend to use
C-style comments as many other files do, since it is C code.
If SPDX identifier requires C++ style, that is SPDX parser's issue
and should be fixed to get it from C-style comment.

https://spdx.org/sites/cpstandard/files/pages/files/using_spdx_license_list_short_identifiers.pdf

Anyway, SPDX.org itself shows C-style (short header) example. See page 6.

Thank you,

>
> Thank you,
>
> ---
> Best Regards,
> Kunihiko Hayashi
>
>



-- 
Masami Hiramatsu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
