From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] of: Stop naming platform_device using dcr address
Date: Mon, 26 May 2014 10:21:25 +0100
Message-ID: <CACxGe6sSazjCe3o6gJDFd8mHm_WbTRs5qsE06gdk5UMxFf7Zew@mail.gmail.com>
References: <1400801769-4506-1-git-send-email-grant.likely@linaro.org>
 <1400801769-4506-3-git-send-email-grant.likely@linaro.org> <1400904621.3958.11.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400904621.3958.11.camel@pasglop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 24, 2014 at 5:10 AM, Benjamin Herrenschmidt
<benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> On Fri, 2014-05-23 at 08:36 +0900, Grant Likely wrote:
>> There is now a way to ensure all platform devices get a unique name when
>> populated from the device tree, and the DCR_NATIVE code path is broken
>> anyway. PowerPC Cell (PS3) is the only platform that actually uses this
>> path.  Most likely nobody will notice if it is killed. Remove the code
>> and associated ugly #ifdef.
>>
>> The user-visible impact of this patch is that any DCR device on Cell
>> will get a new name in the /sys/devices hierarchy.
>
> I don't understand. First DCR devices cover more than Cell (and not even
> PS3). All 4xx embedded have some form of DCR based devices so I don't
> know how much we use as "platform".
>
> What do you mean by "the DCR_NATIVE" code path is broken anyway ?

Take a look at the function. In the PPC_DCR_NATIVE path, the device
name is set using format "d%x.%s", but the function doesn't return.
Instead, it falls through to the end of the function that sets the
device name again using "%s.%d", so the first name never sticks.

The last time that code was touched was in 2010 by me when I moved it
out of arch/powerpc (94c0931983ee9, "of: Merge of_device_alloc() and
of_device_make_bus_id()"). It was already broken then. As far as I can
tell, it was broken as far back as 7eebde70, "[POWERPC] Souped-up
of_platform_device support" from 2006 which is when the code was
added. Did it ever work?

The only thing that selects the other option, PPC_DCR_MMIO is Cell in
arch/powerpc/platforms/cell/Kconfig. Every other DCR device is
PPC_DCR_NATIVE, all of which are broken.

> Changing user visible platform device names has broken stuff in the
> past, I'm not saying it is now but I'd like a better justification
> for removing this.

The whole purpose of this function was to create unique names. The
previous patch solves that, so I'm not convinced that this extra code
path is still warranted. Given that nobody has complained about
PPC_DCR_NATIVE seeming never has worked, that path should be just
dropped outright since fixing it would be an user visible change
itself!

If you are really bothered about removing it on Cell, then I'll put it
back in. I just don't think it is worth it.

g.

>
> Cheers,
> Ben.
>
>
>> Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
>> ---
>>  arch/powerpc/include/asm/dcr-mmio.h |  4 ----
>>  arch/powerpc/sysdev/dcr.c           |  6 +++---
>>  drivers/of/platform.c               | 24 ------------------------
>>  3 files changed, 3 insertions(+), 31 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/dcr-mmio.h b/arch/powerpc/include/asm/dcr-mmio.h
>> index acd491dbd45a..93a68b28e695 100644
>> --- a/arch/powerpc/include/asm/dcr-mmio.h
>> +++ b/arch/powerpc/include/asm/dcr-mmio.h
>> @@ -51,10 +51,6 @@ static inline void dcr_write_mmio(dcr_host_mmio_t host,
>>       out_be32(host.token + ((host.base + dcr_n) * host.stride), value);
>>  }
>>
>> -extern u64 of_translate_dcr_address(struct device_node *dev,
>> -                                 unsigned int dcr_n,
>> -                                 unsigned int *stride);
>> -
>>  #endif /* __KERNEL__ */
>>  #endif /* _ASM_POWERPC_DCR_MMIO_H */
>>
>> diff --git a/arch/powerpc/sysdev/dcr.c b/arch/powerpc/sysdev/dcr.c
>> index 1bd0eba4d355..e9056e438575 100644
>> --- a/arch/powerpc/sysdev/dcr.c
>> +++ b/arch/powerpc/sysdev/dcr.c
>> @@ -152,9 +152,9 @@ EXPORT_SYMBOL_GPL(dcr_resource_len);
>>
>>  #ifdef CONFIG_PPC_DCR_MMIO
>>
>> -u64 of_translate_dcr_address(struct device_node *dev,
>> -                          unsigned int dcr_n,
>> -                          unsigned int *out_stride)
>> +static u64 of_translate_dcr_address(struct device_node *dev,
>> +                                 unsigned int dcr_n,
>> +                                 unsigned int *out_stride)
>>  {
>>       struct device_node *dp;
>>       const u32 *p;
>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
>> index 95c133a0554b..52780a72d09d 100644
>> --- a/drivers/of/platform.c
>> +++ b/drivers/of/platform.c
>> @@ -51,10 +51,6 @@ struct platform_device *of_find_device_by_node(struct device_node *np)
>>  }
>>  EXPORT_SYMBOL(of_find_device_by_node);
>>
>> -#if defined(CONFIG_PPC_DCR)
>> -#include <asm/dcr.h>
>> -#endif
>> -
>>  #ifdef CONFIG_OF_ADDRESS
>>  /*
>>   * The following routines scan a subtree and registers a device for
>> @@ -78,26 +74,6 @@ void of_device_make_bus_id(struct device *dev)
>>       const __be32 *reg;
>>       u64 addr;
>>
>> -#ifdef CONFIG_PPC_DCR
>> -     /*
>> -      * If it's a DCR based device, use 'd' for native DCRs
>> -      * and 'D' for MMIO DCRs.
>> -      */
>> -     reg = of_get_property(node, "dcr-reg", NULL);
>> -     if (reg) {
>> -#ifdef CONFIG_PPC_DCR_NATIVE
>> -             dev_set_name(dev, "d%x.%s", *reg, node->name);
>> -#else /* CONFIG_PPC_DCR_NATIVE */
>> -             u64 addr = of_translate_dcr_address(node, *reg, NULL);
>> -             if (addr != OF_BAD_ADDR) {
>> -                     dev_set_name(dev, "D%llx.%s",
>> -                                  (unsigned long long)addr, node->name);
>> -                     return;
>> -             }
>> -#endif /* !CONFIG_PPC_DCR_NATIVE */
>> -     }
>> -#endif /* CONFIG_PPC_DCR */
>> -
>>       /* Construct the name, using parent nodes if necessary to ensure uniqueness */
>>       while (node->parent) {
>>               /*
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
