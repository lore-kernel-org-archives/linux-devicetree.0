From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH v2 2/2] doc: dt: mtd: add a DT property to enable the use
 of 4byte-address op codes
Date: Wed, 23 Mar 2016 16:08:58 +0100
Message-ID: <56F2B18A.3020107@atmel.com>
References: <cover.1458657802.git.cyrille.pitchen@atmel.com>
 <b6dff3f629497025be74207227b94807b64e0e9c.1458657802.git.cyrille.pitchen@atmel.com>
 <CAL_JsqKUMhPwxrhz50D8+UAaVPT_+=xJLm6A6fVy6RgpyOnq8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKUMhPwxrhz50D8+UAaVPT_+=xJLm6A6fVy6RgpyOnq8w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, boris brezillon <boris.brezillon@free-electrons.com>, =?UTF-8?Q?Marek_Va=c5=a1ut?= <marex@denx.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

sorry I've sent v3 at the same time as you answered to v2.
I'll take your comments into account for v4.

Brian, any preference between 4byte-opcodes or m25p-4byte-opcodes?

Best regards,

Cyrille

Le 23/03/2016 13:49, Rob Herring a =C3=A9crit :
> On Tue, Mar 22, 2016 at 10:13 AM, Cyrille Pitchen
> <cyrille.pitchen@atmel.com> wrote:
>> This patch adds a new optional DT property which enables an alternat=
ive
>> way of supporting memory size above 16MiB (128Mib). This new mechani=
sm
>> translates the regular 3byte-address op codes into their 4byte-addre=
ss
>> version whereas the old/default mecanism makes the SPI memory enter =
its
>> 4byte-address mode, which has annoying side effects for early bootlo=
aders.
>>
>> We cannot discover at run time whether the SPI NOR memory supports t=
he
>> 4byte-address op codes. For instance both Macronix MX25L25635E and
>> MX25L25673G share the same JEDEC ID (C22019 without any extension by=
te).
>> However the first one doesn't support 4byte-address op codes whereas=
 the
>> second one does.
>>
>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>> ---
>>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 11 ++++++=
+++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt=
 b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>> index 2c91c03e7eb0..8be610482089 100644
>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>> @@ -66,6 +66,17 @@ Optional properties:
>>                     Refer to your chips' datasheet to check if this =
is supported
>>                     by your chip.
>>
>> +- m25p,4byte-opcodes: For memory size above 16MiB (128Mib), use the=
 dedicated
>=20
> m25p is not a vendor. So drop it or m25p-4byte-opcodes.
>=20
>> +                      4byte-address opcodes instead of entering the=
 4byte
>> +                      address mode. This mode changes the internal =
state of the
>> +                      chip so may conflict with some early boot loa=
ders, which
>> +                      expect to use the regular (Fast) Read opcodes=
 with 3byte
>> +                      address.
>> +                      However 4byte-address opcodes are not support=
ed by all
>> +                      chips and support for them can not be detecte=
d at runtime.
>=20
> s/can not/cannot/
>=20
>> +                      Refer to you chip's datasheet to check if thi=
s is
>> +                      supported by your chip.
>> +
>>  Example:
>>
>>         flash: m25p80@0 {
>> --
>> 1.8.2.2
>>
