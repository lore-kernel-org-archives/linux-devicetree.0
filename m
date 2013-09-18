From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 18/28] of: create default early_init_dt_add_memory_arch
Date: Wed, 18 Sep 2013 10:09:40 -0500
Message-ID: <CAL_JsqKkhPt0hMKvdh+71WN9ERTRvzJKXO9ZV076ks-XGxbn4A@mail.gmail.com>
References: <1379372965-22359-1-git-send-email-robherring2@gmail.com>
	<1379372965-22359-19-git-send-email-robherring2@gmail.com>
	<20130918033358.51CA1C42C9E@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130918033358.51CA1C42C9E-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, "x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org" <microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org>, linux-ZwoEplunGu2h2975yA52AaxOck334EZe@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 17, 2013 at 10:33 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Mon, 16 Sep 2013 18:09:14 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>
>> Create a weak version of early_init_dt_add_memory_arch which uses
>> memblock or is an empty function when memblock is not enabled. This
>> will unify all architectures except ones with custom memory bank
>> structs.
>
> Two comments below, but otherwise:
>
> Acked-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>> index 0714dd4..a9dce7a 100644
>> --- a/drivers/of/fdt.c
>> +++ b/drivers/of/fdt.c
>> @@ -688,6 +688,17 @@ u64 __init dt_mem_next_cell(int s, __be32 **cellp)
>>       return of_read_number(p, s);
>>  }
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
>> +
>
> Can you do it this way instead:
>
> #ifdef CONFIG_HAVE_MEMBLOCK
> void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
> {
>         base &= PAGE_MASK;
>         size &= PAGE_MASK;
>         memblock_add(base, size);
> }
> #endif
>
> If the platform doesn't provide an early_init_dt_add_memory_arch()
> function and it doesn't have a memblock implementation, then the build
> should outright fail. I don't see a scenario where we would want to
> successfully build the kernel without a working add memory function.

metag and x86 both have empty functions. I guess they get memory from
a different boot interface.

Rob

>
> Also, can you group this function with the common __weak
> early_init_dt_alloc_memory_arch() implementation? It would be good to
> group all the memblock specific functions together.
>
> g.
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
