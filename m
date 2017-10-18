From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [Ksummit-discuss] Devicetree Workshop at Kernel Summit Prague (26
 Oct 2017)
Date: Wed, 18 Oct 2017 15:21:40 +0200
Message-ID: <CAMuHMdXhQQpnQEgOu92MVNd=m2FvkqD9XcYS3rMVMHpB2zY0Qw@mail.gmail.com>
References: <CACxGe6sxKzNKZbdGA-G=Th2oHwuanyC2kGYuaFcKbSRkuhep+Q@mail.gmail.com>
 <20171017114823.58476908@bbrezillon> <CACxGe6tPQxwzN14TZtgNhw7OOuePLJxODrn-_b4gMDGzAFEf1Q@mail.gmail.com>
 <1508257276.74236.38.camel@freebsd.org> <2D4E6B6D-8F07-46D0-BB36-D97916802893@linaro.org>
 <CAMuHMdW-=-CdnD5Eb_w7fc7=c64i+bu=yv9_c0cj3UM940d8EA@mail.gmail.com>
 <ECADFF3FD767C149AD96A924E7EA6EAF3E64B904@USCULXMSG01.am.sony.com>
 <CACxGe6s8CbzRY7L1znq-nQ52eHp3pOu4X3pCX35ocQShnA_Ecw@mail.gmail.com>
 <B7292660-D602-473E-9B47-CF7B4D2449D7@antoniou-consulting.com> <20171018131809.q5nccysb2j7lu4bn@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171018131809.q5nccysb2j7lu4bn-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Ian Lepore <ian-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Bird, Timothy" <Tim.Bird-7U/KSKJipcs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Alexandre,

On Wed, Oct 18, 2017 at 3:18 PM, Alexandre Belloni
<alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On 18/10/2017 at 15:59:00 +0300, Pantelis Antoniou wrote:
>> > On Oct 18, 2017, at 15:14 , Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
>> > On Tue, Oct 17, 2017 at 8:03 PM, Bird, Timothy <Tim.Bird-7U/KSKJipcs@public.gmane.org> wro=
te:
>> >>> -----Original Message-----
>> >>> From Geert Uytterhoeven on Tuesday, October 17, 2017 10:24 AM
>> >>> On Tue, Oct 17, 2017 at 7:02 PM, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> =
wrote:
>> >>>> I think this also gets to having bindings described in a structured=
 way so
>> >>> they can be utilized for validation of dts files.  We are doing a li=
ttle of this in
>> >>> Zephyr since we are using a structured binding spec to generate code=
 from
>> >>> .dts (since we don=E2=80=99t utilize a runtime dtb).
>> >>>
>> >>> So you are basically generating board files from .dts?
>> >>> (closing the loop ;-)
>> >>
>> >> I think we ought to do this on Linux, as a size optimization.
>> >> -- Tim
>> >>
>> >> P.S.  I think I'll leave it ambiguous whether this was meant as a jok=
e or not. :-)
>>
>> As crazy that sounds it is possible using the YAML bindings, i.e. C stru=
cture definitions
>> and fill-up from DT automatically. Whether this is a good idea it=E2=80=
=99s another question :)
>
> But that doesn't work with any driver parsing custom properties (using
> of_property_read_* and the likes). I would very much like to see what
> are the boot time improvements when doing that ;)

Unless you override of_property_read_*() to work on the dense C structures
instead?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
