From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCHv3 3/3] ARM: mvebu: implement L2/PCIe deadlock workaround
Date: Thu, 15 May 2014 16:22:08 +0200
Message-ID: <20140515162208.30d5687c@free-electrons.com>
References: <1400145519-28530-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1400145519-28530-4-git-send-email-thomas.petazzoni@free-electrons.com>
	<6600397.74rV2Hm7nM@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6600397.74rV2Hm7nM@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Albin Tonnerre <albin.tonnerre-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Arnd Bergmann,

On Thu, 15 May 2014 15:26:29 +0200, Arnd Bergmann wrote:

> > +
> > +       if (of_machine_is_compatible("marvell,armada375") ||
> > +           of_machine_is_compatible("marvell,armada38x")) {
> > +               arch_ioremap_caller = armada_pcie_wa_ioremap_caller;
> > +               pci_ioremap_set_mem_type(MT_UNCACHED);
> > +               mvebu_l2x0_pl310_coherent();
> > +       }
> > +
> >         l2x0_of_init(0, ~0UL);
> 
> 
> I wonder whether this should just be move to the existing
> armada_375_380_coherency_init() function to avoid the
> of_machine_is_compatible() check. Other than that,

Indeed, makes a lot of sense to have this in coherency.c instead. Will
be part of v4.

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
