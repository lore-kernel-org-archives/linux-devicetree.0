From: "long.wanglong" <long.wanglong@huawei.com>
Subject: Re: [PATCH] drivers/of/fdt.c: replace pr_warning by pr_warn
Date: Sat, 25 Jul 2015 08:57:06 +0800
Message-ID: <55B2DEE2.8080509@huawei.com>
References: <1437465693-143982-1-git-send-email-long.wanglong@huawei.com> <CAL_JsqKY7hTurOdR4kgXZBT922-s-paM-CgU5rv_fB4qinfxSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKY7hTurOdR4kgXZBT922-s-paM-CgU5rv_fB4qinfxSA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, peifeiyue@huawei.com, wanglong@laoqinren.net
List-Id: devicetree@vger.kernel.org

On 2015/7/25 3:00, Rob Herring wrote:
> On Tue, Jul 21, 2015 at 3:01 AM, Wang Long <long.wanglong@huawei.com> wrote:
>> Update the last pr_warning callsite in drivers/of.
> 
> That is obvious in the diff, but can you tell me why?

Hi Rob,

When we use script "./scripts/checkpatch.pl" to check a patch, using pr_warning
will produce WARNING:

	WARNING: Prefer pr_warn(... to pr_warning(...
	#22: FILE: drivers/of/fdt.c:428:
	+		pr_warning("End of tree marker overwritten: %08x\n",

So,we should convert pr_warning to pr_warn.


Best Regards
Wang Long


> 
> Rob
> 
>> Signed-off-by: Wang Long <long.wanglong@huawei.com>
>> ---
>>  drivers/of/fdt.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>> index 0749656..e1f61b8 100644
>> --- a/drivers/of/fdt.c
>> +++ b/drivers/of/fdt.c
>> @@ -425,7 +425,7 @@ static void __unflatten_device_tree(const void *blob,
>>         start = 0;
>>         unflatten_dt_node(blob, mem, &start, NULL, mynodes, 0, false);
>>         if (be32_to_cpup(mem + size) != 0xdeadbeef)
>> -               pr_warning("End of tree marker overwritten: %08x\n",
>> +               pr_warn("End of tree marker overwritten: %08x\n",
>>                            be32_to_cpup(mem + size));
>>
>>         pr_debug(" <- unflatten_device_tree()\n");
>> @@ -985,24 +985,24 @@ void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
>>         size &= PAGE_MASK;
>>
>>         if (base > MAX_PHYS_ADDR) {
>> -               pr_warning("Ignoring memory block 0x%llx - 0x%llx\n",
>> +               pr_warn("Ignoring memory block 0x%llx - 0x%llx\n",
>>                                 base, base + size);
>>                 return;
>>         }
>>
>>         if (base + size - 1 > MAX_PHYS_ADDR) {
>> -               pr_warning("Ignoring memory range 0x%llx - 0x%llx\n",
>> +               pr_warn("Ignoring memory range 0x%llx - 0x%llx\n",
>>                                 ((u64)MAX_PHYS_ADDR) + 1, base + size);
>>                 size = MAX_PHYS_ADDR - base + 1;
>>         }
>>
>>         if (base + size < phys_offset) {
>> -               pr_warning("Ignoring memory block 0x%llx - 0x%llx\n",
>> +               pr_warn("Ignoring memory block 0x%llx - 0x%llx\n",
>>                            base, base + size);
>>                 return;
>>         }
>>         if (base < phys_offset) {
>> -               pr_warning("Ignoring memory range 0x%llx - 0x%llx\n",
>> +               pr_warn("Ignoring memory range 0x%llx - 0x%llx\n",
>>                            base, phys_offset);
>>                 size -= phys_offset - base;
>>                 base = phys_offset;
>> --
>> 1.8.3.4
>>
> 
> .
> 
