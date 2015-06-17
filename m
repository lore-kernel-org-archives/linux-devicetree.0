From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 6/6] ARM: sun8i: dts: Add Ippo-q8h v1.2 with A33 and 1024x600 lcd support
Date: Wed, 17 Jun 2015 10:26:41 +0300
Message-ID: <2DF00B69-6D3B-4D64-A19D-2B23A2A40439@konsulko.com>
References: <1432997706-20172-1-git-send-email-hdegoede@redhat.com> <1432997706-20172-7-git-send-email-hdegoede@redhat.com> <20150602081459.GO23777@lukather> <556D6955.8030708@redhat.com> <20150603094535.GI23777@lukather> <556EE104.3090803@redhat.com> <20150613135002.GP19653@lukather> <85E62D2D-5387-433B-A944-7F2145459F08@konsulko.com> <20150616175512.GJ11732@lukather> <D4216F2D-0556-4849-B1DF-8E4D250006B4@konsulko.com> <55811F94.3080608@redhat.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55811F94.3080608-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Hans,

> On Jun 17, 2015, at 10:19 , Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote=
:
>=20
> Hi,
>=20
> On 16-06-15 21:33, Pantelis Antoniou wrote:
>> Hi Maxime,
>>=20
>>> On Jun 16, 2015, at 20:55 , Maxime Ripard <maxime.ripard@free-elect=
rons.com> wrote:
>>>=20
>>> Hi Pantelis,
>>>=20
>>> On Sun, Jun 14, 2015 at 09:16:21PM +0300, Pantelis Antoniou wrote:
>>>>> I think we need to discuss this with Pantelis and what is his fee=
ling
>>>>> about this.
>>>>>=20
>>>>> Pantelis, to sum things up, we have a case of a tablet that comes=
 with
>>>>> the exact same board, but coming in two flavours with two differe=
nts
>>>>> screen resolutions. It looks like a great case for your DT quirks
>>>>> work, but we have no way of runtime detecting the difference betw=
een
>>>>> the two variants. What do you think about this? Should we go with
>>>>> using the DT quirks or is this simply out of scope?
>>>>>=20
>>>>> There's not so much example of similar cases in the kernel, and n=
one
>>>>> of them use quirks so far (obviously) but they all boil down to e=
ither
>>>>> the solution you were suggesting in that patch or adding the alte=
rnate
>>>>> configuration as a comment.
>>>>>=20
>>>>> I don't think the latter would work for you, and I agree with tha=
t, so
>>>>> I guess that depending on what Pantelis says, either we go with a
>>>>> better solution using the quirks, or we end up using what you
>>>>> suggested (with a nitpick though, I'd prefer if you used the disp=
lay
>>>>> standard instead of the resolution, which would make it xga I gue=
ss?)
>>>>>=20
>>>>=20
>>>> First of all, the quirks interface is at an RFC stage (new name
>>>> suggested is =E2=80=98variants=E2=80=99); getting that out of the =
way this seems
>>>> like what it is designed to do.
>>>>=20
>>>> The idea of the DT quirks is to drastically cut down on the number
>>>> of different DTs required, each different for each board with minu=
te
>>>> differences from one another.
>>>=20
>>> We're on the same page then :)
>>>=20
>>=20
>> Heh :)
>>=20
>>>> In your case you have boards that have no way to be probed about
>>>> what they =E2=80=98are=E2=80=99, but that=E2=80=99s no big problem=
=2E You can easily pass the
>>>> board variant in the kernel command line and use that to select th=
e
>>>> quirk to apply.
>>>=20
>>> Hans actually pointed out that this would just move the logic
>>> somewhere else, but not remove it. In our case, that would mean U-B=
oot
>>> (Hans being the U-Boot maintainer for the SoCs that are used in thi=
s
>>> particular board).
>>>=20
>>> That would still require us to have a different configuration and t=
o
>>> add some logic to pass that extra parameter to the kernel. I'd be g=
lad
>>> to have less stuff in the kernel, but I can understand that he does=
n't
>>> want more stuff either.
>>>=20
>>=20
>> Well, I don=E2=80=99t know the specifics of your board, but if you h=
ave a configuration
>> subset that works for all the boards and makes it at least possible =
to load
>> a kernel (i.e. ram, serial, storage) you can keep a single bootloade=
r that=E2=80=99s not
>> full featured, but at least can boot any kind of variant.
>>=20
>> Afterwards you can just update the bootargs variable to the correct =
one for
>> a given board.
>=20
> We're talking about tablets here and uboot supports the lcd, as that =
is the only
> way to show errors loading the kernel / show a boot menu, etc.
>=20

I see.

> Show u-boot will know which lcd is present (by the user having flashe=
d
> the right u-boot binary for his model or so we hope). So I really thi=
nk
> that this is something which u-boot should pass along in our case.
>=20
> Talking about how this will all work in the future would it be possib=
le
> for u-boot to pass this info via devicetree rather then the kernel co=
mmandline?
>=20

You can already pass it. There=E2=80=99s a compatible property on root =
in each DT blob.
It=E2=80=99s a string property list that goes from most specific to lea=
st specific.

You can always tack a most specific compatible in front and that=E2=80=99=
s what the
quirks/variant can pick to apply changes.=20

I would try to ask Grant or Rob about what they think too however.

> In general we try not to mangle the cmdline in u-boot, while otoh we =
already
> patch plenty of stuff into the dtb like memory size and such :)
>=20

=46WIW if you pass a cmdline you already mangle the DT, since it is put=
 in the
chosen node as such.

So there=E2=80=99s mangling already you just got to decide where and wh=
at to mangle. :)

> Regards,
>=20
> Hans

Regards

=E2=80=94 Pantelis--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
