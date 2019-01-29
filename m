From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 06/21] memblock: memblock_phys_alloc_try_nid(): don't panic
Date: Tue, 29 Jan 2019 20:58:13 +1100
Message-ID: <87va27rdje.fsf@concordia.ellerman.id.au>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com> <1548057848-15136-7-git-send-email-rppt@linux.ibm.com> <87y373rdll.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87y373rdll.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guan Xuetao <gxt@pku.edu.cn>, Guo Ren <guoren@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arml>
List-Id: devicetree@vger.kernel.org

Michael Ellerman <mpe@ellerman.id.au> writes:

> Mike Rapoport <rppt@linux.ibm.com> writes:
>
>> diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
>> index ae34e3a..2c61ea4 100644
>> --- a/arch/arm64/mm/numa.c
>> +++ b/arch/arm64/mm/numa.c
>> @@ -237,6 +237,10 @@ static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
>>  		pr_info("Initmem setup node %d [<memory-less node>]\n", nid);
>>  
>>  	nd_pa = memblock_phys_alloc_try_nid(nd_size, SMP_CACHE_BYTES, nid);
>> +	if (!nd_pa)
>> +		panic("Cannot allocate %zu bytes for node %d data\n",
>> +		      nd_size, nid);
>> +
>>  	nd = __va(nd_pa);

Wrong hunk, O_o

> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

You know what I mean though :)

cheers
