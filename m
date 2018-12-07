From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [RFT PATCH v1 0/4] Unify CPU topology across ARM64 & RISC-V
Date: Fri, 7 Dec 2018 15:04:32 +0000
Message-ID: <20181207150432.GB4100@e107155-lin>
References: <1543534100-3654-1-git-send-email-atish.patra@wdc.com>
 <20181207134509.GA5913@e105550-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181207134509.GA5913@e105550-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Morten Rasmussen <morten.rasmussen@arm.com>
Cc: Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org, Dmitriy Cherkasov <dmitriy@oss-tech.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, Juri Lelli <juri.lelli@arm.com>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 07, 2018 at 01:45:21PM +0000, Morten Rasmussen wrote:
> Hi,
>
> On Thu, Nov 29, 2018 at 03:28:16PM -0800, Atish Patra wrote:
> > The cpu-map DT entry in ARM64 can describe the CPU topology in
> > much better way compared to other existing approaches. RISC-V can
> > easily adopt this binding to represent it's own CPU topology.
> > Thus, both cpu-map DT binding and topology parsing code can be
> > moved to a common location so that RISC-V or any other
> > architecture can leverage that.
> >
> > The relevant discussion regarding unifying cpu topology can be
> > found in [1].
> >
> > arch_topology seems to be a perfect place to move the common
> > code. I have not introduced any functional changes in the moved
> > code. The only downside in this approach is that the capacity
> > code will be executed for RISC-V as well. But, it will exit
> > immediately after not able to find the appropriate DT node. If
> > the overhead is considered too much, we can always compile out
> > capacity related functions under a different config for the
> > architectures that do not support them.
> >
> > The patches have been tested for RISC-V and compile tested for
> > ARM64 & x86.
>
> The cpu-map bindings are used for arch/arm too, and so is
> arch_topology.c. In fact, it was introduced to allow code-sharing
> between arm and arm64. Applying patch three breaks arm.
>

Ah right. Though I remember the whole point of moving these to arch_topology
was to share between ARM and ARM64, I completely forgot to check the
impact of this for ARM platforms.

> Moving the DT parsing to arch_topology.c we have to unify all three
> architectures. Be aware that arm and arm64 have some differences in how
> they detect cpu capacities. I think we might have to look at the split
> of code between arch/* and arch_topology.c again :-/
>

Thanks for pointing this out. I completely agree and apologies for
forgetting about arm32.

Regards,
Sudeep
