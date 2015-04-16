From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: root node serial-number property documentation
Date: Thu, 16 Apr 2015 13:54:25 -0500
Message-ID: <B1128C28-AC17-47F6-A64A-FD3197112751@codeaurora.org>
References: <1427564371-26039-1-git-send-email-contact@paulk.fr> <f6f4f862c78fa626e7f94bde51eec5b1@agner.ch> <1429175421.2483.1.camel@collins> <CAL_JsqKdHQZL5Z6hKgquKihFykX0ZiCDQfeHOfOZWOh2NMg4Rw@mail.gmail.com> <CFEF8F54-7A3E-482C-B295-6A6BC5D837C8@codeaurora.org> <1429199145.2563.9.camel@collins> <F4D05489-ACF0-44BB-AEC7-7E8FB83FAE4C@codeaurora.org> <1429208077.2563.14.camel@collins>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429208077.2563.14.camel@collins>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> On Apr 16, 2015, at 1:14 PM, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org> wro=
te:
>=20
> Le jeudi 16 avril 2015 =C3=A0 10:53 -0500, Kumar Gala a =C3=A9crit :
>>> On Apr 16, 2015, at 10:45 AM, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org> =
wrote:
>>>=20
>>> Le jeudi 16 avril 2015 =C3=A0 10:23 -0500, Kumar Gala a =C3=A9crit =
:
>>>>> On Apr 16, 2015, at 9:36 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>>>>>=20
>>>>> On Thu, Apr 16, 2015 at 4:10 AM, Paul Kocialkowski <contact@paulk=
=2Efr> wrote:
>>>>>> Le jeudi 16 avril 2015 =C3=A0 09:56 +0200, Stefan Agner a =C3=A9=
crit :
>>>>>>> On 2015-03-28 18:39, Paul Kocialkowski wrote:
>>>>>>>> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
>>>>>>>=20
>>>>>>> I think this is a worthwhile standardization.
>>>>>>>=20
>>>>>>> Acked-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>>>>>>=20
>>>>>> Thanks! I should also add a commit message in v2 mentioning that=
 this is
>>>>>> already used in open firmware and reported by lshw.
>>>>>=20
>>>>> With that,
>>>>>=20
>>>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>=20
>>> [snip]
>>>=20
>>>> I feel like this is a little lite either in the doc or commit mess=
age.
>>>> Is the string completely arbitrary?  Is it meant to match labeling=
 on
>>>> a board or case?  Is this meant to be used by the kernel at all?
>>>=20
>>> I guess it doesn't really matter what it is, as long as it's a stri=
ng.
>>> The kernel does not suggest any use for it either, it's just made
>>> available to userspace through cpuinfo.
>>>=20
>>> Now if there is a particular use for this in user-space, it would h=
ave
>>> to match some standards. For instance, it Android, ro.serialno is
>>> usually a 16-bytes (plus one null byte) representation of a 64 bit
>>> number. For USB, I recall it is usually a 32 bytes string (includin=
g the
>>> null byte), but may be extended to more.
>>>=20
>>> What the string actually represents depends and some SOCs have seri=
al
>>> number bytes (I know that omap and sunxi have some for instance, th=
at
>>> are usually used) while other devices may take it from somewhere el=
se.
>>> In any case, it doesn't really matter and is not up to the kernel a=
nyway
>>> since it is just passed through from the bootloader.
>>>=20
>>> Thus, I don't think it's very relevant to mention it in either the
>>> documentation or the commit message.
>>=20
>> So you say =E2=80=98board=E2=80=99 in the patch, since it could be S=
oC specific, we
>> should probably clean up the wording a bit.
>=20
> It really doesn't matter where the string comes from, what it contain=
s
> or whether some SoCs have provisions to generate one.
> I think board is one the most common words that we can use to describ=
e
> devices. "devices" is also fine, I could go with it if you prefer, bu=
t I
> don't really see what it changes.

Lets go with device instead of board.

>=20
>> I=E2=80=99m just saying when someone reads this 6 months or a year l=
ater and
>> tries to figure out what the purpose of the property is they don=E2=80=
=99t
>> really have enough info.  Putting some examples in the commit messag=
e
>> of what possibly usages is I think a reasonable thing.
>=20
> Okay, that would make sense. Still, the purpose of this is to pass th=
e
> serial number string from the bootloader to userspace. All of the
> discussion about where to grab the serial from and what it should loo=
k
> like is not relevant to the kernel. Instead, it's up to the bootloade=
r
> that is in charge of generating the serial string, so the discussion
> should happen there.

Again, I=E2=80=99ve got no issues with the property and its purpose to =
be used by user space, just saying we need to convey more of the intent=
 via commit message or updating the doc.

- k
--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
