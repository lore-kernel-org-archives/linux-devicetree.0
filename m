From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 5/5] mm: enable CONFIG_MOVABLE_NODE on non-x86 arches
Date: Fri, 07 Oct 2016 12:10:21 +0530
Message-ID: <87wphkmzl6.fsf@linux.vnet.ibm.com>
References: <1475778995-1420-1-git-send-email-arbab@linux.vnet.ibm.com> <1475778995-1420-6-git-send-email-arbab@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1475778995-1420-6-git-send-email-arbab@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: Reza Arbab <arbab@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, Tang Chen <tangchen@cn.fujitsu.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-mm@kvack.org
List-Id: devicetree@vger.kernel.org

Reza Arbab <arbab@linux.vnet.ibm.com> writes:

> To support movable memory nodes (CONFIG_MOVABLE_NODE), at least one of
> the following must be true:
>
> 1. We're on x86. This arch has the capability to identify movable nodes
>    at boot by parsing the ACPI SRAT, if the movable_node option is used.
>
> 2. Our config supports memory hotplug, which means that a movable node
>    can be created by hotplugging all of its memory into ZONE_MOVABLE.
>
> Fix the Kconfig definition of CONFIG_MOVABLE_NODE, which currently
> recognizes (1), but not (2).
>

We now enable a lot of new code on different arch, such as the new node list
N_MEMORY.

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>

> Signed-off-by: Reza Arbab <arbab@linux.vnet.ibm.com>
> ---
>  mm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/Kconfig b/mm/Kconfig
> index be0ee11..5d0818f 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -153,7 +153,7 @@ config MOVABLE_NODE
>  	bool "Enable to assign a node which has only movable memory"
>  	depends on HAVE_MEMBLOCK
>  	depends on NO_BOOTMEM
> -	depends on X86_64
> +	depends on X86_64 || MEMORY_HOTPLUG
>  	depends on NUMA
>  	default n
>  	help
> -- 
> 1.8.3.1

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
