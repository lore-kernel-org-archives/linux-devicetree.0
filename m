From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH 1/3] ARM: dts: enable L2 cache parity and ecc on
 db-xc3-24g4xg board
Date: Wed, 10 Jan 2018 20:08:31 +0000
Message-ID: <236e468acaef47d6847809d09a88ee06@svr-chch-ex1.atlnz.lc>
References: <20180108223158.21930-1-chris.packham@alliedtelesis.co.nz>
 <20180108223158.21930-2-chris.packham@alliedtelesis.co.nz>
 <87y3l66s0r.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: "jlu@pengutronix.de" <jlu@pengutronix.de>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "bp@alien8.de" <bp@alien8.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Gregory,=0A=
=0A=
On 10/01/18 21:24, Gregory CLEMENT wrote:=0A=
> Hi Chris,=0A=
> =0A=
>   On mar., janv. 09 2018, Chris Packham <chris.packham@alliedtelesis.co.n=
z> wrote:=0A=
> =0A=
> Could you have add a (even small) message in the commit log?=0A=
> =0A=
> Also could you improve the title by specify that it applies on=0A=
> armada-xp, like this:=0A=
> =0A=
> ARM: dts: armada-xp: enable L2 cache parity and ecc on db-xc3-24g4xg=0A=
>=0A=
=0A=
Will do.=0A=
=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>> ---=0A=
>>   arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts | 5 +++++=0A=
>>   1 file changed, 5 insertions(+)=0A=
>>=0A=
>> diff --git a/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts b/arch/arm/bo=
ot/dts/armada-xp-db-xc3-24g4xg.dts=0A=
>> index 06fce35d7491..00ca489fc788 100644=0A=
>> --- a/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts=0A=
>> +++ b/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts=0A=
>> @@ -70,6 +70,11 @@=0A=
>>   	};=0A=
>>   };=0A=
>>   =0A=
>> +&L2 {=0A=
>> +	arm,parity-enable;=0A=
>> +	marvell,ecc-enable;=0A=
> =0A=
> It is not a problem for me to already applied the device tree change=0A=
> even if the driver is not merged yet. But I would like to have an=0A=
> acked-by on this new property by either a device tree maintainer or at=0A=
> least the EDAC maintainer, of course having both acked-by would be=0A=
> perfect ! :)=0A=
=0A=
Thanks, I was hoping you would say that. That way I can keep this =0A=
independent of the EDAC driver changes.=0A=
=0A=
> =0A=
> Thanks,=0A=
> =0A=
> Gregory=0A=
> =0A=
> =0A=
> =0A=
> =0A=
>> +};=0A=
>> +=0A=
>>   &devbus_bootcs {=0A=
>>   	status =3D "okay";=0A=
>>   =0A=
>> -- =0A=
>> 2.15.1=0A=
>>=0A=
> =0A=
=0A=
