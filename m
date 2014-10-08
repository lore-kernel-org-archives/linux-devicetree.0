From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: cygnus: Initial support for Broadcom Cygnus
 SoC
Date: Wed, 8 Oct 2014 09:34:00 -0700
Message-ID: <54356778.4090101@broadcom.com>
References: <sbranden@broadcom.com> <1412746025-11998-1-git-send-email-sbranden@broadcom.com> <1412746025-11998-2-git-send-email-sbranden@broadcom.com> <CAL_JsqKD6F5xcUQx8T++uDK2zaqTneRwU+2yR7RMj==ArwcLcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKD6F5xcUQx8T++uDK2zaqTneRwU+2yR7RMj==ArwcLcA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>, JD Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree@vger.
List-Id: devicetree@vger.kernel.org

Thanks for comments - inline.

On 14-10-08 06:10 AM, Rob Herring wrote:
> On Wed, Oct 8, 2014 at 12:27 AM, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org=
> wrote:
>> From: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>
>> Adds initial support for the Cygnus SoC based on Broadcom=E2=80=99s =
iProc series.
>>
>> Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: Desmond Liu <desmondl-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: JD (Jiandong) Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Tested-by: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> ---
>>   arch/arm/mach-bcm/Kconfig      |   31 ++++++++
>>   arch/arm/mach-bcm/Makefile     |    3 +
>>   arch/arm/mach-bcm/bcm_cygnus.c |  166 ++++++++++++++++++++++++++++=
++++++++++++
>>   3 files changed, 200 insertions(+)
>>   create mode 100644 arch/arm/mach-bcm/bcm_cygnus.c
>>
>> diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
>> index fc93800..2dd3f78 100644
>> --- a/arch/arm/mach-bcm/Kconfig
>> +++ b/arch/arm/mach-bcm/Kconfig
>> @@ -5,6 +5,37 @@ menuconfig ARCH_BCM
>>
>>   if ARCH_BCM
>>
>> +config ARCH_BCM_IPROC
>> +       bool "Broadcom ARMv7 iProc boards" if ARCH_MULTI_V7
>> +       select ARM_GIC
>> +       select CACHE_L2X0
>> +       select HAVE_ARM_TWD if LOCAL_TIMERS
>
> LOCAL_TIMERS does not exist anymore.
Will change to if SMP so it will work for other iproc chips that have=20
SMP going forward.
>
>> +       select HAVE_CLK
>
> Selected already by multi-platform.
>
>> +       select CLKSRC_OF
>> +       select CLKSRC_MMIO
>
> These should be selected by the timers that need these rather than th=
e platform.
>
OK
>> +       select GENERIC_CLOCKEVENTS
>
> Selected already by multi-platform.
>
>> +       select ARM_GLOBAL_TIMER
>> +       select ARCH_REQUIRE_GPIOLIB
>> +       select ARM_AMBA
>> +       select PINCTRL
>> +       select DEBUG_UART_8250
>
> This entry should not be a select. It will break multi-platform.
Yes, this select will be removed from here in next version and moved to=
=20
kconfig.debug as other platforms do.
>
> Sort the select entries alphabetically.
>
>> +       help
>> +         This enables support for systems based on Broadcom IPROC a=
rchitected SoCs.
>> +         The IPROC complex contains one or more ARM CPUs along with=
 common
