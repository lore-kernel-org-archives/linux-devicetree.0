From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/7] ARM: kernel: update topology to use new MPIDR
 macros
Date: Mon, 19 Nov 2012 10:38:34 -0500 (EST)
Message-ID: <alpine.LFD.2.02.1211191037450.1182@xanadu.home>
References: <1353329106-24084-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1353329106-24084-3-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1353329106-24084-3-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
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

On Mon, 19 Nov 2012, Lorenzo Pieralisi wrote:

> This patch updates the topology initialization code to use the newly
> defined accessors to retrieve the MPIDR affinity levels.
> 
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>

Acked-by: Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> ---
>  arch/arm/kernel/topology.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/kernel/topology.c b/arch/arm/kernel/topology.c
> index 4642c7d..cba99bd 100644
> --- a/arch/arm/kernel/topology.c
> +++ b/arch/arm/kernel/topology.c
> @@ -262,19 +262,14 @@ void store_cpu_topology(unsigned int cpuid)
>  
>  		if (mpidr & MPIDR_MT_BITMASK) {
>  			/* core performance interdependency */
> -			cpuid_topo->thread_id = (mpidr >> MPIDR_LEVEL0_SHIFT)
> -				& MPIDR_LEVEL0_MASK;
> -			cpuid_topo->core_id = (mpidr >> MPIDR_LEVEL1_SHIFT)
> -				& MPIDR_LEVEL1_MASK;
> -			cpuid_topo->socket_id = (mpidr >> MPIDR_LEVEL2_SHIFT)
> -				& MPIDR_LEVEL2_MASK;
> +			cpuid_topo->thread_id = MPIDR_AFFINITY_LEVEL(mpidr, 0);
> +			cpuid_topo->core_id = MPIDR_AFFINITY_LEVEL(mpidr, 1);
> +			cpuid_topo->socket_id = MPIDR_AFFINITY_LEVEL(mpidr, 2);
>  		} else {
>  			/* largely independent cores */
>  			cpuid_topo->thread_id = -1;
> -			cpuid_topo->core_id = (mpidr >> MPIDR_LEVEL0_SHIFT)
> -				& MPIDR_LEVEL0_MASK;
> -			cpuid_topo->socket_id = (mpidr >> MPIDR_LEVEL1_SHIFT)
> -				& MPIDR_LEVEL1_MASK;
> +			cpuid_topo->core_id = MPIDR_AFFINITY_LEVEL(mpidr, 0);
> +			cpuid_topo->socket_id = MPIDR_AFFINITY_LEVEL(mpidr, 1);
>  		}
>  	} else {
>  		/*
> -- 
> 1.7.12
> 
> 
