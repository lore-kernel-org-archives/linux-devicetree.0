From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: bL_switcher: Don't enable bL switcher on systems
 without CCI
Date: Mon, 21 Apr 2014 19:37:22 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1404211926040.980@knanqh.ubzr>
References: <1397239311-27717-1-git-send-email-a.kesavan@samsung.com> <1397239311-27717-2-git-send-email-a.kesavan@samsung.com> <alpine.LFD.2.11.1404111406210.980@knanqh.ubzr> <CAM4voanduaJ32ztj6ZDMOPXNd9W6Ttwae_PQ68VGxPKZEsj3kA@mail.gmail.com>
 <alpine.LFD.2.11.1404161524050.980@knanqh.ubzr> <CAM4voamv7CrGpnM_HgTsSU6jvb3TffC0BKKrvNh-VHj+u9EKOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAM4voamv7CrGpnM_HgTsSU6jvb3TffC0BKKrvNh-VHj+u9EKOQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "mark.rutland" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, robh+dt <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas P Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 21 Apr 2014, Abhilash Kesavan wrote:

> Hi Nicolas,
> 
> On Thu, Apr 17, 2014 at 1:48 AM, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > Here's what I mean:
> >
> > ----- >8
> >
> > From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Date: Wed, 16 Apr 2014 15:43:59 -0400
> > Subject: [PATCH] ARM: bL_switcher: fix validation check before its activation
> >
> > The switcher should not depend on MAX_CLUSTER which is a build time
> > limit to  determine ifit should be activated or not. In a multiplatform
> > kernel binary it is possible to have dual-cluster and quad-cluster
> > platforms configured in. In that case MAX_CLUSTER should be 4 and that
> > shouldn't prevent the switcher from working if the kernel is booted on a
> > b.L dual-cluster system.
> >
> > In bL_switcher_halve_cpus() we already have a runtime validation check
> > to make sure we're dealing with only two clusters, so booting on a quad
> > cluster system will be caught and switcher activation aborted.
> >
> > However, the b.L switcher must ensure the MCPM layer is initialized on
> > the booted hardware before doing anything.  The mcpm_is_available()
> > function is added to that effect.
> >
> > Signed-off-by: Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Thank you for the explanation and patch. I have tested this on our
> multi-platform configuration and it works fine - activating the
> switcher on one SoC and not on the other.

Good.  It is in RMK's patch system now.

> Even though it is not the case now, could we have a scenario where we
> may use mcpm for only secondary core boot-up on one SoC and for
> switching on another ? I would then have mcpm ops populated for both
> but still want bL switcher activated for only one of them.

Absolutely.  As soon as you have cluster synchronization issues, you 
must use MCPM.  The switcher is just one amongst a couple users relying 
on MCPM to do the cluster handling.  Secondary CPU boot is an other 
such user, as well as CPU hotplug that you then get for free.  The 
important thing to remember is that MCPM is a separate layer independent 
from the b.L switcher.

The switcher will accept to be started only on a dual cluster system.  
But if you don't want it started on a particular dual-cluster SoC you 
just need to add no_bL_switcher to the kernel cmdline for that SoC.


Nicolas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
