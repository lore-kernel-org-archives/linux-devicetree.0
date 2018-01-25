From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] devicetree: new FDT format version
Date: Thu, 25 Jan 2018 15:11:32 -0800
Message-ID: <22573814-d4a7-4458-221c-589cb859e780@gmail.com>
References: <b96829f9-2e8b-fdc5-5090-58591e2260cf@gmail.com>
 <CAL_JsqJR2y7bMw_-9TBAGWZ_kf7_sZo5qvqvRowJ8jiy=4G0Bg@mail.gmail.com>
 <20180123124232.GA14832@umbus>
 <20328477-e511-e875-7dc4-253640f2219e@gmail.com>
 <CAL_Jsq+fvFrGhqO0zbEUE_i23FkU=G4Z1-e0vnXHi4KbS2oK0A@mail.gmail.com>
 <e1bec77d-4dac-200b-34be-23573bf738f0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e1bec77d-4dac-200b-34be-23573bf738f0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "Pantelis Antomarek.vasut-Re5JQEeQqe/2sr8fMPgRzw@public.gmane.org" <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, =?UTF-8?Q?Marek_Va=c5=a1ut?= <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/24/18 13:16, Frank Rowand wrote:
> On 01/24/18 07:47, Rob Herring wrote:
>> On Tue, Jan 23, 2018 at 3:17 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> On 01/23/18 04:42, David Gibson wrote:
>>>> On Mon, Jan 22, 2018 at 03:01:52PM -0600, Rob Herring wrote:
>>>>> On Mon, Jan 22, 2018 at 2:09 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

< snip >

>>> My first shot at the new format added a field to the FDT to indicate
>>> that an overlay FDT was concatenated to the FDT (and the overlay FDT
>>> in turn could set it's field to concatenate another overlay FDT).

< snip >

>>> For ease of typing, I'll call this "chaining" or "chained".  For
>>> Linux, I am envisioning no kernel use of data from a chained FDT
>>> until after the tree is unflattened.  I haven't done an exhaustive
>>> search to determine all of the uses of data directly from the
>>> flattened FDT, but I am optimistic that there will not be any such
>>> access that would require data from a chained FDT (and we could
>>> make this a rule).
>>
>> This would be a major downside to leaving it up to the kernel because
>> what can't be touched is hard to enumerate and could change. For
>> example, we added earlycon and now the uart node can't be modified.
> 
> What you say makes sense.  So I'll reverse myself and say that for
> Linux, we should update the FDT read code to scan all chained
> overlay FDT(s) as well as the base FDT.

< snip >

And I'll reverse myself again, so full circle.

As David pointed out elsewhere, targeting overlay fragments to
their actual position in the tree makes a function that scans
the chained FDTs for a property value (as an example) very
complex.  Given that insight, I agreed with David.

With that further background, I'm back here to reconsider
devicetree data that is accessed by the kernel early in
boot, before the devicetree is unflattened.

The early boot time frame can be a difficult environment to
code within.  There are a lot of limitations to what features
and services are available.  We try to limit the amount of
code in this window to as little as possible.  Given that,
is it reasonable to assume that we won't be adding a lot
of code that accesses the devicetree before it is unflattened?
I wouldn't say zero code, but I would hope very little code.

*** I'm thinking out loud as I'm typing this, and it turns
*** out that this following paragraph is not workable,
*** so after this paragraph, I'll reject it.  So don't
*** take this paragraph as a serious proposal.
If that premise is accepted, and if we added _either_ a
specification restriction on overlays _or_ a warning or
"don't come crying to us if you need to modify your
existing base FDT and/or overlay FDT to take advantage
of a _new_ early boot feature", how does that change things?
The restriction would be something like (could take a
different form that accomplishes the same goal): the base
FDT must contain all data that is used by pre-unflatten
code and overlay FDTs must not modify that data.

And now I've wrapped myself info a tight little ball
that will not work, because detecting (and preventing)
an overlay from modifying this data is an unreasonable
amount of complexity.  The best that I could do would
be to say:  all data that is used by pre-unflatten
code must be contained in the base FDT, if an overlay
FDT modifies any of this data, the pre-unflatten
feature has the option of ignoring the changes, or
at some point after unflattening, re-reading the data
from the expanded tree.  That leaves a bad taste in
my mouth, I don't like it.  But it is a possible
compromise.

Another option would be to remove as much of the
pre-unflatten data access as possible, moving the
accesses to just after unflattening and accept
that some features just won't be available until
after unflattening.  Can we reduce this set of
data to data that is not modifiable by an overlay
(such as mem_rsvmap) or is that too constricting?

I'll continue to ponder this area...

-Frank
