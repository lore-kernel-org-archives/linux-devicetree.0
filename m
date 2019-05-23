From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [RFT PATCH v4 3/5] cpu-topology: Move cpu topology code to
 common code.
Date: Thu, 23 May 2019 10:35:49 +0100
Message-ID: <20190523093549.GA13560@e107155-lin>
References: <20190428002529.14229-1-atish.patra@wdc.com>
 <20190428002529.14229-4-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190428002529.14229-4-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>
Cc: linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>, Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>, Anup Patel <anup@brainfault.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Morten Rasmussen <morten.rasmussen@arm.com>, Otto Sabart <ottosabart@seberm.com>, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 27, 2019 at 05:25:27PM -0700, Atish Patra wrote:
> Both RISC-V & ARM64 are using cpu-map device tree to describe
> their cpu topology. It's better to move the relevant code to
> a common place instead of duplicate code.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  arch/arm64/include/asm/topology.h |  23 ---
>  arch/arm64/kernel/topology.c      | 303 +-----------------------------
>  drivers/base/arch_topology.c      | 298 ++++++++++++++++++++++++++++-
>  drivers/base/topology.c           |   1 +
>  include/linux/arch_topology.h     |  28 +++
>  5 files changed, 330 insertions(+), 323 deletions(-)
> 
> -void store_cpu_topology(unsigned int cpuid);
[...]


> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index edfcf8d982e4..2b0758c01cee 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -6,8 +6,8 @@
>   * Written by: Juri Lelli, ARM Ltd.
>   */
>
> -#include <linux/acpi.h>
>  #include <linux/arch_topology.h>
> +#include <linux/acpi.h>

I assume this was to avoid compilation errors, when I rebased I got
conflict and I ordered them back alphabetically as before and hit the
compilation error.

The actual fix would be to include linux/arch_topology.h in linux/topology.h
as you are moving contents of asm/topology.h which it includes.

I did the change and get it tested by kbuild. See [1]

Regards,
Sudeep

[1] https://git.kernel.org/sudeep.holla/linux/h/cpu_topology
