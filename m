From: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/7] Samsung: SMDKV210 - Add basic Device Tree Support
	This patch enables the SMDKV210 to boot using the device tree method.
	The
	board initialisation routines are moved to a seperate file for device
	tree probing.When device tree is not ena
Date: Fri, 24 Sep 2010 13:03:06 +0530
Message-ID: <AANLkTiktZC-TQA7qR7yPas581DcGg9M_=bU5y4w_fY7o@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 24, 2010 at 1:21 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
> On Mon, Sep 20, 2010 at 03:49:34PM +0530, Shaju Abraham wrote:
>> Signed-off-by: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>> =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A08 ++
>> =A0arch/arm/mach-s5pv210/Kconfig =A0 =A0 =A0 =A0 =A0 =A0| =A0 15 ++++
>> =A0arch/arm/mach-s5pv210/Makefile =A0 =A0 =A0 =A0 =A0 | =A0 =A01 +
>> =A0arch/arm/mach-s5pv210/mach-smdkv210_dt.c | =A0121 +++++++++++++++++++=
+++++++++++
>> =A04 files changed, 145 insertions(+), 0 deletions(-)
>> =A0create mode 100644 arch/arm/mach-s5pv210/mach-smdkv210_dt.c
>>
>> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> index a63f7c2..dd721fd 100644
>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -1383,6 +1383,14 @@ endmenu
>>
>> =A0menu "Boot options"
>>
>> +config USE_OF
>> + =A0 =A0 =A0 =A0bool "Flattened Device Tree support"
>> + =A0 =A0 =A0 =A0select OF
>> + =A0 =A0 =A0 =A0select OF_FLATTREE
>> + =A0 =A0 =A0 =A0help
>> + =A0 =A0 =A0 =A0 =A0Include support for flattened device tree machine d=
escriptions.
>> +
>> +
>
> Hmmm, this approach looks troublesome when looking at the rest of the
> patch series. =A0I don't think this config symbol should be needed.
>
>> =A0config ARM_EMBEDDED_DTB
>> =A0 =A0 =A0 string "Embedded device tree blob" if OF
>> =A0 =A0 =A0 default ""
>> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconf=
ig
>> index 307a21d..74a6cbe 100644
>> --- a/arch/arm/mach-s5pv210/Kconfig
>> +++ b/arch/arm/mach-s5pv210/Kconfig
>> @@ -78,6 +78,21 @@ config MACH_SMDKV210
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Machine support for Samsung SMDKV210
>>
>> +config MACH_SMDKV210_DT
>> + =A0 =A0 =A0 bool "SMDKV210-DT"
>> + =A0 =A0 =A0 select OF
>> + =A0 =A0 =A0 select OF_FLATTREE
>> + =A0 =A0 =A0 select CPU_S5PV210
>> + =A0 =A0 =A0 select ARCH_SPARSEMEM_ENABLE
>> + =A0 =A0 =A0 select SAMSUNG_DEV_ADC
>> + =A0 =A0 =A0 select SAMSUNG_DEV_TS
>> + =A0 =A0 =A0 select S3C_DEV_WDT
>> + =A0 =A0 =A0 select HAVE_S3C2410_WATCHDOG
>> + =A0 =A0 =A0 help
>> + =A0 =A0 =A0 =A0 Machine support for Samsung SMDKV210-Device Tree
>> +
>> +
>> +
>> =A0config MACH_SMDKC110
>> =A0 =A0 =A0 bool "SMDKC110"
>> =A0 =A0 =A0 select CPU_S5PV210
>> diff --git a/arch/arm/mach-s5pv210/Makefile b/arch/arm/mach-s5pv210/Make=
file
>> index 74dbd76..f0944a9 100644
>> --- a/arch/arm/mach-s5pv210/Makefile
>> +++ b/arch/arm/mach-s5pv210/Makefile
>> @@ -21,6 +21,7 @@ obj-$(CONFIG_S5PV210_USE_NONCOMMON_STRUCT_CLK) +=3D cl=
ock.o
>>
>> =A0obj-$(CONFIG_MACH_AQUILA) =A0 =A0+=3D mach-aquila.o
>> =A0obj-$(CONFIG_MACH_SMDKV210) =A0+=3D mach-smdkv210.o
>> +obj-$(CONFIG_MACH_SMDKV210_DT) +=3D mach-smdkv210_dt.o
>> =A0obj-$(CONFIG_MACH_SMDKC110) =A0+=3D mach-smdkc110.o
>> =A0obj-$(CONFIG_MACH_GONI) =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D mach-goni.o
>>
>> diff --git a/arch/arm/mach-s5pv210/mach-smdkv210_dt.c b/arch/arm/mach-s5=
pv210/mach-smdkv210_dt.c
>> new file mode 100644
>> index 0000000..679401b
>> --- /dev/null
>> +++ b/arch/arm/mach-s5pv210/mach-smdkv210_dt.c
>> @@ -0,0 +1,121 @@
>> +/* linux/arch/arm/mach-s5pv210/mach-smdkv210_dt.c
>> + *
>> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>> + * =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> +*/
>> +#include <linux/kernel.h>
>> +#include <linux/types.h>
>> +#include <linux/i2c.h>
>> +#include <linux/init.h>
>> +#include <linux/serial_core.h>
>> +#include <linux/dm9000.h>
>> +#include <linux/gpio.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/of_fdt.h>
>> +#include <linux/of_clk.h>
>> +
>> +#include <linux/of_address.h>
>> +#include <linux/of_irq.h>
>> +
>> +
>> +#include <asm/mach/arch.h>
>> +#include <asm/hardware/vic.h>
>> +#include <asm/mach/map.h>
>> +#include <asm/setup.h>
>> +#include <asm/mach-types.h>
>> +
>> +#include <mach/map.h>
>> +
>> +#include <mach/regs-clock.h>
>> +
>> +#include <plat/regs-serial.h>
>> +#include <plat/s5pv210.h>
>> +#include <plat/devs.h>
>> +#include <plat/cpu.h>
>> +#include <plat/adc.h>
>> +#include <plat/ts.h>
>> +
>> +
>> +
>> +/* Following are default values for UCON, ULCON and UFCON UART register=
s */
>> +#define SMDKV210_UCON_DEFAULT =A0 =A0 =A0 =A0(S3C2410_UCON_TXILEVEL | =
=A0 =A0 =A0 =A0\
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2410_UCO=
N_RXILEVEL | =A0 =A0 =A0 =A0\
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2410_UCO=
N_TXIRQMODE | =A0 =A0 =A0 \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2410_UCO=
N_RXIRQMODE | =A0 =A0 =A0 \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2410_UCO=
N_RXFIFO_TOI | =A0 =A0 =A0\
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2443_UCO=
N_RXERR_IRQEN)
>> +
>> +#define SMDKV210_ULCON_DEFAULT =A0 =A0 =A0 S3C2410_LCON_CS8
>> +
>> +#define SMDKV210_UFCON_DEFAULT =A0 =A0 =A0 (S3C2410_UFCON_FIFOMODE | =
=A0 =A0 =A0 \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_UFC=
ON_TXTRIG4 | =A0 =A0 =A0 =A0\
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_UFC=
ON_RXTRIG4)
>> +
>> +static struct s3c2410_uartcfg smdkv210_uartcfgs[] __initdata =3D {
>> + =A0 =A0 [0] =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 0,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDKV210_UCON_DE=
FAULT,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDKV210_ULCON_D=
EFAULT,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDKV210_UFCON_D=
EFAULT,
>> + =A0 =A0 },
>> + =A0 =A0 [1] =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDKV210_UCON_DE=
FAULT,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDKV210_ULCON_D=
EFAULT,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDKV210_UFCON_D=
EFAULT,
>> + =A0 =A0 },
>> + =A0 =A0 [2] =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 2,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDKV210_UCON_DE=
FAULT,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDKV210_ULCON_D=
EFAULT,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDKV210_UFCON_D=
EFAULT,
>> + =A0 =A0 },
>> + =A0 =A0 [3] =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 3,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D SMDKV210_UCON_DE=
FAULT,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D SMDKV210_ULCON_D=
EFAULT,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D SMDKV210_UFCON_D=
EFAULT,
>> + =A0 =A0 },
>> +};
>
> This looks like data that should be populated from parsing the device
> tree. =A0It shouldn't be implemented as statically allocated tables.
>
>> +static void __init smdkv210_map_io(void)
>> +{
>> + =A0 =A0 s5p_init_io(NULL, 0, S5P_VA_CHIPID);
>> + =A0 =A0 s3c24xx_init_clocks(24000000);
>> + =A0 =A0 s3c24xx_init_uarts(smdkv210_uartcfgs, ARRAY_SIZE(smdkv210_uart=
cfgs));
>
> As mentioned above, uart initialization data should be extracted from
> the device tree. =A0However, this isn't a showstopper issue, and I won't
> Nack the patch over it. =A0It just makes the board support more verbose
> than it needs to be.
>

Thanks for the review Grant. I will incorporate all your comments in
the next version of the
patches.

Regards
Shaju
