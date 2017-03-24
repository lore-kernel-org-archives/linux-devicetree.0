From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH 3/3] powerpc/powernv: Introduce address translation services for Nvlink2
Date: Fri, 24 Mar 2017 23:28:32 +1100
Message-ID: <87k27ex3in.fsf@concordia.ellerman.id.au>
References: <1490154573-22475-1-git-send-email-alistair@popple.id.au> <1490154573-22475-3-git-send-email-alistair@popple.id.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490154573-22475-3-git-send-email-alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, mhairgrove-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, shailendras-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org> writes:

> diff --git a/arch/powerpc/include/asm/tlb.h b/arch/powerpc/include/asm/tlb.h
> index 6095575..fc61fca 100644
> --- a/arch/powerpc/include/asm/tlb.h
> +++ b/arch/powerpc/include/asm/tlb.h
> @@ -63,15 +63,21 @@ static inline void tlb_remove_check_page_size_change(struct mmu_gather *tlb,
>  }
>  
>  #ifdef CONFIG_SMP
> +/* If there is an NPU context associated with this thread it may have
> + * been active on a GPU which has issued translation requests via the
> + * nest mmu. In this case we need to do a broadcast tlb to invalidate
> + * any caches on the nest mmu. Invalidations on the GPU are handled
> + * via mmu notfiers.
> + */
>  static inline int mm_is_core_local(struct mm_struct *mm)
>  {
> -	return cpumask_subset(mm_cpumask(mm),
> +	return !mm->context.npu_context && cpumask_subset(mm_cpumask(mm),
>  			      topology_sibling_cpumask(smp_processor_id()));
>  }

This breaks the BookE build (corenet64_smp_defconfig):

23:22:58 In file included from arch/powerpc/mm/pgtable-book3e.c:15:0:
23:22:58 ./arch/powerpc/include/asm/tlb.h: In function 'mm_is_core_local':
23:22:58 ./arch/powerpc/include/asm/tlb.h:75:21: error: 'mm_context_t {aka struct <anonymous>}' has no member named 'npu_context'
23:22:58   return !mm->context.npu_context && cpumask_subset(mm_cpumask(mm),
23:22:58                      ^

cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
