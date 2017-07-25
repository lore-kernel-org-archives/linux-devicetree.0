From: Andrii Anisov <andrii_anisov-uRwfk40T5oI@public.gmane.org>
Subject: Re: Duplicated memory node in the Device-Tree (WAS [XEN] Re:
 Duplicated memory nodes cause the BUG())
Date: Tue, 25 Jul 2017 18:27:31 +0300
Message-ID: <c77f71a3-edd9-3700-001b-feee05165454@epam.com>
References: <835d808c-9d5e-2dc0-6cf9-8fbecdc49914@epam.com>
 <6d1fb061-03b0-3b58-e70a-3c0e0777d8d7@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6d1fb061-03b0-3b58-e70a-3c0e0777d8d7-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julien Grall <julien.grall-5wv7dgnIgG8@public.gmane.org>, xen-devel <xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org>
Cc: Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Cooper <andrew.cooper3-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Ian Jackson <ian.jackson-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, Wei Liu <wei.liu2-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Jan Beulich <JBeulich-IBi9RG/b67k@public.gmane.org>, Konrad Rzeszutek Wilk <konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, George Dunlap <george.dunlap-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Tim Deegan <tim-LM2mM/qkH7s@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Julien,


On 25.07.17 17:23, Julien Grall wrote:
> I think this is by chance rather than by design. The first question to 
> answer is why a Firmware would specify twice the same memory banks? Is 
> it valid from the specification?
Yep, that is the question.

> Regardless that, it looks like to me that the device-tree you give to 
> the board should not contain the memory nodes.
The device-tree is provided by vendor in that form, and u-boot is 
theirs. It seems to me that they do not really care since the kernel 
tolerates duplication.

>>  ps. Linux kernel does tolerate duplicated memory nodes by merging 
>> memory blocks. I.e. memblock_add_range() function is commented as 
>> following:
>> /**
>>      * memblock_add_range - add new memblock region
>>      * @type: memblock type to add new region into
>>      * @base: base address of the new region
>>      * @size: size of the new region
>>      * @nid: nid of the new region
>>      * @flags: flags of the new region
>>      *
>>      * Add new memblock region [@base,@base+@size) into @type. The new
>> region
>>      * is allowed to overlap with existing ones - overlaps don't affect
>> already
>>      * existing regions.  @type is guaranteed to be minimal (all
>> neighbouring
>>      * compatible regions are merged) after the addition.
>>      *
>>      * RETURNS:
>>      * 0 on success, -errno on failure.
>>      */
IMO the function description is pretty straight-forward.
But let us wait for device tree guys feedback.

-- 

*Andrii Anisov*


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
