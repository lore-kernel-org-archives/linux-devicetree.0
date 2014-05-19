From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCHv3 1/3] ARM: mm: allow sub-architectures to override PCI I/O memory type
Date: Mon, 19 May 2014 19:04:24 +0200
Message-ID: <6041406.aOYqt5yzTp@wuerfel>
References: <1400145519-28530-1-git-send-email-thomas.petazzoni@free-electrons.com> <4669695.sl9JY8Fb9h@wuerfel> <20140519165010.GQ15130@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140519165010.GQ15130-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Albin Tonnerre <Albin.Tonnerre-5wv7dgnIgG8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 19 May 2014 17:50:10 Will Deacon wrote:
> On Mon, May 19, 2014 at 05:40:51PM +0100, Arnd Bergmann wrote:
> > On Monday 19 May 2014 15:23:55 Will Deacon wrote:
> > > Fair enough -- I just don't think we should dress up an erratum workaround as
> > > a bug fix, especially when it's adding a new user of strongly-ordered memory
> > > to the kernel which we can't honour for arm64.
> > 
> > Makes sense. How about a patch then that just changes the memory type for
> > the I/O space and adds a comment explaining all we found out? From what
> > I can tell, strict ordering is required for Armada 3xx, may or may not
> > be required elsewhere but should never hurt noticeably. We may want to restrict
> > it to ARMv6/v7 so we don't have to pick the right domain.
> 
> Ok, and we don't bother with the extra dsb in outb? I'm alright with that if
> the comment goes into enough detail.

That was my idea. I'm fine with it either way, with the dsb or without it.
Let's see what Russell thinks about this, he probably has a preference.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
