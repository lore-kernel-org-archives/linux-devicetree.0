From: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: cygnus: Initial support for Broadcom Cygnus
 SoC
Date: Thu, 18 Sep 2014 16:33:08 -0700
Message-ID: <541B6BB4.50301@broadcom.com>
References: <jonathar@broadcom.com> <1410897497-27527-1-git-send-email-jonathar@broadcom.com> <1410897497-27527-2-git-send-email-jonathar@broadcom.com> <20140917000018.GI14191@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140917000018.GI14191@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, JD Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

Thanks for the feedback.

On 14-09-16 05:00 PM, Mark Rutland wrote:
> On Tue, Sep 16, 2014 at 08:58:12PM +0100, Jonathan Richardson wrote:
>> Adds initial support for the Cygnus SoC based on Broadcom=E2=80=99s =
iProc series.
>>
>> Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: Desmond Liu <desmondl-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: JD (Jiandong) Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Tested-by: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> ---
>>  arch/arm/mach-bcm/Kconfig            |   34 +++++++
>>  arch/arm/mach-bcm/Makefile           |    3 +
>>  arch/arm/mach-bcm/board_bcm_cygnus.c |  166 +++++++++++++++++++++++=
+++++++++++
>=20
> Is Cygnus an SoC or a board?

SoC. I will rename it to bcm_cygnus.c

>=20
>>  3 files changed, 203 insertions(+)
>>  create mode 100644 arch/arm/mach-bcm/board_bcm_cygnus.c
>>
>> diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
>> index fc93800..58e0f20 100644
>> --- a/arch/arm/mach-bcm/Kconfig
>> +++ b/arch/arm/mach-bcm/Kconfig
>> @@ -5,6 +5,40 @@ menuconfig ARCH_BCM
>> =20
>>  if ARCH_BCM
>> =20
>> +config ARCH_BCM_IPROC
>> +	bool "Broadcom ARMv7 iProc boards" if ARCH_MULTI_V7
>> +	select ARM_GIC
>> +	select CACHE_L2X0
>> +	select HAVE_ARM_SCU if SMP
>=20
> I didn't spot any SMP code in this series.

It's single core. Will fix.
>=20
>> +	select HAVE_ARM_TWD if LOCAL_TIMERS
>> +	select HAVE_CLK
>> +	select CLKSRC_OF
>> +	select CLKSRC_MMIO
>> +	select LOCAL_TIMERS if SMP
>> +	select GENERIC_CLOCKEVENTS_BUILD
>=20
> You don't need to select this.

Will fix.
>=20
>> +	select GENERIC_CLOCKEVENTS
>> +	select ARM_GLOBAL_TIMER
>> +	select ARCH_REQUIRE_GPIOLIB
>> +	select ARM_AMBA
>> +	select PINCTRL
>> +	select DEBUG_UART_8250
>> +	help
>> +	  This enables support for systems based on Broadcom IPROC archite=
cted SoCs.
>> +	  The IPROC complex contains one or more ARM CPUs along with commo=
n
>> +	  core periperals. Application specific SoCs are created by adding=
 a
>> +	  uArchitecture containing peripherals outside of the IPROC comple=
x.
>> +	  Currently supported SoCs are Cygnus.
>> +
>> +menu "iProc SoC based Machine types"
>> +	depends on ARCH_BCM_IPROC
>> +
>> +	config ARCH_BCM_CYGNUS
>> +		bool "Support Broadcom Cygnus board"
>> +		select USB_ARCH_HAS_EHCI if USB_SUPPORT
>> +		help
>> +		  Support for Broadcom Cygnus SoC.
>> +endmenu
>> +
>>  config ARCH_BCM_MOBILE
>>  	bool "Broadcom Mobile SoC Support" if ARCH_MULTI_V7
>>  	select ARCH_REQUIRE_GPIOLIB
>> diff --git a/arch/arm/mach-bcm/Makefile b/arch/arm/mach-bcm/Makefile
>> index b19a396..dd14a10 100644
>> --- a/arch/arm/mach-bcm/Makefile
>> +++ b/arch/arm/mach-bcm/Makefile
>> @@ -10,6 +10,9 @@
>>  # of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>  # GNU General Public License for more details.
>> =20
>> +# Cygnus
>> +obj-$(CONFIG_ARCH_BCM_CYGNUS) +=3D  board_bcm_cygnus.o
>> +
>>  # BCM281XX
>>  obj-$(CONFIG_ARCH_BCM_281XX)	+=3D board_bcm281xx.o
>> =20
>> diff --git a/arch/arm/mach-bcm/board_bcm_cygnus.c b/arch/arm/mach-bc=
m/board_bcm_cygnus.c
>> new file mode 100644
>> index 0000000..d67555a
>> --- /dev/null
>> +++ b/arch/arm/mach-bcm/board_bcm_cygnus.c
>> @@ -0,0 +1,166 @@
>> +/*
>> + * Copyright 2014 Broadcom Corporation.  All rights reserved.
>> + *
>> + * Unless you and Broadcom execute a separate written software lice=
nse
>> + * agreement governing use of this software, this software is licen=
sed to you
>> + * under the terms of the GNU General Public License version 2, ava=
ilable at
>> + * http://www.broadcom.com/licenses/GPLv2.php (the "GPL").
>=20
> Why don't we point at the gnu.org copy as we do elsewhere?
>

I am enquiring.

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
>=20
> Please don't hard code addresses in board files.

Would a separate header file be sufficient? I notice this approach was
taken in vexpress A9x4 (out of date?). I couldn't find a home for them
in dt and I don't think anyone would want to see them there. They
shouldn't ever change.

We have a couple of more addresses that will be added in future
revisions of this file for DMA and LCD (for reset/power up procedures),
as those drivers are added.

>=20
>> +#define CRMU_SOFT_RESET_CMD 0xFFFFFFFF
>> +
>> +/* CRU_RESET register */
>> +static void * __iomem crmu_mail_box1_reg;
>> +
>> +#ifdef CONFIG_NEON
>> +
>> +#define CRU_BASE                  0x1800e000
>=20
> Another hard coded address that needs to go.
>=20
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
>> +	void * __iomem cru_base =3D ioremap_nocache(CRU_BASE, CRU_SIZE);
>=20
> Why not plain ioremap?
>=20
>> +	u32 reg, i;
>> +
>> +	BUG_ON(!cru_base);
>=20
> This seems a little extreme. Can;t we continue without NEON?

