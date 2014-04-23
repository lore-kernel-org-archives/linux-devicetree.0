From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/3] arm: exynos: Add MCPM call-back functions
Date: Wed, 23 Apr 2014 22:56:57 +0200
Message-ID: <53582919.1040905@linaro.org>
References: <1397239311-27717-6-git-send-email-a.kesavan@samsung.com>	<1398147435-3122-1-git-send-email-a.kesavan@samsung.com>	<535650AE.90501@linaro.org> <CAM4voa=WJiF-9wZB29JOFhz2kEE-TC0y6h-8GVwk3_JoXxpK+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAM4voa=WJiF-9wZB29JOFhz2kEE-TC0y6h-8GVwk3_JoXxpK+A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas P Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "mark.rutland" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, robh+dt <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/23/2014 05:31 PM, Abhilash Kesavan wrote:
> Hi Daniel,
> On Tue, Apr 22, 2014 at 4:51 PM, Daniel Lezcano
> <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On 04/22/2014 08:17 AM, Abhilash Kesavan wrote:
>>>
>>> Add machine-dependent MCPM call-backs for Exynos5420. These are use=
d
>>> to power up/down the secondary CPUs during boot, shutdown, s2r and
>>> switching.
>>>
>>> Signed-off-by: Thomas Abraham <thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> Signed-off-by: Inderpal Singh <inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>>> Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> ---

[ ... ]

>>> +#include <plat/cpu.h>
>>> +#include "regs-pmu.h"
>>> +
>>> +#define EXYNOS5420_CPUS_PER_CLUSTER    4
>>> +#define EXYNOS5420_NR_CLUSTERS         2
>>> +
>>> +/* Secondary CPU entry point */
>>> +#define REG_ENTRY_ADDR         (S5P_VA_SYSRAM_NS + 0x1C)
>>> +
>>> +#define EXYNOS_CORE_LOCAL_PWR_EN               0x3
>>> +#define EXYNOS_CORE_LOCAL_PWR_DIS              0x0
>>>
>>> +#define EXYNOS_ARM_COMMON_CONFIGURATION                S5P_PMUREG(=
0x2500)
>>> +#define EXYNOS_ARM_L2_CONFIGURATION            S5P_PMUREG(0x2600)
>>> +
>>> +#define EXYNOS_ARM_CORE_CONFIGURATION(_nr)     \
>>> +                       (S5P_ARM_CORE0_CONFIGURATION + ((_nr) * 0x8=
0))
>>> +#define EXYNOS_ARM_CORE_STATUS(_nr)            \
>>> +                       (S5P_ARM_CORE0_STATUS + ((_nr) * 0x80))
>>> +
>>> +#define EXYNOS_COMMON_CONFIGURATION(_nr)       \
>>> +                       (EXYNOS_ARM_COMMON_CONFIGURATION + ((_nr) *=
 0x80))
>>> +#define EXYNOS_COMMON_STATUS(_nr)              \
>>> +                       (EXYNOS_COMMON_CONFIGURATION(_nr) + 0x4)
>>> +
>>> +#define EXYNOS_L2_CONFIGURATION(_nr)           \
>>> +                       (EXYNOS_ARM_L2_CONFIGURATION + ((_nr) * 0x8=
0))
>>> +#define EXYNOS_L2_STATUS(_nr)                  \
>>> +                       (EXYNOS_L2_CONFIGURATION(_nr) + 0x4)
>>> +
>>
>>
>> Is it possible to share the definition of those macros with the rest=
 of the
>> code via functions, so they can be re-used for the other sub-systems=
 ? eg:
>> https://patches.linaro.org/27798/
> OK..I will work on making wrapper functions for these. Would these ne=
w
> functions be better placed in the mcpm code or the pm code ?

Hi Abhilash,

yes, in the pm code. That would make more sense.

Thanks
   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
