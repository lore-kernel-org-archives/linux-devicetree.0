From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v6 05/19] watchdog: orion: Make sure the watchdog is
 initially stopped
Date: Fri, 7 Feb 2014 10:44:53 -0500
Message-ID: <20140207154453.GA8533@titan.lakedaemon.net>
References: <1391707226-18258-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1391707226-18258-6-git-send-email-ezequiel.garcia@free-electrons.com>
 <52F43ED0.4050808@roeck-us.net>
 <20140207104044.GA11063@localhost>
 <52F4E1C1.4010805@roeck-us.net>
 <20140207151727.GB8218@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140207151727.GB8218@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 07, 2014 at 12:17:28PM -0300, Ezequiel Garcia wrote:
> On Fri, Feb 07, 2014 at 05:38:09AM -0800, Guenter Roeck wrote:
> > On 02/07/2014 02:40 AM, Ezequiel Garcia wrote:
> > > On Thu, Feb 06, 2014 at 06:02:56PM -0800, Guenter Roeck wrote:
> > >> On 02/06/2014 09:20 AM, Ezequiel Garcia wrote:
> > >>> Having the watchdog initially fully stopped is important to avoid
> > >>> any spurious watchdog triggers, in case the registers are not in
> > >>> its reset state.
> > >>>
> > >>> Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> > >>> Tested-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > >>> Tested-by: Willy Tarreau <w@1wt.eu>
> > >>> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > >>> ---
> > >>>    drivers/watchdog/orion_wdt.c | 3 +++
> > >>>    1 file changed, 3 insertions(+)
> > >>>
> > >>> diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
> > >>> index 6746033..2dbeee9 100644
> > >>> --- a/drivers/watchdog/orion_wdt.c
> > >>> +++ b/drivers/watchdog/orion_wdt.c
> > >>> @@ -142,6 +142,9 @@ static int orion_wdt_probe(struct platform_device *pdev)
> > >>>    	orion_wdt.max_timeout = wdt_max_duration;
> > >>>    	watchdog_init_timeout(&orion_wdt, heartbeat, &pdev->dev);
> > >>>
> > >>> +	/* Let's make sure the watchdog is fully stopped */
> > >>> +	orion_wdt_stop(&orion_wdt);
> > >>> +
> > >>
> > >> Actually we just had that in another driver, and I stumbled over it there.
> > >>
> > >> Problem with stopping the watchdog in probe unconditionally is that you can
> > >> use it to defeat nowayout: unload the module, then load it again,
> > >> and the watchdog is stopped even if nowayout is true.
> > >>

How often would a user legitimately want to unload/load the watchdog
module?

> > >
> > > Hm... I see.
> > >
> > >> Is this really what you want ? Or, in other words, what is the problem
> > >> you are trying to solve ?
> > >>
> > >
> > > Well, this is related to the discussion about the bootloader not
> > > reseting the watchdog properly, provoking spurious watchdog triggering.
> > >
> > > Jason Gunthorpe explained [1] that we needed a particular sequence:
> > >
> > >   1. Disable WDT
> > >   2. Clear bridge
> > >   3. Enable WDT
> > >
> > > We added the irq handling to satisfy (2), and the watchdog stop for (1).
> > >
> > > The watchdog stop was agreed specifically [2].
> > >
> > > Ideas?
> > >
> > 
> > Other drivers assume that if the watchdog is running, it is supposed
> > to be running. The more common approach in such cases is to ping the
> > watchdog once to give userspace more time to get ready, but leave
> > it enabled. So you could check if the watchdog is enabled, and if
> > it was enabled re-enable it after initialization is complete
> > (and maybe log a message stating that the watchdog is enabled).
> > 
> > If you don't want to do that, and if you are defeating nowayout
> > on purpose to fix a problem with a broken bootloader,
> > you should at least put in comment describing the problem you are
> > trying to solve, and that you accept breaking nowayout with your fix.

Yes, this should be commented.

> I'm not fond of not having "nowayout" option on our driver, given I'm sure
> it's a watchdog feature for a good reason.
> 
> On the other side, I can't see how can we distinguish a previously
> and explicitly enabled watchdog, from a spurious enable by broken bootloader.

How about we just don't define module_exit() and leave a comment as
such?  It's not unprecedented, a couple of the atm drivers are
explicitly setup like this (uPD98402.c, zatm.c, eni.c).

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
