From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] of: use hash based search in of_find_node_by_phandle
Date: Fri, 26 Jan 2018 09:34:59 -0600
Message-ID: <CAL_JsqJ=6bmOZCsj=NVthgXsZRRjyhQUDv0-CrngF_1MaYtKqA@mail.gmail.com>
References: <1516955496-17236-1-git-send-email-cpandya@codeaurora.org>
 <f08592cf-5e49-e631-c481-e166b741f25e@prevas.dk> <aa84e40d-5032-1d1d-6146-391ca1e5e528@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <aa84e40d-5032-1d1d-6146-391ca1e5e528@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chintan Pandya <cpandya@codeaurora.org>
Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Frank Rowand <frowand.list@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 26, 2018 at 9:14 AM, Chintan Pandya <cpandya@codeaurora.org> wrote:
>
>> I'm probably missing something obvious, but: Aren't phandles in practice
>> small consecutive integers assigned by dtc? If so, why not just have a
>> smallish static array mapping the small phandle values directly to
>> device node, instead of adding a pointer to every struct device_node? Or
>> one could determine the size of the array dynamically (largest seen
>> phandle value, capping at something sensible, e.g. 1024).

I do have some concerns that is a bit fragile and dependent on dtc's
implementations. However, I guess we already kind of are with overlay
phandles.

> Haven't noticed this earlier !! If following is known or true, we can avoid
> using hash-table and save per device_node hlish_node.
>
>     1. How to know max phandle value without traversing tree once? In my
> case,
>        max is 1263.

We already have to know it for overlays. Plus unflattening has to
handle phandles specially already, so it would be easy to do there if
we aren't already.

Then the question what to do with overlays. For now, we can probably
assume too few phandles to matter.

>     2. Although, I haven't observed collision but is it like every
> device_node
>        is associated with unique phandle value ?

Yes, phandles must be unique.

>> In either case, one would still need to keep the code doing the
>> whole-tree traversal for handling large phandle values, but I think the
>> above should make lookup O(1) in most cases.
>
> I would refrain doing this because that will make this API inconsistent in
> terms
> of time taken by different nodes. I see that people do change their device
> placing in DT and that changes time taken in of_* APIs for them but
> affecting
> others.

Who cares. It's the total time that matters. It's obviously not a
problem until you have 1000s of lookups as no one cared until recently
(though you aren't the first with a hash table lookup).

>> Alternatively, one could just count the number of nodes with a phandle,
>> allocate an array of that many pointers (so the memory use is certainly
>> no more than if adding a pointer to each device_node), and sort it by
>> phandle, so one can do lookup using a binary search.
>>
>> Rasmus
>
> This is certainly doable if current approach is not welcomed due to
> addition on hlish_node in device_node.

I certainly prefer an out of band approach as that's easier to turn of
if we want to save memory.

Still, I'd like to see some data on a cache based approach and reasons
why that won't work.

Rob
