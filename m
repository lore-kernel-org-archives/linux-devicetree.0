From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v8 10/16] mm/memblock: add a new function
 memblock_alloc_near_nid
Date: Tue, 11 Oct 2016 11:16:23 +0100
Message-ID: <20161011101623.GC23648@arm.com>
References: <1472712907-12700-1-git-send-email-thunder.leizhen@huawei.com>
 <1472712907-12700-11-git-send-email-thunder.leizhen@huawei.com>
 <57FC43F4.1020909@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <57FC43F4.1020909@huawei.com>
Sender: owner-linux-mm@kvack.org
To: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree <devicetree@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm <linux-mm@kvack.org>, Zefan Li <lizefan@huawei.com>, Xinwei Hu <huxinwei@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>, Hanjun Guo <guohanjun@huawei.com>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 11, 2016 at 09:44:20AM +0800, Leizhen (ThunderTown) wrote:
> On 2016/9/1 14:55, Zhen Lei wrote:
> > If HAVE_MEMORYLESS_NODES is selected, and some memoryless numa nodes are
> > actually exist. The percpu variable areas and numa control blocks of that
> > memoryless numa nodes must be allocated from the nearest available node
> > to improve performance.
> > 
> > Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> > ---
> >  include/linux/memblock.h |  1 +
> >  mm/memblock.c            | 28 ++++++++++++++++++++++++++++
> >  2 files changed, 29 insertions(+)
> 
> Hi Will,
>   It seems no one take care about this, how about I move below function into arch/arm64/mm/numa.c
> again? So that, merge it and patch 11 into one.

I'd rather you reposted it after the merge window so we can see what to
do with it then. The previous posting was really hard to figure out and
mixed lots of different concepts into one series, so it's not completely
surprising that it didn't all get picked up.

Will

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
