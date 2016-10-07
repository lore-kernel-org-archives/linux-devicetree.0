From: "Aneesh Kumar K.V" <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 4/5] mm: make processing of movable_node arch-specific
Date: Fri, 07 Oct 2016 12:07:11 +0530
Message-ID: <87zimgmzqg.fsf@linux.vnet.ibm.com>
References: <1475778995-1420-1-git-send-email-arbab@linux.vnet.ibm.com> <1475778995-1420-5-git-send-email-arbab@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475778995-1420-5-git-send-email-arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Reza Arbab <arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Bharata B Rao <bharata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Nathan Fontenot <nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Alistair Popple <apopple-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, Balbir Singh <bsingharora-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tang Chen <tangchen-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Reza Arbab <arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> writes:

> Currently, CONFIG_MOVABLE_NODE depends on X86_64. In preparation to
> enable it for other arches, we need to factor a detail which is unique
> to x86 out of the generic mm code.
>
> Specifically, as documented in kernel-parameters.txt, the use of
> "movable_node" should remain restricted to x86:
>
> movable_node    [KNL,X86] Boot-time switch to enable the effects
>                 of CONFIG_MOVABLE_NODE=y. See mm/Kconfig for details.
>
> This option tells x86 to find movable nodes identified by the ACPI SRAT.
> On other arches, it would have no benefit, only the undesired side
> effect of setting bottom-up memblock allocation.
>
> Since #ifdef CONFIG_MOVABLE_NODE will no longer be enough to restrict
> this option to x86, move it to an arch-specific compilation unit
> instead.

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

>
> Signed-off-by: Reza Arbab <arbab-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> ---
>  arch/x86/mm/numa.c  | 35 ++++++++++++++++++++++++++++++++++-
>  mm/memory_hotplug.c | 31 -------------------------------
>  2 files changed, 34 insertions(+), 32 deletions(-)
>
> diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> index fb68210..e95cab4 100644
> --- a/arch/x86/mm/numa.c
> +++ b/arch/x86/mm/numa.c
> @@ -887,6 +887,38 @@ EXPORT_SYMBOL(cpumask_of_node);
>  #endif	/* !CONFIG_DEBUG_PER_CPU_MAPS */
>
>  #ifdef CONFIG_MEMORY_HOTPLUG
> +
> +static int __init cmdline_parse_movable_node(char *p)
> +{
> +#ifdef CONFIG_MOVABLE_NODE
> +	/*
> +	 * Memory used by the kernel cannot be hot-removed because Linux
> +	 * cannot migrate the kernel pages. When memory hotplug is
> +	 * enabled, we should prevent memblock from allocating memory
> +	 * for the kernel.
> +	 *
> +	 * ACPI SRAT records all hotpluggable memory ranges. But before
> +	 * SRAT is parsed, we don't know about it.
> +	 *
> +	 * The kernel image is loaded into memory at very early time. We
> +	 * cannot prevent this anyway. So on NUMA system, we set any
> +	 * node the kernel resides in as un-hotpluggable.
> +	 *
> +	 * Since on modern servers, one node could have double-digit
> +	 * gigabytes memory, we can assume the memory around the kernel
> +	 * image is also un-hotpluggable. So before SRAT is parsed, just
> +	 * allocate memory near the kernel image to try the best to keep
> +	 * the kernel away from hotpluggable memory.
> +	 */
> +	memblock_set_bottom_up(true);
> +	movable_node_enabled = true;
> +#else
> +	pr_warn("movable_node option not supported\n");
> +#endif
> +	return 0;
> +}
> +early_param("movable_node", cmdline_parse_movable_node);
> +
>  int memory_add_physaddr_to_nid(u64 start)
>  {
>  	struct numa_meminfo *mi = &numa_meminfo;
> @@ -899,4 +931,5 @@ int memory_add_physaddr_to_nid(u64 start)
>  	return nid;
>  }
>  EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
> -#endif
> +
> +#endif /* CONFIG_MEMORY_HOTPLUG */
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 9d29ba0..79c709a 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1738,37 +1738,6 @@ static bool can_offline_normal(struct zone *zone, unsigned long nr_pages)
>  }
>  #endif /* CONFIG_MOVABLE_NODE */
>
> -static int __init cmdline_parse_movable_node(char *p)
> -{
> -#ifdef CONFIG_MOVABLE_NODE
> -	/*
> -	 * Memory used by the kernel cannot be hot-removed because Linux
> -	 * cannot migrate the kernel pages. When memory hotplug is
> -	 * enabled, we should prevent memblock from allocating memory
> -	 * for the kernel.
> -	 *
> -	 * ACPI SRAT records all hotpluggable memory ranges. But before
> -	 * SRAT is parsed, we don't know about it.
> -	 *
> -	 * The kernel image is loaded into memory at very early time. We
> -	 * cannot prevent this anyway. So on NUMA system, we set any
> -	 * node the kernel resides in as un-hotpluggable.
> -	 *
> -	 * Since on modern servers, one node could have double-digit
> -	 * gigabytes memory, we can assume the memory around the kernel
> -	 * image is also un-hotpluggable. So before SRAT is parsed, just
> -	 * allocate memory near the kernel image to try the best to keep
> -	 * the kernel away from hotpluggable memory.
> -	 */
> -	memblock_set_bottom_up(true);
> -	movable_node_enabled = true;
> -#else
> -	pr_warn("movable_node option not supported\n");
> -#endif
> -	return 0;
> -}
> -early_param("movable_node", cmdline_parse_movable_node);
> -
>  /* check which state of node_states will be changed when offline memory */
>  static void node_states_check_changes_offline(unsigned long nr_pages,
>  		struct zone *zone, struct memory_notify *arg)
> -- 
> 1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
