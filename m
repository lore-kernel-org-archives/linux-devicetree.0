From: "Chen, Alvin" <alvin.chen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: RE: [PATCH 1/4 v3] GPIO: gpio-dwapb: Enable platform driver binding
 to MFD driver
Date: Wed, 10 Sep 2014 10:32:08 +0000
Message-ID: <4656BEB6164FC34F8171C6538F1A595B2E98F878@SHSMSX101.ccr.corp.intel.com>
References: <1410286081-16653-1-git-send-email-alvin.chen@intel.com>
 <1410286081-16653-2-git-send-email-alvin.chen@intel.com>
 <D034802C.A7BEE%dvhart@linux.intel.com>
 <4656BEB6164FC34F8171C6538F1A595B2E98854F@SHSMSX101.ccr.corp.intel.com>
 <20140910032646.GA39541@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140910032646.GA39541@vmdeb7>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, atull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "Shevchenko, Andriy" <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Ong, Boon Leong" <boon.leong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "Kweh, Hock Leong" <hock.leong.kweh-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>, "Westerberg, Mika" <mika.westerberg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > > You cover this specific dependencies with inline ifdefs, but you
> > > lose the CONFIG_OF depends by dropping it, and there are no such
> > > checks in the probe routine. Assumptions of OF are not limited to probe in
> this driver.
> > >
> > > While I would like to see this assumption properly abstracted, the
> > > most expedient/immediate fix is probably to add a depends on OF above.
> >
> > Andriy, how do you think?
> >
> > How about
> > depends on OF_GPIO || MFD_GPIO_DWAPB, or depends on OF_GPIO ||
> > MFD_INTEL_QUARK_I2C_GPIO?
> >
> 
> Upon closer inspection, I think my concern is invalid. the OF header already
> tests for CONFIG_OF and provides no-op / -ENOSYS (tsk tsk) alternatives. So
> long as you can compile with "#CONFIG_OF is not set" as it is, then I withdraw
> my comment.
Yes, it can be compiled with "#CONFIG_OF is not set" and "#CONFIG_OF_GPIO is not set"

> 
> Sorry for the noise.
> 
> --
> Darren Hart
> Intel Open Source Technology Center
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
