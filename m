From: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [Linaro-mm-sig] [PATCH 2/2] drivers: dma-contiguous: add
 initialization from device tree
Date: Fri, 15 Mar 2013 16:21:47 +0100
Message-ID: <51433C8B.20607@samsung.com>
References: <1360845928-8107-1-git-send-email-m.szyprowski@samsung.com>
 <1360845928-8107-3-git-send-email-m.szyprowski@samsung.com>
 <511D586A.5060902@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <511D586A.5060902-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On 2/14/2013 10:34 PM, Laura Abbott wrote:
>
> On 2/14/2013 4:45 AM, Marek Szyprowski wrote:
> <snip>
>> +name:        an name given to the defined region.
>> +base-address:    the base address of the defined region.
>> +size:        the size of the memory region.
>> +linux,contiguous-region: property indicating that the defined memory
>> +        region is used for contiguous memory allocations,
>> +        Linux specific (optional)
>> +linux,default-contiguous-region: property indicating that the region
>> +        is the default region for all contiguous memory
>> +        allocations, Linux specific (optional)
>> +
>> +
>
> I don't see any code actually implementing the 
> default-contiguous-region binding. Currently on ARM systems we will 
> still setup the default region based on the Kconfig. Is this intentional?

Nope, this was my fault. I've missed the fixup which added support for
default-contiguous-region (it was just a few lines more to cma_fdt_scan()
function).

>> diff --git a/drivers/base/dma-contiguous.c 
>> b/drivers/base/dma-contiguous.c
>> index 085389c..5761f73 100644
>> --- a/drivers/base/dma-contiguous.c
>> +++ b/drivers/base/dma-contiguous.c
>> @@ -24,6 +24,9 @@
>>
>>   #include <linux/memblock.h>
>>   #include <linux/err.h>
>> +#include <linux/of.h>
>> +#include <linux/of_fdt.h>
>> +#include <linux/of_platform.h>
>>   #include <linux/mm.h>
>>   #include <linux/mutex.h>
>>   #include <linux/page-isolation.h>
>> @@ -177,6 +180,35 @@ no_mem:
>>       return ERR_PTR(ret);
>>   }
>>
>> +/*****************************************************************************/ 
>>
>> +
>> +#ifdef CONFIG_OF
>> +int __init cma_fdt_scan(unsigned long node, const char *uname,
>> +                int depth, void *data)
>> +{
>> +    phys_addr_t base, size;
>> +    unsigned long len;
>> +    __be32 *prop;
>> +
>> +    if (strncmp(uname, "region@", 7) != 0 || depth != 2 ||
>> +        !of_get_flat_dt_prop(node, "contiguous-region", NULL))
>
> The documentation says "linux,contiguous-region"
>

Right, lack of another fixup. It looks that I posted an incomplete 
version, I'm sorry.
I hurried that time (it was my last day in the office before going for 
holidays).

>
>> +#ifdef CONFIG_OF
>> +static void cma_assign_device_from_dt(struct device *dev)
>> +{
>> +    struct device_node *node;
>> +    struct cma *cma;
>> +    u32 value;
>> +
>> +    node = of_parse_phandle(dev->of_node, "linux,contiguous-region", 
>> 0);
>> +    if (!node)
>> +        return;
>> +    if (of_property_read_u32(node, "reg", &value) && !value)
>> +        return;
>> +    cma = cma_get_area(value);
>> +    if (!cma)
>> +        return;
>> +
>> +    dev_set_cma_area(dev, cma);
>> +    pr_info("Assigned CMA region at %lx to %s device\n", (unsigned 
>> long)value, dev_name(dev));
>> +}
>> +
>
> This scheme of associating devices with CMA regions by base does not 
> work if you want to let CMA figure out where to place the region (base 
> = 0). Can we use the name to associate the device with the region? I 
> had been working on something similar internally and that was the only 
> solution I had come up with to associate arbitrary CMA nodes with devices.

Right, support for base = 0 requires different handling, but I thought 
that if
we use the device tree approach, the designer already knows the complete 
memory
configuration, so providing the correct base address is not that hard.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
