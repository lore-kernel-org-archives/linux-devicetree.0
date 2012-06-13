From: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [RFC 4/4] sched: cpu_power: enable ARCH_POWER
Date: Wed, 13 Jun 2012 15:50:43 +0200
Message-ID: <CAKfTPtAbmLy5hR-W7RMQpn1cf1jkirv0oNtS_h4dmPYx5gTm1w@mail.gmail.com>
References: <1339502524-10265-1-git-send-email-vincent.guittot@linaro.org>
	<1339502524-10265-5-git-send-email-vincent.guittot@linaro.org>
	<1339591819.8980.28.camel@twins>
	<CAKfTPtCERCDdCSLyPAYAhxAB4wkDMVfMbfecv+vOMbgUXvYwYg@mail.gmail.com>
	<1339594110.8980.38.camel@twins>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1339594110.8980.38.camel@twins>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, devicetree-discuss@lists.ozlabs.org, linux@arm.linux.org.uk, grant.likely@secretlab.ca, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On 13 June 2012 15:28, Peter Zijlstra <peterz@infradead.org> wrote:
> On Wed, 2012-06-13 at 15:20 +0200, Vincent Guittot wrote:
>>
>> In v3.4, x86 hasn't got any specific declaration for
>> arch_scale_freq_power so it would now use the weak
>> arch_scale_freq_power which calls default_scale_freq_power. Isn't it
>> enough ?
>
> ---
> Subject: sched, x86: Remove broken power estimation
> From: Peter Zijlstra <a.p.zijlstra@chello.nl>
> Date: Wed Jun 13 15:24:45 CEST 2012
>
> The x86 sched power implementation has been broken forever and gets i=
n
> the way of other stuff, remove it.
>
> For archaeological interest, fixing this code would require dealing w=
ith
> the cross-cpu calling of these functions and more importantly, we nee=
d
> to filter idle time out of the a/m-perf stuff because the ratio will =
go
> down to 0 when idle, giving a 0 capacity which is not what we'd want.
>
> Signed-off-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
> Link: http://lkml.kernel.org/n/tip-wjjwelpti8f8k7i1pdnzmdr8@git.kerne=
l.org
> ---
> =A0arch/x86/kernel/cpu/Makefile | =A0 =A02 -
> =A0arch/x86/kernel/cpu/sched.c =A0| =A0 55 --------------------------=
-----------------
> =A02 files changed, 1 insertion(+), 56 deletions(-)
>
> --- a/arch/x86/kernel/cpu/Makefile
> +++ b/arch/x86/kernel/cpu/Makefile
> @@ -14,7 +14,7 @@ CFLAGS_common.o =A0 =A0 =A0 =A0 =A0 =A0 =A0 :=3D $(=
nostackp)
>
> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0:=3D intel_cacheinfo.o sc=
attered.o topology.o
> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D proc.o capflags.o po=
werflags.o common.o
> -obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D vmware.o hypervisor.o =
sched.o mshyperv.o
> +obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D vmware.o hypervisor.o =
mshyperv.o
> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D rdrand.o
> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D match.o
>
> --- a/arch/x86/kernel/cpu/sched.c
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -#include <linux/sched.h>
> -#include <linux/math64.h>
> -#include <linux/percpu.h>
> -#include <linux/irqflags.h>
> -
> -#include <asm/cpufeature.h>
> -#include <asm/processor.h>
> -
> -#ifdef CONFIG_SMP
> -
> -static DEFINE_PER_CPU(struct aperfmperf, old_perf_sched);
> -
> -static unsigned long scale_aperfmperf(void)
> -{
> - =A0 =A0 =A0 struct aperfmperf val, *old =3D &__get_cpu_var(old_perf=
_sched);
> - =A0 =A0 =A0 unsigned long ratio, flags;
> -
> - =A0 =A0 =A0 local_irq_save(flags);
> - =A0 =A0 =A0 get_aperfmperf(&val);
> - =A0 =A0 =A0 local_irq_restore(flags);
> -
> - =A0 =A0 =A0 ratio =3D calc_aperfmperf_ratio(old, &val);
> - =A0 =A0 =A0 *old =3D val;
> -
> - =A0 =A0 =A0 return ratio;
> -}
> -
> -unsigned long arch_scale_freq_power(struct sched_domain *sd, int cpu=
)
> -{
> - =A0 =A0 =A0 /*
> - =A0 =A0 =A0 =A0* do aperf/mperf on the cpu level because it include=
s things
> - =A0 =A0 =A0 =A0* like turbo mode, which are relevant to full cores.
> - =A0 =A0 =A0 =A0*/
> - =A0 =A0 =A0 if (boot_cpu_has(X86_FEATURE_APERFMPERF))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return scale_aperfmperf();
> -
> - =A0 =A0 =A0 /*
> - =A0 =A0 =A0 =A0* maybe have something cpufreq here
> - =A0 =A0 =A0 =A0*/
> -
> - =A0 =A0 =A0 return default_scale_freq_power(sd, cpu);
> -}
> -
> -unsigned long arch_scale_smt_power(struct sched_domain *sd, int cpu)
> -{
> - =A0 =A0 =A0 /*
> - =A0 =A0 =A0 =A0* aperf/mperf already includes the smt gain
> - =A0 =A0 =A0 =A0*/
> - =A0 =A0 =A0 if (boot_cpu_has(X86_FEATURE_APERFMPERF))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return SCHED_LOAD_SCALE;
> -
> - =A0 =A0 =A0 return default_scale_smt_power(sd, cpu);
> -}
> -
> -#endif
>

Sorry for the misses, I need to update my tags because this has been fi=
ltered.
