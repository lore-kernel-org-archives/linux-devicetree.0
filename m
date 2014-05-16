From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCHv3 1/3] ARM: mm: allow sub-architectures to override PCI
 I/O memory type
Date: Fri, 16 May 2014 10:57:36 +0100
Message-ID: <20140516095736.GF12341@arm.com>
References: <1400145519-28530-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140515155130.193c3181@free-electrons.com>
 <20140515142924.GI27594@arm.com>
 <4972763.mtuLYh6sDH@wuerfel>
 <20140515153430.GM27594@arm.com>
 <20140515175307.GA12259@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140515175307.GA12259-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Albin Tonnerre <Albin.Tonnerre-5wv7dgnIgG8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 15, 2014 at 06:53:07PM +0100, Jason Gunthorpe wrote:
> On Thu, May 15, 2014 at 04:34:30PM +0100, Will Deacon wrote:
> > > How can a write be non-posted on the PCI bus if it's posted on AXI?
> > 
> > From the point-of-view of the CPU it would be posted, but the PCI bus would
> > see an unposted write (so I imagine there would be write buffering at the
> > host controller). However, I worry that I'm missing your point :)
> 
> It is worth being a bit careful with language here, from an AXI
> perspective there is not really such thing as a posted write. 
> 
> All writes are explicitly ack'd upon 'completion', however the memory
> type influences when that is allowed to happen.

Correct. I was trying desperately to avoid delving into AXI signals as it
adds another source of confusion, despite the attempt at being precise.

> For PCI IO writes the AXI memory type from the CPU must be 'Device
> Non-bufferable' (AWCACHE = 0), which will require the AXI ACK to be
> generated only once the PCI target returns an IOWr completion TLP.

That sounds like `strongly-ordered memory' for ARMv7.

> For PCI Memory writes the AXI memory type from the CPU could be
> 'Device Non-bufferable' but it would be best if it is 'Device
> Bufferable' (AWCACHE = 1).

That sounds like `device memory' for ARMv7.

> The latter allows more performance by permitting any AXI bridge in the
> path to ack the write early. This is as close as AXI gets to 'posted
> writes'
> 
> It is very important that the page tables in the CPU properly select
> the right AXI Memory Type for each space.

But, as far as I know, this ordering/completion guarantee for I/O space
accesses is a property of the x86 architecture, not something mandated by
the PCI spec (after all, this is nothing to do with the PCI bus).

> AFAIK, to duplicate x86 semantics an outl/inl must spin the CPU until
> it completes at the target, and the CPU must not pipeline outl/inl
> operations: outl();  outl(); produces 1 IOWr TLP, waits for
> completion, then produces another.

So that's the real question: Do we really need to duplicate x86 semantics
for IO space accesses? If we do, then we need both strongly-ordered memory
*and* a dsb in our accessors. That's not going to be much fun.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
