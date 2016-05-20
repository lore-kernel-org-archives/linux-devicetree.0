From: Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: Re: drivers/of: crash on boot
Date: Fri, 20 May 2016 12:40:22 +1000
Message-ID: <20160520024022.GA5621@gwshan>
References: <573C8B6C.6030900@oracle.com>
 <CAL_JsqJsjh+Shk1nD5YQeQ=6B1MZOyEj5oX-q_xKH642toURdA@mail.gmail.com>
 <80967a3a-3b97-e131-97e5-f449f567b01c@nvidia.com>
 <d0e2564c-c8d4-2c4c-f194-60b43b0ab80e@nvidia.com>
 <CAL_JsqKn1BLCiW=CBch4G8s=YheXFVouhz+JVvB6j8-4W-UK6A@mail.gmail.com>
 <CAL_JsqLdpq6bePK2c6Dhub9cZvMV1JVqC=RH8pomCmpszYugYg@mail.gmail.com>
 <20160519111950.GA28855@gwshan>
 <CAL_JsqL_8cUmKxu3=BBkmFi3yO7rWeUW64TO6MRV60451V70+Q@mail.gmail.com>
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqL_8cUmKxu3=BBkmFi3yO7rWeUW64TO6MRV60451V70+Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>, Rhyland Klein <rklein@nvidia.com>, Sasha Levin <sasha.levin@oracle.com>, LKML <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 19, 2016 at 07:48:18AM -0500, Rob Herring wrote:
>On Thu, May 19, 2016 at 6:19 AM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
>> On Wed, May 18, 2016 at 08:51:59PM -0500, Rob Herring wrote:
>>>On Wed, May 18, 2016 at 7:23 PM, Rob Herring <robh@kernel.org> wrote:
>>>> On Wed, May 18, 2016 at 4:26 PM, Rhyland Klein <rklein@nvidia.com> wrote:
>>>>> On 5/18/2016 3:58 PM, Rhyland Klein wrote:
>>>>>> On 5/18/2016 3:36 PM, Rob Herring wrote:
>>>>>>> On Wed, May 18, 2016 at 10:34 AM, Sasha Levin <sasha.levin@oracle.com> wrote:
>>>>>>>> Hi Rhyland,
>>>>>>>>
>>>>>>>> I'm seeing a crash on boot that seems to have been caused by
>>>>>>>> "drivers/of: Fix depth when unflattening devicetree":
>>>>>>>>
>>>>>>>> [   61.145229] ==================================================================
>>>>>>>>
>>>>>>>> [   61.147588] BUG: KASAN: stack-out-of-bounds in unflatten_dt_nodes+0x11d2/0x1290 at addr ffff88005b30777c
>>>
>>>[...]
>>>
>>>>> This patch seems to work for me. I found a bug in my original patch.
>>>>> Sasha/Rob, can you see if this works for you too:
>>>>>
>>>>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>>>>> index 0b5850027bb5..e7a8caac5b27 100644
>>>>> --- a/drivers/of/fdt.c
>>>>> +++ b/drivers/of/fdt.c
>>>>> @@ -407,9 +407,9 @@ static int unflatten_dt_nodes(const void *blob,
>>>>>
>>>>>         root = dad;
>>>>>         fpsizes[depth] = dad ? strlen(of_node_full_name(dad)) : 0;
>>>>> -       nps[depth+1] = dad;
>>>>> +       nps[depth] = dad;
>>>>>         for (offset = 0;
>>>>> -            offset >= 0;
>>>>> +            offset >= 0 && depth >= 0;
>>>>>              offset = fdt_next_node(blob, offset, &depth)) {
>>>>>                 if (WARN_ON_ONCE(depth >= FDT_MAX_DEPTH))
>>>>>                         continue;
>>>>
>>>> This is not work for me. I'm booting x86 with the DT unit test and
>>>> KASAN enabled. I suspect our differences are due to different data
>>>> after the end of the dtb. Also, I think there may be a bug in
>>>> fdt_next_node FDT_END handling. The "!depth" seems suspicious to me
>>>> and I think it should be "!(*depth)".
>>>>
>>>> The DT overlay unit tests are also failing. Not sure if that's related.
>>>
>>>Seems with the above patch and the fix to fdt_next_node, the problem
>>>is fixed both for KASAN and the DT overlay tests. Trying it out now
>>>with some other configurations.
>>>
>>
>> There're 5 patches I introduced to drivers/of/fdt.c (A). Rhyland had
>> one patch based on them (B). The code change in this thread is (C).
>> I tried several cases as below.
>>
>> There is one failing case caused by something we don't know yet. I
>> will do some invetigation unless it's not a issue or a known issue
>> of unittest itself.
>>
>> [1]. (A) excluded, (B) excluded, (C) excluded
>> =============================================
>> device-tree: Duplicate name in testcase-data, renamed to "duplicate-name#1"
>> ### dt-test ### start of unittest - you will see error messages
>> /testcase-data/phandle-tests/consumer-a: could not get #phandle-cells-missing for /testcase-data/phandle-tests/provider1
>> /testcase-data/phandle-tests/consumer-a: could not get #phandle-cells-missing for /testcase-data/phandle-tests/provider1
>> /testcase-data/phandle-tests/consumer-a: could not find phandle
>> /testcase-data/phandle-tests/consumer-a: could not find phandle
>> /testcase-data/phandle-tests/consumer-a: arguments longer than property
>> /testcase-data/phandle-tests/consumer-a: arguments longer than property
>> irq: XICS didn't like hwirq-0x1 to VIRQ32 mapping (rc=-22)
>> irq: XICS didn't like hwirq-0x1 to VIRQ32 mapping (rc=-22)
>> ### dt-test ### FAIL of_unittest_platform_populate():783 device deferred probe failed - 0
>
>Humm, I'm not seeing this one.
>

Ok. Thanks for confirm. I will do some investigation later.

>> overlay_is_topmost: #5 clashes #6 @/testcase-data/overlay-node/test-bus/test-unittest8
>> overlay_removal_is_ok: overlay #5 is not topmost
>> of_overlay_destroy: removal check failed for overlay #5
>> ### dt-test ### end of unittest - 147 passed, 1 failed
>>
>> [2]. (A) included, (B) exsluded, (C) excluded
>> =============================================
>> Same output as [1]
>>
>> [3]. (A) included, (B) included, (C) excluded
>> =============================================
>> System fails to boot
>>
>> [4]. (A) included, (B) included, (C) included
>> =============================================
>> Same output as [1] and [2].
>
>For C, this includes the fix to depth in fdt_next_node?
>

Nope, (C) does not include the depth change in fdt_next_node().
I don't see we have problem with it in fdt_next_node(). In case
[4] - all code (except @depth fix in fdt_next_node()) included,
the @depth changes properly in unflatten_dt_nodes() as I saw.

>While case 2 works for you, do you agree that there is an off by one
>error and initially fdt_next_node should be called with depth=0?
>

IRhyland's patch (plus his code he sent in this thread) should be
included. The test result is [4] with Rhyland's fixes included.
Otherwise, the check on @depth in fdt_next_node() needs adjustment.
However, fdt_next_node() is used by unflatten_dt_nodes() and others.
So I think the right option is to include Rhyland's fixes and not
change @depth in fdt_next_node().

Thanks,
Gavin 

>Rob
>
