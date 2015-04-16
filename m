From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: root node serial-number property documentation
Date: Thu, 16 Apr 2015 10:53:43 -0500
Message-ID: <F4D05489-ACF0-44BB-AEC7-7E8FB83FAE4C@codeaurora.org>
References: <1427564371-26039-1-git-send-email-contact@paulk.fr> <f6f4f862c78fa626e7f94bde51eec5b1@agner.ch> <1429175421.2483.1.camel@collins> <CAL_JsqKdHQZL5Z6hKgquKihFykX0ZiCDQfeHOfOZWOh2NMg4Rw@mail.gmail.com> <CFEF8F54-7A3E-482C-B295-6A6BC5D837C8@codeaurora.org> <1429199145.2563.9.camel@collins>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429199145.2563.9.camel@collins>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> On Apr 16, 2015, at 10:45 AM, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org> wr=
ote:
>=20
> Le jeudi 16 avril 2015 =C3=A0 10:23 -0500, Kumar Gala a =C3=A9crit :
>>> On Apr 16, 2015, at 9:36 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
>>>=20
>>> On Thu, Apr 16, 2015 at 4:10 AM, Paul Kocialkowski <contact@paulk.f=
r> wrote:
>>>> Le jeudi 16 avril 2015 =C3=A0 09:56 +0200, Stefan Agner a =C3=A9cr=
it :
>>>>> On 2015-03-28 18:39, Paul Kocialkowski wrote:
>>>>>> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
>>>>>=20
>>>>> I think this is a worthwhile standardization.
>>>>>=20
>>>>> Acked-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>>>>=20
>>>> Thanks! I should also add a commit message in v2 mentioning that t=
his is
>>>> already used in open firmware and reported by lshw.
>>>=20
>>> With that,
>>>=20
>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>=20
> [snip]
>=20
>> I feel like this is a little lite either in the doc or commit messag=
e.
>> Is the string completely arbitrary?  Is it meant to match labeling o=
n
>> a board or case?  Is this meant to be used by the kernel at all?
>=20
> I guess it doesn't really matter what it is, as long as it's a string=
=2E
> The kernel does not suggest any use for it either, it's just made
> available to userspace through cpuinfo.
>=20
> Now if there is a particular use for this in user-space, it would hav=
e
> to match some standards. For instance, it Android, ro.serialno is
> usually a 16-bytes (plus one null byte) representation of a 64 bit
> number. For USB, I recall it is usually a 32 bytes string (including =
the
> null byte), but may be extended to more.
>=20
> What the string actually represents depends and some SOCs have serial
> number bytes (I know that omap and sunxi have some for instance, that
> are usually used) while other devices may take it from somewhere else=
=2E
> In any case, it doesn't really matter and is not up to the kernel any=
way
> since it is just passed through from the bootloader.
>=20
> Thus, I don't think it's very relevant to mention it in either the
> documentation or the commit message.

So you say =E2=80=98board=E2=80=99 in the patch, since it could be SoC =
specific, we should probably clean up the wording a bit.  I=E2=80=99m j=
ust saying when someone reads this 6 months or a year later and tries t=
o figure out what the purpose of the property is they don=E2=80=99t rea=
lly have enough info.  Putting some examples in the commit message of w=
hat possibly usages is I think a reasonable thing.

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
