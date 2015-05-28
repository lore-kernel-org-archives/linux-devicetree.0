From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [RFC PATCH] EDAC: Cleanup atomic_scrub mess
Date: Thu, 28 May 2015 12:27:22 +1000
Message-ID: <1432780042.4979.0.camel@ellerman.id.au>
References: <1431991481-25684-1-git-send-email-lho@apm.com>
	 <1431991481-25684-2-git-send-email-lho@apm.com>
	 <20150519170308.GL4641@pd.tnic>
	 <CAPw-ZT=mTpt_vz+e=rM5ywK8feNKkJQrpEWg=noRCziJ0840TQ@mail.gmail.com>
	 <20150519203336.GP4641@pd.tnic> <20150521180719.GE3689@pd.tnic>
	 <20150521181157.GF3689@pd.tnic> <555F8DE2.4060402@ezchip.com>
	 <20150527155219.GB19407@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150527155219.GB19407-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: Chris Metcalf <cmetcalf-d5a29ZRxExrQT0dZR+AlfA@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "Steven J. Hill" <Steven.Hill-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, ". Maciej W. Rozycki" <macro-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2015-05-27 at 17:52 +0200, Borislav Petkov wrote:
> On Fri, May 22, 2015 at 04:13:22PM -0400, Chris Metcalf wrote:
> > On 05/21/2015 02:11 PM, Borislav Petkov wrote:
> > >From: Borislav Petkov<bp-l3A5Bk7waGM@public.gmane.org>
> > >
> > >So first of all, this atomic_scrub() function's naming is bad. It looks
> > >like an atomic_t helper. Change it to edac_atomic_scrub().
> > >
> > >The bigger problem is that this function is arch-specific and every new
> > >arch which doesn't necessarily need that functionality still needs to
> > >define it, otherwise EDAC doesn't compile.
> > >
> > >So instead of doing that and including arch-specific headers, have each
> > >arch define an EDAC_ATOMIC_SCRUB symbol which can be used in edac_mc.c
> > >for ifdeffery. Much cleaner.
> > >
> > >We already are doing this with another symbol - EDAC_SUPPORT. This is
> > >also much cleaner than having CONFIG_EDAC explicitly depend on all the
> > >arches which need/have EDAC support and drivers.
> > >
> > >This way I can kill the useless edac.h header in tile too.
> > >
> > >Signed-off-by: Borislav Petkov<bp-l3A5Bk7waGM@public.gmane.org>
> > 
> > Acked-by: Chris Metcalf <cmetcalf-d5a29ZRxExrQT0dZR+AlfA@public.gmane.org> [for tile]
> 
> Thanks.
> 
> Just to clarify after today's discussion on IRC: this patch doesn't
> change current DRAM scrubbing behavior on the relevant arches - it
> simply makes the definition of that atomic_scrub thing non-mandatory on
> new arches or on those which don't need it.
> 
> In the meantime, patch has been build-tested on arm and ppc - the two
> I'm missing an ACK for.

I haven't tested it but it looks sane:

Acked-by: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>

cheers


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
