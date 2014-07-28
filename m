From: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Enabling OF selftest to run without machine's devicetree
Date: Sun, 27 Jul 2014 20:28:34 -0700
Message-ID: <CA+rpMbJmCQ7YfJ7c+hjOmdfAdTHtTuH34mEWGH9Xo=rYJFDgKg@mail.gmail.com>
References: <1406404130-27289-1-git-send-email-gaurav.minocha.os@gmail.com>
	<CAL_JsqJXqoyCRcMdS83zPr7prY52GgbAd1y+tgVn5f6Q+=CwxQ@mail.gmail.com>
	<CA+rpMb+pPZykJ7-XurVSSOaTPGNji9zG7FtVB+m6-gNiOHM4Jw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+rpMb+pPZykJ7-XurVSSOaTPGNji9zG7FtVB+m6-gNiOHM4Jw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 26, 2014 at 3:17 PM, Gaurav Minocha
<gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sat, Jul 26, 2014 at 2:11 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Sat, Jul 26, 2014 at 2:48 PM, Gaurav Minocha
>> <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> If there is no devicetree present, this patch adds the selftest
>>> data as a live devicetree. It also removes the same after the
>>> testcase execution is complete.
>>>
>>> Tested with and without machine's devicetree.
>>>
>>> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  drivers/of/fdt.c      |    3 +++
>>>  drivers/of/selftest.c |   34 ++++++++++++++++++++++++++++++----
>>>  2 files changed, 33 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>>> index b777d8f..18088c0 100644
>>> --- a/drivers/of/fdt.c
>>> +++ b/drivers/of/fdt.c
>>> @@ -366,6 +366,9 @@ void of_fdt_unflatten_tree(unsigned long *blob,
>>>                         struct device_node **mynodes)
>>>  {
>>>         __unflatten_device_tree(blob, mynodes, &kernel_tree_alloc);
>>> +
>>> +       /* Get pointer to "/chosen" and "/aliases" nodes for use everywhere */
>>> +       of_alias_scan(&kernel_tree_alloc);
>>>  }
>>>  EXPORT_SYMBOL_GPL(of_fdt_unflatten_tree);
>>>
>>> diff --git a/drivers/of/selftest.c b/drivers/of/selftest.c
>>> index 3a1c5b5..34c9899 100644
>>> --- a/drivers/of/selftest.c
>>> +++ b/drivers/of/selftest.c
>>> @@ -16,6 +16,7 @@
>>>  #include <linux/mutex.h>
>>>  #include <linux/slab.h>
>>>  #include <linux/device.h>
>>> +#include <linux/proc_fs.h>
>>>
>>>  static struct selftest_results {
>>>         int passed;
>>> @@ -25,6 +26,7 @@ static struct selftest_results {
>>>  #define NO_OF_NODES 2
>>>  static struct device_node *nodes[NO_OF_NODES];
>>>  static int last_node_index;
>>> +static bool selftest_live_tree;
>>>
>>>  #define selftest(result, fmt, ...) { \
>>>         if (!(result)) { \
>>> @@ -595,7 +597,7 @@ static int attach_node_and_children(struct device_node *np)
>>>  static int __init selftest_data_add(void)
>>>  {
>>>         void *selftest_data;
>>> -       struct device_node *selftest_data_node;
>>> +       struct device_node *selftest_data_node, *np;
>>>         extern uint8_t __dtb_testcases_begin[];
>>>         extern uint8_t __dtb_testcases_end[];
>>>         const int size = __dtb_testcases_end - __dtb_testcases_begin;
>>> @@ -614,10 +616,31 @@ static int __init selftest_data_add(void)
>>>                         "not running tests\n", __func__);
>>>                 return -ENOMEM;
>>>         }
>>> -       of_fdt_unflatten_tree(selftest_data, &selftest_data_node);
>>
>> Can't you keep this factored out and just do "of_allnodes =
>> selftest_data_node;"?
>>
> I tried to do that in first place, but of_alias_scan() called from
> of_fdt_unflatten_tree(..)
> needs of_allnodes. So, had to call it separately.
>
Actually, it's possible if rather than calling of_alias_scan from
of_fdt_unflatten_tree, I write a wrapper and export it as below.
So, I will be able to call of_fdt_alias_scan explicitly.

of_fdt_alias_scan()
{
     of_alias_scan(&kernel_tree_alloc);
}
EXPORT_SYMBOL(of_fdt_alias_scan)

OR

directly export of_alias_scan() and
kernel_tree_alloc(u64 size, u64 align)

please let me know if I should follow either of the above
approach in my next patch.

>>>
>>> -       /* attach the sub-tree to live tree */
>>> -       return attach_node_and_children(selftest_data_node);
>>> +       if (!of_allnodes) {
>>> +               /* enabling flag for removing nodes */
>>> +               selftest_live_tree = true;
>>
>> If you save the selftest_data_node ptr, then you could test for
>> (selftest_data_node == of_allnodes) instead of this bool. You may want
>> the pointer for some other reason later although I can't think of one
>> right now.
>>
> Yes, this can be done if I make selftest_data_node global, will update
> in next patch.
>
>>> +
>>> +               of_fdt_unflatten_tree(selftest_data, &of_allnodes);
>>> +               if (!of_allnodes) {
>>> +                       pr_warn("%s: No tree to attach; not running tests\n",
>>> +                               __func__);
>>> +                       return -ENODATA;
>>> +               }
>>> +
>>> +               for_each_of_allnodes(np)
>>> +                       of_node_add(np);
>>> +
>>> +               /* Symlink in /proc as required by userspace ABI */
>>> +               proc_symlink("device-tree", NULL, "/sys/firmware/devicetree/base");
>>> +
>>> +               return 0;
>>> +       } else {
>>> +               of_fdt_unflatten_tree(selftest_data, &selftest_data_node);
>>> +
>>> +               /* attach the sub-tree to live tree */
>>> +               return attach_node_and_children(selftest_data_node);
>>> +       }
>>>  }
>>>
>>>  /**
>>> @@ -646,6 +669,9 @@ static void selftest_data_remove(void)
>>>         struct device_node *np;
>>>         struct property *prop;
>>>
>>> +       if (selftest_live_tree)
>>> +               return detach_node_and_children(of_allnodes);
>>> +
>>>         while (last_node_index >= 0) {
>>>                 if (nodes[last_node_index]) {
>>>                         np = of_find_node_by_path(nodes[last_node_index]->full_name);
>>> --
>>> 1.7.9.5
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
