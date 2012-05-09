From: Tanmay Inamdar <tinamdar@apm.com>
Subject: Re: [V2 5/5] powerpc: kernel: 16650 UART reg-shift support
Date: Wed, 9 May 2012 10:57:51 +0530
Message-ID: <CACoXjcnpVi6n7__6SgdzYUuMuRkdtZpVGkOiEowFsL8Gq2kC7w@mail.gmail.com>
References: <1333956052-25319-1-git-send-email-tinamdar@apm.com>
	<1333956052-25319-2-git-send-email-tinamdar@apm.com>
	<1333956052-25319-3-git-send-email-tinamdar@apm.com>
	<1333956052-25319-4-git-send-email-tinamdar@apm.com>
	<1333956052-25319-5-git-send-email-tinamdar@apm.com>
	<CA+5PVA4sjX_Dk6ecySG4ZZoM=xhaWu2jGrQ=LtFgxGL88G=-Nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+5PVA4sjX_Dk6ecySG4ZZoM=xhaWu2jGrQ=LtFgxGL88G=-Nw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Boyer <jwboyer@gmail.com>
Cc: benh@kernel.crashing.org, grant.likely@secretlab.ca, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, May 2, 2012 at 7:08 PM, Josh Boyer <jwboyer@gmail.com> wrote:
> On Mon, Apr 9, 2012 at 3:20 AM, Tanmay Inamdar <tinamdar@apm.com> wro=
te:
>> In APM8018X SOC, UART register address space has been relocated to 3=
2-bit
>> data boundaries for APB bus implementation.
>> Current legacy_serial driver ignores the reg-shift property. This pa=
tch
>> modifies legacy_serial.c and udbg_16550.c to work with above mention=
ed UARTs.
>>
>> Signed-off-by: Tanmay Inamdar <tinamdar@apm.com>
>> ---
>> :100644 100644 8338aef... f5fc106... M =A0arch/powerpc/include/asm/u=
dbg.h
>> :100644 100644 bedd12e... d523b7d... M =A0arch/powerpc/kernel/legacy=
_serial.c
>> :100644 100644 6837f83... e0cb7dc... M =A0arch/powerpc/kernel/udbg_1=
6550.c
>> =A0arch/powerpc/include/asm/udbg.h =A0 =A0 | =A0 =A02 +-
>> =A0arch/powerpc/kernel/legacy_serial.c | =A0 16 +++++---
>> =A0arch/powerpc/kernel/udbg_16550.c =A0 =A0| =A0 64 ++++++++++++++++=
++++++------------
>> =A03 files changed, 52 insertions(+), 30 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/udbg.h b/arch/powerpc/include/=
asm/udbg.h
>> index 8338aef..f5fc106 100644
>> --- a/arch/powerpc/include/asm/udbg.h
>> +++ b/arch/powerpc/include/asm/udbg.h
>> @@ -29,7 +29,7 @@ extern void udbg_printf(const char *fmt, ...)
>> =A0extern void udbg_progress(char *s, unsigned short hex);
>>
>> =A0extern void udbg_init_uart(void __iomem *comport, unsigned int sp=
eed,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int cl=
ock);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int cl=
ock, =A0unsigned int regshift);
>> =A0extern unsigned int udbg_probe_uart_speed(void __iomem *comport,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0unsigned int clock);
>>
>> diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kern=
el/legacy_serial.c
>> index bedd12e..d523b7d 100644
>> --- a/arch/powerpc/kernel/legacy_serial.c
>> +++ b/arch/powerpc/kernel/legacy_serial.c
>> @@ -33,6 +33,7 @@ static struct legacy_serial_info {
>> =A0 =A0 =A0 =A0unsigned int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0c=
lock;
>> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 irq_check_parent;
>> =A0 =A0 =A0 =A0phys_addr_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 t=
addr;
>> + =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0re=
gshift;
>> =A0} legacy_serial_infos[MAX_LEGACY_SERIAL_PORTS];
>>
>> =A0static struct __initdata of_device_id legacy_serial_parents[] =3D=
 {
>> @@ -42,6 +43,7 @@ static struct __initdata of_device_id legacy_seria=
l_parents[] =3D {
>> =A0 =A0 =A0 =A0{.compatible =3D "ibm,opb",},
>> =A0 =A0 =A0 =A0{.compatible =3D "simple-bus",},
>> =A0 =A0 =A0 =A0{.compatible =3D "wrs,epld-localbus",},
>> + =A0 =A0 =A0 {.compatible =3D "apm,apb",},
>> =A0 =A0 =A0 =A0{},
>> =A0};
>>
>> @@ -163,11 +165,6 @@ static int __init add_legacy_soc_port(struct de=
vice_node *np,
>> =A0 =A0 =A0 =A0if (of_get_property(np, "clock-frequency", NULL) =3D=3D=
 NULL)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -1;
>>
>> - =A0 =A0 =A0 /* if reg-shift or offset, don't try to use it */
>> - =A0 =A0 =A0 if ((of_get_property(np, "reg-shift", NULL) !=3D NULL)=
 ||
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 (of_get_property(np, "reg-offset", NUL=
L) !=3D NULL))
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
>> -
>
> So we explicitly didn't support reg-shift before. =A0I'm guessing the=
re is
> a reason for that, but I don't recall what. =A0Ben?
>
> Also, why do you need to use the legacy serial driver at all for this
> SOC? =A0As far as I remember, the OF serial driver should be sufficie=
nt.
>

You are right. There is no need to use legacy serial driver. However I
realized that when 40x is selected, 'PPC_UDBG_16550' is by default
selected. This enables legacy serial driver.

Is it now required to enable 'PPC_UDBG_16550' by default for every SOC
that uses 40x processor?

>> +static unsigned int reg_shift;
>> +#define ns16550_offset(addr) (addr - (unsigned char *)udbg_comport)
>> +
>> =A0static struct NS16550 __iomem *udbg_comport;
>>
>> +static inline u8 serial_read(unsigned char *addr)
>> +{
>> + =A0 =A0 =A0 u32 offset =3D ns16550_offset(addr) << reg_shift;
>> + =A0 =A0 =A0 return readb(udbg_comport + offset);
>> +}
>> +
>> +static inline void serial_write(unsigned char *addr, char val)
>> +{
>> + =A0 =A0 =A0 u32 offset =3D ns16550_offset(addr) << reg_shift;
>> + =A0 =A0 =A0 writeb(val, udbg_comport + offset);
>> +}
>> +
>
> I don't think readb/writeb are correct here. =A0Why did you switch to
> using those instead of sticking with in_8/out_8?
>
> josh

Thanks,
Tanmay
CONFIDENTIALITY NOTICE: This e-mail message, including any attachments,=
=20
is for the sole use of the intended recipient(s) and contains informati=
on=A0
that is confidential and proprietary to AppliedMicro Corporation or its=
 subsidiaries.=20
It is to be used solely for the purpose of furthering the parties' busi=
ness relationship.=20
All unauthorized review, use, disclosure or distribution is prohibited.=
=20
If you are not the intended recipient, please contact the sender by rep=
ly e-mail=20
and destroy all copies of the original message.
=0D
