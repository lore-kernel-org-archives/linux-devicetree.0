From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 1/3] of: rename *_node_sysfs to _node_post
Date: Tue, 10 May 2016 16:57:07 +0300
Message-ID: <A91ED547-2B22-43FD-8B2B-F3DB86BC4750@konsulko.com>
References: <1462817488-8370-1-git-send-email-pantelis.antoniou@konsulko.com> <1462817488-8370-2-git-send-email-pantelis.antoniou@konsulko.com> <CAL_JsqLZuQhDouK_Qd3WWuDHik2iYogeSyAY5+Bn8VDGdWiX4w@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLZuQhDouK_Qd3WWuDHik2iYogeSyAY5+Bn8VDGdWiX4w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Grant Likely <grant.likely@secretlab.ca>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert@linux-m68k.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On May 10, 2016, at 00:49 , Rob Herring <robherring2@gmail.com> wrote:
> 
> On Mon, May 9, 2016 at 1:11 PM, Pantelis Antoniou
> <pantelis.antoniou@konsulko.com> wrote:
> 
> The "why" goes here.
> 

OK.

>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
>> ---
>> drivers/of/base.c       |  4 ++--
>> drivers/of/dynamic.c    | 10 +++++-----
>> drivers/of/of_private.h |  4 ++--
>> drivers/of/unittest.c   |  4 ++--
>> 4 files changed, 11 insertions(+), 11 deletions(-)
>> 
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 9bbca56..20bbc2f 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -156,7 +156,7 @@ int __of_add_property_sysfs(struct device_node *np, struct property *pp)
>>        return rc;
>> }
>> 
>> -int __of_attach_node_sysfs(struct device_node *np)
>> +int __of_attach_node_post(struct device_node *np)
>> {
>>        const char *name;
>>        struct property *pp;
>> @@ -203,7 +203,7 @@ void __init of_core_init(void)
>>                return;
>>        }
>>        for_each_of_allnodes(np)
>> -               __of_attach_node_sysfs(np);
>> +               __of_attach_node_post(np);
>>        mutex_unlock(&of_mutex);
>> 
>>        /* Symlink in /proc as required by userspace ABI */
>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>> index 350b1cf..eb31a55 100644
>> --- a/drivers/of/dynamic.c
>> +++ b/drivers/of/dynamic.c
>> @@ -41,7 +41,7 @@ void of_node_put(struct device_node *node)
>> }
>> EXPORT_SYMBOL(of_node_put);
>> 
>> -void __of_detach_node_sysfs(struct device_node *np)
>> +void __of_detach_node_post(struct device_node *np)
>> {
>>        struct property *pp;
>> 
>> @@ -251,7 +251,7 @@ int of_attach_node(struct device_node *np)
>>        __of_attach_node(np);
>>        raw_spin_unlock_irqrestore(&devtree_lock, flags);
>> 
>> -       __of_attach_node_sysfs(np);
>> +       __of_attach_node_post(np);
>>        mutex_unlock(&of_mutex);
>> 
>>        of_reconfig_notify(OF_RECONFIG_ATTACH_NODE, &rd);
>> @@ -304,7 +304,7 @@ int of_detach_node(struct device_node *np)
>>        __of_detach_node(np);
>>        raw_spin_unlock_irqrestore(&devtree_lock, flags);
>> 
>> -       __of_detach_node_sysfs(np);
>> +       __of_detach_node_post(np);
>>        mutex_unlock(&of_mutex);
>> 
>>        of_reconfig_notify(OF_RECONFIG_DETACH_NODE, &rd);
>> @@ -628,10 +628,10 @@ static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
>> 
>>        switch (ce->action) {
>>        case OF_RECONFIG_ATTACH_NODE:
>> -               __of_attach_node_sysfs(ce->np);
>> +               __of_attach_node_post(ce->np);
>>                break;
>>        case OF_RECONFIG_DETACH_NODE:
>> -               __of_detach_node_sysfs(ce->np);
>> +               __of_detach_node_post(ce->np);
>>                break;
>>        case OF_RECONFIG_ADD_PROPERTY:
>>                /* ignore duplicate names */
>> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
>> index 092cba7..10b0342 100644
>> --- a/drivers/of/of_private.h
>> +++ b/drivers/of/of_private.h
>> @@ -79,9 +79,9 @@ extern void __of_update_property_sysfs(struct device_node *np,
>>                struct property *newprop, struct property *oldprop);
>> 
>> extern void __of_attach_node(struct device_node *np);
>> -extern int __of_attach_node_sysfs(struct device_node *np);
>> +extern int __of_attach_node_post(struct device_node *np);
>> extern void __of_detach_node(struct device_node *np);
>> -extern void __of_detach_node_sysfs(struct device_node *np);
>> +extern void __of_detach_node_post(struct device_node *np);
>> 
>> /* iterators for transactions, used for overlays */
>> /* forward iterator */
>> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
>> index e5a5ec0..7ea3689 100644
>> --- a/drivers/of/unittest.c
>> +++ b/drivers/of/unittest.c
>> @@ -931,7 +931,7 @@ static int attach_node_and_children(struct device_node *np)
>>        of_node_clear_flag(np, OF_DETACHED);
>>        raw_spin_unlock_irqrestore(&devtree_lock, flags);
>> 
>> -       __of_attach_node_sysfs(np);
>> +       __of_attach_node_post(np);
>>        mutex_unlock(&of_mutex);
>> 
>>        while (child) {
>> @@ -989,7 +989,7 @@ static int __init unittest_data_add(void)
>>        if (!of_root) {
>>                of_root = unittest_data_node;
>>                for_each_of_allnodes(np)
>> -                       __of_attach_node_sysfs(np);
>> +                       __of_attach_node_post(np);
>>                of_aliases = of_find_node_by_path("/aliases");
>>                of_chosen = of_find_node_by_path("/chosen");
>>                return 0;
>> --
>> 1.7.12
>> 
