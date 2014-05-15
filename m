From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCHv3 3/3] ARM: mvebu: implement L2/PCIe deadlock workaround
Date: Thu, 15 May 2014 15:50:08 +0200
Message-ID: <20140515155008.1dcca042@free-electrons.com>
References: <1400145519-28530-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1400145519-28530-4-git-send-email-thomas.petazzoni@free-electrons.com>
	<20140515132118.GK27822@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140515132118.GK27822-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Albin Tonnerre <albin.tonnerre-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Jason Cooper,

On Thu, 15 May 2014 09:21:18 -0400, Jason Cooper wrote:

> > +
> > +	if (of_machine_is_compatible("marvell,armada375") ||
> > +	    of_machine_is_compatible("marvell,armada38x")) {
> > +		arch_ioremap_caller = armada_pcie_wa_ioremap_caller;
> > +		pci_ioremap_set_mem_type(MT_UNCACHED);
> 
> iiuc, this patch depends on 1/3.  So how would you like to handle it?

Seems like my long cover letters are not always read in their
entirety :-)

>From my cover letter:

 * PATCH 3/3 uses both of the added infrastructures, as well as the
   existing infrastructure to customize the behavior of ioremap() on a
   per-platform basis, to implement the workaround for the Armada 375
   and 38x SOCs. This patch should go through the mvebu maintainers
   tree. However, it has a build dependency on PATCH 1/3 that needs to
   be taken into account.

The last two sentences are the most important ones here :-)

Joke aside, I'm really open to your suggestions as to what the
appropriate merging patch is. I know Russell prefers to have the ARM
core code flow through his tree, which obviously make sense.

However, routing PATCH 3/3 through Russell tree is going to be a mess
of conflicts when things will get merged by Linus, due to the numerous
other changes we've been doing in mach-mvebu/board-v7.c.

So the only course of action I see right now is to work with Russell to
have him pull patches 1 and 2, and then provide a stable branch/tag
that you can merge as a dependency in whatever branch you decide to
merge patch 3/3. Would that work?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
