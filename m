From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/3] irqchip: gic/realview: support more RealView DCC
 variants
Date: Thu, 18 Feb 2016 14:47:13 +0000
Message-ID: <56C5D971.6060005@arm.com>
References: <1455803172-22747-1-git-send-email-linus.walleij@linaro.org>
 <56C5D304.5010708@arm.com> <5028476.WAQS3ylXOd@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5028476.WAQS3ylXOd@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 18/02/16 14:40, Arnd Bergmann wrote:
> On Thursday 18 February 2016 14:19:48 Marc Zyngier wrote:
>> On 18/02/16 13:46, Linus Walleij wrote:
>>> In the add-on file for the GIC dealing with the RealView family
>>> we currently only handle the PB11MPCore, let's extend this to
>>> manage the RealView EB ARM11MPCore as well. The Revision B of the
>>> ARM11MPCore core tile is a bit special and needs special handling
>>> as it moves a system control register around at random.
>>
>> Ah, 11MPCore RevB. That thing. Tried to locate one in the magic
>> cupboard, and failed. Oh well...
> 
> What surprised me though is that it's enabled by default:
> 
> $ grep REVB arch/arm/configs/realview*
> arch/arm/configs/realview_defconfig:CONFIG_REALVIEW_EB_ARM11MP_REVB=y
> arch/arm/configs/realview-smp_defconfig:CONFIG_REALVIEW_EB_ARM11MP_REVB=y
> 
> With that option set, the defconfig kernel should not be able
> to boot on RevC machines. Do you have a RevC machine that works
> with the defconfig?

No, it looks like someone helped themselves to *all* of the EB-11MPs - I
have a bunch of empty baseboards, and no tile to slap on. I also have a
box of unsoldered 11MPs, but that a different story... ;-)

I guess I should plan for another dumpster diving session.

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
