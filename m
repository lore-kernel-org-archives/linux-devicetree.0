From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] bmips: add BCM6358 support
Date: Mon, 18 Jan 2016 16:03:53 -0800
Message-ID: <569D7D69.6070807@gmail.com>
References: <1453030101-14794-1-git-send-email-noltari@gmail.com>
 <0BC6030C-7485-4193-B86D-E690BF673952@gmail.com>
 <BF36180D-DB32-42A5-AFF7-2B282F5A81DC@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BF36180D-DB32-42A5-AFF7-2B282F5A81DC-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 18/01/2016 01:42, =C3=81lvaro Fern=C3=A1ndez Rojas a =C3=A9crit :
> I can refine it to support a custom offset for each cpu instead of a =
generic one, but defining a custom offset for new SoCs such as BCM6368 =
or BCM6328 would actually break them, since that way the address wouldn=
't be remapped to 0xb0000000.
> See: https://github.com/torvalds/linux/blob/master/arch/mips/include/=
asm/io.h#L213
> In those CPUs the remapping is done automatically (from 0x10000000 to=
 0xb0000000), since the registers are located in the low 512MB of addre=
ss space (0x1fffffffULL).

I see what you mean by that now, we can indeed drop these registers fro=
m
plat_ioremap() since the fallback already takes care of that for us.

>=20
> However, the older CPUs such as BCM6358 (or BCM3368) need that custom=
 ioremap, since those registers aren't located in the low 512MB of addr=
ess space.
> If you want, I can do something like this: https://gist.github.com/No=
ltari/bc5fe029c52cf053a454
> And after that we could add other CPUs such as the BCM3368, which nee=
ds a different offset: "{ "brcm,bcm3368", 0xfff80000 }"
>=20
> What do you think? Should we keep a generic offset (0xfff00000) or sh=
ould we add SoC specific compatible strings with each custom offset?
>=20
> Regards,
> =C3=81lvaro.
>=20
>> El 18 ene 2016, a las 7:49, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
escribi=C3=B3:
>>
>>> On January 17, 2016 3:28:20 AM PST, "=C3=81lvaro Fern=C3=A1ndez Roj=
as" <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> BCM6358 has a shared TLB which conflicts with current SMP support, =
so
>>> it must
>>> be disabled for now.
>>> BCM6358 uses >=3D 0xfff00000 addresses for internal registers, whic=
h need
>>> to be
>>> remapped (by using a simplified version of BRCM63xx ioremap.h).
>>>
>>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>> arch/mips/bmips/setup.c                    | 10 +++++++++
>>> arch/mips/include/asm/mach-bmips/ioremap.h | 33
>>> ++++++++++++++++++++++++++++++
>>> 2 files changed, 43 insertions(+)
>>> create mode 100644 arch/mips/include/asm/mach-bmips/ioremap.h
>>>
>>> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
>>> index 3553528..38b5bd5 100644
>>> --- a/arch/mips/bmips/setup.c
>>> +++ b/arch/mips/bmips/setup.c
>>> @@ -95,6 +95,15 @@ static void bcm6328_quirks(void)
>>>        bcm63xx_fixup_cpu1();
>>> }
>>>
>>> +static void bcm6358_quirks(void)
>>> +{
>>> +    /*
>>> +     * BCM6358 needs special handling for its shared TLB, so
>>> +     * disable SMP for now
>>> +     */
>>> +    bmips_smp_enabled =3D 0;
>>> +}
>>
>> That part looks good.
>>
>>> +
>>> static void bcm6368_quirks(void)
>>> {
>>>    bcm63xx_fixup_cpu1();
>>> @@ -104,6 +113,7 @@ static const struct bmips_quirk bmips_quirk_lis=
t[]
>>> =3D {
>>>    { "brcm,bcm3384-viper",        &bcm3384_viper_quirks        },
>>>    { "brcm,bcm33843-viper",    &bcm3384_viper_quirks        },
>>>    { "brcm,bcm6328",        &bcm6328_quirks            },
>>> +    { "brcm,bcm6358",        &bcm6358_quirks            },
>>>    { "brcm,bcm6368",        &bcm6368_quirks            },
>>>    { "brcm,bcm63168",        &bcm6368_quirks            },
>>>    { },
>>
>> <snip>
>>
>>> +
>>> +static inline int is_bmips_internal_registers(phys_addr_t offset)
>>> +{
>>> +    if (offset >=3D 0xfff00000)
>>> +        return 1;
>>> +
>>> +    return 0;
>>
>> That should probably be refined to be looking at the SoC/CPU you are=
 running on, using eventually of_machine_is_compatible on the SoC-speci=
fic compatible string. For instance, on 6368 and newer, the physical re=
gister offset moves to PA 0x1000_0000.
>>
>> Thanks!
>>
>> --=20
>> Florian


--=20
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
