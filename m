From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v5 00/20] Armada 370/XP watchdog support
Date: Thu, 30 Jan 2014 17:16:29 -0500
Message-ID: <20140130221629.GH29184@titan.lakedaemon.net>
References: <1390836440-12744-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140129181949.GB27143@localhost>
 <20140130205315.GD29184@titan.lakedaemon.net>
 <20140130215056.GA1063@localhost>
 <52EACB92.2080700@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52EACB92.2080700-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 30, 2014 at 11:00:50PM +0100, Sebastian Hesselbarth wrote:
> On 01/30/2014 10:50 PM, Ezequiel Garcia wrote:
> >On Thu, Jan 30, 2014 at 03:53:15PM -0500, Jason Cooper wrote:
> >>Ezequiel,
> >>
> >>On Wed, Jan 29, 2014 at 03:19:50PM -0300, Ezequiel Garcia wrote:
> >>>On Mon, Jan 27, 2014 at 12:27:00PM -0300, Ezequiel Garcia wrote:
> >>>>A new round, mostly fixing some minor nitpicks.
> >>>>
> >>>
> >>>If anyone wants to give this a test, here's a public branch:
> >>>
> >>>https://github.com/MISL-EBU-System-SW/mainline-public/tree/wdt_for_v3.14_v5
> >>
> >>I just took a quick glance at this (commit oneliners/tags) and there
> >>doesn't appear to be any dependence on Sebastian's series.  Did I miss
> >>something?
> >>
> >
> >True, I've completely missed that. I pushed the branch in a rush!
> >
> >Let me prepare a v6, fixing the remaining issue pointed out by Russell,
> >and push again (together with Sebastian's irqchip fixes).
> 
> Umm, no. Just directly name irqchip-orion fixes. Jason will send a PR
> for irqchip-fixes _with-in_ v3.14 while watchdog will go into v3.15.

Yes, but I'd like to do a topic branch for that irqchip PR.  That way,
we don't have to wait for them to land in an -rc.  We can push the
watchdog changes when they are ready, and they can be based on v3.14-rc1
with irqchip/orion-fixes (or whatever) pulled in.

> In any way, do not include my patches into your set.

Agreed.  I wasn't really keen on including the MMIO patch in the series
since it was already in rmk's patch tracker.  Listing the deps in the
coverletter is enough.

> Jason: Ezequiel's watchdog patches install an irq handler that will
> panic(TM) on a watchdog irq. irqchip-orion does not properly clear
> stale bridge irqs which could signal a watchdog irq left by bootloader
> (or watchdog triggering between bootloader and driver probe).

Ok.  I'll look things over and get some branches setup this weekend.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
