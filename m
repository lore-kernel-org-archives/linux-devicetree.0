From: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] bmips: add BCM6358 support
Date: Mon, 18 Jan 2016 10:42:13 +0100
Message-ID: <BF36180D-DB32-42A5-AFF7-2B282F5A81DC@gmail.com>
References: <1453030101-14794-1-git-send-email-noltari@gmail.com> <0BC6030C-7485-4193-B86D-E690BF673952@gmail.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0BC6030C-7485-4193-B86D-E690BF673952-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

I can refine it to support a custom offset for each cpu instead of a ge=
neric one, but defining a custom offset for new SoCs such as BCM6368 or=
 BCM6328 would actually break them, since that way the address wouldn't=
 be remapped to 0xb0000000.
See: https://github.com/torvalds/linux/blob/master/arch/mips/include/as=
m/io.h#L213
In those CPUs the remapping is done automatically (from 0x10000000 to 0=
xb0000000), since the registers are located in the low 512MB of address=
 space (0x1fffffffULL).

However, the older CPUs such as BCM6358 (or BCM3368) need that custom i=
oremap, since those registers aren't located in the low 512MB of addres=
s space.
If you want, I can do something like this: https://gist.github.com/Nolt=
ari/bc5fe029c52cf053a454
And after that we could add other CPUs such as the BCM3368, which needs=
 a different offset: "{ "brcm,bcm3368", 0xfff80000 }"

What do you think? Should we keep a generic offset (0xfff00000) or shou=
ld we add SoC specific compatible strings with each custom offset?

Regards,
=C3=81lvaro.

> El 18 ene 2016, a las 7:49, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> e=
scribi=C3=B3:
>=20
>> On January 17, 2016 3:28:20 AM PST, "=C3=81lvaro Fern=C3=A1ndez Roja=
s" <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> BCM6358 has a shared TLB which conflicts with current SMP support, s=
o
>> it must
>> be disabled for now.
>> BCM6358 uses >=3D 0xfff00000 addresses for internal registers, which=
 need
>> to be
>> remapped (by using a simplified version of BRCM63xx ioremap.h).
>>=20
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> arch/mips/bmips/setup.c                    | 10 +++++++++
>> arch/mips/include/asm/mach-bmips/ioremap.h | 33
>> ++++++++++++++++++++++++++++++
>> 2 files changed, 43 insertions(+)
>> create mode 100644 arch/mips/include/asm/mach-bmips/ioremap.h
>>=20
>> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
>> index 3553528..38b5bd5 100644
>> --- a/arch/mips/bmips/setup.c
>> +++ b/arch/mips/bmips/setup.c
>> @@ -95,6 +95,15 @@ static void bcm6328_quirks(void)
>>        bcm63xx_fixup_cpu1();
>> }
>>=20
>> +static void bcm6358_quirks(void)
>> +{
>> +    /*
>> +     * BCM6358 needs special handling for its shared TLB, so
>> +     * disable SMP for now
>> +     */
>> +    bmips_smp_enabled =3D 0;
>> +}
>=20
> That part looks good.
>=20
>> +
>> static void bcm6368_quirks(void)
>> {
>>    bcm63xx_fixup_cpu1();
>> @@ -104,6 +113,7 @@ static const struct bmips_quirk bmips_quirk_list=
[]
>> =3D {
>>    { "brcm,bcm3384-viper",        &bcm3384_viper_quirks        },
>>    { "brcm,bcm33843-viper",    &bcm3384_viper_quirks        },
>>    { "brcm,bcm6328",        &bcm6328_quirks            },
>> +    { "brcm,bcm6358",        &bcm6358_quirks            },
>>    { "brcm,bcm6368",        &bcm6368_quirks            },
>>    { "brcm,bcm63168",        &bcm6368_quirks            },
>>    { },
>=20
> <snip>
>=20
>> +
>> +static inline int is_bmips_internal_registers(phys_addr_t offset)
>> +{
>> +    if (offset >=3D 0xfff00000)
>> +        return 1;
>> +
>> +    return 0;
>=20
> That should probably be refined to be looking at the SoC/CPU you are =
running on, using eventually of_machine_is_compatible on the SoC-specif=
ic compatible string. For instance, on 6368 and newer, the physical reg=
ister offset moves to PA 0x1000_0000.
>=20
> Thanks!
>=20
> --=20
> Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
