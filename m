From: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Subject: Re: [PATCH 2/3] MIPS: BMIPS: Add BCM6345 support
Date: Mon, 13 Jun 2016 08:08:23 +0200
Message-ID: <575E4DD7.7020204@gmail.com>
References: <1464941524-3992-1-git-send-email-noltari@gmail.com>
 <1464941524-3992-2-git-send-email-noltari@gmail.com>
 <CAOiHx=nu-5_CeHn8dki+v9nrP8uN2QH13gcNsejYKpt7dsmX2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOiHx=nu-5_CeHn8dki+v9nrP8uN2QH13gcNsejYKpt7dsmX2w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: MIPS Mailing List <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, Rob Herring <robh@kernel.org>, Simon Arlott <simon@fire.lp0.eu>
List-Id: devicetree@vger.kernel.org

On a second thought I think I'll postpone adding support for BMIPS3300 =
SoCs since I failed booting latest kernel on a BCM6348.
I'll resend only patch 1/3 on a new patch series.

=C3=81lvaro.

El 3/6/16 a las 13:46, Jonas Gorski escribi=C3=B3:
> Hi,
>=20
> On 3 June 2016 at 10:12, =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:
>> BCM6345 has only one CPU, so SMP support must be disabled.
>>
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/mips/brcm/soc.txt | 2 +-
>>  arch/mips/bmips/setup.c                             | 9 +++++++++
>>  2 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.txt b/D=
ocumentation/devicetree/bindings/mips/brcm/soc.txt
>> index 4a7e030..1936e8a 100644
>> --- a/Documentation/devicetree/bindings/mips/brcm/soc.txt
>> +++ b/Documentation/devicetree/bindings/mips/brcm/soc.txt
>> @@ -4,7 +4,7 @@ Required properties:
>>
>>  - compatible: "brcm,bcm3384", "brcm,bcm33843"
>>                "brcm,bcm3384-viper", "brcm,bcm33843-viper"
>> -              "brcm,bcm6328", "brcm,bcm6358", "brcm,bcm6368",
>> +              "brcm,bcm6328", "brcm,bcm6345", "brcm,bcm6358", "brcm=
,bcm6368",
>>                "brcm,bcm63168", "brcm,bcm63268",
>>                "brcm,bcm7125", "brcm,bcm7346", "brcm,bcm7358", "brcm=
,bcm7360",
>>                "brcm,bcm7362", "brcm,bcm7420", "brcm,bcm7425"
>=20
> This is reasonable.
>=20
>> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
>> index f146d12..b0d339d 100644
>> --- a/arch/mips/bmips/setup.c
>> +++ b/arch/mips/bmips/setup.c
>> @@ -95,6 +95,14 @@ static void bcm6328_quirks(void)
>>                 bcm63xx_fixup_cpu1();
>>  }
>>
>> +static void bcm6345_quirks(void)
>> +{
>> +       /*
>> +        * BCM6345 has only one CPU and no SMP support
>> +        */
>> +       bmips_smp_enabled =3D 0;
>> +}
>> +
>>  static void bcm6358_quirks(void)
>>  {
>>         /*
>> @@ -113,6 +121,7 @@ static const struct bmips_quirk bmips_quirk_list=
[] =3D {
>>         { "brcm,bcm3384-viper",         &bcm3384_viper_quirks       =
    },
>>         { "brcm,bcm33843-viper",        &bcm3384_viper_quirks       =
    },
>>         { "brcm,bcm6328",               &bcm6328_quirks             =
    },
>> +       { "brcm,bcm6345",               &bcm6345_quirks             =
    },
>>         { "brcm,bcm6358",               &bcm6358_quirks             =
    },
>>         { "brcm,bcm6368",               &bcm6368_quirks             =
    },
>>         { "brcm,bcm63168",              &bcm6368_quirks             =
    },
>=20
> This part is unnecessary, as cpu-bmips will only try to enable smp fo=
r
> bmips4350 and higher. but not for bmips32/bmips3300.
>=20
>=20
> Jonas
>=20
