From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] bus: ARM CCN PMU driver
Date: Fri, 11 Jul 2014 16:02:34 +0100
Message-ID: <1405090954.32598.60.camel@hornet>
References: <1405088056-29181-1-git-send-email-pawel.moll@arm.com>
	 <20140711142135.GA21766@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140711142135.GA21766-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Arnaldo Carvalho de Melo <acme-f8uhVLnGfZaxAyOMLChx1axOck334EZe@public.gmane.org>, Stephane Eranian <eranian-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jiri Olsa <jolsa-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2014-07-11 at 15:21 +0100, Russell King - ARM Linux wrote:
> On Fri, Jul 11, 2014 at 03:14:16PM +0100, Pawel Moll wrote:
> > diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> > index 1f37d98..6ab2a62 100644
> > --- a/drivers/bus/Kconfig
> > +++ b/drivers/bus/Kconfig
> > @@ -4,14 +4,6 @@
> >  
> >  menu "Bus devices"
> >  
> > -config BRCMSTB_GISB_ARB
> > -	bool "Broadcom STB GISB bus arbiter"
> > -	depends on ARM
> > -	help
> > -	  Driver for the Broadcom Set Top Box System-on-a-chip internal bus
> > -	  arbiter. This driver provides timeout and target abort error handling
> > -	  and internal bus master decoding.
> > -
> ...
> > diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
> > index 6a4ea7e..493b4ff 100644
> > --- a/drivers/bus/Makefile
> > +++ b/drivers/bus/Makefile
> > @@ -2,14 +2,15 @@
> >  # Makefile for the bus drivers.
> >  #
> >  
> > -obj-$(CONFIG_BRCMSTB_GISB_ARB)	+= brcmstb_gisb.o
> 
> I assume that as these exist in the patch, you haven't looked through
> the patch to check what you're actually submitting... 

This is, obviously, my bad and lack of attention after last minute
rebase, for which I apologise.

> how can we be
> sure that the rest of the patch is what you intend to submit?

Of course you can't be sure, unless you are willing to take my word for
it. Maybe the fact that 46% of the added lines contains upper- or
lowercase string "CCN" matching the subject can support my plea.

Pawel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
