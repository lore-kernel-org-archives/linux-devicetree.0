From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v5 2/2] arm: pxa27x: support for ICP DAS LP-8x4x w/ DT
Date: Tue, 15 Dec 2015 20:21:31 +0100
Message-ID: <4511402.o53nMsg37l@wuerfel>
References: <1449700088-28076-3-git-send-email-ynvich@gmail.com> <87a8pbio2u.fsf@belgarion.home> <1450205413.21989.44.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450205413.21989.44.camel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Ianovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 15 December 2015 21:50:13 Sergei Ianovich wrote:
> On Tue, 2015-12-15 at 19:06 +0100, Robert Jarzmik wrote:


> > > 4. all optional pxa stuff as modules
> > > 5. all stuff on supported pxa boards as modules
> > 
> > > If #5 is extended when support for new boards is added, it should be
> > > possible to run any supported pxa27x board with pxa27x_defconfig.
> > 
> > I'm very eager to see a patch on that. I can feed my Jenkins with it,
> > it would
> > greatly help me catch issues earlier. Moreover it would for free test
> > it on
> > lubbock, mainstone and mioa701. If there was one also for pxa3xx, I
> > would launch
> > it on zylonite cm-x300 ... (that's a bonus, I know :))
> > 
> 
> Updated plan:
> 1. MACH_PXA27X_DT
> 2. PXA_FB and 8250_PXA to enable console
> 3. MMC, MMC_PXA and EXT4_FS to enable boot from MMC
> 3.1. MTD, MTD_CFI, MTD_PHYSMAP_OF and JFFS2_FS to enable boot from MTD
> 4. all optional pxa stuff as modules
> 5. all stuff on supported pxa boards as modules
> 6. supported boards should boot the kernel built with
> `pxa27x-dt_defconfig` after `make olddefconfig`
> 
> It is probably a good idea to put this plan somewhere in Documentation/
> and to have a comment about that in the defconfig itself.
> 
> Is the plan acceptable?

Sounds good to me.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
