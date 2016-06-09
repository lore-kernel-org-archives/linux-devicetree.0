From: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] drivers/of: Fix depth for sub-tree blob in
 unflatten_dt_nodes()
Date: Thu, 9 Jun 2016 10:40:07 +1000
Message-ID: <20160609004007.GA9222@gwshan>
References: <1465368654-24170-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <CAL_Jsq+D86LbGTiDbokSGNMownTMDteji_NmJNxz4AqTYMpJhw@mail.gmail.com>
Reply-To: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+D86LbGTiDbokSGNMownTMDteji_NmJNxz4AqTYMpJhw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, andrew.donnellan-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 08, 2016 at 11:46:41AM -0500, Rob Herring wrote:
>On Wed, Jun 8, 2016 at 1:50 AM, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> wrote:
>> The function is unflattening device sub-tree blob if @dad passed to
>> the function is valid. Currently, this functionality is used by PPC
>> PowerNV PCI hotplug driver only. There are possibly multiple nodes
>> in the first level of depth, fdt_next_node() bails immediately when
>> @depth becomes negative before the second device node can be probed
>> successfully. It leads to the device nodes except the first one won't
>> be unflattened successfully.
>>
>> This fixes the issue by setting the initial depth (@inital_depth) to
>> 1 when this function is called to unflatten device sub-tree blob. No
>> logic changes when this function is used to unflatten non-sub-tree
>> blob.
>
>Does this affect anything besides your PCI hotplug stuff? I'd think
>overlays/changesets would be broken, but the unittests aren't failing
>that I recall.
>

Rob, it affects my PCI hotplug stuff only. There are two paths how
unflatten_dt_nodes() is called. No valid @dad specified in (A). PCI
hotplug is the only user specifying valid @dad in (B) and all other
users have invalid @dad.

          A                          B

   unflatten_device_tree     of_fdt_unflatten_tree
   __unflatten_device_tree   __unflatten_device_tree
   unflatten_dt_nodes        unflatten_dt_nodes

With or without this patch, I got same otuput from unittest as below:

### dt-test ### start of unittest - you will see error messages
/testcase-data/phandle-tests/consumer-a: could not get #phandle-cells-missing for /testcase-data/phandle-tests/provider1
/testcase-data/phandle-tests/consumer-a: could not get #phandle-cells-missing for /testcase-data/phandle-tests/provider1
/testcase-data/phandle-tests/consumer-a: could not find phandle
/testcase-data/phandle-tests/consumer-a: could not find phandle
/testcase-data/phandle-tests/consumer-a: arguments longer than property
/testcase-data/phandle-tests/consumer-a: arguments longer than property
irq: XICS didn't like hwirq-0x1 to VIRQ27 mapping (rc=-22)
irq: XICS didn't like hwirq-0x1 to VIRQ27 mapping (rc=-22)
### dt-test ### FAIL of_unittest_platform_populate():782 device deferred probe failed - 0
overlay_is_topmost: #5 clashes #6 @/testcase-data/overlay-node/test-bus/test-unittest8
overlay_removal_is_ok: overlay #5 is not topmost
of_overlay_destroy: removal check failed for overlay #5
### dt-test ### end of unittest - 147 passed, 1 failed


>Rob
>

Thanks,
Gavin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
