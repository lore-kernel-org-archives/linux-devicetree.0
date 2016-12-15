From: Jason Liu <liu.h.jason@gmail.com>
Subject: Re: [PATCH 1/1] of: of_reserved_mem: Ensure cma reserved region not
 cross the low/high memory
Date: Thu, 15 Dec 2016 23:10:12 +0800
Message-ID: <CAB4PhKdi1Mf=384uyoTWv657kcq_fEHwb7i4hLd7O6hejSBgoA@mail.gmail.com>
References: <1479901021-25064-1-git-send-email-jason.hui.liu@nxp.com>
 <CAL_JsqLHh96D0VULuYfYC1P5K_Bbz6iRjizuYP3Mb6bdERbDnA@mail.gmail.com>
 <833f99b1-d10b-27ba-e0f9-a7c6398fb63d@redhat.com> <CAL_JsqJygJK_VmXKad8n63-jLH+G_xQ=NwX8JVmE=xSuYMof=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJygJK_VmXKad8n63-jLH+G_xQ=NwX8JVmE=xSuYMof=Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Laura Abbott <labbott@redhat.com>, Jason Liu <jason.hui.liu@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

2016-12-15 21:54 GMT+08:00 Rob Herring <robh+dt@kernel.org>:
> On Wed, Dec 14, 2016 at 4:21 PM, Laura Abbott <labbott@redhat.com> wrote:
>> On 12/14/2016 12:45 PM, Rob Herring wrote:
>>> On Wed, Nov 23, 2016 at 5:37 AM, Jason Liu <jason.hui.liu@nxp.com> wrote:
>>>> Need ensure the cma reserved region not cross the low/high memory boundary
>>>> when using the dynamic allocation methond through device-tree, otherwise,
>>>> kernel will fail to boot up when cma reserved region cross how/high mem.
>>>
>>> The kernel command line code setting CMA already deals with this. Why
>>> don't we just call the CMA code (cma_declare_contiguous) to deal with
>>> this?
>>>
>>> Rob
>>>
>>
>> That was proposed in the first version[1] but I think this is a generic
>> problem not specific to CMA. Even non-CMA reservations trying to span
>> zones could cause problems so the devicetree allocation code should
>> restrict reservations to a single zone.
>
> Fair enough, but that's not what this patch does. It's only for CMA.

I'm only certain that the CMA reservation from the device-tree is not
working now.
and if you guys think that this is not only the CMA but also other
non-CMA reservations
should also have this restriction on the device-tree method. I can
change the patch the patch
as the followings.


diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 366d8c3..7b8857d 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -31,11 +31,15 @@ static int reserved_mem_count;

 #if defined(CONFIG_HAVE_MEMBLOCK)
 #include <linux/memblock.h>
-int __init __weak early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
-       phys_addr_t align, phys_addr_t start, phys_addr_t end, bool nomap,
-       phys_addr_t *res_base)
+int __init __weak early_init_dt_alloc_reserved_memory_arch(unsigned long node,
+       phys_addr_t size, phys_addr_t align, phys_addr_t start, phys_addr_t end,
+       bool nomap, phys_addr_t *res_base)
 {
        phys_addr_t base;
+       phys_addr_t highmem_start;
+
+       highmem_start = __pa(high_memory - 1) + 1;
+
        /*
         * We use __memblock_alloc_base() because memblock_alloc_base()
         * panic()s on allocation failure.
@@ -53,15 +57,29 @@ int __init __weak
early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
                return -ENOMEM;
        }

+       /*
+        * Sanity check for the reserved region:If the reserved region
+        * crosses the low/high memory boundary, try to fix it up and then
+        * fall back to allocate region from the low mememory space.
+        */
+
+       if (base < highmem_start && (base + size) > highmem_start) {
+               memblock_free(base, size);
+               base = memblock_alloc_range(size, align, start,
+                                       highmem_start, MEMBLOCK_NONE);
+               if (!base)
+                       return -ENOMEM;
+       }
+

if you guys have good idea, please share or post your patch. This is
really an issue
that reserve memory from the device-tree is broken.

>
> Rob
