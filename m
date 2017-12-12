From: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Subject: Re: [PATCH net-next v5 2/2] net: ethernet: socionext: add AVE
 ethernet driver
Date: Tue, 12 Dec 2017 10:14:56 +0100
Message-ID: <CAOFm3uF65yY3zEfTzM888z2Se24uHyoWi8iy9eBn-x_SP8=kwA@mail.gmail.com>
References: <1512979049-15930-3-git-send-email-hayashi.kunihiko@socionext.com>
 <CAOFm3uELNTgenR91-QGL1QQ08zA0N0rQbH4hzCzFKtRw6TckLw@mail.gmail.com>
 <20171211210455.170A.4A936039@socionext.com> <CAA93ih2i+G2uyL8O-4F1juR1DpUYCd1U1dBCRRM5Xdd3L-m95g@mail.gmail.com>
 <20171211134627.GU10595@n2100.armlinux.org.uk> <CAA93ih0C-aMpFAhU+5x6P=QjiOVRPZ0UL1wyKh1oeXzC8UjPXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAA93ih0C-aMpFAhU+5x6P=QjiOVRPZ0UL1wyKh1oeXzC8UjPXQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux kernel mailing list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Masami-san,

On Tue, Dec 12, 2017 at 3:29 AM, Masami Hiramatsu
<masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
[...]
> Then what I'm considering is copyright notice lines. Those are usually
> treat as the header lines, not single line. So
>
>> +// SDPX-License-Identifier: GPL-2.0
>> +// sni_ave.c - Socionext UniPhier AVE ethernet driver
>> +// Copyright 2014 Panasonic Corporation
>> +// Copyright 2015-2017 Socionext Inc.
>
> is acceptable? or should we keep C-style header lines for new drivers?
>
>> +// SDPX-License-Identifier: GPL-2.0
>> +/*
>> + * sni_ave.c - Socionext UniPhier AVE ethernet driver
>> + * Copyright 2014 Panasonic Corporation
>> + * Copyright 2015-2017 Socionext Inc.
>> + */
>
> I just concern that those lines are not "single". that's all. :)

My voice carries the weight of a down feather in this discussion and
to me the benefit of the first form is that you have removed two
lines. Both forms work fine.

-- 
Cordially
Philippe Ombredanne
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
