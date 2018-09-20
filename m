From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH 0/4] ARM: dts: mvebu: updates and new board
Date: Thu, 20 Sep 2018 20:38:54 +0000
Message-ID: <e627c26d707f4a20a5a427a5a64232d3@svr-chch-ex1.atlnz.lc>
References: <20180726040257.22285-1-chris.packham@alliedtelesis.co.nz>
 <87bm8sjh6f.fsf@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "andrew@lunn.ch" <andrew@lunn.ch>, "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 21/09/18 03:57, Gregory CLEMENT wrote:=0A=
> Hi Chris,=0A=
>   =0A=
>   On jeu., juil. 26 2018, Chris Packham <chris.packham@alliedtelesis.co.n=
z> wrote:=0A=
> =0A=
>> This series updates the armada-xp-98dx3236 SoC and related boards to use=
 the=0A=
>> new style dts bindings for nand.=0A=
>>=0A=
>> I've also added a new db-88f6820-amc board which is an Armada-385 based=
=0A=
>> reference board from Marvell's switch team. It's a plugin card for eithe=
r the=0A=
>> db-dxbc2 or db-xc3-24g4 which can be used if you disable the internal CP=
U on=0A=
>> those platforms.=0A=
>>=0A=
>> Chris Packham (4):=0A=
>>    ARM: dts: mvebu: 98dx3236: Rename nand controller node=0A=
>>    ARM: dts: mvebu: db-dxbc2: use new style nand binding=0A=
>>    ARM: dts: mvebu: db-xc3-24g4: use new style nand binding=0A=
>>    ARM: dts: mvebu: Add device tree for db-88f6820-amc board=0A=
> =0A=
> While applying this series mvebu/dt, I got few warning with "ARM: dts:=0A=
> mvebu: 98dx3236: Rename nand controller node".=0A=
> =0A=
> I fix them and also use the new partition binding, the diff is the=0A=
> following:=0A=
> =0A=
> iff --git a/arch/arm/boot/dts/armada-385-db-88f6820-amc.dts b/arch/arm/bo=
ot/dts/armada-385-db-88f6820-amc.dts=0A=
> index d87614057e3f..dc9ccce1d4a1 100644=0A=
> --- a/arch/arm/boot/dts/armada-385-db-88f6820-amc.dts=0A=
> +++ b/arch/arm/boot/dts/armada-385-db-88f6820-amc.dts=0A=
> @@ -102,9 +102,14 @@=0A=
>                  nand-ecc-strength =3D <4>;=0A=
>                  nand-ecc-step-size =3D <512>;=0A=
>   =0A=
> -               partition@user {=0A=
> -                       reg =3D <0x00000000 0x40000000>;=0A=
> -                       label =3D "user";=0A=
> +               partitions {=0A=
> +                       compatible =3D "fixed-partitions";=0A=
> +                       #address-cells =3D <1>;=0A=
> +                       #size-cells =3D <1>;=0A=
> +                       partition@0 {=0A=
> +                               reg =3D <0x00000000 0x40000000>;=0A=
> +                               label =3D "user";=0A=
> +                       };=0A=
>                  };=0A=
>          };=0A=
>   };=0A=
> @@ -131,13 +136,18 @@=0A=
>                  spi-max-frequency =3D <50000000>;=0A=
>                  m25p,fast-read;=0A=
>   =0A=
> -               partition@u-boot {=0A=
> -                       reg =3D <0x00000000 0x00100000>;=0A=
> -                       label =3D "u-boot";=0A=
> -               };=0A=
> -               partition@u-boot-env {=0A=
> -                       reg =3D <0x00100000 0x00040000>;=0A=
> -                       label =3D "u-boot-env";=0A=
> +               partitions {=0A=
> +                       compatible =3D "fixed-partitions";=0A=
> +                       #address-cells =3D <1>;=0A=
> +                       #size-cells =3D <1>;=0A=
> +                       partition@0 {=0A=
> +                               reg =3D <0x00000000 0x00100000>;=0A=
> +                               label =3D "u-boot";=0A=
> +                       };=0A=
> +                       partition@100000 {=0A=
> +                               reg =3D <0x00100000 0x00040000>;=0A=
> +                               label =3D "u-boot-env";=0A=
> +                       };=0A=
>                  };=0A=
>          };=0A=
>   };=0A=
> =0A=
> I amended your patch with it, but if you don't agree with it, I can=0A=
> still modify it, the branch is not immutable yet.=0A=
=0A=
Looks good to me. Thanks.=0A=
=0A=
> =0A=
> Thanks,=0A=
> =0A=
> Gregory=0A=
> =0A=
>>=0A=
>>   arch/arm/boot/dts/Makefile                    |   1 +=0A=
>>   .../boot/dts/armada-385-db-88f6820-amc.dts    | 184 ++++++++++++++++++=
=0A=
>>   arch/arm/boot/dts/armada-xp-98dx3236.dtsi     |   2 +-=0A=
>>   arch/arm/boot/dts/armada-xp-db-dxbc2.dts      |  18 +-=0A=
>>   arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts |  18 +-=0A=
>>   5 files changed, 208 insertions(+), 15 deletions(-)=0A=
>>   create mode 100644 arch/arm/boot/dts/armada-385-db-88f6820-amc.dts=0A=
>>=0A=
>> -- =0A=
>> 2.18.0=0A=
>>=0A=
> =0A=
=0A=
