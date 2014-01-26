From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 07/18] watchdog: orion: Handle IRQ
Date: Sun, 26 Jan 2014 15:57:51 +0100
Message-ID: <20140126155751.6c6ea59d@skate>
References: <1390431915-5115-1-git-send-email-ezequiel.garcia@free-electrons.com>
	<1390431915-5115-8-git-send-email-ezequiel.garcia@free-electrons.com>
	<20140126090412.37f4932f@skate>
	<20140126131445.GA14713@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140126131445.GA14713@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Ezequiel Garcia,

On Sun, 26 Jan 2014 10:14:46 -0300, Ezequiel Garcia wrote:

> > I don't quiite understand the first sentence of this commit log, and
> > the commit title looks wrong. Maybe a bad copy/paste or something?
> > 
> 
> Hm... yes it doesn't look right. It should read:
> 
> "DT-enabled platforms, where the irqchip driver for the brigde interrupt
> controller is available, can handle the watchdog IRQ properly. Therefore,
> we request the interrupt and add a dummy handler that merely calls panic()".

Ok.

> I guess we can re-phrase it be a bit more readable.
> 
> Why does th commit title looks wrong? By requesting the IRQ we are
> "handling it", no?

Right, but it looks "truncated". Maybe something like:

watchdog: orion: handle irq to avoid having to clear BRIDGE_CLAUSE

or something like that (adjust to the actual reality, I haven't
followed all the implications).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
