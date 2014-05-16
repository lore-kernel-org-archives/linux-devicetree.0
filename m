From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCHv4 3/3] ARM: mvebu: implement L2/PCIe deadlock workaround
Date: Fri, 16 May 2014 15:21:41 +0200
Message-ID: <20140516152141.564dde70@free-electrons.com>
References: <1400165974-9059-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1400165974-9059-4-git-send-email-thomas.petazzoni@free-electrons.com>
	<20140516060851.GF27822@titan.lakedaemon.net>
	<20140516090727.5264dc75@free-electrons.com>
	<20140516125847.GG27822@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140516125847.GG27822-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Albin Tonnerre <albin.tonnerre-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Jason Cooper,

On Fri, 16 May 2014 08:58:47 -0400, Jason Cooper wrote:

> > Hum, well, I believe it's OK, but notice that I will very likely have
> > to do a followup patch, because the solution of making all PCI I/O
> > mappings use the MT_UNCACHED memory type, suggested by Arnd, has not
> > been accepted by Will Deacon. So very likely I will have to change
> > again the mach-mvebu/coherency.c code to call a function that makes PCI
> > I/O mappings MT_UNCACHED specifically for the mach-mvebu platform. But
> > that can indeed be a followup patch.
> 
> Ahh, my mistake.  It was late.  I saw the arm,io-coherent was settled
> and mistakenly thought the other proposed changes wouldn't affect this
> patch.
> 
> I could easily drop it if you like.  It's currently the tip of mvebu/soc
> and I haven't done a signed tag for it yet.

I think it's OK, you can keep it: the PCI I/O mapping thing will come
as an addition.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
