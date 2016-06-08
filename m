From: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] drivers/of: Fix depth for sub-tree blob in
 unflatten_dt_nodes()
Date: Wed, 8 Jun 2016 20:18:31 +1000
Message-ID: <20160608101831.GA4451@gwshan>
References: <1465368654-24170-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <5757D129.4070505@au1.ibm.com>
 <5757D191.3040805@au1.ibm.com>
Reply-To: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5757D191.3040805-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Donnellan <andrew.donnellan-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Cc: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 08, 2016 at 06:04:33PM +1000, Andrew Donnellan wrote:
>On 08/06/16 18:02, Andrew Donnellan wrote:
>>On 08/06/16 16:50, Gavin Shan wrote:
>>>The function is unflattening device sub-tree blob if @dad passed to
>>>the function is valid. Currently, this functionality is used by PPC
>>>PowerNV PCI hotplug driver only. There are possibly multiple nodes
>>>in the first level of depth, fdt_next_node() bails immediately when
>>>@depth becomes negative before the second device node can be probed
>>>successfully. It leads to the device nodes except the first one won't
>>>be unflattened successfully.
>>>
>>>This fixes the issue by setting the initial depth (@inital_depth) to
>>>1 when this function is called to unflatten device sub-tree blob. No
>>>logic changes when this function is used to unflatten non-sub-tree
>>>blob.
>>>
>>>Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>Fixes: 78c44d910 ("drivers/of: Fix depth when unflattening devicetree")
>>>Signed-off-by: Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
>>
>>This doesn't appear to work for me - in my cxl use case, at first glance
>>it looks like we're getting an empty unflattened device tree returned.
>>
>>Will investigate further.
>
>Can confirm though that that I was observing the original problem here with
>78c44d9 when hotplugging a PCI device and only getting 1 PCI function added
>to the devicetree.
>

Andrew, thanks for testing it for CAPI adapter. Without the fix, the
device node for PCI device 0003:09:00.0 is populated and the other 3
device nodes for 0003:09:00.1/2/3 are missed. With the fix, all 4 device
nodes are populated properly.

Andrew, the patch isn't related to the empty FDT blob. please check the
firmware log if the newly enabled (3) CAPI functions have been probed by
firmware. Otherwise, empty FDT blob will be returned. I guess you probably
need a power cycle to retest? :)

Thanks,
Gavin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
