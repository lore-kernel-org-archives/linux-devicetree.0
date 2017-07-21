From: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] dma: Add Spreadtrum DMA controller driver
Date: Fri, 21 Jul 2017 11:27:43 +0800
Message-ID: <CAMz4ku+Vcc3LO8wGTT8QjdwWwtZAwFBMJW0uD=Z5uNVRgyO3zw@mail.gmail.com>
References: <63f2b93b3e484862f736e37d6d422b5566637163.1500361078.git.baolin.wang@spreadtrum.com>
 <4331ea088a26f515fe1f1912c568bfd07d539e9d.1500361078.git.baolin.wang@spreadtrum.com>
 <CAAfSe-sf=a_tAQm7rrnfUtOePRqvQrkmbN_M0hxSvLQ1KgocMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAfSe-sf=a_tAQm7rrnfUtOePRqvQrkmbN_M0hxSvLQ1KgocMA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Chunyan,

On 21 July 2017 at 10:50, Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Baolin,
>
> On 18 July 2017 at 15:06, Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org> wrote:
>> This patch adds the DMA controller driver for Spreadtrum SC9860 platform.
>
> I guess this driver is not only for SC9860, instead it should work for
> all most all Spreadtrum's platforms?

No, now this driver is only for SC9860 platform. If we make this
driver work on other Spreadtrum platform, we should submit new patches
with modifing DT binding files and compatible string.

>
>>
>> Signed-off-by: Baolin Wang <baolin.wang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
>> ---
>>  drivers/dma/Kconfig          |    7 +
>>  drivers/dma/Makefile         |    1 +
>>  drivers/dma/sprd-dma.c       | 1451 ++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/dma/sprd-dma.h |  270 ++++++++
>>  4 files changed, 1729 insertions(+)
>>  create mode 100644 drivers/dma/sprd-dma.c
>>  create mode 100644 include/linux/dma/sprd-dma.h
>>
>> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
>> index fa8f9c0..961f6ea 100644
>> --- a/drivers/dma/Kconfig
>> +++ b/drivers/dma/Kconfig
>> @@ -477,6 +477,13 @@ config STM32_DMA
>>           If you have a board based on such a MCU and wish to use DMA say Y
>>           here.
>>
>> +config SPRD_DMA
>> +       bool "Spreadtrum DMA support"
>> +       depends on ARCH_SPRD
>> +       select DMA_ENGINE
>> +       help
>> +         Enable support for the on-chip DMA controller on Spreadtrum platform.
>> +
>>  config S3C24XX_DMAC
>>         bool "Samsung S3C24XX DMA support"
>>         depends on ARCH_S3C24XX || COMPILE_TEST
>> diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
>> index d12ab29..0fee561 100644
>> --- a/drivers/dma/Makefile
>> +++ b/drivers/dma/Makefile
>> @@ -58,6 +58,7 @@ obj-$(CONFIG_RENESAS_DMA) += sh/
>>  obj-$(CONFIG_SIRF_DMA) += sirf-dma.o
>>  obj-$(CONFIG_STE_DMA40) += ste_dma40.o ste_dma40_ll.o
>>  obj-$(CONFIG_STM32_DMA) += stm32-dma.o
>> +obj-$(CONFIG_SPRD_DMA) += sprd-dma.o
>>  obj-$(CONFIG_S3C24XX_DMAC) += s3c24xx-dma.o
>>  obj-$(CONFIG_TXX9_DMAC) += txx9dmac.o
>>  obj-$(CONFIG_TEGRA20_APB_DMA) += tegra20-apb-dma.o
>> diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
>> new file mode 100644
>> index 0000000..64eaef7
>> --- /dev/null
>> +++ b/drivers/dma/sprd-dma.c
>> @@ -0,0 +1,1451 @@
>> +/*
>> + * Copyright (C) 2017 Spreadtrum Communications Inc.
>> + *
>> + * This software is licensed under the terms of the GNU General Public
>> + * License version 2, as published by the Free Software Foundation, and
>> + * may be copied, distributed, and modified under those terms.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>
> In order to keep consistent with other Spreadtrum's drivers/ DT files
> that had been upstreamed, I suggest to use SPDX-License-Identifier
> tag.

Since I saw other new drivers still use this license and I am not sure
we must change to SPDX-License-Identifier tag. But it is fine for me
to change the license tag.

-- 
Baolin.wang
Best Regards
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
