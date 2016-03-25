From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] doc: dt: mtd: add a DT property to enable the use
 of 4byte-address op codes
Date: Fri, 25 Mar 2016 15:44:34 +0100
Message-ID: <56F54ED2.3030609@atmel.com>
References: <cover.1458657802.git.cyrille.pitchen@atmel.com>
 <b6dff3f629497025be74207227b94807b64e0e9c.1458657802.git.cyrille.pitchen@atmel.com>
 <CAL_JsqKUMhPwxrhz50D8+UAaVPT_+=xJLm6A6fVy6RgpyOnq8w@mail.gmail.com>
 <56F2B18A.3020107@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56F2B18A.3020107-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, boris brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?Q?Marek_Va=c5=a1ut?= <marex-ynQEQJNshbs@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

Since the framework is named spi-nor, what about spi-nor-4byte-opcodes?
Is it okay for everyone?

It would follow the same pattern as spi-max-frequency which applies to =
all SPI
devices.

Best regards,

Cyrille

Le 23/03/2016 16:08, Cyrille Pitchen a =C3=A9crit :
> Hi Rob,
>=20
> sorry I've sent v3 at the same time as you answered to v2.
> I'll take your comments into account for v4.
>=20
> Brian, any preference between 4byte-opcodes or m25p-4byte-opcodes?
>=20
> Best regards,
>=20
> Cyrille
>=20
> Le 23/03/2016 13:49, Rob Herring a =C3=A9crit :
>> On Tue, Mar 22, 2016 at 10:13 AM, Cyrille Pitchen
>> <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:
>>> This patch adds a new optional DT property which enables an alterna=
tive
>>> way of supporting memory size above 16MiB (128Mib). This new mechan=
ism
>>> translates the regular 3byte-address op codes into their 4byte-addr=
ess
>>> version whereas the old/default mecanism makes the SPI memory enter=
 its
>>> 4byte-address mode, which has annoying side effects for early bootl=
oaders.
>>>
>>> We cannot discover at run time whether the SPI NOR memory supports =
the
>>> 4byte-address op codes. For instance both Macronix MX25L25635E and
>>> MX25L25673G share the same JEDEC ID (C22019 without any extension b=
yte).
>>> However the first one doesn't support 4byte-address op codes wherea=
s the
>>> second one does.
>>>
>>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 11 +++++=
++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.tx=
t b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>>> index 2c91c03e7eb0..8be610482089 100644
>>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>>> @@ -66,6 +66,17 @@ Optional properties:
>>>                     Refer to your chips' datasheet to check if this=
 is supported
>>>                     by your chip.
>>>
>>> +- m25p,4byte-opcodes: For memory size above 16MiB (128Mib), use th=
e dedicated
>>
>> m25p is not a vendor. So drop it or m25p-4byte-opcodes.
>>
>>> +                      4byte-address opcodes instead of entering th=
e 4byte
>>> +                      address mode. This mode changes the internal=
 state of the
>>> +                      chip so may conflict with some early boot lo=
aders, which
>>> +                      expect to use the regular (Fast) Read opcode=
s with 3byte
>>> +                      address.
>>> +                      However 4byte-address opcodes are not suppor=
ted by all
>>> +                      chips and support for them can not be detect=
ed at runtime.
>>
>> s/can not/cannot/
>>
>>> +                      Refer to you chip's datasheet to check if th=
is is
>>> +                      supported by your chip.
>>> +
>>>  Example:
>>>
>>>         flash: m25p80@0 {
>>> --
>>> 1.8.2.2
>>>
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
