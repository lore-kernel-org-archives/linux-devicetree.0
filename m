From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] of: overlay_adjust_phandles() - do not modify const
 field
Date: Mon, 24 Apr 2017 11:54:44 -0700
Message-ID: <58FE49F4.7060600@gmail.com>
References: <1493011204-27635-1-git-send-email-frowand.list@gmail.com>
 <1493011204-27635-2-git-send-email-frowand.list@gmail.com>
 <CAL_Jsq+DxGJcggE6KKT_n76CpcCJkRB2sa3Lfm2GRTW78K_tUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+DxGJcggE6KKT_n76CpcCJkRB2sa3Lfm2GRTW78K_tUw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/24/17 09:56, Rob Herring wrote:
> On Mon, Apr 24, 2017 at 12:20 AM,  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>
>> When adjusting overlay phandles to apply to the live device tree, can
>> not modify the property value because it is type const.
>>
>> This is to resolve the issue found by Stephen Boyd [1] when he changed
>> the type of struct property.value from void * to const void *.  As
>> a result of the type change, the overlay code had compile errors
>> where the resolver updates phandle values.
> 
> Conceptually, I prefer your first version. phandles are special and
> there's little reason to expose them except to generate a dts or dtb
> from /proc/device-tree. We could still generate the phandle file in
> that case, but I don't know if special casing phandle is worth it.

The biggest thing that makes me wary about my first version is PPC
and Sparc.  I can read their code, but do not know what the firmware
is feeding into the kernel, so I felt like there might be some
incorrect assumptions or fundamental misunderstandings that I
may have.

If we do remove the phandle properties from the live tree, I think
that phandle still needs to be exposed in /proc/device-tree
because that is important information for being able to understand
(or debug) code via reading the source.  It isn't a lot code.

One factor I was not sure of to help choose between the first version
and this approach is net memory size of the device tree:

  first version:

     Adds struct bin_attribute  (28 bytes on 32 bit arm) to every node

     Removes "linux,phandle" and "phandle" properties from nodes that
     have a phandle (64 + 72 = 136 bytes)

  second version plus subsequent "linux,phandle" removal:

     Removes "linux,phandle" properties from nodes
     that have a phandle (72 bytes)

I do not have a feel of how many nodes have phandles in the many
different device trees, so I'm not sure of the end result for the
first version.

I do not have a strong preference between my first approach and second
approach.  But now that I have done both, a choice can be made.  Let me
know which way you want to go and I'll respin the one you prefer.
For this version I'll make the change you suggested.  For the first
version, I'll modify of_attach_mode() slightly more to remove any
"phandle", "linux,phandle", and "ibm,phandle" property from the node
before attaching it, and add the call to add the phandle sysfs
file: __of_add_phandle_sysfs(np);


