From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] irqchip: gic/realview: support more RealView DCC variants
Date: Thu, 18 Feb 2016 19:30:27 +0100
Message-ID: <CACRpkdZD_qg0p8spr9HnFBSzXidi59J_kR8XBo-s8z-tSqKs5g@mail.gmail.com>
References: <1455803172-22747-1-git-send-email-linus.walleij@linaro.org>
	<56C5D304.5010708@arm.com>
	<5028476.WAQS3ylXOd@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5028476.WAQS3ylXOd@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 18, 2016 at 3:40 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 18 February 2016 14:19:48 Marc Zyngier wrote:
>> On 18/02/16 13:46, Linus Walleij wrote:
>> > In the add-on file for the GIC dealing with the RealView family
>> > we currently only handle the PB11MPCore, let's extend this to
>> > manage the RealView EB ARM11MPCore as well. The Revision B of the
>> > ARM11MPCore core tile is a bit special and needs special handling
>> > as it moves a system control register around at random.
>>
>> Ah, 11MPCore RevB. That thing. Tried to locate one in the magic
>> cupboard, and failed. Oh well...
>
> What surprised me though is that it's enabled by default:

Looks like my fault according to git-blame...

I think this happened when making cover-all defconfigs for
multiplatform. I think I just turned everything on... not realizing
that turning on RevB disabled RevA+RevC.

However since it is the *only* version that works with QEMU
it actually makes some kind of weird sense to have it enabled
since the QEMU version is probably more common than
RevA+RevC...

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