>> +         core periperals. Application specific SoCs are created by =
adding a
>> +         uArchitecture containing peripherals outside of the IPROC =
complex.
>> +         Currently supported SoCs are Cygnus.
>> +
>> +menu "iProc SoC based Machine types"
>> +       depends on ARCH_BCM_IPROC
>> +
>> +       config ARCH_BCM_CYGNUS
>> +               bool "Support Broadcom Cygnus board"
>> +               select USB_ARCH_HAS_EHCI if USB_SUPPORT
>> +               help
>> +                 Support for Broadcom Cygnus SoC.
>> +endmenu
>> +
>>   config ARCH_BCM_MOBILE
>>          bool "Broadcom Mobile SoC Support" if ARCH_MULTI_V7
>>          select ARCH_REQUIRE_GPIOLIB
>> diff --git a/arch/arm/mach-bcm/Makefile b/arch/arm/mach-bcm/Makefile
>> index b19a396..46e092a 100644
>> --- a/arch/arm/mach-bcm/Makefile
>> +++ b/arch/arm/mach-bcm/Makefile
>> @@ -10,6 +10,9 @@
>>   # of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>   # GNU General Public License for more details.
>>
>> +# Cygnus
>> +obj-$(CONFIG_ARCH_BCM_CYGNUS) +=3D  bcm_cygnus.o
>> +
>>   # BCM281XX
>>   obj-$(CONFIG_ARCH_BCM_281XX)   +=3D board_bcm281xx.o
>>
>> diff --git a/arch/arm/mach-bcm/bcm_cygnus.c b/arch/arm/mach-bcm/bcm_=
cygnus.c
>> new file mode 100644
>> index 0000000..8e430ed
>> --- /dev/null
>> +++ b/arch/arm/mach-bcm/bcm_cygnus.c
>> @@ -0,0 +1,166 @@
>> +/*
>> + * Copyright 2014 Broadcom Corporation.  All rights reserved.
>> + *
>> + * Unless you and Broadcom execute a separate written software lice=
nse
>> + * agreement governing use of this software, this software is licen=
sed to you
>> + * under the terms of the GNU General Public License as
>> + * published by the Free Software Foundation version 2.
>> + *
>> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any
>> + * kind, whether express or implied; without even the implied warra=
nty
>> + * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include <linux/of_address.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/clocksource.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/delay.h>
>> +#include <asm/mach/arch.h>
>> +#include <asm/mach/map.h>
>> +#include <asm/proc-fns.h>
>> +#include <asm/hardware/cache-l2x0.h>
>> +
>> +#define CRMU_MAIL_BOX1      0x03024028
>> +#define CRMU_SOFT_RESET_CMD 0xFFFFFFFF
>> +
>> +/* CRU_RESET register */
>> +static void * __iomem crmu_mail_box1_reg;
>> +
>> +#ifdef CONFIG_NEON
>> +
>> +#define CRU_BASE                  0x1800e000
>> +#define CRU_SIZE                  0x34
>> +#define CRU_CONTROL_OFFSET        0x0
>> +#define CRU_PWRDWN_EN_OFFSET      0x4
>> +#define CRU_PWRDWN_STATUS_OFFSET  0x8
>> +#define CRU_NEON0_HW_RESET  6
>> +#define CRU_CLAMP_ON_NEON0  20
>> +#define CRU_PWRONIN_NEON0   21
>> +#define CRU_PWRONOUT_NEON0  21
>> +#define CRU_PWROKIN_NEON0   22
>> +#define CRU_PWROKOUT_NEON0  22
>> +#define CRU_STATUS_DELAY_NS 500
>> +#define CRU_MAX_RETRY_COUNT 10
>> +#define CRU_RETRY_INTVL_US  1
>> +
>> +/* Power up the NEON/VFPv3 block. */
>> +static void bcm_cygnus_powerup_neon(void)
>> +{
>> +       void * __iomem cru_base =3D ioremap(CRU_BASE, CRU_SIZE);
>> +       u32 reg, i;
>> +
>> +       if (WARN_ON(!cru_base))
>> +               return;
>> +
>> +       /* De-assert the neon hardware block reset */
>> +       reg =3D readl(cru_base + CRU_CONTROL_OFFSET);
>> +       reg &=3D ~(1 << CRU_NEON0_HW_RESET);
>> +       writel(reg, cru_base + CRU_CONTROL_OFFSET);
>> +
>> +       /* Assert the power ON register bit */
>> +       reg =3D readl(cru_base + CRU_PWRDWN_EN_OFFSET);
>> +       reg |=3D (1 << CRU_PWRONIN_NEON0);
>> +       writel(reg, cru_base + CRU_PWRDWN_EN_OFFSET);
>> +
>> +       /*
>> +        * Wait up to 10 usec in 1 usec increments for the
>> +        * status register to acknowledge the power ON assert
>> +        */
>> +       for (i =3D 0; i < CRU_MAX_RETRY_COUNT; i++) {
>> +               reg =3D readl(cru_base + CRU_PWRDWN_STATUS_OFFSET);
>> +               if (reg & CRU_PWRONOUT_NEON0)
>> +                       break;
>> +
>> +               udelay(CRU_RETRY_INTVL_US);
>> +       }
>> +
>> +       if (WARN_ON(i =3D=3D CRU_MAX_RETRY_COUNT))
>> +               goto neon_unmap;
>> +
>> +       /* Wait 0.5 usec =3D 500 nsec */
>> +       ndelay(CRU_STATUS_DELAY_NS);
>> +
>> +       /* Assert the power OK register bit */
>> +       reg =3D readl(cru_base + CRU_PWRDWN_EN_OFFSET);
>> +       reg |=3D (1 << CRU_PWROKIN_NEON0);
>> +       writel(reg, cru_base + CRU_PWRDWN_EN_OFFSET);
>> +
>> +       /*
>> +        * Wait up to 10 usec in 1 usec increments for the
>> +        * status register to acknowledge the power OK assert
>> +        */
>> +       for (i =3D 0; i < CRU_MAX_RETRY_COUNT; i++) {
>> +               reg =3D readl(cru_base + CRU_PWRDWN_STATUS_OFFSET);
>> +               if (reg & CRU_PWROKOUT_NEON0)
>> +                       break;
>> +
>> +               udelay(CRU_RETRY_INTVL_US);
>> +       }
>> +
>> +       if (WARN_ON(i =3D=3D CRU_MAX_RETRY_COUNT))
>> +               goto neon_unmap;
>> +
>> +       /* Wait 0.5 usec =3D 500 nsec */
>> +       ndelay(CRU_STATUS_DELAY_NS);
>> +
>> +       /* Set the logic clamp for the neon block */
>> +       reg =3D readl(cru_base + CRU_PWRDWN_EN_OFFSET);
>> +       reg &=3D ~(1 << CRU_CLAMP_ON_NEON0);
>> +       writel(reg, cru_base + CRU_PWRDWN_EN_OFFSET);
>> +
>> +       /* Wait 0.5 usec =3D 500 nsec */
>> +       ndelay(CRU_STATUS_DELAY_NS);
>> +
>> +       /* Reset the neon hardware block */
>> +       reg =3D readl(cru_base + CRU_CONTROL_OFFSET);
>> +       reg |=3D (1 << CRU_NEON0_HW_RESET);
>> +       writel(reg, cru_base + CRU_CONTROL_OFFSET);
>> +
>> +neon_unmap:
>> +       iounmap(cru_base);
>> +}
>> +#endif /* CONFIG_NEON */
>
> Is this a single core chip? If not, it seems like all this would
> change when you add SMP support.
Cygnus is a single core chip.  There are other chips in the IPROC famil=
y=20
that are multi-core.  But they are not part of the Cygnus=20
sub-architecture and would have different ways of powering up.  These=20
will be added in a different patch in the future.
>
> Rob
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
