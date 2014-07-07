From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 4/4] drivers: dma-contiguous: add initialization from
 device tree
Date: Mon, 07 Jul 2014 12:36:40 +0200
Message-ID: <53BA7838.7000706@samsung.com>
References: <1404298132-6050-1-git-send-email-m.szyprowski@samsung.com>
 <1404298132-6050-5-git-send-email-m.szyprowski@samsung.com>
 <00b501cf974c$2db1a800$8914f800$@lge.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <00b501cf974c$2db1a800$8914f800$@lge.com>
Sender: linux-doc-owner@vger.kernel.org
To: Joonsoo Kim <iamjoonsoo.kim@lge.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: 'Benjamin Herrenschmidt' <benh@kernel.crashing.org>, 'Arnd Bergmann' <arnd@arndb.de>, 'Michal Nazarewicz' <mina86@mina86.com>, 'Grant Likely' <grant.likely@linaro.org>, 'Tomasz Figa' <t.figa@samsung.com>, 'Sascha Hauer' <s.hauer@pengutronix.de>, 'Laura Abbott' <lauraa@codeaurora.org>, 'Rob Herring' <robh+dt@kernel.org>, 'Olof Johansson' <olof@lixom.net>, 'Pawel Moll' <pawel.moll@arm.com>, 'Mark Rutland' <mark.rutland@arm.com>, 'Stephen Warren' <swarren@wwwdotorg.org>, 'Ian Campbell' <ian.campbell@citrix.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Kumar Gala' <galak@codeaurora.org>, 'Nishanth Peethambaran' <nishanth.p@gmail.com>, 'Marc' <marc.ceeeee@gmail.com>, 'Josh Cartwright' <joshc@codeaurora.org>, 'Catalin Marinas' <catalin.marinas@arm.com>, 'Will Deacon' <will.deacon@arm.com>, 'Paul Mackerras' <paulus@samba.org>, 'Jon Medhurst' <tixy@linaro.org>, 'Aneesh
List-Id: devicetree@vger.kernel.org

Hello,

On 2014-07-04 07:52, Joonsoo Kim wrote:
>> -----Original Message-----
>> From: Marek Szyprowski [mailto:m.szyprowski@samsung.com]
>> Sent: Wednesday, July 02, 2014 7:49 PM
>>
>> Subject: [PATCH 4/4] drivers: dma-contiguous: add initialization from
>> device tree
>>
>> Add a code to create CMA region from reserved memory and add support for
>> handling 'shared-dma-pool' reserved-memory device tree nodes.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/base/dma-contiguous.c | 67
>> +++++++++++++++++++++++++++++++++++++++++
>>   include/linux/cma.h           |  3 ++
>>   mm/cma.c                      | 69
> ++++++++++++++++++++++++++++++++-----------
>>   3 files changed, 122 insertions(+), 17 deletions(-)
>>

...

>> +/**
>>    * cma_declare_contiguous() - reserve custom contiguous area
>>    * @base: Base address of the reserved area optional, use 0 for any
>>    * @size: Size of the reserved area (in bytes),
>> @@ -162,18 +210,12 @@ int __init cma_declare_contiguous(phys_addr_t base,
>>   			phys_addr_t alignment, unsigned int order_per_bit,
>>   			bool fixed, struct cma **res_cma)
>>   {
>> -	struct cma *cma;
>> -	int ret = 0;
>> +	int ret;
>>
>>   	pr_debug("%s(size %lx, base %08lx, limit %08lx alignment %08lx)\n",
>>   		__func__, (unsigned long)size, (unsigned long)base,
>>   		(unsigned long)limit, (unsigned long)alignment);
>>
>> -	if (cma_area_count == ARRAY_SIZE(cma_areas)) {
>> -		pr_err("Not enough slots for CMA reserved regions!\n");
>> -		return -ENOSPC;
>> -	}
>> -
> Hello, Marek.
>
> After this change, if we have not enough cma_areas, memory will leak.
> I think that we need separate function to check constraint and this
> function should be called before reserving memory in
> cma_declare_contiguous().

Well, I will leave this check to avoid memory leak then.

> BTW, this mail doesn't appear in LKML. What happens? :)

I have no idea, I will send second version then.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

