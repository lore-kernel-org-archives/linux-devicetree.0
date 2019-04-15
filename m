From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [RFT/RFC PATCH v3 4/5] arm: Use common cpu_topology
Date: Mon, 15 Apr 2019 16:31:47 +0100
Message-ID: <20190415153147.GB28623@e107155-lin>
References: <20190320234806.19748-1-atish.patra@wdc.com>
 <20190320234806.19748-5-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190320234806.19748-5-atish.patra@wdc.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Atish Patra <atish.patra@wdc.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Jeremy Linton <jeremy.linton@arm.com>, Johan Hovold <johan@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Otto Sabart <ottosabart@seberm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Catalin Marinas <catalin.marinas@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>, Morten Rasmussen <morten.rasmussen@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 20, 2019 at 04:48:05PM -0700, Atish Patra wrote:
> Currently, ARM32 and ARM64 uses different data structures to
> represent their cpu toplogies. Since, we are moving the ARM64
> topology to common code to be used by other architectures, we
> can reuse that for ARM32 as well.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/arm/include/asm/topology.h | 22 +---------------------
>  arch/arm/kernel/topology.c      | 10 +++++-----
>  include/linux/arch_topology.h   | 10 +++++++++-
>  3 files changed, 15 insertions(+), 27 deletions(-)
>

[...]

> diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> index d4e76e0a..7c850611 100644
> --- a/include/linux/arch_topology.h
> +++ b/include/linux/arch_topology.h
> @@ -36,17 +36,25 @@ unsigned long topology_get_freq_scale(int cpu)
>  struct cpu_topology {
>  	int thread_id;
>  	int core_id;
> +#ifdef CONFIG_ARM_CPU_TOPOLOGY
> +	int socket_id;

Sorry, but I can't find any reason why we need to do this ifdef dance
here, especially for socket_id vs package_id ? Other's I can understand
as there are new, but I am sure we can find a way and get away with
#ifdefery here completely.

> +#else
>  	int package_id;
>  	int llc_id;
> +	cpumask_t llc_sibling;
> +#endif
>  	cpumask_t thread_sibling;
>  	cpumask_t core_sibling;
> -	cpumask_t llc_sibling;
>  };
>
>  #ifdef CONFIG_GENERIC_ARCH_TOPOLOGY
>  extern struct cpu_topology cpu_topology[NR_CPUS];
>
> +#ifdef CONFIG_ARM_CPU_TOPOLOGY
> +#define topology_physical_package_id(cpu)	(cpu_topology[cpu].socket_id)
> +#else
>  #define topology_physical_package_id(cpu)	(cpu_topology[cpu].package_id)
> +#endif

Since all callsites must use topology_physical_package_id, we should be
able to rename socket_id to package_id easily.

--
Regards,
Sudeep
