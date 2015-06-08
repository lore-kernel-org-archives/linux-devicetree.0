From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Duplicated device tree and Dynamic symbols
Date: Mon, 8 Jun 2015 22:16:30 +0200
Message-ID: <CAPybu_29P-Z8Ed=etTwniR5HF8+-=J9+WxqJB0tvSEAbQDruDA@mail.gmail.com>
References: <CAPybu_3CQ0vD=uj_gKwdcsQ_W7u-SRKzKDWOYaXvU83V8iYOqw@mail.gmail.com>
 <CACxGe6sRW3nrExniVH7dw23=XCqHzv73E4Km8o=5Sr+mcNe34Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6sRW3nrExniVH7dw23=XCqHzv73E4Km8o=5Sr+mcNe34Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Grant

I totally understand. every phandle is unique in every device tree,
but I have one device tree per pcie.

What happened to Dynamic Symbols support and fixup support?

If i read it right, it adds some information about the symbols so they
can be treated specially.

Regards!


On Mon, Jun 8, 2015 at 6:27 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Apr 28, 2015 at 9:16 AM, Ricardo Ribalda Delgado
> <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> Hello
>>
>> I have an X86 platform with device tree support. It has multiple pci
>> slots with a custom board that is described with a device tree.
>>
>> When the pci device is probed, the driver fetches a device tree from
>> the firmware infrastructure, patches the range property based on the
>> bar address and adds the device to the main device tree.
>>
>> This works perfectly fine with only one card, but when the second card
>> is connected: Here be dragons :)
>>
>> The main issue is that of_find_node_by_phandle always resolves to the
>> first connected card. I fixed this by creating a new function.
>> of_find_node_by_phandle_family() that chooses the closest phandle on
>> the tree, not just the first one.
>>
>> By reading the "Dynamic Symbols support and fixup support"
>> here:
>> http://events.linuxfoundation.org/sites/events/files/slides/dynamic-dt-elce14.pdf
>> and here
>> https://lwn.net/Articles/616859/
>>
>> It seemed that the patch would fix my issue and it would be already
>> merged, but I cannot find the patch here
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git
>> or here
>> https://git.kernel.org/cgit/linux/kernel/git/jdl/dtc.git
>>
>> So I am wondering some stuff:
>>
>> Would a patch adding my of_find_node_by_phandle_family() would be accepted.?
>
> No, phandles must be unique. That's what phandles are; unique identifiers. :-)
>
> g.



-- 
Ricardo Ribalda
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
