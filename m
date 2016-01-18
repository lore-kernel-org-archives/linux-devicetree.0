From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/2] bmips: add BCM6358 support
Date: Mon, 18 Jan 2016 11:22:53 -0800
Message-ID: <569D3B8D.6040603@gmail.com>
References: <1453030101-14794-1-git-send-email-noltari@gmail.com>
 <0BC6030C-7485-4193-B86D-E690BF673952@gmail.com>
 <BF36180D-DB32-42A5-AFF7-2B282F5A81DC@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <BF36180D-DB32-42A5-AFF7-2B282F5A81DC@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jogo@openwrt.org, cernekee@gmail.com
List-Id: devicetree@vger.kernel.org

(please don't top post)

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

These registers are always accessible AFAIR, either through KSEG3
(0xFF00_0000), or through KSEG1 (0xB000_0000) for newer SoCs, and in
arch/mips/include/asm/io.h, the first thing we do is call
plat_ioremap(), if the address returned is valid, we just bail out and
do not execute the snippet you are indicating.

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

I would prefer we maintain the existing logic from
arch/mips/include/asm/mach-bcm63xx/ioremap.h. If needed we could do thi=
s
in a two level step, where plat_ioremap() calls a helper function, and
this helper function has been scanning the Device Tree for the bus
register space.

Jonas' suggestion works too.

>=20
> Regards,
> =C3=81lvaro.
>=20
>> El 18 ene 2016, a las 7:49, Florian Fainelli <f.fainelli@gmail.com> =
escribi=C3=B3:
>>
>>> On January 17, 2016 3:28:20 AM PST, "=C3=81lvaro Fern=C3=A1ndez Roj=
as" <noltari@gmail.com> wrote:
>>> BCM6358 has a shared TLB which conflicts with current SMP support, =
so
>>> it must
>>> be disabled for now.
>>> BCM6358 uses >=3D 0xfff00000 addresses for internal registers, whic=
h need
>>> to be
>>> remapped (by using a simplified version of BRCM63xx ioremap.h).
>>>
>>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
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
