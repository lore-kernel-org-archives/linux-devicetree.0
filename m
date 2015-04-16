From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: root node serial-number property documentation
Date: Thu, 16 Apr 2015 10:23:08 -0500
Message-ID: <CFEF8F54-7A3E-482C-B295-6A6BC5D837C8@codeaurora.org>
References: <1427564371-26039-1-git-send-email-contact@paulk.fr> <f6f4f862c78fa626e7f94bde51eec5b1@agner.ch> <1429175421.2483.1.camel@collins> <CAL_JsqKdHQZL5Z6hKgquKihFykX0ZiCDQfeHOfOZWOh2NMg4Rw@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKdHQZL5Z6hKgquKihFykX0ZiCDQfeHOfOZWOh2NMg4Rw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> On Apr 16, 2015, at 9:36 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
>=20
> On Thu, Apr 16, 2015 at 4:10 AM, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>=
 wrote:
>> Le jeudi 16 avril 2015 =C3=A0 09:56 +0200, Stefan Agner a =C3=A9crit=
 :
>>> On 2015-03-28 18:39, Paul Kocialkowski wrote:
>>>> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
>>>=20
>>> I think this is a worthwhile standardization.
>>>=20
>>> Acked-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>>=20
>> Thanks! I should also add a commit message in v2 mentioning that thi=
s is
>> already used in open firmware and reported by lshw.
>=20
> With that,
>=20
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>=20
>>=20
>>>> ---
>>>> Documentation/devicetree/booting-without-of.txt | 4 ++++
>>>> 1 file changed, 4 insertions(+)
>>>>=20
>>>> diff --git a/Documentation/devicetree/booting-without-of.txt
>>>> b/Documentation/devicetree/booting-without-of.txt
>>>> index 7768518..8b055897 100644
>>>> --- a/Documentation/devicetree/booting-without-of.txt
>>>> +++ b/Documentation/devicetree/booting-without-of.txt
>>>> @@ -828,6 +828,10 @@ address which can extend beyond that limit.
>>>>   name may clash with standard defined ones, you prefix them with =
your
>>>>   vendor name and a comma.
>>>>=20
>>>> +  Additional properties for the root node:
>>>> +
>>>> +    - serial-number : a string representing the board's serial nu=
mber
>>>> +
>>>>   b) The /cpus node
>>>>=20
>>>>   This node is the parent of all individual CPU nodes. It doesn't
>>>=20
>>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

I feel like this is a little lite either in the doc or commit message. =
 Is the string completely arbitrary?  Is it meant to match labeling on =
a board or case?  Is this meant to be used by the kernel at all?

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
