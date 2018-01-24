From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] devicetree: new FDT format version
Date: Wed, 24 Jan 2018 13:16:32 -0800
Message-ID: <e1bec77d-4dac-200b-34be-23573bf738f0@gmail.com>
References: <b96829f9-2e8b-fdc5-5090-58591e2260cf@gmail.com>
 <CAL_JsqJR2y7bMw_-9TBAGWZ_kf7_sZo5qvqvRowJ8jiy=4G0Bg@mail.gmail.com>
 <20180123124232.GA14832@umbus>
 <20328477-e511-e875-7dc4-253640f2219e@gmail.com>
 <CAL_Jsq+fvFrGhqO0zbEUE_i23FkU=G4Z1-e0vnXHi4KbS2oK0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+fvFrGhqO0zbEUE_i23FkU=G4Z1-e0vnXHi4KbS2oK0A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "Pantelis Antomarek.vasut-Re5JQEeQqe/2sr8fMPgRzw@public.gmane.org" <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, =?UTF-8?Q?Marek_Va=c5=a1ut?= <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/24/18 07:47, Rob Herring wrote:
> On Tue, Jan 23, 2018 at 3:17 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 01/23/18 04:42, David Gibson wrote:
>>> On Mon, Jan 22, 2018 at 03:01:52PM -0600, Rob Herring wrote:
>>>> On Mon, Jan 22, 2018 at 2:09 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>> Hi All,
>>>>>
>>>>> I've tried to create a decent distribution list, but I'm sure I've missed
>>>>> someone or some important list.  Please share this with anyone you think
>>>>> will be affected.
>>>>>
>>>>> I have been playing around with some thoughts for some additions to
>>>>> the devicetree FDT aka blob format.
>>>>>
>>>>> I would like to get the affected parties thinking about how additions to
>>>>> the format could improve whichever pieces of FDT related technology you
>>>>> work on or care about.  In my opinion, the FDT format should change
>>>>> very infrequently because of the impact on so many projects that have
>>>>> to work together to create a final solution, plus the many many users
>>>>> of those projects.
>>>>
>>>> A few things discussed before:
>>>> - Adding type information Even just tagging phandles would be good.
>>>
>>> I'm a bit dubious about this.  It would have to be "hints" only -
>>> there's not really anyway we can put in authoritative type
>>> information, since dtc itself doesn't really know that.  It's also
>>> hard to see how that could be done in a way which wouldn't either a)
>>> require very awkward parallel lookup of the data and type information
>>> or b) not be backwards compatible (even read only).
> 
> I never said it was possible. :) I'm just trying to enumerate possible
> FDT format changes because I don't think we want to continuously
> trickle out FDT changes even if they are backwards compatible.

Yes, I'm trying to capture any pending changes in a single version change.


