From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: cygnus: Initial support for Broadcom Cygnus
 SoC
Date: Wed, 8 Oct 2014 09:27:08 -0700
Message-ID: <543565DC.8010704@broadcom.com>
References: <1412746025-11998-2-git-send-email-sbranden@broadcom.com> <4255803.4lcNtQPo2T@wuerfel> <54352DAC.3080001@broadcom.com> <10762659.VISiZ3vSSN@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10762659.VISiZ3vSSN@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, JD Zheng <jdzheng-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 14-10-08 06:28 AM, Arnd Bergmann wrote:
> On Wednesday 08 October 2014 05:27:24 Scott Branden wrote:
>>>> diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
>>>> index fc93800..2dd3f78 100644
>>>> --- a/arch/arm/mach-bcm/Kconfig
>>>> +++ b/arch/arm/mach-bcm/Kconfig
>>>> @@ -5,6 +5,37 @@ menuconfig ARCH_BCM
>>>>
>>>>    if ARCH_BCM
>>>>
>>>> +config ARCH_BCM_IPROC
>>>> +	bool "Broadcom ARMv7 iProc boards" if ARCH_MULTI_V7
>>>> +	select ARM_GIC
>>>> +	select CACHE_L2X0
>>>> +	select HAVE_ARM_TWD if LOCAL_TIMERS
>>>> +	select HAVE_CLK
>>>> +	select CLKSRC_OF
>>>> +	select CLKSRC_MMIO
>>>> +	select GENERIC_CLOCKEVENTS
>>>> +	select ARM_GLOBAL_TIMER
>>>> +	select ARCH_REQUIRE_GPIOLIB
>>>> +	select ARM_AMBA
>>>> +	select PINCTRL
>>>> +	select DEBUG_UART_8250
>>>
>>> A lot of these are implied by ARCH_MULTI_V7, just drop them here.
>>>
>>> Some others like DEBUG_UART_8250 should remain user-selectable, if
>>> the platform works without them.
>>>
>> Will review.  It looks like DEBUG_UART_8250 actually has to move to
>> Kconfig.debug as that is where everyone else selects it.
>
> Actually I think you also need to use DEBUG_LL_UART_8250 rather than
> DEBUG_UART_8250.
>
>>>> +	help
>>>> +	  This enables support for systems based on Broadcom IPROC architected SoCs.
>>>> +	  The IPROC complex contains one or more ARM CPUs along with common
>>>> +	  core periperals. Application specific SoCs are created by adding a
>>>> +	  uArchitecture containing peripherals outside of the IPROC complex.
>>>> +	  Currently supported SoCs are Cygnus.
>>>> +
>>>> +menu "iProc SoC based Machine types"
>>>> +	depends on ARCH_BCM_IPROC
>>>> +
>>>> +	config ARCH_BCM_CYGNUS
>>>> +		bool "Support Broadcom Cygnus board"
>>>> +		select USB_ARCH_HAS_EHCI if USB_SUPPORT
>>>> +		help
>>>> +		  Support for Broadcom Cygnus SoC.
>>>> +endmenu
>>>
>>> I don't think you need per-board config options. The main option
>>> above should be enough.
>> This is not a per-board config option.  This is actually a per-SoC
>> uArchtecture selection.  More major uArchectures will be added to the
>> IPROC.  Will Change comment to "Support Broadcom Cygnus SoC"
>
> Ok, sounds fine, but remove ARCH_BCM_IPROC then. There should be
> no need for a three-level deep hierarchy (BCM -> IPROC -> CYGNUS)
>
I do not need a 3-deep hierarchy, I need a 2-deep hierarchy for IPROC 
and CYGNUS (and future SoCs that have IPROC Architecture in common).  I 
can move IPROC out of the mach-bcm directory if you like a create a new 
directory?  But it looks like the purpose of mach-bcm is to consolidate 
all Broadcom chipsets in it?
>
>>>> +/* CRU_RESET register */
>>>> +static void * __iomem crmu_mail_box1_reg;
>>>> +
>>>> +#ifdef CONFIG_NEON
>>>> +
>>>> +#define CRU_BASE                  0x1800e000
>>>> +#define CRU_SIZE                  0x34
>>>> +#define CRU_CONTROL_OFFSET        0x0
>>>> +#define CRU_PWRDWN_EN_OFFSET      0x4
>>>> +#define CRU_PWRDWN_STATUS_OFFSET  0x8
>>>> +#define CRU_NEON0_HW_RESET  6
>>>> +#define CRU_CLAMP_ON_NEON0  20
>>>> +#define CRU_PWRONIN_NEON0   21
>>>> +#define CRU_PWRONOUT_NEON0  21
>>>> +#define CRU_PWROKIN_NEON0   22
>>>> +#define CRU_PWROKOUT_NEON0  22
>>>> +#define CRU_STATUS_DELAY_NS 500
>>>> +#define CRU_MAX_RETRY_COUNT 10
>>>> +#define CRU_RETRY_INTVL_US  1
>>>> +
>>>> +/* Power up the NEON/VFPv3 block. */
>>>> +static void bcm_cygnus_powerup_neon(void)
>>>> +{
>>>> +	void * __iomem cru_base = ioremap(CRU_BASE, CRU_SIZE);
>>>> +	u32 reg, i;
>>>
>>> Same thing here: this should really use the device node for CRU.
>>>
>>> Can you describe what the CRU is? Is this specific to NEON or is
>>> it some general-purpose power management unit?
>>>
>> It's a central resource unit with a lot of random registers to perform
>> various operations.  To reduce confusion I'll probably move this out of
>> the kernel init and into the bootloader.  This will simplify the kernel
>> init.
>
> That would help too, yes.
>
>>>> +
>>>> +static const char const *bcm_cygnus_dt_compat[] = {
>>>> +	"brcm,cygnus",
>>>> +	NULL,
>>>> +};
>>>> +
>>>> +DT_MACHINE_START(BCM_CYGNUS_DT, "Broadcom Cygnus SoC")
>>>> +	.init_machine = bcm_cygnus_init,
>>>> +	.map_io = debug_ll_io_init,
>>>> +	.dt_compat = bcm_cygnus_dt_compat,
>>>> +	.restart   = bcm_cygnus_restart
>>>> +MACHINE_END
>>>
>>> The map_io pointer is unnecessary, and the restart pointer should get
>>> set by the reset driver. I hope we can find a way to avoid the
>>> bcm_cygnus_init callback as well.
>> bcm_cygnus_init callback can be removed by moving initialization to
>> bootloader.
>
> Ok, perfect!
>
> 	Arnd
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
