From: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/5] firmware: Add coreboot device tree binding documentation
Date: Fri, 24 Mar 2017 12:33:34 -0700
Message-ID: <CAODwPW-GHWBmYeX-XkpO1sxk=JXfPaijoLEoKxuiBHHS3LTBXg@mail.gmail.com>
References: <1490303069-13230-1-git-send-email-thierry.escande@collabora.com>
 <1490303069-13230-5-git-send-email-thierry.escande@collabora.com>
 <20170324122146.GE22771@leverpostej> <20170324175727.GB119093@google.com> <CAODwPW94vsaWF8+DrLduWhHpbBvdvynbDocXCv2ekZH178BHjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAODwPW94vsaWF8+DrLduWhHpbBvdvynbDocXCv2ekZH178BHjQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Escande <thierry.escande-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

...and again in plaintext, sorry about that.

On Fri, Mar 24, 2017 at 12:32 PM, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> > Devicetree bindings should be in vendor,prefix format. This doesn't
>> > represent every aspect of coreboot, so it needs a more descriptive
>> > string.
>>
>> Any particular suggestion? I suppose this is Google's interpretation of
>> coreboot tables, so "google,coreboot"?
>
>
> No. This binding is for the coreboot project in general and has nothing to
> do with Google. coreboot is both the vendor and the product, so I think
> "coreboot" would look better than "coreboot,coreboot". And yes, it is
> supposed to represent every aspect of coreboot (right now the "coreboot
> tables" are already sort of a catch-all data structure used by coreboot to
> pass on any sort of info it wants later stages to know... and if we ever
> have any additional things we'd like to pass on, we'd probably want to add
> them to this binding as well).
>
>>
>> > > + - reg: Address and length of the following two memory regions, in
>> > > order:
>> > > +   1.) The coreboot table. This is a list of variable-sized
>> > > descriptors
>> > > +   that contain various compile- and run-time generated firmware
>> > > +   parameters. It is identified by the magic string "LBIO" in its
>> > > first
>> > > +   four bytes.
>> > > +   See coreboot's src/commonlib/include/commonlib/coreboot_tables.h
>> > > for
>> > > +   details.
>> >
>> > Given this is a memory region, it should be described under the
>> > reserved-memory node.
>>
>> We've painted this bikeshed before. I guess the result was either to use
>> /reserved-memory or /memreserve/. I believe we've been using
>> /memreserve/. I suppose we could document a method to use either, but
>> the main "agreement" was to use the /firmware/coreboot path instead of
>> /reserved-memory/coreboot.
>
>
> See the old thread Brian linked for some arguments for and against this. I
> think particularly because we want this node to represent every aspect of
> coreboot (which I think makes more sense than spreading stuff all over the
> place), treating it as reserved memory would not work well if we might later
> add other fields.
>
> Also, since we didn't get any more responses the last time we tried to
> upstream this and had schedules to keep, we had to go ahead with what we
> had. So right now there are already millions of devices shipped with this
> binding in firmware, and the only question we still have left to decide is
> whether Linux wants to support them upstream or not.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
