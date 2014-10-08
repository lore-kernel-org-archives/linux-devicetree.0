From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: cygnus: Initial support for Broadcom Cygnus SoC
Date: Wed, 08 Oct 2014 20:12:38 +0200
Message-ID: <34012512.W8VifyXY4H@wuerfel>
References: <1412746025-11998-2-git-send-email-sbranden@broadcom.com> <10762659.VISiZ3vSSN@wuerfel> <543565DC.8010704@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <543565DC.8010704-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, JD Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 08 October 2014 09:27:08 Scott Branden wrote:
> On 14-10-08 06:28 AM, Arnd Bergmann wrote:
> > On Wednesday 08 October 2014 05:27:24 Scott Branden wrote:
> >>>
> >>> I don't think you need per-board config options. The main option
> >>> above should be enough.
> >> This is not a per-board config option.  This is actually a per-SoC
> >> uArchtecture selection.  More major uArchectures will be added to the
> >> IPROC.  Will Change comment to "Support Broadcom Cygnus SoC"
> >
> > Ok, sounds fine, but remove ARCH_BCM_IPROC then. There should be
> > no need for a three-level deep hierarchy (BCM -> IPROC -> CYGNUS)
> >
> I do not need a 3-deep hierarchy, I need a 2-deep hierarchy for IPROC 
> and CYGNUS (and future SoCs that have IPROC Architecture in common).  I 
> can move IPROC out of the mach-bcm directory if you like a create a new 
> directory?  But it looks like the purpose of mach-bcm is to consolidate 
> all Broadcom chipsets in it?

Yes, better leave it all in mach-bcm. You really shouldn't need much
code at all that is soc specific, so adding new directories is not
encouraged. We have some platforms that need no code at all, and on
arm64 that is required.

Isn't Northstar also IPROC? That one didn't seem to need the symbol.

Could you make ARCH_BCM_IPROC a silent symbol that is just selected
by each SoC family specific symbol?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
