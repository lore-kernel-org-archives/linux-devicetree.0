From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: drivers/of: crash on boot
Date: Thu, 19 May 2016 09:20:47 -0500
Message-ID: <CAL_JsqKVwR_tvqAYaHRpe81SKKE97-ciMKE3RkDXQ1EEbMXz1g@mail.gmail.com>
References: <573C8B6C.6030900@oracle.com> <CAL_JsqJsjh+Shk1nD5YQeQ=6B1MZOyEj5oX-q_xKH642toURdA@mail.gmail.com>
 <80967a3a-3b97-e131-97e5-f449f567b01c@nvidia.com> <d0e2564c-c8d4-2c4c-f194-60b43b0ab80e@nvidia.com>
 <CAL_JsqKn1BLCiW=CBch4G8s=YheXFVouhz+JVvB6j8-4W-UK6A@mail.gmail.com> <CAL_JsqLdpq6bePK2c6Dhub9cZvMV1JVqC=RH8pomCmpszYugYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLdpq6bePK2c6Dhub9cZvMV1JVqC=RH8pomCmpszYugYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Sasha Levin <sasha.levin-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Gavin Shan <gwshan-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 18, 2016 at 8:51 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, May 18, 2016 at 7:23 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Wed, May 18, 2016 at 4:26 PM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> On 5/18/2016 3:58 PM, Rhyland Klein wrote:
>>>> On 5/18/2016 3:36 PM, Rob Herring wrote:
>>>>> On Wed, May 18, 2016 at 10:34 AM, Sasha Levin <sasha.levin-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> wrote:
>>>>>> Hi Rhyland,
>>>>>>
>>>>>> I'm seeing a crash on boot that seems to have been caused by
>>>>>> "drivers/of: Fix depth when unflattening devicetree":
>>>>>>
>>>>>> [   61.145229] ==================================================================
>>>>>>
>>>>>> [   61.147588] BUG: KASAN: stack-out-of-bounds in unflatten_dt_nodes+0x11d2/0x1290 at addr ffff88005b30777c
>
> [...]
>
>>> This patch seems to work for me. I found a bug in my original patch.
>>> Sasha/Rob, can you see if this works for you too:
>>>
>>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>>> index 0b5850027bb5..e7a8caac5b27 100644
>>> --- a/drivers/of/fdt.c
>>> +++ b/drivers/of/fdt.c
>>> @@ -407,9 +407,9 @@ static int unflatten_dt_nodes(const void *blob,
>>>
>>>         root = dad;
>>>         fpsizes[depth] = dad ? strlen(of_node_full_name(dad)) : 0;
>>> -       nps[depth+1] = dad;
>>> +       nps[depth] = dad;
>>>         for (offset = 0;
>>> -            offset >= 0;
>>> +            offset >= 0 && depth >= 0;
>>>              offset = fdt_next_node(blob, offset, &depth)) {
>>>                 if (WARN_ON_ONCE(depth >= FDT_MAX_DEPTH))
>>>                         continue;
>>
>> This is not work for me. I'm booting x86 with the DT unit test and
>> KASAN enabled. I suspect our differences are due to different data
>> after the end of the dtb. Also, I think there may be a bug in
>> fdt_next_node FDT_END handling. The "!depth" seems suspicious to me
>> and I think it should be "!(*depth)".

I take that back. Your change does work for me. Must have had something stale.

>> The DT overlay unit tests are also failing. Not sure if that's related.
>
> Seems with the above patch and the fix to fdt_next_node, the problem
> is fixed both for KASAN and the DT overlay tests. Trying it out now
> with some other configurations.

fdt_next_node is in fact correct. Changing it caused failures in the
dtc unit tests.

So I have squashed the above fix into your original fix and pushed
that out to -next. kernelci.org is also seeing some failures due to
this. I'll give this another day or so before sending to Linus.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
