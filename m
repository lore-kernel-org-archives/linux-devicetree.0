From: "Suzuki K. Poulose" <Suzuki.Poulose-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/4] arm-cci: Split the code for PMU vs driver support
Date: Wed, 25 Feb 2015 10:26:12 +0000
Message-ID: <54EDA344.2040004@arm.com>
References: <1424783863-9894-1-git-send-email-suzuki.poulose@arm.com> <1424783863-9894-4-git-send-email-suzuki.poulose@arm.com> <alpine.LFD.2.11.1502241659270.25484@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.11.1502241659270.25484-fMhRO7WWcppj+hNMo8g0rg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Punit Agrawal <Punit.Agrawal-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 24/02/15 22:17, Nicolas Pitre wrote:
> On Tue, 24 Feb 2015, Suzuki K. Poulose wrote:
>
>> From: "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
>>
>> This patch separates the PMU driver code from the low level
>> CCI driver code, and enables the CCI400-PMU for ARM64.
>>
>> Introduces config options for both.
>>
>>   - ARM_CCI400_MCPM	- controls the low level MCPM driver code for CCI
>>   - ARM_CCI400_PMU	- controls the PMU driver code
>>   - ARM_CCI400_COMMON	- CCI400 specific details shared by MCPM
>> 			  and PMU
>> Changes:
>>   - ARM_CCI 		- common code for probing the CCI devices
>>
>> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
>> Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
>> Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>> Signed-off-by: Suzuki K. Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
>
> Comments inline.
>
>> ---
>>   arch/arm/mach-exynos/Kconfig   |    2 +-
>>   arch/arm/mach-vexpress/Kconfig |    4 ++--
>>   drivers/bus/Kconfig            |   28 +++++++++++++++++++++++-----
>>   drivers/bus/arm-cci.c          |   25 +++++++++++++++++++++----
>>   include/linux/arm-cci.h        |    7 ++++++-
>>   5 files changed, 53 insertions(+), 13 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
>> index 603820e..9bc8b4d 100644
>> --- a/arch/arm/mach-exynos/Kconfig
>> +++ b/arch/arm/mach-exynos/Kconfig
>> @@ -123,7 +123,7 @@ config SOC_EXYNOS5800
>>   config EXYNOS5420_MCPM
>>   	bool "Exynos5420 Multi-Cluster PM support"
>>   	depends on MCPM && SOC_EXYNOS5420
>> -	select ARM_CCI
>> +	select ARM_CCI400_MCPM
>>   	select ARM_CPU_SUSPEND
>>   	help
>>   	  This is needed to provide CPU and cluster power management
>> diff --git a/arch/arm/mach-vexpress/Kconfig b/arch/arm/mach-vexpress/Kconfig
>> index d6b16d9..097912f 100644
>> --- a/arch/arm/mach-vexpress/Kconfig
>> +++ b/arch/arm/mach-vexpress/Kconfig
>> @@ -53,7 +53,7 @@ config ARCH_VEXPRESS_CORTEX_A5_A9_ERRATA
>>   config ARCH_VEXPRESS_DCSCB
>>   	bool "Dual Cluster System Control Block (DCSCB) support"
>>   	depends on MCPM
>> -	select ARM_CCI
>> +	select ARM_CCI400_MCPM
>>   	help
>>   	  Support for the Dual Cluster System Configuration Block (DCSCB).
>>   	  This is needed to provide CPU and cluster power management
>> @@ -71,7 +71,7 @@ config ARCH_VEXPRESS_SPC
>>   config ARCH_VEXPRESS_TC2_PM
>>   	bool "Versatile Express TC2 power management"
>>   	depends on MCPM
>> -	select ARM_CCI
>> +	select ARM_CCI400_MCPM
>>   	select ARCH_VEXPRESS_SPC
>>   	help
>>   	  Support for CPU and cluster power management on Versatile Express
>> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
>> index b99729e..91dd013 100644
>> --- a/drivers/bus/Kconfig
>> +++ b/drivers/bus/Kconfig
>> @@ -43,12 +43,30 @@ config OMAP_INTERCONNECT
>>   	help
>>   	  Driver to enable OMAP interconnect error handling driver.
>>
>> -config ARM_CCI
>> -	bool "ARM CCI driver support"
>> -	depends on ARM && OF && CPU_V7
>> +config ARM_CCI400_MCPM
>> +	bool
>> +	depends on ARM && OF && CPU_V7 && MCPM
>
> MCPM is not an actual dependency and therefore should probably not be
> added here.
OK, will remove that.

