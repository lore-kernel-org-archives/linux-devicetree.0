From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH] of/fdt: add kernel command line option for dtb_compat
 string
Date: Wed, 08 Dec 2010 07:03:29 -0800
Message-ID: <4CFF9E41.6050006@gmail.com>
References: <1291658059-383-1-git-send-email-dirk.brandewie@gmail.com> <4bb36a12-8d95-4d4e-936c-c1c74a9372cc@VA3EHSMHS025.ehs.local> <4CFD3322.1000503@gmail.com> <4CFD3371.3080807@gmail.com> <805e9139-7c09-45f5-a5a9-0ed0cbf64f2f@VA3EHSMHS025.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <805e9139-7c09-45f5-a5a9-0ed0cbf64f2f@VA3EHSMHS025.ehs.local>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Neuendorffer <stephen.neuendorffer@xilinx.com>
Cc: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@xenotime.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, grant.likely@secretlab.ca
List-Id: devicetree@vger.kernel.org

On 12/06/2010 01:50 PM, Stephen Neuendorffer wrote:
>
>
>> -----Original Message-----
>> From: Dirk Brandewie [mailto:dirk.brandewie@gmail.com]
>> Sent: Monday, December 06, 2010 11:03 AM
>> To: Stephen Neuendorffer
>> Cc: linux-kernel@vger.kernel.org; Randy Dunlap;
> devicetree-discuss@lists.ozlabs.org; linux-
>> doc@vger.kernel.org; grant.likely@secretlab.ca
>> Subject: Re: [PATCH] of/fdt: add kernel command line option for
> dtb_compat string
>>
>> On 12/06/2010 11:01 AM, Dirk Brandewie wrote:
>>> On 12/06/2010 10:37 AM, Stephen Neuendorffer wrote:
>>>>
>>>>
>>>>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>>>>> index c1360e0..ca1318c 100644
>>>>> --- a/drivers/of/fdt.c
>>>>> +++ b/drivers/of/fdt.c
>>>>> @@ -15,6 +15,8 @@
>>>>> #include<linux/of_fdt.h>
>>>>> #include<linux/string.h>
>>>>> #include<linux/errno.h>
>>>>> +#include<asm-generic/vmlinux.lds.h>
>>>>> +
>>>>>
>>>>> #ifdef CONFIG_PPC
>>>>> #include<asm/machdep.h>
>>>>> @@ -604,3 +606,49 @@ void __init unflatten_device_tree(void)
>>>>>
>>>>> pr_debug("<- unflatten_device_tree()\n");
>>>>> }
>>>>> +
>>>>> +extern uint8_t __dtb_start[];
>>>>> +extern uint8_t __dtb_end[];
>>>>> +static void __init *of_flat_dt_find_compatible_dtb(char *name)
>>>>> +{
>>>>> + void *rc = NULL;
>>>>> + unsigned long root, size;
>>>>> + struct boot_param_header *orig_initial_boot_params;
>>>>> + uint8_t *blob;
>>>>> +
>>>>> + orig_initial_boot_params = initial_boot_params;
>>>>> + blob = __dtb_start;
>>>>> + initial_boot_params = (struct boot_param_header *)blob;
>>>>
>>>> Oy... can you avoid the pointer dance by using
> of_fdt_is_compatible()
>>>> from my recent set of patches?
>>>
>>> I would like to get rid of the pointer dance. Is your patch set
> going to make it
>>> into .37? I didn't see any acks.
>>>
>> Obviously I meant .38 :-)
>
> I'd like it too, but that's up to Grant.

Grant any guidance here?

I imagine some of the
> bottleneck is that I don't have
> an easy way to test on powerpc or microblaze at the moment, so it's not
> clear that the code doesn't
> break anything.
>
