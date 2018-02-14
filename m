From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2] of: cache phandle nodes to reduce cost of
 of_find_node_by_phandle()
Date: Tue, 13 Feb 2018 17:07:17 -0800
Message-ID: <6e16f883-8aaf-c6af-10f3-3d96c8370bd6@gmail.com>
References: <1518416868-8804-1-git-send-email-frowand.list@gmail.com>
 <CAL_JsqKrp_vL2ZnYEnabonRdHvPT17Gf8fk102g=j4VUH1HSSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKrp_vL2ZnYEnabonRdHvPT17Gf8fk102g=j4VUH1HSSA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Chintan Pandya <cpandya@codeaurora.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 02/13/18 06:49, Rob Herring wrote:
> On Mon, Feb 12, 2018 at 12:27 AM,  <frowand.list@gmail.com> wrote:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> Create a cache of the nodes that contain a phandle property.  Use this
>> cache to find the node for a given phandle value instead of scanning
>> the devicetree to find the node.  If the phandle value is not found
>> in the cache, of_find_node_by_phandle() will fall back to the tree
>> scan algorithm.
> 
> Please add some data here as to what speed up we see.

Will do.


>> The cache is initialized in of_core_init().
>>
>> The cache is freed via a late_initcall_sync() if modules are not
>> enabled.
>>
>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
>> ---
>>
>> Changes since v1:
>>   - change short description from
>>     of: cache phandle nodes to reduce cost of of_find_node_by_phandle()
>>   - rebase on v4.16-rc1
>>   - reorder new functions in base.c to avoid forward declaration
>>   - add locking around kfree(phandle_cache) for memory ordering
>>   - add explicit check for non-null of phandle_cache in
>>     of_find_node_by_phandle().  There is already a check for !handle,
>>     which prevents accessing a null phandle_cache, but that dependency
>>     is not obvious, so this check makes it more apparent.
>>   - do not free phandle_cache if modules are enabled, so that
>>     cached phandles will be available when modules are loaded
>>
>>  drivers/of/base.c       | 93 ++++++++++++++++++++++++++++++++++++++++++++++---
>>  drivers/of/of_private.h |  5 +++
>>  drivers/of/resolver.c   | 21 -----------
>>  3 files changed, 94 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index ad28de96e13f..b3597c250837 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -91,10 +91,88 @@ int __weak of_node_to_nid(struct device_node *np)
>>  }
>>  #endif
>>
>> +static struct device_node **phandle_cache;
>> +static u32 max_phandle_cache;
>> +
>> +phandle live_tree_max_phandle(void)
>> +{
>> +       struct device_node *node;
>> +       phandle max_phandle;
>> +       unsigned long flags;
>> +
>> +       raw_spin_lock_irqsave(&devtree_lock, flags);
>> +
>> +       max_phandle = 0;
>> +       for_each_of_allnodes(node) {
>> +               if (node->phandle != OF_PHANDLE_ILLEGAL &&
>> +                   node->phandle > max_phandle)
>> +                       max_phandle = node->phandle;
>> +               }
>> +
>> +       raw_spin_unlock_irqrestore(&devtree_lock, flags);
>> +
>> +       return max_phandle;
>> +}
>> +
>> +static void of_populate_phandle_cache(void)
>> +{
>> +       unsigned long flags;
>> +       phandle max_phandle;
>> +       u32 nodes = 0;
>> +       struct device_node *np;
>> +
>> +       if (phandle_cache)
>> +               return;
>> +
>> +       max_phandle = live_tree_max_phandle();
>> +
>> +       raw_spin_lock_irqsave(&devtree_lock, flags);
>> +
>> +       for_each_of_allnodes(np)
>> +               nodes++;
>> +
>> +       /* sanity cap for malformed tree */
> 
> Or any tree that doesn't match your assumptions.

Will change to say so.


>> +       if (max_phandle > nodes)
>> +               max_phandle = nodes;
> 
> I fail to see how setting max_phandle to number of nodes helps you
> here.
>
> Either just bail out or mask the phandle values so this works
> with any contiguous range.

I'll mask.


> Please capture somewhere what the assumptions are for the cache to
> work (i.e. phandles were allocated contiguously from 0).

Will do.


> 
> Rob
> 
