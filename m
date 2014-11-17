From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [U-Boot] [PATCH 5/6] sunxi: video: Add simplefb support
Date: Mon, 17 Nov 2014 15:01:08 +0000
Message-ID: <CACxGe6u=kQbHWpe1pFqD90viD0x2S+k0LL+T7S5LhTPmQSGy7g@mail.gmail.com>
References: <1415984088-6800-1-git-send-email-hdegoede@redhat.com>
 <1415984088-6800-6-git-send-email-hdegoede@redhat.com> <1416138607.25454.13.camel@hellion.org.uk>
 <5468AC2E.80601@redhat.com> <1416148688.25454.22.camel@hellion.org.uk>
 <5468BE9A.8050501@redhat.com> <1416154297.25454.24.camel@hellion.org.uk>
 <CACxGe6vE0BdWOrdw1iQyk2-tmdnAUZ=oQCvGg_LESoiw055DLw@mail.gmail.com> <1416219254.27385.15.camel@hellion.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416219254.27385.15.camel-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: U-Boot <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 17, 2014 at 10:14 AM, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org> wrote:
> On Mon, 2014-11-17 at 09:58 +0000, Grant Likely wrote:
>> I /DO/ want comments though. Putting the node in /chosen is
>> unconventional. I want to hear if anyone has a good reason why the
>> framebuffers shouldn't be placed into /chosen.
>
> I don't think putting it under /chosen is a problem at all. THe
> semantics of some of hte convention properties are a bit odd under
> there, but that's not insurmountable.
>
>> >> AFAIK Grant agrees with v5
>> >
>> > AFAIK Grant hasn't actually said that. If he does ack it (or if someone
>> > points me to the correct mail) then I have no further objections.
>>
>> My word also isn't gospel.
>
> I suppose I should have said something like "I trust Grant's judgement
> more than my own on things relating to DT" ;-).
>
>>  On controversial stuff I want to have
>> consensus. For the clock patches and had a long conversation with Rob
>> to make sure we were both in agreement before giving my final ack.
>>
>> > In fact it's a bit odd to have a reg property under /chosen at all,
>> > since it doesn't really fit in with the bus structure. I've done
>> > something similar in some bindings I've authored[0], but AIUI I got that
>> > wrong and really should have used a set of non-reg properties with a
>> > single value so there was no need to parse using #*-cells  (cf the
>> > initrd-start + initrd-end properties under /chosen). Sadly DT is an ABI,
>> > so for my bindings I'm kind of stuck with it for the foreseeable future.
>> >
>> > [0]
>> > http://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/device-tree/booting.txt;h=08ed7751859dbe2d2c32d86d7df371057d7b45a4;hb=HEAD
>>
>> Ironic isn't it that I though of that as precedence when I suggested
>> /chosen! :-)
>
> :-)
>
>> I actually don't have a problem with it. We do need a way to specify
>> runtime memory usage, and /chosen is as good a place as any,
>> particularly when it represents things that won't necessarily be
>> relevant on kexec or dom0 boot.
>
> The main issue which was explained to me with my Xen bindings was that
> reg = <> isn't all that meaningful under /chosen because it doesn't fit
> into the bus structure, so the #address-/size-cells stuff gets a bit
> strange. It's probably tolerable for things which are strictly physical
> RAM addresses (as opposed to mmio) since RAM isn't typically behind a
> visible bus.
>
> The scheme used for initrds sidesteps all those issues by using separate
> (multicellular) properties for the start and end regions and not using
> reg=<> and therefore naturally breaking the expected semantic link with
> bus topology which reg implies etc.

I quite dislike the initrd multi-property approach. It has to be
parsed in a completely separate way.

>> The other options are under either the /memory or the /reserved-memory
>> tree. Rob and I talked about /reserved-memory quite a lot. We could
>> put all the framebuffer details into the memory node that reserves the
>> framebuffer. However, I don't like that idea because it kind of makes
>> assumptions about how the framebuffer will be located inside the
>> memory region and doesn't allow for multiple framebuffers within a
>> single region.
>
> Yes, that sounds strictly worse than the current solution to me.

Besides, the simple-framebuffer binding could easily be extended to
allow a reserved-memory reference instead of a reg property if/when
that becomes a better option for a specific platform.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
