From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] devicetree: new FDT format version
Date: Mon, 29 Jan 2018 18:32:35 +0000
Message-ID: <CACxGe6tUB3NhNhOtqzoJfThx=RE1_=TSDQz+wQUm=sdE5JirZQ@mail.gmail.com>
References: <b96829f9-2e8b-fdc5-5090-58591e2260cf@gmail.com>
 <CAL_JsqJR2y7bMw_-9TBAGWZ_kf7_sZo5qvqvRowJ8jiy=4G0Bg@mail.gmail.com>
 <20180123124232.GA14832@umbus> <20328477-e511-e875-7dc4-253640f2219e@gmail.com>
 <CAL_Jsq+fvFrGhqO0zbEUE_i23FkU=G4Z1-e0vnXHi4KbS2oK0A@mail.gmail.com>
 <e1bec77d-4dac-200b-34be-23573bf738f0@gmail.com> <e986435b-481b-2629-7600-10d9e21ac58e@gmail.com>
 <20180125122912.GB2099@umbus> <72d30756-a963-92c9-1838-3e3f80c57e39@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <72d30756-a963-92c9-1838-3e3f80c57e39-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "Pantelis Antomarek.vasut-Re5JQEeQqe/2sr8fMPgRzw@public.gmane.org" <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 25, 2018 at 8:01 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 01/25/18 04:29, David Gibson wrote:
