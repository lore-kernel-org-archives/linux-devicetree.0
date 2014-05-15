From: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 RESEND 2/5] ARM: add SMP support for Broadcom mobile
 SoCs
Date: Thu, 15 May 2014 15:19:08 -0400
Message-ID: <20140515191908.GO32082@beef>
References: <1400176691-26058-1-git-send-email-elder@linaro.org>
 <1400176691-26058-3-git-send-email-elder@linaro.org>
 <CAGVrzca20+3kmJjyGv8Pr-qNNV4n0hhADL6GWvcYVDUL4q28Hg@mail.gmail.com>
 <5375049C.40104@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5375049C.40104-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 15, 2014 at 01:17:00PM -0500, Alex Elder wrote:
> On 05/15/2014 01:03 PM, Florian Fainelli wrote:
> > Hi Alex,
> > 
> > 2014-05-15 10:58 GMT-07:00 Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> >> This patch adds SMP support for BCM281XX and BCM21664 family SoCs.
> >>
> >> This feature is controlled with a distinct config option such that a
> >> SMP-enabled multi-v7 binary can be configured to run these SoCs in
> >> uniprocessor mode.  Since this SMP functionality is used for
> >> multiple Broadcom mobile chip families the config option is called
> >> ARCH_BCM_MOBILE_SMP (for lack of a better name).
> >>
> >> On SoCs of this type, the secondary core is not held in reset on
> >> power-on.  Instead it loops in a ROM-based holding pen.  To release
> >> it, one must write into a special register a jump address whose
> >> low-order bits have been replaced with a secondary core's id, then
> >> trigger an event with SEV.  On receipt of an event, the ROM code
> >> will examine the register's contents, and if the low-order bits
> >> match its cpu id, it will clear them and write the value back to the
> >> register just prior to jumping to the address specified.
> >>
> >> The location of the special register is defined in the device tree
> >> using a "secondary-boot-reg" property in a node whose "enable-method"
> >> matches.
> >>
> >> Derived from code originally provided by Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> >>
> >> Signed-off-by: Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> ---
> >>  arch/arm/mach-bcm/Kconfig   |  18 +++-
> >>  arch/arm/mach-bcm/Makefile  |   3 +
> >>  arch/arm/mach-bcm/platsmp.c | 201 ++++++++++++++++++++++++++++++++++++++++++++
> > 
> > Could we make that name a little bit more specific to the mobile SoCs?
> 
> Sure.  I thought about that but naming stuff here has been a sort
> of ongoing struggle...  "Kona" made some sense, in some cases,
> but it's not perfect.  Simlar with "mobile."
> 
> I'll propose "kona_smp.c".  OK with you?  Unless I get a better
> suggestion I'll plan to go with that next time around.

Works for me.

-Matt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