> You removed the prompt string therefore this will only be
> selectable explicitly as needed.
This was intentional, I missed mentioning about it. Do you think we
need to change it back ?
>
> Also, shouldn't it select ARM_CCI400_COMMON ?
Thanks for that, yes it should.
>
>> +	help
>> +	  Low level power management driver for CCI400 cache coherent
>> +	  interconnect for ARM platforms.
>> +
>> +config ARM_CCI400_PMU
>> +	bool "ARM CCI400 PMU support"
>> +	depends on ARM || ARM64
>> +	depends on HW_PERF_EVENTS
>> +	select ARM_CCI400_COMMON
>>   	help
>> -	  Driver supporting the CCI cache coherent interconnect for ARM
>> -	  platforms.
>> +	  Support for PMU events monitoring on the ARM CCI cache coherent
>> +	  interconnect.
>> +
>> +	  If unsure, say N
>> +
>> +config ARM_CCI400_COMMON
>> +	bool
>> +	select ARM_CCI
>> +
>> +config ARM_CCI
>> +	bool
>
> Surely you could do with only one of ARM_CCI or ARM_CCI400_COMMON?
> Personally I'd go with the later as it is more precise.

The ARM_CCI now stands for CCI version agnostic code. This can be used
for adding support for the newer versions, e.g CCI-500, which I am
planning to post, after this series gets sorted out.


>
>>   config ARM_CCN
>>   	bool "ARM CCN driver support"
>> diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
>> index fe9fa46..7e330fe 100644
>> --- a/drivers/bus/arm-cci.c
>> +++ b/drivers/bus/arm-cci.c
>> @@ -32,6 +32,7 @@
>>   static void __iomem *cci_ctrl_base;
>>   static unsigned long cci_ctrl_phys;
>>
>> +#ifdef CONFIG_ARM_CCI400_MCPM
>>   struct cci_nb_ports {
>>   	unsigned int nb_ace;
>>   	unsigned int nb_ace_lite;
>> @@ -42,12 +43,19 @@ static const struct cci_nb_ports cci400_ports = {
>>   	.nb_ace_lite = 3
>>   };
>>
>> +#define CCI400_MCPM_PORTS_DATA	(&cci400_ports)
>
> I'm a bit uneasy with the conflation of MCPM in here.  Sure (most) MCPM
> backends are the only users of this code, but that doesn't mean MCPM has
> to have exclusive access.  Having "MCPM" entranched into the code and
> config symbols like that is misrepresenting this code somewhat.
So, would you like to change the ARM_CCI400_MCPM as well, to something like:
	ARM_CCI400_DRIVER or even ARM_CCI400_LL_DRIVER ?

>
>> +#else
>> +#define CCI400_MCPM_PORTS_DATA	(NULL)
>> +#endif
>> +
>>   static const struct of_device_id arm_cci_matches[] = {
>> -	{.compatible = "arm,cci-400", .data = &cci400_ports },
>> +#ifdef CONFIG_ARM_CCI400_COMMON
>> +	{.compatible = "arm,cci-400", .data = CCI400_MCPM_PORTS_DATA },
>> +#endif
>>   	{},
>>   };
>>
>> -#ifdef CONFIG_HW_PERF_EVENTS
>> +#ifdef CONFIG_ARM_CCI400_PMU
>>
>>   #define DRIVER_NAME		"CCI-400"
>>   #define DRIVER_NAME_PMU		DRIVER_NAME " PMU"
>> @@ -981,6 +989,7 @@ static int cci_pmu_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>
>> +	pr_info("ARM %s PMU driver probed", pmu->model->name);
>
> Wouldn't this addition fit better in one of the previous patches?
Yes, it could have been moved to the previous one, will fix it in the 
next revision.


Thanks
Suzuki


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
