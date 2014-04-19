From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 0/7] of: setup dma parameters using dma-ranges and dma-coherent
Date: Sat, 19 Apr 2014 10:32:45 -0400
Message-ID: <1397917972-6293-1-git-send-email-santosh.shilimkar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Here is an updated version of [2] based on discussion. Series introduces
support for setting up dma parameters based on device tree properties
like 'dma-ranges' and 'dma-coherent' and also update to ARM 32 bit port.
Earlier version of the same series is here [1].

The 'dma-ranges' helps to take care of few DMAable system memory restrictions
by use of dma_pfn_offset which we maintain now per device. Arch code then
uses it for dma address translations for such cases. We update the
dma_pfn_offset accordingly during DT the device creation process.The
'dma-coherent' property is used to setup arch's coherent dma_ops.

After some off-list discussion with RMK and Arnd, I have now dropped the
controversial dma_mask setup code from the series which actually isn't blocking
me as such. Considering rest of the parts of the series are already aligned,
am hoping to get this version merged for 3.16 merge window.

We agreed in last discussion that drivers have the ultimate
responsibility to setup the correct dma mask but then we need to have some
means to see if bus can support what driver has requested for a case where
driver request for bigger mask than what bus supports. I can follow up on
the mask topic if we have broken drivers.

Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>

Grygorii Strashko (2):
  of: introduce of_dma_get_range() helper
  ARM: dma: Use dma_pfn_offset for dma address translation

Santosh Shilimkar (5):
  device: introduce per device dma_pfn_offset
  of: introduce of_dma_is_coherent() helper
  of: configure the platform device dma parameters
  ARM: dma: implement set_arch_dma_coherent_ops()
  ARM: mm: use phys_addr_t in __dma_page_[cpu_to_dev/dev_to_cpu]

 arch/arm/include/asm/dma-mapping.h |   24 +++++-
 arch/arm/mm/dma-mapping.c          |    4 +-
 drivers/of/platform.c              |  151 ++++++++++++++++++++++++++++++++++++
 include/linux/device.h             |    2 +
 include/linux/dma-mapping.h        |    7 ++
 include/linux/of_platform.h        |   15 ++++
 6 files changed, 197 insertions(+), 6 deletions(-)

Regards,
Santosh

[1] http://www.spinics.net/lists/arm-kernel/msg311678.html
[2] https://lkml.org/lkml/2014/3/6/186 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
