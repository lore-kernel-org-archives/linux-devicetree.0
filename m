From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCHv4 3/3] ARM: mvebu: implement L2/PCIe deadlock workaround
Date: Fri, 16 May 2014 09:07:27 +0200
Message-ID: <20140516090727.5264dc75@free-electrons.com>
References: <1400165974-9059-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1400165974-9059-4-git-send-email-thomas.petazzoni@free-electrons.com>
	<20140516060851.GF27822@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140516060851.GF27822-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Albin Tonnerre <albin.tonnerre-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Jason Cooper,

On Fri, 16 May 2014 02:08:51 -0400, Jason Cooper wrote:
> On Thu, May 15, 2014 at 04:59:34PM +0200, Thomas Petazzoni wrote:
> > The Marvell Armada 375 and Armada 38x SOCs, which use the Cortex-A9
> > CPU core, the PL310 cache and the Marvell PCIe hardware block are
> > affected a L2/PCIe deadlock caused by a system erratum when hardware
> > I/O coherency is used.
> > 
> > This deadlock can be avoided by mapping the PCIe memory areas as
> > strongly-ordered (note: MT_UNCACHED is strongly-ordered), and by
> > removing the outer cache sync done in software. This is implemented in
> > this patch by:
> > 
> >  * Registering a custom arch_ioremap_caller function that allows to
> >    make sure PCI memory regions are mapped MT_UNCACHED.
> > 
> >  * Adding at runtime the 'arm,io-coherent' property to the PL310 cache
> >    controller. This cannot be done permanently in the DT, because the
> >    hardware I/O coherency can only be enabled when CONFIG_SMP is
> >    enabled, in the current kernel situation.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  arch/arm/mach-mvebu/coherency.c | 39 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> 
> Applied to mvebu/soc.

Hum, well, I believe it's OK, but notice that I will very likely have
to do a followup patch, because the solution of making all PCI I/O
mappings use the MT_UNCACHED memory type, suggested by Arnd, has not
been accepted by Will Deacon. So very likely I will have to change
again the mach-mvebu/coherency.c code to call a function that makes PCI
I/O mappings MT_UNCACHED specifically for the mach-mvebu platform. But
that can indeed be a followup patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
