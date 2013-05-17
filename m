From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH v4 02/18] ARM: kernel: fix __cpu_logical_map default
 initialization
Date: Fri, 17 May 2013 11:46:38 -0400 (EDT)
Message-ID: <alpine.LFD.2.03.1305171146100.31158@syhkavp.arg>
References: <1368804061-4421-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1368804061-4421-3-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1368804061-4421-3-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
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
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>, Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 17 May 2013, Lorenzo Pieralisi wrote:

> The __cpu_logical_map array is statically initialized to 0, which is a valid
> MPIDR value. To prevent issues with the current implementation, this patch
> defines an MPIDR_INVALID value, and statically initializes the
> __cpu_logical_map[] array to it. Entries in the arm_dt_init_cpu_maps()
> tmp_map array used to stash DT reg properties while parsing DT are initialized
> with the MPIDR_INVALID value as well for consistency.
> 
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> CC: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>

Acked-by: Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>


> ---
>  arch/arm/include/asm/cputype.h  | 2 ++
>  arch/arm/include/asm/smp_plat.h | 2 +-
>  arch/arm/kernel/devtree.c       | 2 +-
>  arch/arm/kernel/setup.c         | 2 +-
>  4 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/include/asm/cputype.h b/arch/arm/include/asm/cputype.h
> index 7652712..dba62cb 100644
> --- a/arch/arm/include/asm/cputype.h
> +++ b/arch/arm/include/asm/cputype.h
> @@ -32,6 +32,8 @@
>  
>  #define MPIDR_HWID_BITMASK 0xFFFFFF
>  
> +#define MPIDR_INVALID (~MPIDR_HWID_BITMASK)
> +
>  #define MPIDR_LEVEL_BITS 8
>  #define MPIDR_LEVEL_MASK ((1 << MPIDR_LEVEL_BITS) - 1)
>  
> diff --git a/arch/arm/include/asm/smp_plat.h b/arch/arm/include/asm/smp_plat.h
> index aaa61b6..e789832 100644
> --- a/arch/arm/include/asm/smp_plat.h
> +++ b/arch/arm/include/asm/smp_plat.h
> @@ -49,7 +49,7 @@ static inline int cache_ops_need_broadcast(void)
>  /*
>   * Logical CPU mapping.
>   */
> -extern int __cpu_logical_map[];
> +extern u32 __cpu_logical_map[];
>  #define cpu_logical_map(cpu)	__cpu_logical_map[cpu]
>  /*
>   * Retrieve logical cpu index corresponding to a given MPIDR[23:0]
> diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
> index 904cad5..0905502 100644
> --- a/arch/arm/kernel/devtree.c
> +++ b/arch/arm/kernel/devtree.c
> @@ -82,7 +82,7 @@ void __init arm_dt_init_cpu_maps(void)
>  	u32 i, j, cpuidx = 1;
>  	u32 mpidr = is_smp() ? read_cpuid_mpidr() & MPIDR_HWID_BITMASK : 0;
>  
> -	u32 tmp_map[NR_CPUS] = { [0 ... NR_CPUS-1] = UINT_MAX };
> +	u32 tmp_map[NR_CPUS] = { [0 ... NR_CPUS-1] = MPIDR_INVALID };
>  	bool bootcpu_valid = false;
>  	cpus = of_find_node_by_path("/cpus");
>  
> diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> index 6ae71b7..eeac924 100644
> --- a/arch/arm/kernel/setup.c
> +++ b/arch/arm/kernel/setup.c
> @@ -457,7 +457,7 @@ void notrace cpu_init(void)
>  	    : "r14");
>  }
>  
> -int __cpu_logical_map[NR_CPUS];
> +u32 __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = MPIDR_INVALID };
>  
>  void __init smp_setup_processor_id(void)
>  {
> -- 
> 1.8.2.2
> 
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
> 
