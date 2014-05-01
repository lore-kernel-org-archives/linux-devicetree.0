From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 0/7] of: setup dma parameters using dma-ranges and
 dma-coherent
Date: Thu, 1 May 2014 09:19:18 -0400
Message-ID: <536249D6.3020008@ti.com>
References: <1398353407-2345-1-git-send-email-santosh.shilimkar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398353407-2345-1-git-send-email-santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rob, Russell,

On Thursday 24 April 2014 11:30 AM, Santosh Shilimkar wrote:
> Here is an updated v3 of the series. Series introduces support for setting up
> dma parameters based on device tree properties like 'dma-ranges' and
> 'dma-coherent' and also update to ARM 32 bit port. Earlier version of the
> series can be found here [3], [2] and [1].
> 
> The 'dma-ranges' helps to take care of few DMAable system memory restrictions
> by use of dma_pfn_offset which we maintain now per device. Arch code then
> uses it for dma address translations for such cases. We update the
> dma_pfn_offset accordingly during DT the device creation process.The
> 'dma-coherent' property is used to setup arch's coherent dma_ops.
> 
> Hopefully with acks, tested-by this version can get into 3.16 queue. I will
> post a followup series for Keystone SOC which will use this infrastructure.
> Linus W also wants to use this for ARM integrator platform dma offset issue.
> 
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
> 
> Grygorii Strashko (2):
>   of: introduce of_dma_get_range() helper
>   ARM: dma: Use dma_pfn_offset for dma address translation
> 
> Santosh Shilimkar (5):
>   device: introduce per device dma_pfn_offset
>   of: introduce of_dma_is_coherent() helper
>   of: configure the platform device dma parameters
>   ARM: dma: implement set_arch_dma_coherent_ops()
>   ARM: dma: use phys_addr_t in __dma_page_[cpu_to_dev/dev_to_cpu]
> 
>  arch/arm/include/asm/dma-mapping.h |   28 ++++++++++--
>  arch/arm/mm/dma-mapping.c          |    4 +-
>  drivers/of/address.c               |   87 ++++++++++++++++++++++++++++++++++++
>  drivers/of/platform.c              |   71 +++++++++++++++++++++++++++--
>  include/linux/device.h             |    2 +
>  include/linux/dma-mapping.h        |    7 +++
>  include/linux/of_address.h         |    8 ++++
>  include/linux/of_platform.h        |    6 +++
>  8 files changed, 204 insertions(+), 9 deletions(-)
> 
How do we go about merging this series ? There is a dependency
between the patches and hence the question.

> 
> [1] http://www.spinics.net/lists/arm-kernel/msg311678.html
> [2] https://lkml.org/lkml/2014/3/6/186
> [3] https://lkml.org/lkml/2014/4/19/80
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
