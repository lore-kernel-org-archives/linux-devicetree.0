From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 10/15] MIPS: ingenic: Add machine info for supported
 boards
Date: Tue, 02 Jan 2018 17:32:27 +0100
Message-ID: <1514910747.3623.0@smtp.crapouillou.net>
References: <20180102150848.11314-1-paul@crapouillou.net>
        <20180102150848.11314-10-paul@crapouillou.net>
        <CANc+2y7ePJ9PwXQp2EQS_CFj541iOkWLbZm7K3U0G7j0bx4RDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANc+2y7ePJ9PwXQp2EQS_CFj541iOkWLbZm7K3U0G7j0bx4RDg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, linux-mips@linux-mips.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi PrasannaKumar,

Le mar. 2 janv. 2018 =E0 17:02, PrasannaKumar Muralidharan=20
<prasannatsmkumar@gmail.com> a =E9crit :
> Hi Paul,
>=20
> On 2 January 2018 at 20:38, Paul Cercueil <paul@crapouillou.net>=20
> wrote:
>>  This makes sure that 'mips_machtype' will be initialized to the SoC
>>  version used on the board.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   arch/mips/Kconfig         |  1 +
>>   arch/mips/jz4740/Makefile |  2 +-
>>   arch/mips/jz4740/boards.c | 12 ++++++++++++
>>   arch/mips/jz4740/setup.c  | 34 +++++++++++++++++++++++++++++-----
>>   4 files changed, 43 insertions(+), 6 deletions(-)
>>   create mode 100644 arch/mips/jz4740/boards.c
>>=20
>>   v2: No change
>>   v3: No change
>>   v4: No change
>>   v5: Use SPDX license identifier
>>=20
>>  diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>>  index 350a990fc719..83243e427e36 100644
>>  --- a/arch/mips/Kconfig
>>  +++ b/arch/mips/Kconfig
>>  @@ -376,6 +376,7 @@ config MACH_INGENIC
>>          select BUILTIN_DTB
>>          select USE_OF
>>          select LIBFDT
>>  +       select MIPS_MACHINE
>>=20
>>   config LANTIQ
>>          bool "Lantiq based platforms"
>>  diff --git a/arch/mips/jz4740/Makefile b/arch/mips/jz4740/Makefile
>>  index 88d6aa7d000b..fc2d3b3c4a80 100644
>>  --- a/arch/mips/jz4740/Makefile
>>  +++ b/arch/mips/jz4740/Makefile
>>  @@ -6,7 +6,7 @@
>>   # Object file lists.
>>=20
>>   obj-y +=3D prom.o time.o reset.o setup.o \
>>  -       platform.o timer.o
>>  +       platform.o timer.o boards.o
>>=20
>>   CFLAGS_setup.o =3D -I$(src)/../../../scripts/dtc/libfdt
>>=20
>>  diff --git a/arch/mips/jz4740/boards.c b/arch/mips/jz4740/boards.c
>>  new file mode 100644
>>  index 000000000000..13b0bddd8cb7
>>  --- /dev/null
>>  +++ b/arch/mips/jz4740/boards.c
>>  @@ -0,0 +1,12 @@
>>  +// SPDX-License-Identifier: GPL-2.0
>>  +/*
>>  + * Ingenic boards support
>>  + * Copyright 2017, Paul Cercueil <paul@crapouillou.net>
>>  + */
>>  +
>>  +#include <asm/bootinfo.h>
>>  +#include <asm/mips_machine.h>
>>  +
>>  +MIPS_MACHINE(MACH_INGENIC_JZ4740, "qi,lb60", "Qi Hardware Ben=20
>> Nanonote", NULL);
>>  +MIPS_MACHINE(MACH_INGENIC_JZ4780, "img,ci20",
>>  +                       "Imagination Technologies CI20", NULL);
>>  diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
>>  index 6d0152321819..afd84ee966e8 100644
>>  --- a/arch/mips/jz4740/setup.c
>>  +++ b/arch/mips/jz4740/setup.c
>>  @@ -22,6 +22,7 @@
>>   #include <linux/of_fdt.h>
>>=20
>>   #include <asm/bootinfo.h>
>>  +#include <asm/mips_machine.h>
>>   #include <asm/prom.h>
>>=20
>>   #include <asm/mach-jz4740/base.h>
>>  @@ -53,16 +54,34 @@ static void __init jz4740_detect_mem(void)
>>          add_memory_region(0, size, BOOT_MEM_RAM);
>>   }
>>=20
>>  +static unsigned long __init get_board_mach_type(const void *fdt)
>>  +{
>>  +       const struct mips_machine *mach;
>>  +
>>  +       for (mach =3D (struct mips_machine *)&__mips_machines_start;
>>  +                       mach < (struct mips_machine=20
>> *)&__mips_machines_end;
>>  +                       mach++) {
>>  +               if (!fdt_node_check_compatible(fdt, 0,=20
>> mach->mach_id))
>>  +                       return mach->mach_type;
>>  +       }
>>  +
>>  +       return MACH_INGENIC_JZ4740;
>>  +}
>>  +
>>   void __init plat_mem_setup(void)
>>   {
>>          int offset;
>>=20
>>  +       if (!early_init_dt_scan(__dtb_start))
>>  +               return;
>>  +
>>          jz4740_reset_init();
>>  -       __dt_setup_arch(__dtb_start);
>>=20
>>          offset =3D fdt_path_offset(__dtb_start, "/memory");
>>          if (offset < 0)
>>                  jz4740_detect_mem();
>>  +
>>  +       mips_machtype =3D get_board_mach_type(__dtb_start);
>>   }
>>=20
>>   void __init device_tree_init(void)
>>  @@ -75,13 +94,18 @@ void __init device_tree_init(void)
>>=20
>>   const char *get_system_type(void)
>>   {
>>  -       if (IS_ENABLED(CONFIG_MACH_JZ4780))
>>  -               return "JZ4780";
>>  -
>>  -       return "JZ4740";
>>  +       return mips_get_machine_name();
>>   }
>>=20
>>   void __init arch_init_irq(void)
>>   {
>>          irqchip_init();
>>   }
>>  +
>>  +static int __init jz4740_machine_setup(void)
>>  +{
>>  +       mips_machine_setup();
>>  +
>>  +       return 0;
>>  +}
>>  +arch_initcall(jz4740_machine_setup);
>>  --
>>  2.11.0
>>=20
>>=20
>=20
> Why add another file in arch/mips/jz4740/? I think declaring a machine
> and compatible string in dts would suffice. Please feel free to
> correct me if I am wrong.
>=20
> Regards,
> PrasannaKumar

The point of this commit is, first, to have a textual description of=20
the board
that can then be retrieved in dmesg; then, to properly initialize the
mips_machtype early in the boot process. I think you are right and we=20
could
have both things just with "model" and "compatible" nodes in devicetree.

Regards,
-Paul
=
