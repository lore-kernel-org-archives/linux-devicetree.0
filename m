From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v2 06/15] watchdog: orion: Remove unneeded BRIDGE_CAUSE
 clear
Date: Wed, 22 Jan 2014 13:52:13 -0700
Message-ID: <20140122205213.GW18269@obsidianresearch.com>
References: <1390295561-3466-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1390295561-3466-7-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140121233537.GS18269@obsidianresearch.com>
 <20140122164904.GB27273@localhost>
 <20140122173417.GT18269@obsidianresearch.com>
 <52E02AB6.7040104@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52E02AB6.7040104-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> Clearing BRIDGE_CAUSE will only clear all currently pending upstream
> IRQs, of course. If WDT IRQ will be re-raised right after that in
> BRIDGE_CAUSE depends on the actual HW implementation, i.e. we do no
> clear the causing IRQ itself but just what it raised in BRIDGE_CAUSE.

Which is why it makes no sense to clear it one time at kernel start.

Either you only get new edge triggered interrupts after request_irq
(sane behavior) or you might sometimes get an old pending edge
triggered interrupt after request_irq (crazy behavior).

Clearing BRIDGE_CAUSE at kernel start only shortens the racy window it
doesn't eliminate it.

In the more familiar level triggered world the driver would go to the
device and ensure it wasn't asserting an IRQ level and then do the
request_irq. This guarentees it won't get an interrupt callback.

In a edge triggered world the driver should go to the device an ensure
that it won't create a new IRQ, then do request_irq - confident that
there will NEVER be a call to the IRQ handler, under any
circumstances.

So I think edge triggered interrupts need to ack any possible old edge
trigger in the cause register before the first unmask - eg in the
setup callback.

> So, you should also clear WDT's irq in the driver yourself to clear a
> possible pending upstream BRIDGE_CAUSE.

Which isn't possible - the BRIDGE_CAUSE is owned by the irq driver and
it must be cleared there, and it must only be cleared after the wdt
has been stopped so it doesn't set it again.

Notice that Ezequiel has added an IRQ handler that just calls panic,
so a spurious interrupt call is VERY VERY BAD.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
