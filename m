From: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 5/9] ARM: Enable erratum 798181 for Broadcom Brahma-B15
Date: Wed, 26 Feb 2014 16:38:20 -0800
Message-ID: <CADtm3G7JcO6+Sc6Dsw1swY09F7+-KSXjsQU8CBcH-K6On2aP_Q@mail.gmail.com>
References: <1393410552-21497-1-git-send-email-marc.ceeeee@gmail.com>
 <1393410552-21497-6-git-send-email-marc.ceeeee@gmail.com> <20140226104702.GA8961@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140226104702.GA8961-MRww78TxoiP5vMa5CHWGZ34zcgK1vI+I0E9HWUfgJXw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Will,

On Wed, Feb 26, 2014 at 2:47 AM, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org> wrote:
> On Wed, Feb 26, 2014 at 10:29:08AM +0000, Marc Carino wrote:
>> From: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Broadcom Brahma-B15 (r0p0..r0p2) is also affected by Cortex-A15
>> erratum 798181, so enable the workaround for Brahma-B15.
>
> Really... *exactly* the same erratum? That sounds pretty unlikely, so I'd
> really like to be sure that the workaround we have indeed solves your
> problem (issuing a dummy TLBI to 0x0 + dsb, then followed by a dmb + clrex
> on each core). The point is that the workaround doesn't simply perform
> non-shareable invalidation on each core using IPIs.

Yes, it should be the same.  I've sent you more detail off-list.

Regards,
Gregory
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