>> On Wed, Jan 24, 2018 at 04:22:15PM -0800, Frank Rowand wrote:
>>> On 01/24/18 13:16, Frank Rowand wrote:
>>>> On 01/24/18 07:47, Rob Herring wrote:
>>>>> On Tue, Jan 23, 2018 at 3:17 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>>> On 01/23/18 04:42, David Gibson wrote:
>>>>>>> On Mon, Jan 22, 2018 at 03:01:52PM -0600, Rob Herring wrote:
>>>>>>>> On Mon, Jan 22, 2018 at 2:09 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>>>>>> Hi All,
>>>>>>>>>
>>>>>>>>> I've tried to create a decent distribution list, but I'm sure I've missed
>>>>>>>>> someone or some important list.  Please share this with anyone you think
>>>>>>>>> will be affected.
>>>>>>>>>
>>>>>>>>> I have been playing around with some thoughts for some additions to
>>>>>>>>> the devicetree FDT aka blob format.
>>>>>>>>>
>>>>>>>>> I would like to get the affected parties thinking about how additions to
>>>>>>>>> the format could improve whichever pieces of FDT related technology you
>>>>>>>>> work on or care about.  In my opinion, the FDT format should change
>>>>>>>>> very infrequently because of the impact on so many projects that have
>>>>>>>>> to work together to create a final solution, plus the many many users
>>>>>>>>> of those projects.
>>>>>>>>
>>>>>>>> A few things discussed before:
>>>>>>>> - Adding type information Even just tagging phandles would be good.
>>>>>>>
>>>>>>> I'm a bit dubious about this.  It would have to be "hints" only -
>>>>>>> there's not really anyway we can put in authoritative type
>>>>>>> information, since dtc itself doesn't really know that.  It's also
>>>>>>> hard to see how that could be done in a way which wouldn't either a)
>>>>>>> require very awkward parallel lookup of the data and type information
>>>>>>> or b) not be backwards compatible (even read only).
>>>>>
>>>>> I never said it was possible. :) I'm just trying to enumerate possible
>>>>> FDT format changes because I don't think we want to continuously
>>>>> trickle out FDT changes even if they are backwards compatible.
>>>>
>>>> Yes, I'm trying to capture any pending changes in a single version change.
>>>>
>>>>
>>>>>>>> - Allow applying overlays by just appending to the blob. The need for
>>>>>>>> this is somewhat gone now that libfdt can just fully apply overlays.
>>>>>>>
>>>>>>> I'm not really sure what you want here.  I mean you could easily allow
>>>>>>> the format to allow multiple appended overlays, and define that to
>>>>>>> mean the overlaid result.  At some point *something* is going to have
>>>>>>> to really do the application, so I'm not sure that it really buys you
>>>>>>> that much.  It also makes nearly every operation on the tree in libfdt
>>>>>>> horrible to implement, at least within the other constraints the
>>>>>>> interface was designed around; you'll continually have to scan the
>>>>>>> entire tree just in case some other overlay fragment has some bearing
>>>>>>> on the thing you're looking at.  It confuses the interface too: what
>>>>>>> does "node offset" mean if the same node could be built up from
>>>>>>> overlay fragments at multiple offsets.
>>>>>
>>>>> The idea was to avoid applying overlays to flattened trees at all.
>>>>> You're just passing the problem to the next stage (typically the
>>>>> kernel). But we have applying overlays to flattened trees now, so
>>>>> maybe there's no need anymore.
>>>>>
>>>>>> Somewhat echoing David's comment, I'm also not sure what you mean.
>>>>>> And trying to not overly influence this conversation with preconceptions
>>>>>> from what I'm going to propose.
>>>>>>
>>>>>> My first shot at the new format added a field to the FDT to indicate
>>>>>> that an overlay FDT was concatenated to the FDT (and the overlay FDT
>>>>>> in turn could set it's field to concatenate another overlay FDT).
>>>>>
>>>>> Yes, something like this is what I meant. This was something Grant had
>>>>> talked about.
>>>>>
>>>>>> But in the end I decided that information belonged outside the FDT,
>>>>>> and it was sufficient to require that all FDTs be padded out so that
>>>>>> if an overlay FDT was concatenated to the FDT, the overlay FDT would
>>>>>> be properly aligned.
>>>>>
>>>>> I can't think of why this wouldn't work either.
>>>>>
>>>>>> For ease of typing, I'll call this "chaining" or "chained".  For
>>>>>> Linux, I am envisioning no kernel use of data from a chained FDT
>>>>>> until after the tree is unflattened.  I haven't done an exhaustive
>>>>>> search to determine all of the uses of data directly from the
>>>>>> flattened FDT, but I am optimistic that there will not be any such
>>>>>> access that would require data from a chained FDT (and we could
>>>>>> make this a rule).
>>>>>
>>>>> This would be a major downside to leaving it up to the kernel because
>>>>> what can't be touched is hard to enumerate and could change. For
>>>>> example, we added earlycon and now the uart node can't be modified.
>>>>
>>>> What you say makes sense.  So I'll reverse myself and say that for
>>>> Linux, we should update the FDT read code to scan all chained
>>>> overlay FDT(s) as well as the base FDT.
>>>
>>> < snip >
>>>
>>> What I wrote was somewhat ambiguous.  What I meant by "FDT read
>>> code" was functions that check for existence of nodes in the
>>> FDT or read property values from the FDT.
>>
>> Oh.. not just FDT unflattening code.
>>
>> The trouble with this is that scanning for a specific node or property
>> in a set of chained overlays is highly nontrivial.  Even if you set
>> aside the arguably self-imposed design constraints in libfdt, you
>> can't just do the same lookup in each fragment: along the way you need
>> to resolve the path at which each fragment applies.  That in itself is
>> non-trivial.  If you have overlays applying on top of other overlays,
>> that could involve recursive lookups of things from previous overlays.
>> It's spectacularly complicated and we have to do it on *every single*
>> read operation.
>
> I totally overlooked having to resolve each fragment.  You are right,
> that makes the problem very complex instead of trivial.

It would be possible to do if each fragment was pre-resolved at append
time to the node that it modifies. ie. each fragment node points back
with an offset to the node it modifies Then searching the tree could
be done by walking backwards through the fragments instead of
searching forwards. Would need to research the best way to do that,
and it would also mean that merely appending a DTB fragment isn't an
option.

g.
