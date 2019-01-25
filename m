From: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH v2 06/21] memblock: memblock_phys_alloc_try_nid(): don't
 panic
Date: Fri, 25 Jan 2019 21:32:52 +0200
Message-ID: <20190125193252.GH31519@rapoport-lnx>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <1548057848-15136-7-git-send-email-rppt@linux.ibm.com>
 <20190125174502.GL25901@arrakis.emea.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190125174502.GL25901@arrakis.emea.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guan Xuetao <gxt@pku.edu.cn>, Guo Ren <guoren@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Russell
List-Id: devicetree@vger.kernel.org

On Fri, Jan 25, 2019 at 05:45:02PM +0000, Catalin Marinas wrote:
> On Mon, Jan 21, 2019 at 10:03:53AM +0200, Mike Rapoport wrote:
> > diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
> > index ae34e3a..2c61ea4 100644
> > --- a/arch/arm64/mm/numa.c
> > +++ b/arch/arm64/mm/numa.c
> > @@ -237,6 +237,10 @@ static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
> >  		pr_info("Initmem setup node %d [<memory-less node>]\n", nid);
> >  
> >  	nd_pa = memblock_phys_alloc_try_nid(nd_size, SMP_CACHE_BYTES, nid);
> > +	if (!nd_pa)
> > +		panic("Cannot allocate %zu bytes for node %d data\n",
> > +		      nd_size, nid);
> > +
> >  	nd = __va(nd_pa);
> >  
> >  	/* report and initialize */
> 
> Does it mean that memblock_phys_alloc_try_nid() never returns valid
> physical memory starting at 0?

Yes, it does.
memblock_find_in_range_node() that is used by all allocation methods
skips the first page [1].
 
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/mm/memblock.c#n257

> -- 
> Catalin
> 

-- 
Sincerely yours,
Mike.
