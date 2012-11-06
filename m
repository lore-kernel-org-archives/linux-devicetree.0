From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 3/4] ARM: kernel: add logical mappings look-up
Date: Tue, 6 Nov 2012 22:00:38 +0000
Message-ID: <20121106220038.GD21764@mudshark.cambridge.arm.com>
References: <1350393709-23546-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1350393709-23546-4-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1350393709-23546-4-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 16, 2012 at 02:21:47PM +0100, Lorenzo Pieralisi wrote:
> In ARM SMP systems the MPIDR register ([23:0] bits) is used to uniquely
> identify CPUs.
> 
> In order to retrieve the logical CPU index corresponding to a given
> MPIDR value and guarantee a consistent translation throughout the kernel,
> this patch adds a look-up based on the MPIDR[23:0] so that kernel subsystems
> can use it whenever the logical cpu index corresponding to a given MPIDR
> value is needed.
> 
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm/include/asm/smp_plat.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm/include/asm/smp_plat.h b/arch/arm/include/asm/smp_plat.h
> index 558d6c8..aaa61b6 100644
> --- a/arch/arm/include/asm/smp_plat.h
> +++ b/arch/arm/include/asm/smp_plat.h
> @@ -5,6 +5,9 @@
>  #ifndef __ASMARM_SMP_PLAT_H
>  #define __ASMARM_SMP_PLAT_H
>  
> +#include <linux/cpumask.h>
> +#include <linux/err.h>
> +
>  #include <asm/cputype.h>
>  
>  /*
> @@ -48,5 +51,19 @@ static inline int cache_ops_need_broadcast(void)
>   */
>  extern int __cpu_logical_map[];
>  #define cpu_logical_map(cpu)	__cpu_logical_map[cpu]
> +/*
> + * Retrieve logical cpu index corresponding to a given MPIDR[23:0]
> + *  - mpidr: MPIDR[23:0] to be used for the look-up
> + *
> + * Returns the cpu logical index or -EINVAL on look-up error
> + */
> +static inline int get_logical_index(u32 mpidr)
> +{
> +	int cpu;
> +	for (cpu = 0; cpu < nr_cpu_ids; cpu++)
> +		if (cpu_logical_map(cpu) == mpidr)
> +			return cpu;
> +	return -EINVAL;
> +}
>  
>  #endif

Acked-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>

Will
