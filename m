From: Will Deacon <will.deacon@arm.com>
Subject: Re: [RFT PATCH v1 3/4] cpu-topology: Move cpu topology code to
 common code.
Date: Mon, 3 Dec 2018 16:58:34 +0000
Message-ID: <20181203165833.GA27796@arm.com>
References: <1543534100-3654-1-git-send-email-atish.patra@wdc.com>
 <1543534100-3654-4-git-send-email-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1543534100-3654-4-git-send-email-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org, Dmitriy Cherkasov <dmitriy@oss-tech.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, Juri Lelli <juri.lelli@arm.com>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Morten Rasmussen <morten.rasmussen@arm.com>, Palmer Dabbelt <palmer@sifive.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob
List-Id: devicetree@vger.kernel.org

On Thu, Nov 29, 2018 at 03:28:19PM -0800, Atish Patra wrote:
> Both RISC-V & ARM64 are using cpu-map device tree to describe
> their cpu topology. It's better to move the relevant code to
> a common place instead of duplicate code.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/arm64/include/asm/topology.h |  22 ---
>  arch/arm64/kernel/topology.c      | 303 +-------------------------------------
>  drivers/base/arch_topology.c      | 294 ++++++++++++++++++++++++++++++++++++

Whilst I'm happy seeing this code moved out, I'd like to have an entry in
MAINTAINERS so that somebody can review changes from the arm64 side without
having to poll a load of different lists. I assume patches would still go
via Rafael and Greg, but if we could have Sudeep added as Reviewer for this
file, then I'd really appreciate it.

Cheers,

Will
