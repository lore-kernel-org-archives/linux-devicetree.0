From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCHv3 1/3] ARM: mm: allow sub-architectures to override PCI
 I/O memory type
Date: Fri, 16 May 2014 09:33:35 -0600
Message-ID: <20140516153335.GA29660@obsidianresearch.com>
References: <1400145519-28530-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140515155130.193c3181@free-electrons.com>
 <20140515142924.GI27594@arm.com>
 <4972763.mtuLYh6sDH@wuerfel>
 <20140515153430.GM27594@arm.com>
 <20140515175307.GA12259@obsidianresearch.com>
 <20140516095736.GF12341@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140516095736.GF12341-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Albin Tonnerre <Albin.Tonnerre-5wv7dgnIgG8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 16, 2014 at 10:57:36AM +0100, Will Deacon wrote:
> > AFAIK, to duplicate x86 semantics an outl/inl must spin the CPU until
> > it completes at the target, and the CPU must not pipeline outl/inl
> > operations: outl();  outl(); produces 1 IOWr TLP, waits for
> > completion, then produces another.
> 
> So that's the real question: Do we really need to duplicate x86 semantics
> for IO space accesses? If we do, then we need both strongly-ordered memory
> *and* a dsb in our accessors. That's not going to be much fun.

Yep, that is the real question.

It has been over 10 years since I last converted a driver from IO to
MMIO - but IIRC the completion timing became a software visible
difference.

The entire reasons that this funny non-posted outl exists in PCI is to
support software compatability. You could take an ISA device and stick
it on PCI and the driver timing would be completely unaltered.

Linux obviously works on systems where outl is posted, ARM currently,
for instance. I've also run on MIPS systems that completely lack the
ability to synchronize outl (and I recall having to convert all the
drivers to mmio on that system..)

Arnd is right though, I doubt anyone cares, using IO space has been
discouraged for a decade at least at this point.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
