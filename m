From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 0/7] MIPS: Move device-tree files to a common location
Date: Mon, 25 Aug 2014 17:26:07 +0200
Message-ID: <CAMuHMdUDt+YOe=aEn9cA0a9pZL48DfnMRDM+2Ks-n7L8k-18Dg@mail.gmail.com>
References: <1408651466-8334-1-git-send-email-abrestic@chromium.org>
	<CAGVrzcZobuL4z0WNX+Sz4p_uwaPL-S5yvEmgRUwZPJi4+qq0tg@mail.gmail.com>
	<CAL1qeaGb-o0P7x4nZPJ+dGfoSKz+2ANrB0gGrBi19TtPxVTAZQ@mail.gmail.com>
	<20140823063113.GC23715@localhost>
	<CAMuHMdXudu0kuOkKN8JCrWZSrQ4awKHhHU0E2ss++ProP0rteQ@mail.gmail.com>
	<CAOiHx=mZPt=p_jw4fyEqgniJvqunQ86ro_Run5ZtD1zLYWzmqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOiHx=mZPt=p_jw4fyEqgniJvqunQ86ro_Run5ZtD1zLYWzmqA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Qais Yousef <qais.yousef-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 25, 2014 at 5:17 PM, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
> On Sat, Aug 23, 2014 at 9:50 PM, Geert Uytterhoeven
> <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
>> On Sat, Aug 23, 2014 at 8:31 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
>>>> > arch/arm/boot/dts/<vendor>/
>>>> >
>>>> > Is this something we should do for the MIPS and update the other architectures
>>>> > to follow that scheme?
>>>>
>>>> I recall reading that as well and that it would be adopted for ARM64,
>>>> but that hasn't seemed to have happened.  Perhaps Olof (CC'ed) will no
>>>> more.
>>>
>>> Yeah, I highly recommend having a directory per vendor. We didn't on ARM,
>>> and the amount of files in that directory is becoming pretty
>>> insane. Moving to a subdirectory structure later gets messy which is
>>> why we've been holding off on it.
>>
>> It would mean we can change our scripts to operate on "interesting"
>> DTS files from
>>
>>      do-something-with $(git grep -l $vendor, -- arch/arm/boot/dts)
>>
>> to
>>
>>     do-something-with arch/arm/boot/dts/$vendor/*
>>
>> which is easier to type...
>
> Btw, do you mean chip-vendor or device-vendor with vendor?
> Device-vendor could get a bit messy on the source part as the router
> manufacturers tend to switch them quite often. E.g. d-link used arm,
> mips and ubi32 chips from marvell, ubicom, broadcom, atheros, realtek
> and ralink for their dir-615 router, happily switching back and forth.
> There are 14 known different hardware revisions of it where the chip
> differed from the previous one.

That's indeed a good question, as you'll be having a *.dts for a device,
including a *.dtsi for an SoC.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
