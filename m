From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH] of/fdt: add kernel command line option for dtb_compat
 string
Date: Mon, 06 Dec 2010 11:01:54 -0800
Message-ID: <4CFD3322.1000503@gmail.com>
References: <1291658059-383-1-git-send-email-dirk.brandewie@gmail.com> <4bb36a12-8d95-4d4e-936c-c1c74a9372cc@VA3EHSMHS025.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <4bb36a12-8d95-4d4e-936c-c1c74a9372cc@VA3EHSMHS025.ehs.local>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Neuendorffer <stephen.neuendorffer@xilinx.com>
Cc: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@xenotime.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On 12/06/2010 10:37 AM, Stephen Neuendorffer wrote:
>
>
>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>> index c1360e0..ca1318c 100644
>> --- a/drivers/of/fdt.c
>> +++ b/drivers/of/fdt.c
>> @@ -15,6 +15,8 @@
>>   #include<linux/of_fdt.h>
>>   #include<linux/string.h>
>>   #include<linux/errno.h>
>> +#include<asm-generic/vmlinux.lds.h>
>> +
>>
>>   #ifdef CONFIG_PPC
>>   #include<asm/machdep.h>
>> @@ -604,3 +606,49 @@ void __init unflatten_device_tree(void)
>>
>>   	pr_debug("<- unflatten_device_tree()\n");
>>   }
>> +
>> +extern uint8_t __dtb_start[];
>> +extern uint8_t __dtb_end[];
>> +static void __init *of_flat_dt_find_compatible_dtb(char *name)
>> +{
>> +	void *rc = NULL;
>> +	unsigned long root, size;
>> +	struct boot_param_header  *orig_initial_boot_params;
>> +	uint8_t *blob;
>> +
>> +	orig_initial_boot_params = initial_boot_params;
>> +	blob = __dtb_start;
>> +	initial_boot_params = (struct boot_param_header *)blob;
>
> Oy... can you avoid the pointer dance by using of_fdt_is_compatible()
> from my recent set of patches?

I would like to get rid of the pointer dance. Is your patch set going to make it 
into .37?  I didn't see any acks.

> It takes a blob argument.  Then the loop below goes away.
>

The loop will still be needed since multiple DTBs may be linked into the image. 
using your  of_fdt_is_compatible() will make the loop a lot more readable though.

--Dirk

> Steve
>
>> +
>> +
>> +	while (blob<  __dtb_end) {
>> +		if (be32_to_cpu(initial_boot_params->magic) !=
> OF_DT_HEADER) {
>> +			WARN(1, "Invalid device tree blob in
> vmlinux\n");
>> +			break;
>> +		}
>> +
>> +		root = of_get_flat_dt_root();
>> +		if (of_flat_dt_is_compatible(root, name)>  0) {
>> +			rc = blob;
>> +			break;
>> +		}
>> +
>> +		size =  be32_to_cpu(initial_boot_params->totalsize);
>> +		blob =  PTR_ALIGN(blob + size, STRUCT_ALIGNMENT);
>> +		initial_boot_params = (struct boot_param_header *)blob;
>> +	}
>> +
>> +	if (rc == NULL)
>> +		initial_boot_params = orig_initial_boot_params;
>> +	return rc;
>> +}
>> +
>> +
>> +static int __init of_flat_dtb_compat_setup(char *line)
>> +{
>> +	if (!initial_boot_params)
>> +		initial_boot_params =
> of_flat_dt_find_compatible_dtb(line);
>> +	return 1;
>> +}
>> +
>> +early_param("dtb_compat", of_flat_dtb_compat_setup);
>> +
>> --
>> 1.7.2.3
>>
>> _______________________________________________
>> devicetree-discuss mailing list
>> devicetree-discuss@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/devicetree-discuss
>
>
> This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
>
>

