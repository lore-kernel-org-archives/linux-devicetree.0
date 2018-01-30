From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] of: change overlay apply input data from EDT to FDT
Date: Mon, 29 Jan 2018 16:35:31 -0800
Message-ID: <d009592b-ee82-7706-29ff-2749cd0e3c20@gmail.com>
References: <1517194414-19932-1-git-send-email-frowand.list@gmail.com>
 <CAMuHMdWrhgvLv6syjFxfN42ah7pkO9Ye9SJYDTCwRMQCFrJAeg@mail.gmail.com>
 <df065acc-2479-2513-ac3d-63d065d2ffa1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <df065acc-2479-2513-ac3d-63d065d2ffa1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Alan,

In this patch series one of the changes was to change some
devicetree unittest overlay source to use the new sugar syntax to
specify overlay nodes instead of hand coding the fragment nodes.

One reviewer reminded me to update Documentation/ files that
show the hand coding of overlay fragment nodes.  One of those
files is Documentation/devicetree/bindings/fpga/fpga-region.txt.
I plan to submit a patch to update the example devicetree source
to use the sugar syntax.  There is one place where I can not
make that change, which is the "Overlay DTS Format" section.
In this section, the use of 'target-path="/path" is shown as
one of two ways to specify the target of the fragment.  The
sugar syntax creates a fragment using the 'target=<phandle>'
form instead of 'target-path="/path"' form.  With sugar
syntax, there is no way to specify target-path.  Is the
target-path form needed by the fpga subsystem, or can this
be removed?

-Frank

On 01/29/18 16:22, Frank Rowand wrote:
> On 01/29/18 06:08, Geert Uytterhoeven wrote:
>> Hi Frank,
>>
>> On Mon, Jan 29, 2018 at 3:53 AM,  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>>
>>> Move duplicating and unflattening of an overlay flattened devicetree
>>> (FDT) into the overlay application code.  To accomplish this,
>>> of_overlay_apply() is replaced by of_overlay_fdt_apply().
>>>
>>> The copy of the FDT (aka "duplicate FDT") now belongs to devicetree
>>> code, which is thus responsible for freeing the duplicate FDT.  The
>>> caller of of_overlay_fdt_apply() remains responsible for freeing the
>>> original FDT.
>>>
>>> The unflattened device tree (aka expanded device tree, EDT) now
>>> belongs to devicetree code, which is thus responsible for freeing
>>> the EDT.
>>>
>>> These ownership changes prevent early freeing of the duplicated FDT
>>> or the EDT, which could result in use after free errors.
>>>
>>> These changes led to migrating some unittest overlay data into
>>> their own devicetree source files, and then converting most of
>>> them to use sugar syntax instead of hand coding fragments.
>>
>> Thanks for your series!
>>
>>> Frank Rowand (2):
>>>   of: change overlay apply input data from EDT to FDT
>>>   of: convert unittest overlay devicetree source to sugar syntax
>>
>> Do you plan to update Documentation/devicetree/overlay-notes.txt
>> and Documentation/devicetree/bindings/fpga/fpga-region.txt, too?
> 
> Thanks for the pointers.
> 
> I will add updates to Documentation/devicetree/overlay-notes.txt in
> this series.
> 
> The changes to Documentation/devicetree/bindings/fpga/fpga-region.txt
> are related to the relatively new sugar syntax in dtc, not to the
> changes introduced by this patch series.  I'll create a patch outside
> this series to update this documentation.
> 
> 
>> Gr{oetje,eeting}s,
>>
>>                         Geert
>>
>> --
>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
>>
>> In personal conversations with technical people, I call myself a hacker. But
>> when I'm talking to journalists I just say "programmer" or something like that.
>>                                 -- Linus Torvalds
>>
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
