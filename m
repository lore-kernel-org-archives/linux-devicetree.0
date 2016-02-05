From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/2] pci, pci-thunder-pem: Add PCIe host driver for
 ThunderX processors.
Date: Fri, 5 Feb 2016 13:49:27 -0600
Message-ID: <20160205194927.GA6581@localhost>
References: <1453844781-24380-1-git-send-email-ddaney.cavm@gmail.com>
 <1453844781-24380-3-git-send-email-ddaney.cavm@gmail.com>
 <20160205000452.GI7031@localhost>
 <56B3ECAD.4050605@caviumnetworks.com>
 <20160205031042.GA31722@localhost>
 <56B4D812.7080106@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56B4D812.7080106-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 05, 2016 at 09:12:50AM -0800, David Daney wrote:
> On 02/04/2016 07:10 PM, Bjorn Helgaas wrote:
> >On Thu, Feb 04, 2016 at 04:28:29PM -0800, David Daney wrote:
> >>On 02/04/2016 04:04 PM, Bjorn Helgaas wrote:
> >>>On Tue, Jan 26, 2016 at 01:46:21PM -0800, David Daney wrote:
> >>>>From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> >>>>
> >>>>Some Cavium ThunderX processors require quirky access methods for the
> >>>>config space of the PCIe bridge.  Add a driver to provide these config
> >>>>space accessor functions.  The pci-host-common code is used to
> >>>>configure the PCI machinery.
> >>>>
> >>>>Signed-off-by: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> >>>>Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >>>>Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> >>>>---
> >>>>  .../devicetree/bindings/pci/pci-thunder-pem.txt    |  43 ++++
> >>>>  MAINTAINERS                                        |   8 +
> >>>>  drivers/pci/host/Kconfig                           |   7 +
> >>>>  drivers/pci/host/Makefile                          |   1 +
> >>>>  drivers/pci/host/pci-thunder-pem.c                 | 283 +++++++++++++++++++++
> >>>
> >>>What's the significance of the "pem" part of the name?  I'm wondering
> >>>if we can shorten the filenames and function names by dropping it and
> >>>referring to this simply as "thunder" or "thunderx".
> ...

> >>Since PEM and ECAM are terminology used in the hardware manuals that
> >>have specific meanings relative to the Thunder SoC family, I think
> >>it is not too inconvenient to carry them over into the file names.
> >
> >As long as PEM and ECAM are really two distinct root complexes that
> >are unrelated, I guess this is OK.
> 
> They are, see above.

OK, I'm convinced.

> >>>>+		/*
> >>>>+		 * 32-bit accesses only.  If the write is for a size
> >>>>+		 * smaller than 32-bits, we must first read the 32-bit
> >>>>+		 * value and merge in the desired bits and then write
> >>>>+		 * the whole 32-bits back out.
> >>>>+		 */
> >>>
> >>>Ugh.  Another device that only supports 32-bit writes.  I guess this
> >>>only affects this single device, and maybe you "know" that it has no
> >>>registers where RW1C bits may be corrupted.  Although I suppose this
> >>>device has the standard status registers (Status at 0x06, Secondary
> >>>Status at 0x1e, Device Status in PCIe capability, etc.), which do
> >>>contain RW1C bits.
> ...

> I will add a WARN_ONCE or similar. and send a new patch set.
> 
> FWIW, I think I have been able to get the message through to the
> hardware architects that building root complexes that are not
> exposed as PCI standard ECAMs makes things very difficult.  This was
> the original intention, but turned out not to be possible when we
> looked more closely at the hardware implementation.  I am optimistic
> that subsequent generations of Thunder will be much improved in this
> area.

Great!  Since there's apparently only one ThunderX device (devfn == 0
on the root bus) that has this problem, and you know exactly what that
device is and where all its RW1C bits are, you *could* fix this in the
*_config_write() functions by clearing any RW1C bits before the
"modify/write" part of any read/modify/write cycle.

BTW, minor nit, when you repost these, can you reorder the
map_bus/read/write functions in that order so they match the order
they're declared in struct pci_ops?  I think both pem and ecam
versions could benefit from this.

Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
