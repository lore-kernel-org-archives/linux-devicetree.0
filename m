From: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: meson: add meson8 machine definition
Date: Thu, 2 Oct 2014 19:05:19 +0200
Message-ID: <20141002170519.GA29052@gmail.com>
References: <1412198986-26534-1-git-send-email-b.galvani@gmail.com>
 <1412198986-26534-2-git-send-email-b.galvani@gmail.com>
 <11073411.IcmTkIICYA@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <11073411.IcmTkIICYA@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Victor Wan <victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Jerry Cao <jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 02, 2014 at 11:24:54AM +0200, Arnd Bergmann wrote:
> On Wednesday 01 October 2014 23:29:41 Beniamino Galvani wrote:
> > 
> > +static const char * const m8_common_board_compat[] = {
> > +       "amlogic,meson8",
> > +       NULL,
> > +};
> > +
> >  DT_MACHINE_START(AML8726_MX, "Amlogic Meson6 platform")
> >         .dt_compat      = m6_common_board_compat,
> >  MACHINE_END
> >  
> > +DT_MACHINE_START(MESON8, "Amlogic Meson8 platform")
> > +       .dt_compat      = m8_common_board_compat,
> > +MACHINE_END
> > 
> 
> I'd just add the meson8 string to the m6_common_board_compat list and
> rename it.

>From what I've seen so far the two families are very similar and share
most of the IP cores, so a unique DT machine is a good idea.

Does the MACH_MESON8 Kconfig symbol still make sense or can I drop it
and rename MACH_MESON6 to MACH_MESON?

Beniamino

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
