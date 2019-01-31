From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v2 19/21] treewide: add checks for the return value of
 memblock_alloc*()
Date: Thu, 31 Jan 2019 07:07:46 +0100
Message-ID: <b7c12014-14ae-2a38-900c-41fd145307bc@c-s.fr>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <1548057848-15136-20-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548057848-15136-20-git-send-email-rppt@linux.ibm.com>
Content-Language: fr
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, uclinux
List-Id: devicetree@vger.kernel.org



Le 21/01/2019 à 09:04, Mike Rapoport a écrit :
> Add check for the return value of memblock_alloc*() functions and call
> panic() in case of error.
> The panic message repeats the one used by panicing memblock allocators with
> adjustment of parameters to include only relevant ones.
> 
> The replacement was mostly automated with semantic patches like the one
> below with manual massaging of format strings.
> 
> @@
> expression ptr, size, align;
> @@
> ptr = memblock_alloc(size, align);
> + if (!ptr)
> + 	panic("%s: Failed to allocate %lu bytes align=0x%lx\n", __func__,
> size, align);
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> Reviewed-by: Guo Ren <ren_guo@c-sky.com>             # c-sky
> Acked-by: Paul Burton <paul.burton@mips.com>	     # MIPS
> Acked-by: Heiko Carstens <heiko.carstens@de.ibm.com> # s390
> Reviewed-by: Juergen Gross <jgross@suse.com>         # Xen
> ---

[...]

> diff --git a/mm/sparse.c b/mm/sparse.c
> index 7ea5dc6..ad94242 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c

[...]

> @@ -425,6 +436,10 @@ static void __init sparse_buffer_init(unsigned long size, int nid)
>   		memblock_alloc_try_nid_raw(size, PAGE_SIZE,
>   						__pa(MAX_DMA_ADDRESS),
>   						MEMBLOCK_ALLOC_ACCESSIBLE, nid);
> +	if (!sparsemap_buf)
> +		panic("%s: Failed to allocate %lu bytes align=0x%lx nid=%d from=%lx\n",
> +		      __func__, size, PAGE_SIZE, nid, __pa(MAX_DMA_ADDRESS));
> +

memblock_alloc_try_nid_raw() does not panic (help explicitly says: Does 
not zero allocated memory, does not panic if request cannot be satisfied.).

Stephen Rothwell reports a boot failure due to this change.

Christophe

>   	sparsemap_buf_end = sparsemap_buf + size;
>   }
>   
> 
