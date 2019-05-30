From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v6 1/7] Documentation: DT: arm: add support for sockets
 defining package boundaries
Date: Thu, 30 May 2019 08:56:03 -0400
Message-ID: <70639181-09d1-4644-f062-b19e06db7471@ti.com>
References: <20190529211340.17087-1-atish.patra@wdc.com>
 <20190529211340.17087-2-atish.patra@wdc.com>
 <49f41e62-5354-a674-d95f-5f63851a0ca6@ti.com>
 <20190530115103.GA10919@e105550-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190530115103.GA10919@e105550-lin.cambridge.arm.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Morten Rasmussen <morten.rasmussen@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>, Atish Patra <atish.patra@wdc.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Jeremy Linton <jeremy.linton@arm.com>, Otto
List-Id: devicetree@vger.kernel.org

On 5/30/19 7:51 AM, Morten Rasmussen wrote:
> On Wed, May 29, 2019 at 07:39:17PM -0400, Andrew F. Davis wrote:
>> On 5/29/19 5:13 PM, Atish Patra wrote:
>>> From: Sudeep Holla <sudeep.holla@arm.com>
>>>
>>> The current ARM DT topology description provides the operating system
>>> with a topological view of the system that is based on leaf nodes
>>> representing either cores or threads (in an SMT system) and a
>>> hierarchical set of cluster nodes that creates a hierarchical topology
>>> view of how those cores and threads are grouped.
>>>
>>> However this hierarchical representation of clusters does not allow to
>>> describe what topology level actually represents the physical package or
>>> the socket boundary, which is a key piece of information to be used by
>>> an operating system to optimize resource allocation and scheduling.
>>>
>>
>> Are physical package descriptions really needed? What does "socket" imply
>> that a higher layer "cluster" node grouping does not? It doesn't imply a
>> different NUMA distance and the definition of "socket" is already not well
>> defined, is a dual chiplet processor not just a fancy dual "socket" or are
>> dual "sockets" on a server board "slotket" card, will we need new names for
>> those too..
> 
> Socket (or package) just implies what you suggest, a grouping of CPUs
> based on the physical socket (or package). Some resources might be
> associated with packages and more importantly socket information is
> exposed to user-space. At the moment clusters are being exposed to
> user-space as sockets which is less than ideal for some topologies.
> 

I see the benefit of reporting the physical layout and packaging 
information to user-space for tracking reasons, but from software 
perspective this doesn't matter, and the resource partitioning should be 
described elsewhere (NUMA nodes being the go to example).

> At the moment user-space is only told about hw threads, cores, and
> sockets. In the very near future it is going to be told about dies too
> (look for Len Brown's multi-die patch set).
> 

Seems my hypothetical case is already in the works :(

> I don't see how we can provide correct information to user-space based
> on the current information in DT. I'm not convinced it was a good idea
> to expose this information to user-space to begin with but that is
> another discussion.
> 

Fair enough, it's a little late now to un-expose this info to userspace 
so we should at least present it correctly. My worry was this getting 
out of hand with layering, for instance what happens when we need to add 
die nodes in-between cluster and socket?

Andrew

> Morten
> 
