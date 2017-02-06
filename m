From: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH RESEND 1/3] arm64: add THUNDER2 processor family
Date: Mon, 6 Feb 2017 15:21:40 +0000
Message-ID: <20170206152140.GA2001@localhost>
References: <1486233461-2679-1-git-send-email-jnair@caviumnetworks.com>
 <1486233461-2679-2-git-send-email-jnair@caviumnetworks.com>
 <20170206100608.GA8540@arm.com>
 <CAK8P3a1_dQZd3RRyavMKqBFcHsXTQ2oAUO5vaLhyTiH99XhqrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a1_dQZd3RRyavMKqBFcHsXTQ2oAUO5vaLhyTiH99XhqrQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 06, 2017 at 02:44:13PM +0100, Arnd Bergmann wrote:
> On Mon, Feb 6, 2017 at 11:06 AM, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org> wrote:
> > On Sat, Feb 04, 2017 at 06:37:39PM +0000, Jayachandran C wrote:
> >> Add support for ThunderX2 CN99XX arm64 server processors.
> >>
> >> Introduce a new arm64 platform config option ARCH_THUNDER2 for these
> >> processors. Add device tree files boot/dts/cavium/thunder-99xx.dtsi for
> >> on-chip devices and boot/dts/cavium/thunder-99xx.dts for the evaluation
> >> board.
> >>
> >> Signed-off-by: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
> >> ---
> >>  arch/arm64/Kconfig.platforms                 |   7 ++
> >>  arch/arm64/boot/dts/cavium/Makefile          |   1 +
> >>  arch/arm64/boot/dts/cavium/thunder-99xx.dts  |  34 +++++++
> >>  arch/arm64/boot/dts/cavium/thunder-99xx.dtsi | 147 +++++++++++++++++++++++++++
> >
> > This is basically identical to vulcan.dtsi. Do we really need both in the
> > tree?

The Vulcan architecture has been discontinued by Broadcom, so the platform
and device tree files should go away soon. Renames are going to be messy, it
will be better to keep Vulcan around until the transition is complete, and
then delete it.

> Hmm, an alternative would be to add the new .dtsi file and start out with an
> #include of the existing file, with overrides for anything that needs changing.
> Similarly, the Kconfig symbol could just 'select ARCH_VULCAN' for now.

Even in this case, we will need to copy the files from boot/dts/broadcom to
boot/dts/cavium along the way. The current patchset is (in my opinion) the
least messy way to accomplish the transition. But it is the maintainer's call,
so if you think it has to be done differently, I can update the patchset and
post again.

Thanks,
JC.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
