From: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] devicetree: new FDT format version
Date: Wed, 24 Jan 2018 16:27:05 -0600
Message-ID: <CANk1AXQSizYobfxqdMeAx7EPV40PbLLAhApGDjkmg7SZb+K9_Q@mail.gmail.com>
References: <b96829f9-2e8b-fdc5-5090-58591e2260cf@gmail.com>
 <CAL_JsqJR2y7bMw_-9TBAGWZ_kf7_sZo5qvqvRowJ8jiy=4G0Bg@mail.gmail.com>
 <20180123124232.GA14832@umbus> <20328477-e511-e875-7dc4-253640f2219e@gmail.com>
 <CAL_Jsq+fvFrGhqO0zbEUE_i23FkU=G4Z1-e0vnXHi4KbS2oK0A@mail.gmail.com> <e1bec77d-4dac-200b-34be-23573bf738f0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e1bec77d-4dac-200b-34be-23573bf738f0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "Pantelis Antomarek.vasut-Re5JQEeQqe/2sr8fMPgRzw@public.gmane.org" <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Kyle Evans <kevans-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 24, 2018 at 3:16 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>>>>> - Allow applying overlays by just appending to the blob. The need for
>>>>> this is somewhat gone now that libfdt can just fully apply overlays.
>>>>
>>>> I'm not really sure what you want here.  I mean you could easily allow
>>>> the format to allow multiple appended overlays, and define that to
>>>> mean the overlaid result.  At some point *something* is going to have
>>>> to really do the application, so I'm not sure that it really buys you
>>>> that much.  It also makes nearly every operation on the tree in libfdt
>>>> horrible to implement, at least within the other constraints the
>>>> interface was designed around; you'll continually have to scan the
>>>> entire tree just in case some other overlay fragment has some bearing
>>>> on the thing you're looking at.  It confuses the interface too: what
>>>> does "node offset" mean if the same node could be built up from
>>>> overlay fragments at multiple offsets.
>>
>> The idea was to avoid applying overlays to flattened trees at all.
>> You're just passing the problem to the next stage (typically the
>> kernel). But we have applying overlays to flattened trees now, so
>> maybe there's no need anymore.
>>
>>> Somewhat echoing David's comment, I'm also not sure what you mean.
>>> And trying to not overly influence this conversation with preconceptions
>>> from what I'm going to propose.
>>>
>>> My first shot at the new format added a field to the FDT to indicate
>>> that an overlay FDT was concatenated to the FDT (and the overlay FDT
>>> in turn could set it's field to concatenate another overlay FDT).
>>
>> Yes, something like this is what I meant. This was something Grant had
>> talked about.
>>
>>> But in the end I decided that information belonged outside the FDT,
>>> and it was sufficient to require that all FDTs be padded out so that
>>> if an overlay FDT was concatenated to the FDT, the overlay FDT would
>>> be properly aligned.
>>
>> I can't think of why this wouldn't work either.
>>
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

One normal FPGA use case is where the bootloader programs the FPGA
with a static image.  Chained FDT blobs could simplify things for the
bootloader in that case.  The bootloader could attempt to program the
FPGA and if it succeeds, concatenate a FDT blob to the end of the
original FDT to add the devices that were programmed into the FPGA.
That's nice since the bootloader would just need the FPGA image and an
accompanying blob without having to parse or know anything about
either.  That's assuming the use case where the bootloader does not
have to do any bringup of the hardware in the FPGA, just program it
and leave it for the OS to use as normal (non-FPGA) hardware.

Alan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
