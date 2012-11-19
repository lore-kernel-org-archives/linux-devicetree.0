From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/5] ARM: kernel: smp_setup_processor_id() updates
Date: Sun, 18 Nov 2012 22:08:20 -0500 (EST)
Message-ID: <alpine.LFD.2.02.1211182151400.1182@xanadu.home>
References: <1352983614-22924-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1352983614-22924-2-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1352983614-22924-2-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
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
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 15 Nov 2012, Lorenzo Pieralisi wrote:

> This patch applies some basic changes to the smp_setup_processor_id()
> ARM implementation to make the code that builds cpu_logical_map more
> uniform across the kernel.
> 
> The function now prints the full extent of the boot CPU MPIDR[23:0] and
> initializes the cpu_logical_map for CPUs up to nr_cpu_ids.
> 
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>

Acked-by: Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> ---
>  arch/arm/kernel/setup.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> index da1d1aa..d0df6c8 100644
> --- a/arch/arm/kernel/setup.c
> +++ b/arch/arm/kernel/setup.c
> @@ -426,13 +426,14 @@ int __cpu_logical_map[NR_CPUS];
>  void __init smp_setup_processor_id(void)
>  {
>  	int i;
> -	u32 cpu = is_smp() ? read_cpuid_mpidr() & 0xff : 0;
> +	u32 mpidr = is_smp() ? read_cpuid_mpidr() & 0xffffff : 0;
> +	u32 cpu = mpidr & 0xff;
>  
>  	cpu_logical_map(0) = cpu;
> -	for (i = 1; i < NR_CPUS; ++i)
> +	for (i = 1; i < nr_cpu_ids; ++i)
>  		cpu_logical_map(i) = i == cpu ? 0 : i;
>  
> -	printk(KERN_INFO "Booting Linux on physical CPU %d\n", cpu);
> +	printk(KERN_INFO "Booting Linux on physical CPU 0x%x\n", mpidr);
>  }
>  
>  static void __init setup_processor(void)
> -- 
> 1.7.12
> 
> 
