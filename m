From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH 10/12] ARM: vf610m4: add new machine and SoC for Vybrid
 on Cortex-M4
Date: Wed, 03 Dec 2014 19:00:34 +0100
Message-ID: <81685103c8799e70ea25e5029d2ae7e5@agner.ch>
References: <1417565531-4507-1-git-send-email-stefan@agner.ch>
 <1417565531-4507-11-git-send-email-stefan@agner.ch>
 <2188062.Vg1qCai6yo@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2188062.Vg1qCai6yo@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014-12-03 11:56, Arnd Bergmann wrote:
> On Wednesday 03 December 2014 01:12:09 Stefan Agner wrote:
>> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> index 89c4b5c..fdebe18 100644
>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -459,6 +459,18 @@ config ARCH_FOOTBRIDGE
>>  	  Support for systems based on the DC21285 companion chip
>>  	  ("FootBridge"), such as the Simtec CATS and the Rebel NetWinder.
>>
>> +menuconfig ARCH_MXCM4
>> +	bool "Freescale Vybrid/i.MX family on Cortex-M4" if !MMU
>> +	select ARCH_REQUIRE_GPIOLIB
>> +	select ARM_CPU_SUSPEND if PM
>> +	select CLKSRC_MMIO
>> +	select GENERIC_IRQ_CHIP
>> +	select PINCTRL
>> +	select PM_OPP if PM
>> +	select SOC_BUS
>> +	help
>> +	  Support for Freescale Vybrid/iMX-based family of processors on Cortex-M4
>> +
>>  config ARCH_NETX
>>  	bool "Hilscher NetX based"
>>  	select ARM_VIC
> 
> I would really prefer not to see any more standalone machine types,
> but rather have ARMv7-M as one of the options for the
> multiplatform configuration. In particular, that would let us
> do *build* testing on a combined mxcm4/efm32/vexpress kernel,
> although that kernel would clearly not be usable anywhere
> because of the restrictions of nommu machines.

Yes me too, but as I pointed out in the cover letter, I'm not sure I'm
up to that task.... I'm not at all in a hurry with the Vybrid M4 Linux
stuff, so I can wait until that is resolved or maybe try to resolve that
myself (again)...

Beside that the multi-platform would help do build tests, Vybrid is also
a nice platform to do smoke tests on a !MMU platform. Uwe would be happy
about that, as he discovered that !MMU was broken for several releases
lately :-)

> 
>> +static void __init vf610m4_init_irq(void)
>> +{
>> +	vf610_mscm_init();
>> +	irqchip_init();
>> +}
> 
> Can you make vf610_mscm_init get called from irqchip and remove this
> function?
> 

I guess you mean by IRQCHIP_DECLARE? I hesitated to do this since I only
found drivers in drivers/irqchip using that. However, MSCM is currently
part of mach-imx. First I used arch_extn to implement the functionality,
so I thought it really fits more into arch. But I guess when it is a
normal irqchip driver, I will have to move it anyway, despite the fact
that it is only available on Vybrid....?

--
Stefan


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
