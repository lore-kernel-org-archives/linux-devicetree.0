From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [RESEND PATCH 2/4] dt-bindings: add "reduced-width" property for
 Armada XP SDRAM controller
Date: Thu, 10 Aug 2017 21:17:10 +0000
Message-ID: <4935472b6a44447fa764fa811a645b9f@svr-chch-ex1.atlnz.lc>
References: <20170807014641.4003-1-chris.packham@alliedtelesis.co.nz>
 <20170807014641.4003-3-chris.packham@alliedtelesis.co.nz>
 <20170810203801.jz5hl5onqci275ef@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "gregory.clement@free-electrons.com" <gregory.clement@free-electrons.com>, "bp@alien8.de" <bp@alien8.de>, "jlu@pengutronix.de" <jlu@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 11/08/17 08:38, Rob Herring wrote:=0A=
> On Mon, Aug 07, 2017 at 01:46:39PM +1200, Chris Packham wrote:=0A=
>> Some SoC implementations that use this controller have a reduced pin=0A=
>> count so the meaning of "full" and "half" with change.=0A=
> =0A=
> s/with/width/ ?=0A=
> =0A=
=0A=
Yes will include in v2.=0A=
=0A=
>>=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>> ---=0A=
>>   .../bindings/memory-controllers/mvebu-sdram-controller.txt          | =
6 ++++++=0A=
>>   1 file changed, 6 insertions(+)=0A=
>>=0A=
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/mvebu-=
sdram-controller.txt b/Documentation/devicetree/bindings/memory-controllers=
/mvebu-sdram-controller.txt=0A=
>> index 89657d1d4cd4..3041868321c8 100644=0A=
>> --- a/Documentation/devicetree/bindings/memory-controllers/mvebu-sdram-c=
ontroller.txt=0A=
>> +++ b/Documentation/devicetree/bindings/memory-controllers/mvebu-sdram-c=
ontroller.txt=0A=
>> @@ -13,6 +13,12 @@ Required properties:=0A=
>>    - reg: a resource specifier for the register space, which should=0A=
>>      include all SDRAM controller registers as per the datasheet.=0A=
>>   =0A=
>> +Optional properties:=0A=
>> + - marvell,reduced-width: some SoCs that use this SDRAM controller have=
=0A=
>> +   a reduced pin count. On such systems "full" width is 32-bits and=0A=
>> +   "half" width is 16-bits. Set this property to indicate that the SoC=
=0A=
>> +   used is such a system.=0A=
> =0A=
> Maybe you should just state what the width is.=0A=
=0A=
=0A=
Specifying a number like 64/32/16 is done in for some other properties I =
=0A=
dismissed that because what this is about how we interpret a =0A=
pin-strapping option. I guess "max-width =3D <64>;" and "max-width =3D =0A=
<32>"; would achieve the same.=0A=
=0A=
=0A=
> Or your compatible string should just be specific enough to know the=0A=
> width.=0A=
=0A=
I decided against a new compatible sting that because the IP block =0A=
really is the Armada-XP one and the existing compatible string is used =0A=
in other places (using multiple compatible strings would solve that).=0A=
=0A=
I'm not too fussed which of the 3 options are used. Is there any =0A=
particular preference?=0A=
