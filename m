From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: use pr_fmt prefix for all console printing
Date: Thu, 2 Jun 2016 14:56:34 -0500
Message-ID: <CAL_JsqLrC27EOkWfRtzUOZox5wkRU=qEb+b3z2JQG++e5uSGSg@mail.gmail.com>
References: <1464880499-29864-1-git-send-email-robh@kernel.org> <57506DDC.3060804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <57506DDC.3060804@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 2, 2016 at 12:33 PM, Frank Rowand <frowand.list@gmail.com> wrote:
> On 06/02/16 08:14, Rob Herring wrote:
>> Clean-up all the DT printk functions to use common pr_fmt prefix.
>>
>> Some print statements such as kmalloc errors were redundant, so just
>> drop those.
>>
>> Cc: Frank Rowand <frowand.list@gmail.com>
>> Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> ---
>>  drivers/of/address.c         | 49 ++++++++++++++++++++++----------------------
>>  drivers/of/base.c            | 11 ++++++----
>>  drivers/of/dynamic.c         | 47 +++++++++++++++++++++---------------------
>>  drivers/of/fdt.c             | 12 +++++------
>>  drivers/of/fdt_address.c     | 35 ++++++++++++++++---------------
>>  drivers/of/irq.c             |  2 ++
>>  drivers/of/of_numa.c         | 22 ++++++--------------
>>  drivers/of/of_pci.c          |  6 ++++--
>>  drivers/of/of_reserved_mem.c | 22 ++++++++++----------
>>  drivers/of/overlay.c         | 43 +++++++++++++++-----------------------
>>  drivers/of/platform.c        | 16 +++++++--------
>>  drivers/of/resolver.c        |  2 ++
>>  12 files changed, 130 insertions(+), 137 deletions(-)
>>
>
> Nice cleanup.  A couple of comments below.
>
> Reviewed-by: Frank Rowand <frank.rowand@am.sony.com>
>
> < snip >

>> @@ -65,11 +67,7 @@ static int __init of_numa_parse_memory_nodes(void)
>>       u32 nid;
>>       int r = 0;
>>
>> -     for (;;) {
>> -             np = of_find_node_by_type(np, "memory");
>> -             if (!np)
>> -                     break;
>> -
>> +     for_each_node_by_type(np, "memory") {
>>               r = of_property_read_u32(np, "numa-node-id", &nid);
>>               if (r == -EINVAL)
>>                       /*
>> @@ -83,18 +81,10 @@ static int __init of_numa_parse_memory_nodes(void)
>>                       break;
>>
>>               r = of_address_to_resource(np, 0, &rsrc);
>> -             if (r) {
>> -                     pr_err("NUMA: bad reg property in memory node\n");
>> -                     break;
>> -             }
>> -
>> -             pr_debug("NUMA:  base = %llx len = %llx, node = %u\n",
>> -                      rsrc.start, rsrc.end - rsrc.start + 1, nid);
>> -
>> -             r = numa_add_memblk(nid, rsrc.start,
>
> Missing declaration: int i;
>
> Calling of_address_to_resource() with index > 0 and then calling
> numa_add_memblk() with the resulting resource(s) is a change in
> functionality.  This should be in a separate patch.

This shouldn't be here. This was my rewriting the NUMA patches under review...

>
>> +             for (i = 0; !r; i++, r = of_address_to_resource(np, i, &rsrc)) {
>> +                     r = numa_add_memblk(nid, rsrc.start,
>>                                   rsrc.end - rsrc.start + 1);
>> -             if (r)
>> -                     break;
>> +             }
>>       }
>>       of_node_put(np);
>>
>
> < snip >
>
>> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
>> index 8225081..318dbb5 100644
>> --- a/drivers/of/overlay.c
>> +++ b/drivers/of/overlay.c
>> @@ -8,7 +8,9 @@
>>   * modify it under the terms of the GNU General Public License
>>   * version 2 as published by the Free Software Foundation.
>>   */
>> -#undef DEBUG
>> +
>> +#define pr_fmt(fmt)  "OF: overlay: " fmt
>> +
>>  #include <linux/kernel.h>
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>> @@ -137,8 +139,8 @@ static int of_overlay_apply_one(struct of_overlay *ov,
>>       for_each_property_of_node(overlay, prop) {
>>               ret = of_overlay_apply_single_property(ov, target, prop);
>>               if (ret) {
>> -                     pr_err("%s: Failed to apply prop @%s/%s\n",
>> -                             __func__, target->full_name, prop->name);
>> +                     pr_err("Failed to apply prop @%s/%s\n",
>> +                            target->full_name, prop->name);
>>                       return ret;
>>               }
>>       }
>> @@ -146,9 +148,8 @@ static int of_overlay_apply_one(struct of_overlay *ov,
>>       for_each_child_of_node(overlay, child) {
>>               ret = of_overlay_apply_single_device_node(ov, target, child);
>>               if (ret != 0) {
>> -                     pr_err("%s: Failed to apply single node @%s/%s\n",
>> -                                     __func__, target->full_name,
>> -                                     child->name);
>> +                     pr_err("Failed to apply single node @%s/%s\n",
>> +                            target->full_name, child->name);
>>                       of_node_put(child);
>>                       return ret;
>>               }
>> @@ -176,8 +177,7 @@ static int of_overlay_apply(struct of_overlay *ov)
>>
>>               err = of_overlay_apply_one(ov, ovinfo->target, ovinfo->overlay);
>>               if (err != 0) {
>> -                     pr_err("%s: overlay failed '%s'\n",
>> -                             __func__, ovinfo->target->full_name);
>> +                     pr_err("apply failed '%s'\n", ovinfo->target->full_name);
>>                       return err;
>>               }
>>       }
>> @@ -208,7 +208,7 @@ static struct device_node *find_target_node(struct device_node *info_node)
>>       if (ret == 0)
>>               return of_find_node_by_path(path);
>>
>> -     pr_err("%s: Failed to find target for node %p (%s)\n", __func__,
>> +     pr_err("Failed to find target for node %p (%s)\n",
>>               info_node, info_node->name);
>>
>>       return NULL;
>> @@ -355,8 +355,6 @@ int of_overlay_create(struct device_node *tree)
>>
>>       id = idr_alloc(&ov_idr, ov, 0, 0, GFP_KERNEL);
>>       if (id < 0) {
>> -             pr_err("%s: idr_alloc() failed for tree@%s\n",
>> -                             __func__, tree->full_name);
>
> Every other error in of_overlay_create() results in a pr_err().
> (The other cases of removing pr_err() in this file are fine, because
> the errors are already reported in the functions called from this
> function.)
>
> I would recommend leaving in the pr_err() for idr_alloc() failure.

I was thinking idr_alloc is going to call kmalloc which will print
errors on failure, but there may be some case it doesn't.

Rob
