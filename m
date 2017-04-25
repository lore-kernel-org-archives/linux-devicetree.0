From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] of: Add unit tests for applying overlays
Date: Tue, 25 Apr 2017 10:45:38 -0700
Message-ID: <58FF8B42.6050406@gmail.com>
References: <1493075119-32026-1-git-send-email-frowand.list@gmail.com>
 <1493075119-32026-3-git-send-email-frowand.list@gmail.com>
 <CAL_Jsq+8fcDwe4iPxLRsKnw_UAc6JE3KRRbnx1aS+o0oJH9tPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+8fcDwe4iPxLRsKnw_UAc6JE3KRRbnx1aS+o0oJH9tPw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michal Marek <mmarek-IBi9RG/b67k@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kbuild mailing list <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/25/17 09:44, Rob Herring wrote:
> On Mon, Apr 24, 2017 at 6:05 PM,  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>
>> Existing overlay unit tests examine individual pieces of the overlay
>> code.  The new tests target the entire process of applying an overlay.
> 
> Just a few nits.
> 
>> Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
> 
> [...]
> 
>> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
>> index 18bbb4517e25..cc76b3b81eab 100644
>> --- a/drivers/of/of_private.h
>> +++ b/drivers/of/of_private.h
>> @@ -55,6 +55,17 @@ static inline int of_property_notify(int action, struct device_node *np,
>>  }
>>  #endif /* CONFIG_OF_DYNAMIC */
>>
>> +#ifdef CONFIG_OF_UNITTEST
>> +extern void __init unittest_unflatten_overlay_base(void);
>> +extern void *__unflatten_device_tree(const void *blob,
> 
> This can and should be outside the ifdef.

Will do.

> 
>> +                             struct device_node *dad,
>> +                             struct device_node **mynodes,
>> +                             void *(*dt_alloc)(u64 size, u64 align),
>> +                             bool detached);
>> +#else
>> +static inline void unittest_unflatten_overlay_base(void) {};
>> +#endif
>> +
>>  /**
>>   * General utilities for working with live trees.
>>   *
> 
> [...]
> 
>> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
>> index 62db55b97c10..884f6c1f8ae9 100644
>> --- a/drivers/of/unittest.c
>> +++ b/drivers/of/unittest.c
>> @@ -8,6 +8,7 @@
>>  #include <linux/err.h>
>>  #include <linux/errno.h>
>>  #include <linux/hashtable.h>
>> +#include <linux/libfdt.h>
>>  #include <linux/of.h>
>>  #include <linux/of_fdt.h>
>>  #include <linux/of_irq.h>
>> @@ -1925,6 +1926,320 @@ static void __init of_unittest_overlay(void)
>>  static inline void __init of_unittest_overlay(void) { }
>>  #endif
>>
>> +#ifdef CONFIG_OF_OVERLAY
> 
> This can move down to...

Will do.

> 
>> +
>> +/*
>> + * __dtb_ot_begin[] and __dtb_ot_end[] are created by cmd_dt_S_dtb
>> + * in scripts/Makefile.lib
>> + */
>> +
>> +#define OVERLAY_INFO_EXTERN(name) \
>> +       extern uint8_t __dtb_##name##_begin[]; \
>> +       extern uint8_t __dtb_##name##_end[]
>> +
>> +#define OVERLAY_INFO(name, expected) \
>> +{      .dtb_begin       = __dtb_##name##_begin, \
>> +       .dtb_end         = __dtb_##name##_end, \
>> +       .expected_result = expected, \
>> +}
>> +
>> +struct overlay_info {
>> +       uint8_t            *dtb_begin;
>> +       uint8_t            *dtb_end;
>> +       void               *data;
>> +       struct device_node *np_overlay;
>> +       int                expected_result;
>> +       int                overlay_id;
>> +};
>> +
>> +OVERLAY_INFO_EXTERN(overlay_base);
>> +OVERLAY_INFO_EXTERN(overlay);
>> +OVERLAY_INFO_EXTERN(overlay_bad_phandle);
> 
> ...here. Maybe we want to move all this to a separate file instead.

In the medium term, yes.  At the moment it is good enough for this
localized use for unittest.  I do not think it is baked enough
for general use.  I want to see how well it works for the
previously existing overlay unit tests and make sure it meets
the majority of the needs of wider use cases before making it
more widely visible.


>> +
>> +/* order of entries is hard-coded into users of overlays[] */
>> +struct overlay_info overlays[] = {
> 
> static?

Yes, thanks.


>> +       OVERLAY_INFO(overlay_base, -9999),
>> +       OVERLAY_INFO(overlay, 0),
>> +       OVERLAY_INFO(overlay_bad_phandle, -EINVAL),
>> +       {}
>> +};
> 
> [...]
> 
>> @@ -1962,6 +2277,9 @@ static int __init of_unittest(void)
>>         /* Double check linkage after removing testcase data */
>>         of_unittest_check_tree_linkage();
>>
>> +
> 
> Extra blank line.

thanks

> 
>> +       of_unittest_overlay_high_level();
>> +
>>         pr_info("end of unittest - %i passed, %i failed\n",
>>                 unittest_results.passed, unittest_results.failed);
>>
>> --
>> Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
