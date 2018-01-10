From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH 2/3] ARM: dts: mvebu: add sdram controller node to
 Armada-38x
Date: Wed, 10 Jan 2018 20:19:30 +0000
Message-ID: <5aa9a523e86e4607a14265790d105168@svr-chch-ex1.atlnz.lc>
References: <20180108223158.21930-1-chris.packham@alliedtelesis.co.nz>
 <20180108223158.21930-3-chris.packham@alliedtelesis.co.nz>
 <87tvvu6ro6.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: "jlu@pengutronix.de" <jlu@pengutronix.de>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "bp@alien8.de" <bp@alien8.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/01/18 21:31, Gregory CLEMENT wrote:=0A=
> Hi Chris,=0A=
>   =0A=
>   On mar., janv. 09 2018, Chris Packham <chris.packham@alliedtelesis.co.n=
z> wrote:=0A=
> =0A=
>> The Armada-38x uses an SDRAM controller that is compatible with the=0A=
>> Armada-XP. The key difference is the width of the bus (XP is 64/32, 38x=
=0A=
>> is 32/16). The SDRAM controller registers are the same between the two=
=0A=
>> SoCs.=0A=
>>=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>> ---=0A=
>>   arch/arm/boot/dts/armada-38x.dtsi | 5 +++++=0A=
>>   1 file changed, 5 insertions(+)=0A=
>>=0A=
>> diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armad=
a-38x.dtsi=0A=
>> index 00ff549d4e39..6d34c5ec178f 100644=0A=
>> --- a/arch/arm/boot/dts/armada-38x.dtsi=0A=
>> +++ b/arch/arm/boot/dts/armada-38x.dtsi=0A=
>> @@ -138,6 +138,11 @@=0A=
>>   			#size-cells =3D <1>;=0A=
>>   			ranges =3D <0 MBUS_ID(0xf0, 0x01) 0 0x100000>;=0A=
>>   =0A=
>> +			sdramc@1400 {=0A=
> =0A=
> Could you add a label? Thanks to this it would be possible to=0A=
> enable/disable it at board level in a esay way.=0A=
> =0A=
=0A=
Sure. Any suggestions for a name better than "sdramc:"?=0A=
=0A=
It's probably worth adding the same label to armada-xp.dtsi and =0A=
armada-xp-98dx3236.dtsi.=0A=
=0A=
>> +				compatible =3D "marvell,armada-xp-sdram-controller";=0A=
>> +				reg =3D <0x1400 0x500>;=0A=
> =0A=
> What about adding status =3D "disabled" ?=0A=
> =0A=
> Thanks to this we can enable it at board level only if we really want=0A=
> it, it would avoid nasty regression on boards that don't need it, if an=
=0A=
> issue occurs. Unless you are sure that it is completely safe to enable=0A=
> it for everyone.=0A=
=0A=
The EDAC driver (which is default n) will not probe the device if ECC =0A=
has not been enabled so that should be safe.=0A=
=0A=
Other than the EDAC driver the only other code that looks at this is in =0A=
arch/arm/mach-mvebu/pm.c and it almost seems like an omission that this =0A=
code is not active on armada-38x. The armada-38x platforms I have access =
=0A=
to don't use suspend/resume so I can't verify this.=0A=
=0A=