We can yes. The reason for this was to prevent difficult troubleshootin=
g
if it ever failed. But a WARN_ON would probably be sufficient.

>=20
>> +
>> +	/* De-assert the neon hardware block reset */
>> +	reg =3D readl(cru_base + CRU_CONTROL_OFFSET);
>> +	reg &=3D ~(1 << CRU_NEON0_HW_RESET);
>> +	writel(reg, cru_base + CRU_CONTROL_OFFSET);
>> +
>> +	/* Assert the power ON register bit */
>> +	reg =3D readl(cru_base + CRU_PWRDWN_EN_OFFSET);
>> +	reg |=3D (1 << CRU_PWRONIN_NEON0);
>> +	writel(reg, cru_base + CRU_PWRDWN_EN_OFFSET);
>> +
>> +	/*
>> +	 * Wait up to 10 usec in 1 usec increments for the
>> +	 * status register to acknowledge the power ON assert
>> +	 */
>> +	for (i =3D 0; i < CRU_MAX_RETRY_COUNT; i++) {
>> +		reg =3D readl(cru_base + CRU_PWRDWN_STATUS_OFFSET);
>> +		if (reg & CRU_PWRONOUT_NEON0)
>> +			break;
>> +
>> +		udelay(CRU_RETRY_INTVL_US);
>> +	}
>> +
>> +	if (i =3D=3D CRU_MAX_RETRY_COUNT)
>> +		panic("NEON power ON register not acknowledged\n");
>=20
> We can't just disable NEON if we fail to enable the HW block?
>=20
> [...]
>=20
>> +static void __init bcm_cygnus_timer_init(void)
>> +{
>> +	/* Initialize all clocks declared in device tree */
>> +	of_clk_init(NULL);
>> +
>> +	clocksource_of_init();
>> +}
>=20
> If you take a look at time_init in arch/arm/kernel/time.c you'll see
> this is redundant.

Will fix.

>=20
> Get rid of this.
>=20
>> +
>> +static void __init bcm_cygnus_init(void)
>> +{
>> +	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL)=
;
>> +
>> +	l2x0_of_init(0, ~0UL);
>> +
>> +	crmu_mail_box1_reg =3D ioremap_nocache(CRMU_MAIL_BOX1, SZ_4);
>=20
> Why not plain ioremap?

I will change them to ioremap.

>=20
>> +	BUG_ON(!crmu_mail_box1_reg);
>=20
> We only use this for reboot later on, so do we need to blow up so
> spectacularly in this case?

Will fix.

>=20
>> +
>> +#ifdef CONFIG_NEON
>> +	bcm_cygnus_powerup_neon();
>> +#endif
>> +}
>> +
>> +/*
>> + * Reset the system
>> + */
>> +void bcm_cygnus_restart(enum reboot_mode mode, const char *cmd)
>> +{
>> +	/* Send reset command to M0 via Mailbox. */
>> +	writel(CRMU_SOFT_RESET_CMD, crmu_mail_box1_reg);
>> +	iounmap(crmu_mail_box1_reg);
>> +
>> +	/* Wait for M0 to reset the chip. */
>> +	while (1)
>> +		cpu_do_idle();
>> +}
>=20
> This doesn't have to live in the machine descriptor. It could be a
> separate driver.

I'm not sure if a separate driver is the way we want to go with this
right now. If we had more of this M0 communication then I would agree,
and we may in the future. But if we don't then there would just be a
reset handler in the driver. If more interaction and a driver is
required we would move this to a driver.

Was your suggestion more related to the hard coded addresses in this
file or the mysterious nature of the reset procedure?

>=20
> Thanks,
> Mark.
>=20

Thanks.
Jon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
