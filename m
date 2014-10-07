From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: Eliminate of_allnodes list
Date: Tue, 7 Oct 2014 11:11:31 +0100
Message-ID: <CACxGe6ss1y=ee66SVMxFC_Dq0Wi3bx9WRamwkWxCDk8E6QtugA@mail.gmail.com>
References: <1412585954-21172-1-git-send-email-grant.likely@linaro.org> <CAL_JsqJ+TCfeHF=Rzec0=-hM6Y_vbijQBvyyvL58E67WMYTxEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJ+TCfeHF=Rzec0=-hM6Y_vbijQBvyyvL58E67WMYTxEg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 6, 2014 at 2:56 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Oct 6, 2014 at 3:59 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> The device tree structure is composed of two lists; the 'allnodes' list
>> which is a singly linked list containing every node in the tree, and the
>> child->parent structure where each parent node has a singly linked list
>> of children. All of the data in the allnodes list can be easily
>> reproduced with the parent-child lists, so of_allnodes is actually
>> unnecessary. Remove it entirely which saves a bit of memory and
>> simplifies the data structure quite a lot.
>>
>> Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>
>> This applies against my current devicetree/next branch on git.secretlab.ca/git/linux
>>
>> I'm not going to try and merge this in v3.18. It's too risky a patch and
>> I only just wrote it. I'll try to get it in for v3.19.
>
> Looks good. A few minor things below.
>
> [...]
>
>> diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
>> index 9e21e4fc9599..8f43ab8fd2d6 100644
>> --- a/drivers/mfd/vexpress-sysreg.c
>> +++ b/drivers/mfd/vexpress-sysreg.c
>> @@ -223,7 +223,7 @@ static int vexpress_sysreg_probe(struct platform_device *pdev)
>>         vexpress_config_set_master(vexpress_sysreg_get_master());
>>
>>         /* Confirm board type against DT property, if available */
>> -       if (of_property_read_u32(of_allnodes, "arm,hbi", &dt_hbi) == 0) {
>> +       if (of_property_read_u32(of_root, "arm,hbi", &dt_hbi) == 0) {
>
> Given this and selftests are the only users in the whole tree, perhaps
> this should just use of_find_node_by_path("/") rather than expose this
> global.

I'll look at doing that with a separate patch. The
of_have_populated_dt() static inline in of.h uses it, so it needs to
be exported with the current code. I'd need to create an exported
version of that function to unexport of_root.

>
>>                 u32 id = vexpress_get_procid(VEXPRESS_SITE_MASTER);
>>                 u32 hbi = (id >> SYS_PROCIDx_HBI_SHIFT) & SYS_HBI_MASK;
>>
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 2305dc0382bc..b86beff7b167 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -32,8 +32,8 @@
>>
>>  LIST_HEAD(aliases_lookup);
>>
>> -struct device_node *of_allnodes;
>> -EXPORT_SYMBOL(of_allnodes);
>> +struct device_node *of_root;
>> +EXPORT_SYMBOL(of_root);
>>  struct device_node *of_chosen;
>>  struct device_node *of_aliases;
>>  struct device_node *of_stdout;
>> @@ -48,7 +48,7 @@ struct kset *of_kset;
>>   */
>>  DEFINE_MUTEX(of_mutex);
>>
>> -/* use when traversing tree through the allnext, child, sibling,
>> +/* use when traversing tree through the child, sibling,
>>   * or parent members of struct device_node.
>>   */
>>  DEFINE_RAW_SPINLOCK(devtree_lock);
>> @@ -204,7 +204,7 @@ static int __init of_init(void)
>>         mutex_unlock(&of_mutex);
>>
>>         /* Symlink in /proc as required by userspace ABI */
>> -       if (of_allnodes)
>> +       if (of_root)
>>                 proc_symlink("device-tree", NULL, "/sys/firmware/devicetree/base");
>>
>>         return 0;
>> @@ -245,6 +245,23 @@ struct property *of_find_property(const struct device_node *np,
>>  }
>>  EXPORT_SYMBOL(of_find_property);
>>
>> +struct device_node *__of_find_all_nodes(struct device_node *prev)
>> +{
>> +       struct device_node *np;
>> +       if (!prev)
>> +               np = of_root;
>> +       else if (prev->child) {
>> +               np = prev->child;
>> +       } else {
>
> Your braces are inconsistent.

Fixed.

>> @@ -180,12 +172,12 @@ static void __init of_selftest_check_tree_linkage(void)
>>         struct device_node *np;
>>         int allnode_count = 0, child_count;
>>
>> -       if (!of_allnodes)
>> +       if (!of_root)
>
> This could be !of_have_populated_dt() instead.

For internal dt code, I don't mind referencing of_root directly.

Thanks for the review.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
