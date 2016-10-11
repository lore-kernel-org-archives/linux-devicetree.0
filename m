From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Subject: Re: [PATCH v8 10/16] mm/memblock: add a new function
 memblock_alloc_near_nid
Date: Tue, 11 Oct 2016 19:04:24 +0800
Message-ID: <57FCC738.7050005@huawei.com>
References: <1472712907-12700-1-git-send-email-thunder.leizhen@huawei.com>
 <1472712907-12700-11-git-send-email-thunder.leizhen@huawei.com>
 <57FC43F4.1020909@huawei.com> <20161011101623.GC23648@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161011101623.GC23648@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <will.deacon@arm.com>
Cc: devicetree <devicetree@vger.kernel.org>, Zefan Li <lizefan@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, Hanjun Guo <guohanjun@huawei.com>, linux-kernel <linux-kernel@vger.kernel.org>, Xinwei Hu <huxinwei@huawei.com>, linux-mm <linux-mm@kvack.org>, Rob Herring <robh+dt@kernel.org>, Tianhong Ding <dingtianhong@huawei.com>, Andrew Morton <akpm@linux-foundation.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 2016/10/11 18:16, Will Deacon wrote:
> On Tue, Oct 11, 2016 at 09:44:20AM +0800, Leizhen (ThunderTown) wrote:
>> On 2016/9/1 14:55, Zhen Lei wrote:
>>> If HAVE_MEMORYLESS_NODES is selected, and some memoryless numa nodes are
>>> actually exist. The percpu variable areas and numa control blocks of that
>>> memoryless numa nodes must be allocated from the nearest available node
>>> to improve performance.
>>>
>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>> ---
>>>  include/linux/memblock.h |  1 +
>>>  mm/memblock.c            | 28 ++++++++++++++++++++++++++++
>>>  2 files changed, 29 insertions(+)
>>
>> Hi Will,
>>   It seems no one take care about this, how about I move below function into arch/arm64/mm/numa.c
>> again? So that, merge it and patch 11 into one.
> 
> I'd rather you reposted it after the merge window so we can see what to
> do with it then. The previous posting was really hard to figure out and
> mixed lots of different concepts into one series, so it's not completely
> surprising that it didn't all get picked up.
OK, thanks.

> 
> Will
> 
> .
> 
