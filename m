Return-Path: <SRS0=ANIs=F5=gmail.com=frowand.list@kernel.org>
Subject: Re: [PATCH] of: get of_root directly in place of
 of_find_node_by_path("/")
References: <1520041604-24482-1-git-send-email-tyreld@linux.vnet.ibm.com>
 <20180307203847.l6jfxgizrzzwfrbr@rob-hp-laptop>
 <756e7632-bc0a-ae5f-f383-fbd3f0bf9135@linux.vnet.ibm.com>
 <CAL_JsqLZV7pSJCczoR9wr=ufkSWEKv7LrKt19Nq3DvVSB3P6pw@mail.gmail.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <dab44b8c-bb02-24d4-8628-b4798483cd75@gmail.com>
Date: Wed, 7 Mar 2018 15:59:32 -0800
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLZV7pSJCczoR9wr=ufkSWEKv7LrKt19Nq3DvVSB3P6pw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Cc: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 03/07/18 14:21, Rob Herring wrote:
> On Wed, Mar 7, 2018 at 4:14 PM, Tyrel Datwyler
> <tyreld@linux.vnet.ibm.com> wrote:
>> On 03/07/2018 12:38 PM, Rob Herring wrote:
>>> On Fri, Mar 02, 2018 at 08:46:44PM -0500, Tyrel Datwyler wrote:
>>>> There are a couple places in drivers/of where the root node is found
>>>> with a of_find_node_by_path("/") call. This call just returns
>>>> of_node_get(of_root) when the the path "/" is passed as a parameter.
>>>> So, lets fixup these instances to just do that instead.
>>>>
>>>> Signed-off-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
>>>> ---
>>>>  drivers/of/base.c     | 2 +-
>>>>  drivers/of/platform.c | 4 ++--
>>>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>>>> index ad28de9..94c1b4d 100644
>>>> --- a/drivers/of/base.c
>>>> +++ b/drivers/of/base.c
>>>> @@ -455,7 +455,7 @@ int of_machine_is_compatible(const char *compat)
>>>>      struct device_node *root;
>>>>      int rc = 0;
>>>>
>>>> -    root = of_find_node_by_path("/");
>>>> +    root = of_node_get(of_root);
>>>
>>> The former seems more readable to me. I'll wait and see if Frank has any
>>> comments on this change.>>
>> Fair enough. I find them equally readable now that we have a well
>> named/defined global, namely "of_root", pointing at the device tree
>> root. My primary goal was saving a function call, but I wasn't sure
>> if anybody really cares enough. A quick check shows ~77 uses of
>> "of_find_node_by_path("/")" in the kernel.

That is an interesting result.

>> Figured I'd start here
>> and see what the consensus was.
> 
> As far as outside drivers/of/ is concerned, we certainly don't want to
> expose global variables. But for most uses, you shouldn't need the
> root node pointer because most iterating or searching functions treat
> NULL as root.
> 
> Rob

For a simple answer, I'll go along with Rob here.


"Here, hold my beer and watch this!"

Things one should never say.  :-)

Please don't run with this following idea yet.  This could open a can
of worms that I've been trying to leave closed until I have some time
scheduled to handle the fall out.

The core devicetree code was not written with the concept of overlays
in mind.  When the first portions of the overlay code were accepted,
the architectural issues of the extending existing core code were not
first addressed.  I don't even know if they were considered or
discussed because I was not involved at the time.

Some key things that were not updated to account for overlays:

  1) locking (protection of the live devicetree data structures)

  2) pointers to live devicetree data structures being handed out
     to kernel code outside the core devicetree code

One result of this is that after an overlay is applied, we can never
free the memory containing the overlay FDT and the overlay expanded
tree, because we do not know if any other part of the kernel has a
pointer into the overlay data.

I haven't dug into this in any depth yet, but it seems like it should
be possible to create a new set of devicetree APIS, called by drivers
and other parts of the kernel that retrieve information from the
devicetree.  This API can not return pointers into the core devicetree
data structures.  Thus no node pointers, no property pointers, no
property value pointers.

We may find some easy solution for this, but I suspect not.

That's a long winded way of saying that maybe we should not spend
effort on cleaning up non-critical issues with the way the
current API is being used, _if_ the current API is going to
be replaced long term.

-Frank
