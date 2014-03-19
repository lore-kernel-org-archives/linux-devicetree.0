From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v3 0/8] Watchdog support for Armada 375/38x SoC
Date: Wed, 19 Mar 2014 16:21:22 -0600
Message-ID: <20140319222122.GB1154@obsidianresearch.com>
References: <1394658715-2017-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140312214312.GA14357@obsidianresearch.com>
 <20140312215456.GA13340@arch.cereza>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140312215456.GA13340-nAQHv47ARr+vIlHkl8J1cg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 12, 2014 at 06:54:56PM -0300, Ezequiel Garcia wrote:
> On Mar 12, Jason Gunthorpe wrote:
> > On Wed, Mar 12, 2014 at 06:11:47PM -0300, Ezequiel Garcia wrote:
> > 
> > > I've pushed a branch so people can test this easily, e.g. ensuring
> > > no regressions on Dove, Kirkwood and A370/XP:
> > > 
> > > https://github.com/MISL-EBU-System-SW/mainline-public/tree/wdt_a385_a375_v3
> > 
> > This branch worked for me, the watchdog functioned as expected.
> > 
> 
> Good to hear. Is that a Tested-by on Kirkwood?

Yes, sorry for the delay

> > I got these two oddball messages during boot though:
> > 
> > irq: Cannot allocate irq_descs @ IRQ26, assuming pre-allocated
> > irq: Cannot allocate irq_descs @ IRQ61, assuming pre-allocated
> > 
> > Probably unrelated to the watchdog.. Unfortunately I've run out of
> > time right now to investigate.
> > 
> 
> Probably. That branch is based on some mvebu/for-next tip, which has all
> the watchdog and devicetree dependencies for this patchset to apply.
> 
> I can re-send a series based on v3.15-rc1 and we can check again; maybe
> we're just missing some irq patch.

I quickly re-checked and 3.14.0-rc7 doesn't print these messages..

I can review again when 3.15-rc1 comes out.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
