From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] devicetree: new FDT format version
Date: Fri, 26 Jan 2018 14:08:08 -0800
Message-ID: <83008da0-7383-ba2d-a239-e11ad7d1327d@gmail.com>
References: <b96829f9-2e8b-fdc5-5090-58591e2260cf@gmail.com>
 <CAL_JsqJR2y7bMw_-9TBAGWZ_kf7_sZo5qvqvRowJ8jiy=4G0Bg@mail.gmail.com>
 <20180123124232.GA14832@umbus>
 <20328477-e511-e875-7dc4-253640f2219e@gmail.com>
 <CAL_Jsq+fvFrGhqO0zbEUE_i23FkU=G4Z1-e0vnXHi4KbS2oK0A@mail.gmail.com>
 <e1bec77d-4dac-200b-34be-23573bf738f0@gmail.com>
 <e986435b-481b-2629-7600-10d9e21ac58e@gmail.com>
 <20180125122912.GB2099@umbus>
 <CAMuHMdV0jdj90uzqMx_wtvz=-KaagJG2_UQTm1DW3gzt6cNG6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdV0jdj90uzqMx_wtvz=-KaagJG2_UQTm1DW3gzt6cNG6A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "Pantelis Antomarek.vasut-Re5JQEeQqe/2sr8fMPgRzw@public.gmane.org" <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, =?UTF-8?Q?Marek_Va=c5=a1ut?= <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/26/18 00:56, Geert Uytterhoeven wrote:
> On Thu, Jan 25, 2018 at 1:29 PM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> On Wed, Jan 24, 2018 at 04:22:15PM -0800, Frank Rowand wrote:
>>> On 01/24/18 13:16, Frank Rowand wrote:
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
>>
>> Either fully applying the overlay in flattened form, or (even
> 
> Applying the overlays in flattened form sounds like a good idea to me.

I'm having trouble envisioning what "apply an overlay in flattened form"
means.

I'll provide a simple example to illustrate.

  - Base devicetree contains one non-root node which contains one property.
  - Overlay devicetree adds one property to that same node.

The before and after dt_struct block of the FDTs would contain (vastly
simplified, ignoring tags, not notating nesting of nodes, ignoring
root node, etc):

(1) base FDT dt_struct:
  [node1] [prop1 value length] [prop1 name offset] [prop1 value]

(2) overlay FDT dt_struct:
  [fragment 1 node] [__overlay__ node (for node1)] [prop2 value length] [prop2 name offset] [prop2 value]

(3) resulting FDT after applying overlay to base:

  [node1] [prop1 value length] [prop1 name offset] [prop1 value] [prop2 value length] [prop2 name offset] [prop2 value]

  - dt_string block updated to add the string for prop2 name (if not already in block)
  - prop2 name offset updated for offset in updated dt_string block

Is creating (3) from (1) and (2) what is meant by "apply an overlay
in flattened form"?

Getting from (1) and (2) to (3) does not look trivial.  Am I missing
something?

-Frank

> It still adds complexity, but handling multiple overlays can be done by a
> simple iteration, not recursion.
> The end result will always consume less memory, and will thus fit in the
> original block of memory allocated for base FDT and overlay FDTs, unless
> the base FDT and overlay FDTs are in FLASH (this assumes chaining really
> means appending, not using an external chaining mechanism).
> 
>> temporarily) unflattening the tree are better solutions.
> 
> Temporary unflattening sounds like a waste to me: it must be redone again
> later anyway. Applying the FDT overlays early on will make that later step
> simpler (no more overlays to handle).
> So if you need information from an FDT, you can help later steps by
> applying the FDT overlays right away.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
