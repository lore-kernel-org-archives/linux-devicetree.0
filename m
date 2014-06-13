From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RFC PATCH] OF: fix of_find_node_by_path() assumption that of_allnodes
 is root
Date: Fri, 13 Jun 2014 09:49:03 -0700
Message-ID: <539B2B7F.8010900@gmail.com>
References: <539A91E2.7000606@gmail.com> <CAL_JsqJ+f0CjwGnqTzXjMOAvbDOf0O3BZgcQwrzaWBy9Gwiw8A@mail.gmail.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJ+f0CjwGnqTzXjMOAvbDOf0O3BZgcQwrzaWBy9Gwiw8A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 6/13/2014 6:52 AM, Rob Herring wrote:
> On Fri, Jun 13, 2014 at 12:53 AM, Frank Rowand <frowand.list@gmail.com> wrote:
>> From: Frank Rowand <frank.rowand@sonymobile.com>
>>
>> Pantelis Antoniou reports that of_find_node_by_path() is borked because
>> of_allnodes is not guaranteed to contain the root of the tree after using
>> any of the dynamic update functions because some other nodes ends up as
>> of_allnodes.
>>
>> Fixes: c22e650e66b8 of: Make of_find_node_by_path() handle /aliases
> 
> Is it not possible to do a fix in of_find_node_by_path instead? I just

Yes, the code for that is in https://lkml.org/lkml/2014/5/20/758

Or as Grant said in his reply, just use the fix in of_attach_node() for
now since he is going to replace the custom list.

> wonder if this could have any other unintended side-effects on
> of_attach_node's behavior.
> 
> Rob
> 
>>
>> Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>
>> ---
>>
>>
>> Pantelis,
>>
>> Can you test whether the problem you reported in irc?
>>
>> This patch has not been tested, not even compile tested.
>>
>>
>>  drivers/of/base.c |    8       6 +     2 -     0 !
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> Index: b/drivers/of/base.c
>> ===================================================================
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -1948,6 +1948,9 @@ int of_reconfig_notify(unsigned long act
>>
>>  /**
>>   * of_attach_node - Plug a device node into the tree and global list.
>> + *
>> + * Put the device node after of_allnodes in the global list so that
>> + * of_allnodes remains the root.
>>   */
>>  int of_attach_node(struct device_node *np)
>>  {
>> @@ -1958,11 +1961,12 @@ int of_attach_node(struct device_node *n
>>         if (rc)
>>                 return rc;
>>
>> +       BUG_ON(!of_allnodes);
>>         raw_spin_lock_irqsave(&devtree_lock, flags);
>>         np->sibling = np->parent->child;
>> -       np->allnext = of_allnodes;
>> +       np->allnext = of_allnodes->allnext;
>>         np->parent->child = np;
>> -       of_allnodes = np;
>> +       of_allnodes->allnext = np;
>>         of_node_clear_flag(np, OF_DETACHED);
>>         raw_spin_unlock_irqrestore(&devtree_lock, flags);
>>
> .
> 
