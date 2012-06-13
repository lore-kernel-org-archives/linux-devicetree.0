From: Jean Pihet <jean.pihet@newoldbits.com>
Subject: Re: [RFC 1/4] ARM: topology: Add arch_scale_freq_power function
Date: Wed, 13 Jun 2012 10:50:59 +0200
Message-ID: <CAORVsuWGE3=8DWRMG0Fq2+CGt9i7__JnfUnOAjbZgGcvhfVK5g@mail.gmail.com>
References: <1339502524-10265-1-git-send-email-vincent.guittot@linaro.org>
	<1339502524-10265-2-git-send-email-vincent.guittot@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1339502524-10265-2-git-send-email-vincent.guittot@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, devicetree-discuss@lists.ozlabs.org, linux@arm.linux.org.uk, peterz@infradead.org, grant.likely@secretlab.ca, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

Hi Vincent,

On Tue, Jun 12, 2012 at 2:02 PM, Vincent Guittot
<vincent.guittot@linaro.org> wrote:
> Add infrastructure to be able to modify the cpu_power of each core
>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
> =A0arch/arm/include/asm/topology.h | =A0 =A02 ++
> =A0arch/arm/kernel/topology.c =A0 =A0 =A0| =A0 36 +++++++++++++++++++=
++++++++++++++++-
> =A02 files changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/include/asm/topology.h b/arch/arm/include/asm/t=
opology.h
> index 58b8b84..78e4c85 100644
> --- a/arch/arm/include/asm/topology.h
> +++ b/arch/arm/include/asm/topology.h
> @@ -27,11 +27,13 @@ void init_cpu_topology(void);
> =A0void store_cpu_topology(unsigned int cpuid);
> =A0const struct cpumask *cpu_coregroup_mask(int cpu);
>
> +void set_power_scale(unsigned int cpu, unsigned long power);
> =A0#else
>
> =A0static inline void init_cpu_topology(void) { }
> =A0static inline void store_cpu_topology(unsigned int cpuid) { }
>
> +static inline void set_power_scale(unsigned int cpu, unsigned long p=
ower) { }
> =A0#endif
>
> =A0#include <asm-generic/topology.h>
> diff --git a/arch/arm/kernel/topology.c b/arch/arm/kernel/topology.c
> index 8200dea..00301a7 100644
> --- a/arch/arm/kernel/topology.c
> +++ b/arch/arm/kernel/topology.c
> @@ -22,6 +22,35 @@
> =A0#include <asm/cputype.h>
> =A0#include <asm/topology.h>
>
> +/*
> + * cpu power scale management
> + */
> +
> +/*
> + * cpu power table
> + * This per cpu data structure describes the relative capacity of ea=
ch core.
> + * On a heteregenous system, cores don't have the same computation c=
apacity
> + * and we reflect that difference in the cpu_power field so the sche=
duler can
> + * take this difference into account for load balance. A per cpu str=
ucture is
> + * preferred because each cpu is mainly using its own cpu_power even=
 it's not
> + * always true because of nohz_idle_balance
The end of the comment is unclear IMO; Can you give more details on
the relation between cpu_power and nohz_idle_balance?

Regards,
Jean