>>>> - Allow applying overlays by just appending to the blob. The need for
>>>> this is somewhat gone now that libfdt can just fully apply overlays.
>>>
>>> I'm not really sure what you want here.  I mean you could easily allow
>>> the format to allow multiple appended overlays, and define that to
>>> mean the overlaid result.  At some point *something* is going to have
>>> to really do the application, so I'm not sure that it really buys you
>>> that much.  It also makes nearly every operation on the tree in libfdt
>>> horrible to implement, at least within the other constraints the
>>> interface was designed around; you'll continually have to scan the
>>> entire tree just in case some other overlay fragment has some bearing
>>> on the thing you're looking at.  It confuses the interface too: what
>>> does "node offset" mean if the same node could be built up from
>>> overlay fragments at multiple offsets.
> 
> The idea was to avoid applying overlays to flattened trees at all.
> You're just passing the problem to the next stage (typically the
> kernel). But we have applying overlays to flattened trees now, so
> maybe there's no need anymore.
> 
>> Somewhat echoing David's comment, I'm also not sure what you mean.
>> And trying to not overly influence this conversation with preconceptions
>> from what I'm going to propose.
>>
>> My first shot at the new format added a field to the FDT to indicate
>> that an overlay FDT was concatenated to the FDT (and the overlay FDT
>> in turn could set it's field to concatenate another overlay FDT).
> 
> Yes, something like this is what I meant. This was something Grant had
> talked about.
> 
>> But in the end I decided that information belonged outside the FDT,
>> and it was sufficient to require that all FDTs be padded out so that
>> if an overlay FDT was concatenated to the FDT, the overlay FDT would
>> be properly aligned.
> 
> I can't think of why this wouldn't work either.
> 
>> For ease of typing, I'll call this "chaining" or "chained".  For
>> Linux, I am envisioning no kernel use of data from a chained FDT
>> until after the tree is unflattened.  I haven't done an exhaustive
>> search to determine all of the uses of data directly from the
>> flattened FDT, but I am optimistic that there will not be any such
>> access that would require data from a chained FDT (and we could
>> make this a rule).
> 
> This would be a major downside to leaving it up to the kernel because
> what can't be touched is hard to enumerate and could change. For
> example, we added earlycon and now the uart node can't be modified.

What you say makes sense.  So I'll reverse myself and say that for
Linux, we should update the FDT read code to scan all chained
overlay FDT(s) as well as the base FDT.


>>  I need to verify my assumptions here.  The
>> proof of concept code (doesn't even compile) would do phandle
>> resolution directly on the overlay FDT(s), and the unflatten
>> code would be slightly modified (I think -- I haven't prototyped
>> the unflatten part yet) to unflatten each FDT separately.  In
>> Linux, unflatten is two passes, (1) scan FDT to determine
>> unflattened size, (2) actually unflatten.  So this would become
>> (1) determine unflattened size of FDT _and_ overlay FDT(s),
>> (2) unflatten FDT and overlay FDT(s).
>>
>> When I send out my proposal, I will note this issue, and I would
>> expect there will be discussion about whether information to chain
>> FDTs belongs in the FDT, or somewhere external.
>>
>>>
>>>> - Move to an unflattened format so we don't have to unflatten the
>>>> tree. Or to put it another way, extend FDT enough that the tree can be
>>>> walked and manipulated efficiently. I think this would involve storing
>>>> node offsets for all the nodes. Maybe that could be combined with
>>>> storage for __symbols__?
>>>
>>> I don't think this is feasible.  If you want an unflattened tree
>>> you'll have to change things so much that any superficial resemblence
>>> to dtb will just be misleading.  You're likely to increase the size in
>>> nearly all cases (which seems to be a concern to people).  You're also
>>> almost certain to lose the benefits the serialized approach was
>>> written for in the first place: chiefly that you can make edits
>>> locally, using inserts and deletes but without having to adjust
>>> offsets or handles anywhere else in the structure.
>>
>> With my Linux blinders on, I don't see the need for any significant
>> access of the data in the FDT.  We do very little access before the
>> tree is unflattened.
> 
> We discussed this in context of shrinking the kernel memory usage for
> tiny systems a few months back. The idea is you could skip
> unflattening leaving all the data in flash and save RAM. Another way
> to do it would be unflatten the tree at build time and build the
> unflattened tree into the kernel.

Good point.  Makes sense.


>> My knowledge of bootloader use of the FDT is nearly non-existent, so
>> I'm on thin ice here.  But I am guessing that a lot of bootloader
>> processing of FDT data could be removed if the kernel would unflatten
>> a chained FDT and overlay FDT(s).
>>
>> Comments from the bootloader folks on this topic would be much
>> appreciated.
>>
>>> Making a portable "libdt" that manages an in-memory unflattened tree
>>> with pointers, and can serialize and deserialze to dtb makes sense,
>>> IMO.  Trying to make the flattened and unflattened trees the *same*
>>> format does not.
>>
>> That seems like a good approach, if the functionality is needed.
>>
>>>
>>> Basically, efficient runtime manipulation is out of scope for the dtb
>>> format - that's not what it's for.  If you're doing non-trivial
>>> manipulation you really should be unflattening, then doing your work,
>>> and if necessary re-flattening afterwards.  Unfortunately, I think the
>>> fact you can manipulate while still in flattened format (and libfdt
>>> even makes it pretty easy to write code to do so) has meant a bunch of
>>> projects have postponed going to an unflattening model rather past the
>>> point they should have.
>>>
>>>> I also am not happy that labels which were purely source level
>>>> convenience are now part of the ABI with overlays>
>>> Yeah :/.  I keep harping on it, but overlays really are a hack.  I
>>> think fleshing out the "connectors" approach that has been suggested
>>> is really a better approach than trying to make the hack less hacky.
>>
>> Two topics:
>>
>> (1) This maybe means that we need to have a connectors architecture
>> before finalizing any FDT changes, to ensure that the FDT contains
>> everything that connectors require.
> 
> I've said this many times. Connectors are not going to solve every
> overlay usecase. A simple example is I want an overlay to change
> "status" in a node from disabled to enabled or vice-versa.

Yes, agreed that connectors are not sufficient.


>> (2) I don't see the nodes __symbols__, __fixups__, and __local_fixups__ as
>> ABI, even though they are in use in the wild.
>>
>> I see them as an experimental implementation to provide a solution to
>> a problem space.  I feel that this implementation should continue to
>> exist, but in a deprecated fashion, for quite a while for the current
>> users.
>>
>> I suspect this is the will be a controversial position, but I am
>> strongly leaning in this direction, especially for the Linux
>> implementation.
> 
> If you maintain the deprecated ABI then you aren't breaking anything
> with adding a new ABI. As far as I'm aware, there aren't any upstream
> overlays. Certainly not in the kernel tree, but I'd count bootloader
> repos too. However, we don't want to encourage or force overlays to
> stay downstream and block upstreaming them simply because we might
> change the ABI. A new ABI sooner rather than later will save us some
> pain.

Note that I will not be suggesting any changes to what the overlay
devicetree source looks like (assuming that no overlay metadata is
hand coded), only changing the format of the overlay metadata that
is generated by the dtc compiler and stored in the FDT.


> Also, as long as we only support bootloaders applying overlays and not
> the kernel, I'd argue there is no ABI between the base dt and
> overlays. The ABI exists where the base dt and overlays are stored in
> different places.
> 
> Rob
> 
