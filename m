From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 18/28] of: create default early_init_dt_add_memory_arch
Date: Tue, 17 Sep 2013 08:01:36 -0500
Message-ID: <CAL_Jsq+Tt7N-sMPTBKLU565YezK81mN0KcqdtNTQFU5vhBeOUQ@mail.gmail.com>
References: <1379372965-22359-1-git-send-email-robherring2@gmail.com>
	<1379372965-22359-19-git-send-email-robherring2@gmail.com>
	<DDB72C85-45A3-40FC-9108-7B56F6C5BC5B@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DDB72C85-45A3-40FC-9108-7B56F6C5BC5B-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, "x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org" <microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org>, "linux-73nT9ZVIoz3k1uMJSBkQmQ@public.gmane.org" <linux-73nT9ZVIoz3k1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 17, 2013 at 3:46 AM, Catalin Marinas
<catalin.marinas-5wv7dgnIgG8@public.gmane.org> wrote:
> On 17 Sep 2013, at 00:09, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> --- a/arch/arm64/kernel/setup.c
>> +++ b/arch/arm64/kernel/setup.c
>> @@ -147,24 +147,6 @@ static void __init setup_machine_fdt(phys_addr_t dt_phys)
>>       pr_info("Machine: %s\n", machine_name);
>> }
>>
>> -void __init early_init_dt_add_memory_arch(u64 base, u64 size)
>> -{
>> -     base &= PAGE_MASK;
>> -     size &= PAGE_MASK;
>> -     if (base + size < PHYS_OFFSET) {
>> -             pr_warning("Ignoring memory block 0x%llx - 0x%llx\n",
>> -                        base, base + size);
>> -             return;
>> -     }
>> -     if (base < PHYS_OFFSET) {
>> -             pr_warning("Ignoring memory range 0x%llx - 0x%llx\n",
>> -                        base, PHYS_OFFSET);
>> -             size -= PHYS_OFFSET - base;
>> -             base = PHYS_OFFSET;
>> -     }
>> -     memblock_add(base, size);
>> -}
>> -
>> /*
>>  * Limit the memory size that was specified via FDT.
>>  */
>
> ...
>
>> --- a/drivers/of/fdt.c
>> +++ b/drivers/of/fdt.c
>> @@ -688,6 +688,17 @@ u64 __init dt_mem_next_cell(int s, __be32 **cellp)
>>       return of_read_number(p, s);
>> }
>>
>> +void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
>> +{
>> +#ifdef CONFIG_HAVE_MEMBLOCK
>> +     base &= PAGE_MASK;
>> +     size &= PAGE_MASK;
>> +     memblock_add(base, size);
>> +#else
>> +     pr_err("%s: ignoring memory (%llx, %llx)\n", __func__, base, size);
>> +#endif
>> +}
>
> Are the arm64 changes equivalent here?  There are some safety checks to
> cope with the kernel being loaded at a higher offset than the
> recommended one (PHYS_OFFSET calculated automatically).

I tried to keep that, but PHYS_OFFSET is not universally defined. My
reasoning is this range checking is hardly specific to an
architecture. Perhaps if memory always starts at 0 you don't need it.
If arm64 really needs these checks, then all architectures do.

Perhaps "__virt_to_phys(PAGE_OFFSET)" instead of PHYS_OFFSET would work for all?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
