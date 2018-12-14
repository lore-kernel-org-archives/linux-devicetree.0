From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 2/2] of: __of_detach_node() - remove node from phandle
 cache
Date: Fri, 14 Dec 2018 14:38:20 -0800
Message-ID: <878c5024-c184-12f3-2868-df6c79d568ce@gmail.com>
References: <1544769771-5468-1-git-send-email-frowand.list@gmail.com>
 <1544769771-5468-3-git-send-email-frowand.list@gmail.com>
 <CAL_JsqJN69kbLX=Fn-hYh1FwWoU-S+sB7wHjG-9H5=ihbo3hcg@mail.gmail.com>
 <68a9e834-b11d-8b9f-1669-466709257f37@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <68a9e834-b11d-8b9f-1669-466709257f37@linux.vnet.ibm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Bringmann <mwb@linux.vnet.ibm.com>, Rob Herring <robh+dt@kernel.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, tlfalcon@linux.vnet.ibm.com, minkim@us.ibm.com, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On 12/14/18 1:56 PM, Michael Bringmann wrote:
> On 12/14/2018 11:20 AM, Rob Herring wrote:
>> On Fri, Dec 14, 2018 at 12:43 AM <frowand.list@gmail.com> wrote:
>>>
>>> From: Frank Rowand <frank.rowand@sony.com>
>>>
>>> Non-overlay dynamic devicetree node removal may leave the node in
>>> the phandle cache.  Subsequent calls to of_find_node_by_phandle()
>>> will incorrectly find the stale entry.  Remove the node from the
>>> cache.
>>>
>>> Add paranoia checks in of_find_node_by_phandle() as a second level
>>> of defense (do not return cached node if detached, do not add node
>>> to cache if detached).
>>>
>>> Reported-by: Michael Bringmann <mwb@linux.vnet.ibm.com>
>>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
>>> ---
>>>  drivers/of/base.c       | 29 ++++++++++++++++++++++++++++-
>>>  drivers/of/dynamic.c    |  3 +++
>>>  drivers/of/of_private.h |  4 ++++
>>>  3 files changed, 35 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>>> index d599367cb92a..34a5125713c8 100644
>>> --- a/drivers/of/base.c
>>> +++ b/drivers/of/base.c
>>> @@ -162,6 +162,27 @@ int of_free_phandle_cache(void)
>>>  late_initcall_sync(of_free_phandle_cache);
>>>  #endif
>>>
>>> +/*
>>> + * Caller must hold devtree_lock.
>>> + */
>>> +void __of_free_phandle_cache_entry(phandle handle)
>>> +{
>>> +       phandle masked_handle;
>>> +
>>> +       if (!handle)
>>> +               return;
>>> +
>>> +       masked_handle = handle & phandle_cache_mask;
>>> +
>>> +       if (phandle_cache) {
>>> +               if (phandle_cache[masked_handle] &&
>>> +                   handle == phandle_cache[masked_handle]->phandle) {
>>> +                       of_node_put(phandle_cache[masked_handle]);
>>> +                       phandle_cache[masked_handle] = NULL;
>>> +               }
>>> +       }
>>> +}
>>> +
>>>  void of_populate_phandle_cache(void)
>>>  {
>>>         unsigned long flags;
>>> @@ -1209,11 +1230,17 @@ struct device_node *of_find_node_by_phandle(phandle handle)
>>>                 if (phandle_cache[masked_handle] &&
>>>                     handle == phandle_cache[masked_handle]->phandle)
>>>                         np = phandle_cache[masked_handle];
>>> +               if (np && of_node_check_flag(np, OF_DETACHED)) {
>>> +                       of_node_put(np);
>>> +                       phandle_cache[masked_handle] = NULL;
>>
>> This should never happen, right? Any time we set OF_DETACHED, the
>> entry should get removed from the cache. I think we want a WARN here
>> in case we're in an unexpected state.

Correct, this should never happen.  I will add the WARN.


> We don't actually remove the pointer from the phandle cache when we set
> OF_DETACHED in drivers/of/dynamic.c:__of_detach_node.  The phandle cache
> is currently static within drivers/of/base.c.  There are a couple of
> calls to of_populate_phandle_cache / of_free_phandle_cache within
> drivers/of/overlay.c, but these are not involved in the device tree
> updates that occur during LPAR migration.  A WARN here would only make
> sense, if we also arrange to clear the handle.

Rob's reply did not include the full patch 2/2.  The full patch 2/2 also
adds a call to __of_free_phandle_cache_entry() in __of_detach_node().

-Frank

> 
>>
>> Rob
> 
> Michael
> 
>>
>>
> 
