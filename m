From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [RFT PATCH v1 3/4] cpu-topology: Move cpu topology code to
 common code.
Date: Mon, 3 Dec 2018 17:12:24 +0000
Message-ID: <20181203171223.GD17883@e107155-lin>
References: <1543534100-3654-1-git-send-email-atish.patra@wdc.com>
 <1543534100-3654-4-git-send-email-atish.patra@wdc.com>
 <20181203165833.GA27796@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181203165833.GA27796@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>, Juri Lelli <juri.lelli@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org, Dmitriy Cherkasov <dmitriy@oss-tech.org>, Ingo Molnar <mingo@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Morten Rasmussen <morten.rasmussen@arm.com>, Palmer Dabbelt <palmer@sifive.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@l>
List-Id: devicetree@vger.kernel.org

(Fixed Juri Lelli's email)

On Mon, Dec 03, 2018 at 04:58:34PM +0000, Will Deacon wrote:
> On Thu, Nov 29, 2018 at 03:28:19PM -0800, Atish Patra wrote:
> > Both RISC-V & ARM64 are using cpu-map device tree to describe
> > their cpu topology. It's better to move the relevant code to
> > a common place instead of duplicate code.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  arch/arm64/include/asm/topology.h |  22 ---
> >  arch/arm64/kernel/topology.c      | 303 +-------------------------------------
> >  drivers/base/arch_topology.c      | 294 ++++++++++++++++++++++++++++++++++++
>
> Whilst I'm happy seeing this code moved out, I'd like to have an entry in
> MAINTAINERS so that somebody can review changes from the arm64 side without
> having to poll a load of different lists. I assume patches would still go
> via Rafael and Greg, but if we could have Sudeep added as Reviewer for this
> file, then I'd really appreciate it.
>

Thanks Will for pointing this. I agree with you and like to be added as
reviewer for this.

Since arch_topology.c was mostly added for ARM/ARM64 and by Juri Lelli 
(who is no longer with ARM) and I did review the initial version, I would
like to assume maintenance for this file if both Juri and Greg are OK
with it so that I can keep an eye on this as we expect more changes to
this both for ARM and RISC-V. I am fine if anyone who has contributed
more to this file wants to maintain.

--
Regards,
Sudeep
