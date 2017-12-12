From: Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH net-next v5 2/2] net: ethernet: socionext: add AVE
 ethernet driver
Date: Tue, 12 Dec 2017 11:29:25 +0900
Message-ID: <CAA93ih0C-aMpFAhU+5x6P=QjiOVRPZ0UL1wyKh1oeXzC8UjPXQ@mail.gmail.com>
References: <1512979049-15930-3-git-send-email-hayashi.kunihiko@socionext.com>
 <CAOFm3uELNTgenR91-QGL1QQ08zA0N0rQbH4hzCzFKtRw6TckLw@mail.gmail.com>
 <20171211210455.170A.4A936039@socionext.com> <CAA93ih2i+G2uyL8O-4F1juR1DpUYCd1U1dBCRRM5Xdd3L-m95g@mail.gmail.com>
 <20171211134627.GU10595@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171211134627.GU10595-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux kernel mailing list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Russell,

2017-12-11 22:46 GMT+09:00 Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>:
> On Mon, Dec 11, 2017 at 10:34:17PM +0900, Masami Hiramatsu wrote:
>> IMHO, even if we use SPDX license identifier, I recommend to use
>> C-style comments as many other files do, since it is C code.
>> If SPDX identifier requires C++ style, that is SPDX parser's issue
>> and should be fixed to get it from C-style comment.
>
> See the numerous emails on this subject already.  The issue of C
> vs C++ comments has come up many times by many different people, but
> the result is the same.  That's not going to happen.  Linux kernel
> C files are required to use "//" for the SPDX identifier by order
> of Linus Torvalds.

OK, I got it.

>
> Linus has also revealed in that discussion that he has a preference
> for "//" style commenting for single comments, so it seems that the
> kernel coding style may change - but there is no desire for patches
> to "clean up" single line comments to use "//".

Thank you for making it clear.

Then what I'm considering is copyright notice lines. Those are usually
treat as the header lines, not single line. So

> +// SDPX-License-Identifier: GPL-2.0
> +// sni_ave.c - Socionext UniPhier AVE ethernet driver
> +// Copyright 2014 Panasonic Corporation
> +// Copyright 2015-2017 Socionext Inc.

is acceptable? or should we keep C-style header lines for new drivers?

> +// SDPX-License-Identifier: GPL-2.0
> +/*
> + * sni_ave.c - Socionext UniPhier AVE ethernet driver
> + * Copyright 2014 Panasonic Corporation
> + * Copyright 2015-2017 Socionext Inc.
> + */

I just concern that those lines are not "single". that's all. :)

>
> For further information, and to see the discussion that has already
> happened, the arguments that have been made about style, see the
> threads for the patch series that tglx has been posting wrt documenting
> the SPDX stuff for the kernel.

OK, got it.

https://lkml.org/lkml/2017/11/16/663


Thanks,

>
> Thanks (let's stop rehashing the same arguments.)
>


-- 
Masami Hiramatsu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
