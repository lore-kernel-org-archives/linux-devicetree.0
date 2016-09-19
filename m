From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 3/3] mm: enable CONFIG_MOVABLE_NODE on powerpc
Date: Mon, 19 Sep 2016 11:59:35 +0530
Message-ID: <87h99cxv00.fsf@linux.vnet.ibm.com>
References: <1473883618-14998-1-git-send-email-arbab@linux.vnet.ibm.com> <1473883618-14998-4-git-send-email-arbab@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1473883618-14998-4-git-send-email-arbab@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: Reza Arbab <arbab@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-mm@kvack.org
List-Id: devicetree@vger.kernel.org

Reza Arbab <arbab@linux.vnet.ibm.com> writes:

> Onlining memory into ZONE_MOVABLE requires CONFIG_MOVABLE_NODE. Enable
> the use of this config option on PPC64 platforms.
>
> Signed-off-by: Reza Arbab <arbab@linux.vnet.ibm.com>
> ---
>  Documentation/kernel-parameters.txt | 2 +-
>  mm/Kconfig                          | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/kernel-parameters.txt b/Documentation/kernel-parameters.txt
> index a4f4d69..3d8460d 100644
> --- a/Documentation/kernel-parameters.txt
> +++ b/Documentation/kernel-parameters.txt
> @@ -2344,7 +2344,7 @@ bytes respectively. Such letter suffixes can also be entirely omitted.
>  			that the amount of memory usable for all allocations
>  			is not too small.
>  
> -	movable_node	[KNL,X86] Boot-time switch to enable the effects
> +	movable_node	[KNL,X86,PPC] Boot-time switch to enable the effects
>  			of CONFIG_MOVABLE_NODE=y. See mm/Kconfig for details.
>  

Movable node also does.
	memblock_set_bottom_up(true);
What is the impact of that. Do we need changes equivalent to that ? Also
where are we marking the nodes which can be hotplugged, ie where do we
do memblock_mark_hotplug() ?
       
>  	MTD_Partition=	[MTD]
> diff --git a/mm/Kconfig b/mm/Kconfig
> index be0ee11..4b19cd3 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -153,7 +153,7 @@ config MOVABLE_NODE
>  	bool "Enable to assign a node which has only movable memory"
>  	depends on HAVE_MEMBLOCK
>  	depends on NO_BOOTMEM
> -	depends on X86_64
> +	depends on X86_64 || PPC64
>  	depends on NUMA
>  	default n
>  	help

-aneesh

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