>>
>>   [1] http://lkml.iu.edu/hypermail/linux/kernel/1702.1/04160.html
>>
>> Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>> ---
>>  drivers/of/base.c       |  4 ++--
>>  drivers/of/dynamic.c    | 28 +++++++++++++++++++++------
>>  drivers/of/of_private.h |  3 +++
>>  drivers/of/resolver.c   | 51 ++++++++++++++++++++++++++++++-------------------
>>  4 files changed, 58 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index d7c4629a3a2d..b41650fd0fcf 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -220,8 +220,8 @@ void __init of_core_init(void)
>>                 proc_symlink("device-tree", NULL, "/sys/firmware/devicetree/base");
>>  }
>>
>> -static struct property *__of_find_property(const struct device_node *np,
>> -                                          const char *name, int *lenp)
>> +struct property *__of_find_property(const struct device_node *np,
>> +                                   const char *name, int *lenp)
>>  {
>>         struct property *pp;
>>
>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>> index 888fdbc09992..44963b4e7235 100644
>> --- a/drivers/of/dynamic.c
>> +++ b/drivers/of/dynamic.c
>> @@ -354,17 +354,17 @@ void of_node_release(struct kobject *kobj)
>>  }
>>
>>  /**
>> - * __of_prop_dup - Copy a property dynamically.
>> + * __of_prop_alloc - Create a property dynamically.
>>   * @prop:      Property to copy
>>   * @allocflags:        Allocation flags (typically pass GFP_KERNEL)
>>   *
>> - * Copy a property by dynamically allocating the memory of both the
>> + * Create a property by dynamically allocating the memory of both the
>>   * property structure and the property name & contents. The property's
>>   * flags have the OF_DYNAMIC bit set so that we can differentiate between
>>   * dynamically allocated properties and not.
>>   * Returns the newly allocated property or NULL on out of memory error.
>>   */
>> -struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
>> +struct property *__of_prop_alloc(char *name, void *value, int len, gfp_t allocflags)
>>  {
>>         struct property *new;
>>
>> @@ -378,9 +378,9 @@ struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
>>          * of zero bytes. We do this to work around the use
>>          * of of_get_property() calls on boolean values.
>>          */
>> -       new->name = kstrdup(prop->name, allocflags);
>> -       new->value = kmemdup(prop->value, prop->length, allocflags);
>> -       new->length = prop->length;
>> +       new->name = kstrdup(name, allocflags);
>> +       new->value = kmemdup(value, len, allocflags);
>> +       new->length = len;
>>         if (!new->name || !new->value)
>>                 goto err_free;
>>
>> @@ -397,6 +397,22 @@ struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
>>  }
>>
>>  /**
>> + * __of_prop_dup - Copy a property dynamically.
>> + * @prop:      Property to copy
>> + * @allocflags:        Allocation flags (typically pass GFP_KERNEL)
>> + *
>> + * Copy a property by dynamically allocating the memory of both the
>> + * property structure and the property name & contents. The property's
>> + * flags have the OF_DYNAMIC bit set so that we can differentiate between
>> + * dynamically allocated properties and not.
>> + * Returns the newly allocated property or NULL on out of memory error.
>> + */
>> +struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
>> +{
>> +       return __of_prop_alloc(prop->name, prop->value, prop->length, allocflags);
>> +}
>> +
>> +/**
>>   * __of_node_dup() - Duplicate or create an empty device node dynamically.
>>   * @fmt: Format string (plus vargs) for new full name of the device node
>>   *
>> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
>> index 18bbb4517e25..554394c96569 100644
>> --- a/drivers/of/of_private.h
>> +++ b/drivers/of/of_private.h
>> @@ -62,6 +62,7 @@ static inline int of_property_notify(int action, struct device_node *np,
>>   * without taking node references, so you either have to
>>   * own the devtree lock or work on detached trees only.
>>   */
>> +struct property *__of_prop_alloc(char *name, void *value, int len, gfp_t allocflags);
>>  struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags);
>>  __printf(2, 3) struct device_node *__of_node_dup(const struct device_node *np, const char *fmt, ...);
>>
>> @@ -70,6 +71,8 @@ extern const void *__of_get_property(const struct device_node *np,
>>  extern int __of_add_property(struct device_node *np, struct property *prop);
>>  extern int __of_add_property_sysfs(struct device_node *np,
>>                 struct property *prop);
>> +extern struct property *__of_find_property(const struct device_node *np,
>> +                                          const char *name, int *lenp);
>>  extern int __of_remove_property(struct device_node *np, struct property *prop);
>>  extern void __of_remove_property_sysfs(struct device_node *np,
>>                 struct property *prop);
>> diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
>> index 7ae9863cb0a4..a2d5b8f0b7bf 100644
>> --- a/drivers/of/resolver.c
>> +++ b/drivers/of/resolver.c
>> @@ -20,6 +20,8 @@
>>  #include <linux/errno.h>
>>  #include <linux/slab.h>
>>
>> +#include "of_private.h"
>> +
>>  /* illegal phandle value (set when unresolved) */
>>  #define OF_PHANDLE_ILLEGAL     0xdeadbeef
>>
>> @@ -67,36 +69,43 @@ static phandle live_tree_max_phandle(void)
>>         return phandle;
>>  }
>>
>> -static void adjust_overlay_phandles(struct device_node *overlay,
>> +static int adjust_overlay_phandles(struct device_node *overlay,
>>                 int phandle_delta)
>>  {
>>         struct device_node *child;
>> +       struct property *newprop;
>>         struct property *prop;
>>         phandle phandle;
> 
> Some of these can move into the if statement. That will save some
> stack space on recursion (or maybe the compiler is smart enough).

Will do.


>> +       int ret;
>>
>> -       /* adjust node's phandle in node */
>> -       if (overlay->phandle != 0 && overlay->phandle != OF_PHANDLE_ILLEGAL)
>> -               overlay->phandle += phandle_delta;
>> -
>> -       /* copy adjusted phandle into *phandle properties */
>> -       for_each_property_of_node(overlay, prop) {
>> +       if (overlay->phandle != 0 && overlay->phandle != OF_PHANDLE_ILLEGAL) {
>>
>> -               if (of_prop_cmp(prop->name, "phandle") &&
>> -                   of_prop_cmp(prop->name, "linux,phandle"))
>> -                       continue;
>> -
>> -               if (prop->length < 4)
>> -                       continue;
>> +               overlay->phandle += phandle_delta;
>>
>> -               phandle = be32_to_cpup(prop->value);
>> -               if (phandle == OF_PHANDLE_ILLEGAL)
>> -                       continue;
>> +               phandle = cpu_to_be32(overlay->phandle);
>> +
>> +               prop = __of_find_property(overlay, "phandle", NULL);
>> +               newprop = __of_prop_alloc(prop->name, &phandle, sizeof(phandle),
>> +                                         GFP_KERNEL);
>> +               if (!newprop)
>> +                       return -ENOMEM;
>> +               __of_update_property(overlay, newprop, &prop);
>> +
>> +               prop = __of_find_property(overlay, "linux,phandle", NULL);
>> +               newprop = __of_prop_alloc(prop->name, &phandle, sizeof(phandle),
>> +                                         GFP_KERNEL);
> 
> There is no reason to support "linux,phandle" for overlays. That is
> legacy (pre ePAPR) which predates any overlays by a long time.

I would like to have the same behavior for non-overlays as for overlays.
The driver is the same whether the device tree description comes from
the initial device tree or from an overlay.


> Also, dtc still defaults to generating both phandle and linux,phandle
> properties which maybe we should switch off now. If anything, we're
> wasting a bit of memory storing both. I think we should only store
> "phandle" and convert any cases of only a "linux,phandle" property to
> "phandle".

Agreed.  If this patch set is accepted instead of the first version, I could
do a subsequent patch to remove the "linux,phandle" property.


> 
> Rob
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
